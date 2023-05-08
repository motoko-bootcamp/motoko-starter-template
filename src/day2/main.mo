import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Array "mo:base/Array";

import Type "Types";

actor class Homework() {
  type Homework = Type.Homework;

  public shared func addHomework(homework : Homework) : async Nat {
    return 9;
  };

  public shared query func getHomework(id : Nat) : async Result.Result<Homework, Text> {
    return #err("not implemented");
  };

  public shared func updateHomework(id : Nat, homework : Homework) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  public shared func deleteHomework(id : Nat) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  public shared query func getAllHomework() : async [Homework] {
    return [];
  };

  public shared func markAsCompleted(id : Nat) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  public shared query func getPendingHomework() : async [Homework] {
    return [];
  };

  public shared query func searchHomework(searchTerm : Text) : async [Homework] {
    return [];
  };
};
