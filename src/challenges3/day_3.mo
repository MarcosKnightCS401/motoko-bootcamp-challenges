import Array "mo:base/Array";
import Option "mo:base/Option";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

actor {
  private func swap(array : [var Nat], i : Nat, j : Nat) : [var Nat] {
    let iTemp = i;
    array[i] := j;
    array[j] := iTemp;
    array;
  };

  public func init_count(n : Nat) : async [Nat] {
    let array : [Nat] = Array.tabulate<Nat>(n, func(i : Nat) : Nat { i; });
  };

  public func seven(array : [Nat]) : async Text {
    for(val in array.vals()) {
      let numText = Nat.toText(val);
      for(char in numText.chars()) {
        let charText = Char.toText(char);
        if(charText == "7") {
          return "Seven is found"
        };
      };
    };

    "Seven is not found"
  };

  public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
    if(n == null) {
      return m;
    } else {
      return Option.get(n, 0);
    }
  };

  public func day_of_the_week(n : Nat) : async ?Text {
    switch(n) {
      case(1) {
        return ?"Monday";
      };
      case(2) {
        return ?"Tuesday";
      };
      case(3) {
        return ?"Wednesday";
      };
      case(4) {
        return ?"Thursday";
      };
      case(5) {
        return ?"Friday";
      };
      case(6) {
        return ?"Saturday";
      };
      case(7) {
        return ?"Sunday";
      };
      case(something) {
        return null;
      };
    };
  };

  public func populate_array(array : [?Nat]) : async [Nat] {
    Array.map(array, func(val : ?Nat) : Nat {
      switch(val) {
        case(?val) return val;
        case(null) return 0;
      };
    });
  };

  public func sum_of_array(array : [Nat]) : async Nat {
    Array.foldLeft(array, 0, func(sum : Nat, val : Nat) : Nat { sum + val });
  };

  public func squared_array(array : [Nat]) : async [Nat] {
    Array.map(array, func(val : Nat) : Nat { val ** 2 });
  };

  public func increase_by_index(array : [Nat]) : async [Nat] {
    var counter = 0;

    Array.map(array, func(val : Nat) : Nat {
      counter += 1;
      val + counter
    });
  };

  private func contains<A>(array : [A], a : A, f : (A, A) -> Bool) : async Bool {
    true
  }
};