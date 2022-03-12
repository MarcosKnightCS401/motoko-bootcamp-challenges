import Array "mo:base/Array";
import Option "mo:base/Option";
import Nat "mo:base/Nat";
import List "mo:base/List";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Result "mo:base/Result";
import Debug "mo:base/Debug";
import HTTP "http";

actor {
  type Error = {
    #critical;
    #minor;
  };

  stable var registryEntries : [(Nat, Principal)] = [];
  let registry = HashMap.fromIter<Nat,Principal>(registryEntries.vals(), 0, Nat.equal, Hash.hash);
  stable var nextTokenIndex = 0;

  public shared({caller}) func mint(): async Result.Result<(), Text> {
    if(Principal.isAnonymous(caller)) {
      return #err("You need to be authenticated to register");
    } else {
      registry.put(nextTokenIndex, caller);
      nextTokenIndex += 1;
      return #ok;
    };
  };

  public func transfer(to: Principal, tokenIndex: Nat): async Result.Result<(), Text> {
    if(Principal.isAnonymous(to)) {
      return #err("You need to be authenticated to register");
    } else {
      let oldPrincipal = registry.replace(tokenIndex, to);
      return #ok;
    };
  };

  public shared({caller}) func balance(): async [Nat] {
    let registryKeys = registry.keys();
    let filteredRegistry = Iter.filter(registry.entries(), func((tokenIndex: Nat, currentPrincipal: Principal)) : Bool { currentPrincipal == caller });
    var balanceList = List.nil<Nat>();

    for(entry in filteredRegistry) {
      balanceList := List.push(entry.0, balanceList);
    };

    List.toArray<Nat>(balanceList)
  };

  public query func http_request(request : HTTP.Request) : async HTTP.Response {
    let totalNFTs = Nat.toText(registry.size());
    let lastPrincipal = registry.get(nextTokenIndex - 1);
    let lastPrincipalStrict = Option.get(lastPrincipal, Principal.fromText("anonymous"));
    let lastUser = Principal.toText(lastPrincipalStrict);
    
    let response = {
      body = Text.encodeUtf8("Total NFTS: " # totalNFTs # ", Last Minter: " # lastUser);
      headers = [("Content-Type", "text/html; charset=UTF-8")];
      status_code = 200 : Nat16;
      streaming_strategy = null
    };

    return(response)
  };

  system func preupgrade() {
    registryEntries := Iter.toArray(registry.entries())
  };

  system func postupgrade() {
    registryEntries := []
  };
};