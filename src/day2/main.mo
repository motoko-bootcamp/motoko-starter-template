import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Array "mo:base/Array";

import Type "Types";

actor class Homework() {
  type Homework = Type.Homework;

  // Add a new homework task
  public shared func addHomework(homework : Homework) : async Nat {
    return 9;
  };

  // Get a specific homework task by id
  public shared query func getHomework(id : Nat) : async Result.Result<Homework, Text> {
    return #err("not implemented");
  };

  // Update a homework task's title, description, and/or due date
  public shared func updateHomework(id : Nat, homework : Homework) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  // Mark a homework task as completed
  public shared func markAsCompleted(id : Nat) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  // Delete a homework task by id
  public shared func deleteHomework(id : Nat) : async Result.Result<(), Text> {
    return #err("not implemented");
  };

  // Get the list of all homework tasks
  public shared query func getAllHomework() : async [Homework] {
    return [];
  };

  // Get the list of pending (not completed) homework tasks
  public shared query func getPendingHomework() : async [Homework] {
    return [];
  };

  // Search for homework tasks based on a search terms
  public shared query func searchHomework(searchTerm : Text) : async [Homework] {
    return [];
  };
};
