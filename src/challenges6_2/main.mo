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

actor {
  let challenge6 : actor { mint : () -> async Result.Result<(), Text>} = actor("rdmx6-jaaaa-aaaaa-aaadq-cai");
  
  public func callMint() : async Result.Result<(), Text> {
      return(await challenge6.mint())
  };
};