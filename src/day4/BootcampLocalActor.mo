import Principal "mo:base/Principal";

// Don't forget to NOT use this actor when deploying to --network IC
// On the IC, you should import actor from "rww3b-zqaaa-aaaam-abioa-cai" and call same method
actor class BootcampLocalActor() {
  public query func getAllStudentsPrincipal() : async [Principal] {
    return [Principal.fromText("wo5qg-ysjiq-5da"), Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai")];
  };
};
