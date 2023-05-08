import Type "Types";
import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";

actor class StudentWall() {
  type Message = Type.Message;
  type Content = Type.Content;
  type Survey = Type.Survey;
  type Answer = Type.Answer;

  public shared ({ caller }) func writeMessage(c : Content) : async Nat {
    return 9;
  };

  public shared query func getMessage(messageId : Nat) : async Result.Result<Message, Text> {
    return #err("not implemented");
  };

  public shared ({ caller }) func updateMessage(messageId : Nat, c : Content) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  public shared ({ caller }) func deleteMessage(messageId : Nat) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  public func upVote(messageId : Nat) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  public func downVote(messageId : Nat) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  public func getAllMessages() : async [Message] {
    return [];
  };

  public func getAllMessagesRanked() : async [Message] {
    return [];
  };
};
