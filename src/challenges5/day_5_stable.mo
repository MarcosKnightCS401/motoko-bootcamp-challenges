import Cycles "mo:base/ExperimentalCycles";
import Option "mo:base/Option";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Principal "mo:base/Principal";

actor {
  stable var favoriteNumberEntries : [(Principal, Nat)] = [];
  let favoriteNumber = Map.fromIter<Principal,Nat>(entries.vals(), 0, Principal.equal, Principal.hash);

  public shared({caller}) func add_favorite_number(n: Nat): async Text {
    if(Option.isNull(favoriteNumber.get(caller))) {
      favoriteNumber.put(caller, n);
      return "You've already registered your number";
    } else {
      return "You've successfully registered your number";
    }
  };

  public shared({caller}) func show_favorite_number(): async ?Nat {
    if(Principal.isAnonymous(caller)) {
      return null;
    } else {
      return favoriteNumber.get(caller);
    }
  };

  public shared({caller}) func update_favorite_number(n: Nat): async Text {
    if(Option.isNull(favoriteNumber.get(caller))) {
      return "Your favorite number does not exist to update";
    } else {
      let oldFavNum = favoriteNumber.replace(caller, n);
      return "You've successfully updated your number";
    }
  };

  public shared({caller}) func delete_favorite_number(): async Text {
    if(Option.isNull(favoriteNumber.get(caller))) {
      return "Your favorite number does not exist to delete";
    } else {
      favoriteNumber.delete(caller);
      return "You've successfully deleted your number";
    }
  };

  system func preupgrade() {
    favoriteNumberEntries := Iter.toArray(map.entries())
  };

  system func postupgrade() {
    favoriteNumberEntries := []
  };
};