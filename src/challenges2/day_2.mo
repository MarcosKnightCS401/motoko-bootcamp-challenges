import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Char "mo:base/Char";
import Text "mo:base/Text";

actor {
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if(n > 0 and n < 256) return Nat8.fromNat(n) else return Nat8.fromNat(0);
  };

  public func max_number_with_n_bits(n : Nat) : async Nat {
    Nat.pow(2, n);
  };

  public func decimal_to_bits(n : Nat) : async Text {
    "";
  };

  public func capitalize_character(c : Char) : async Char {
    var a = Char.toNat32(c);
    Char.fromNat32(a - 20);
  };

  public func capitalize_text(t : Text) : async Text {
    for(char in t.chars()) {
      if(Char.isLowercase(char)) {
        let a = capitalize_character(char);
      };
    };

    "";
  };

  public func is_inside(t : Text, c : Char) : async Bool {
    for(char in t.chars()) {
      if(c == char) {
        return true;
      };
    };

    false;
  };

  public func trim_whitespace(t : Text) : async Text {
    //Text.trim(t, " ");
    "";
  };

  public func duplicated_character(t : Text) : async Text {
    //Text.trim(t, " ");
    "";
  };

  public func size_in_bytes(t : Text) : async Nat16 {
    //Text.trim(t, " ");
    let n : Nat16 = 1;
    return n;
  };

  public func bubble_sort(t : Text) : async Nat16 {
    //Text.trim(t, " ");
    let n : Nat16 = 1;
    return n;
  };
};
