import TrieMap "mo:base/TrieMap";
import Trie "mo:base/Trie";
import Result "mo:base/Result";
import Text "mo:base/Text";
import Option "mo:base/Option";
import Debug "mo:base/Debug";

import Account "Account";
// NOTE: only use for local dev,
// when deploying to IC, import from "rww3b-zqaaa-aaaam-abioa-cai"
import BootcampLocalActor "BootcampLocalActor";

actor class MotoCoin() {
  public type Account = Account.Account;

  // Returns the name of the token
  public query func name() : async Text {
    return "";
  };

  // Returns the symbol of the token
  public query func symbol() : async Text {
    return "";
  };

  // Returns the the total number of tokens on all accounts
  public func totalSupply() : async Nat {
    return 9;
  };

  // Returns the default transfer fee
  public query func balanceOf(account : Account) : async (Nat) {
    return 9;
  };

  // Transfer tokens to another account
  public shared ({ caller }) func transfer(
    from : Account,
    to : Account,
    amount : Nat,
  ) : async Result.Result<(), Text> {
    return #ok;
  };

  // Airdrop 100 MotoCoin to any student that is part of the Bootcamp.
  public func airdrop() : async Result.Result<(), Text> {
    return #err("not implemented");
  };
};
