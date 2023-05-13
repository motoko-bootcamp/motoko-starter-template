import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import MoSpec "mo:mospec/MoSpec";

import Main "main";
import Calculator "Calculator";
import Type "Types";

let day5Actor = await Main.Verifier();

let assertTrue = MoSpec.assertTrue;
let describe = MoSpec.describe;
let context = MoSpec.context;
let before = MoSpec.before;
let it = MoSpec.it;
let skip = MoSpec.skip;
let pending = MoSpec.pending;
let run = MoSpec.run;

let studentTestProfile : Type.StudentProfile = {
  name = "Tester";
  Team = "cozy-test";
  graduate = false;
};
let runnerPrincipal = Principal.fromText("wo5qg-ysjiq-5da");

let success = run([
  describe(
    "#addMyProfile",
    [
      it(
        "should add a profile to my Principal",
        do {
          let response = await day5Actor.addMyProfile(studentTestProfile);
          switch (response) {
            case (#ok) {
              true;
            };
            case (#err(message)) {
              Debug.trap(message);
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#seeAProfile",
    [
      it(
        "should see a profile from a Principal",
        do {
          let response = await day5Actor.seeAProfile(runnerPrincipal);
          switch (response) {
            case (#ok(profile)) {
              assertTrue(profile.name == "Tester");
            };
            case (#err(message)) {
              Debug.trap(message);
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#updateMyProfile",
    [
      it(
        "should update my Principal's profile",
        do {
          let newStudentProfile : Type.StudentProfile = {
            name = "Tester2";
            Team = "other-team";
            graduate = false;
          };
          let response = await day5Actor.updateMyProfile(newStudentProfile);
          switch (response) {
            case (#ok) {
              true;
            };
            case (#err(message)) {
              Debug.trap(message);
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#deleteMyProfile",
    [
      it(
        "should delete my Principal's profile",
        do {
          let response = await day5Actor.deleteMyProfile();
          switch (response) {
            case (#ok) {
              true;
            };
            case (#err(message)) {
              Debug.trap(message);
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#test",
    [
      it(
        "should test a given canister",
        do {
          let calculatorActor = await Calculator.Calculator();
          let response = await day5Actor.test(Principal.fromActor(calculatorActor));
          switch (response) {
            case (#ok) {
              true;
            };
            case (#err(testError)) {
              switch (testError) {
                case (#UnexpectedValue(message)) {
                  Debug.trap(message);
                };
                case (#UnexpectedError(message)) {
                  Debug.trap(message);
                };
              };
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#verifyOwnership",
    [
      it(
        "should verify if caller is a controller of the given canister",
        do {
          // NOTE: Not possible to test locally,
          // as actor "aaaa-aa" (aka the IC itself, exposed as an interface) does not exist locally
          // let calculatorActor = await Calculator.Calculator();
          // let response = await day5Actor.verifyOwnership(Principal.fromActor(calculatorActor), runnerPrincipal);
          // switch (response) {
          //   case (#ok(result)) {
          //     assertTrue(result);
          //   };
          //   case (#err(message)) {
          //     Debug.trap(message);
          //   };
          // };
          true;
        },
      ),
    ],
  ),
  describe(
    "#verifyWork",
    [
      it(
        "should verify and test work done by student",
        do {
          // NOTE: Also not possible to test locally
          // as this method is only subcalling verifyOwnership() + test()
          // and verifyOwnership() is not possible locally
          true;
        },
      ),
    ],
  ),
]);

if (success == false) {
  Debug.trap("Tests failed");
};
