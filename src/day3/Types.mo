import Principal "mo:base/Principal";
module {
  public type Content = {
    #Text : Text;
    #Image : Blob;
    #Survey : Survey;
  };

  public type Message = {
    content : Content;
    vote : Int;
    creator : Principal;
  };

  public type Answer = (
    description : Text, // contains description of the answer
    numberOfVotes : Nat // represents the number of votes for this answer
  );

  public type Survey = {
    title : Text; // title describes the survey
    answers : [Answer]; // possible answers for the survey
  };
};
