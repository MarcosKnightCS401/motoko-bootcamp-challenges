import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {
  public func add(n : Nat, m : Nat) : async Nat {
    return (n + m);
  };

  public func square(n : Nat) : async Nat {
    return (n * 4);
  };

  public func days_to_second(n : Nat) : async Nat {
    return (n * 86400);
  };

  var counter : Nat = 0;

  public func increment_counter(n : Nat) : async Nat {
    counter += n;
    return counter;
  };

  public func clear_counter() : async () {
    counter := 0;
  };

  public func divide(n : Nat, m : Nat) : async Bool {
    if(m % n == 0) return true else return false;
  };

  public func is_even(n : Nat) : async Bool {
    if(n % 2 == 0) return true else return false;
  };

  public func sum_of_array(array : [Nat]) : async Nat {
    if(array.size() == 0) return 0;

    var sum : Nat = 0;

    for (value in array.vals()){
      sum := sum + value;
    };

    return sum;
  };

  public func maximum(array : [Nat]) : async Nat {
    if(array.size() == 0) return 0;

    var max : Nat = 1;

    for (value in array.vals()) {
      if(value > max) max := value;
    };

    return max;
  };

  public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
    Array.filter(array, func(val: Nat) : Bool { n != val });
  };

  public func selection_sort(array : [Nat]) : async [Nat] {
    Array.sort(array, Nat.compare);
  };
};
