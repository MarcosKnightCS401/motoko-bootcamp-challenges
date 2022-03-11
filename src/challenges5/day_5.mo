import Cycles "mo:base/ExperimentalCycles";
import Option "mo:base/Option";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Principal "mo:base/Principal";

actor {
  public shared({caller}) func is_anonymous(): async Bool {
    return Principal.isAnonymous(caller)
  };

  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

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

  public func deposit_cycles(): async Nat {
    let cycles = Cycles.available();

    if(cycles < 0) {
        return 0;
    };

    return Cycles.accept(cycles)
  };

  public shared({caller}) func withdraw_cycles(n: Nat): async () {
    Cycles.add(n);
  };

  stable var counter: Nat = 0;
  stable var version_number: Nat = 0;

  public func increment_counter(n: Nat): async Nat {
    counter += n;
    counter
  };

  system func postupgrade() {
    version_number += 1
  };
};