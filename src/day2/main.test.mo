import Debug "mo:base/Debug";
import Time "mo:base/Time";
import MoSpec "mo:mospec/MoSpec";

import Main "main";
import Type "Types";
import Text "mo:base/Text";

let day2Actor = await Main.Homework();

let assertTrue = MoSpec.assertTrue;
let describe = MoSpec.describe;
let context = MoSpec.context;
let before = MoSpec.before;
let it = MoSpec.it;
let skip = MoSpec.skip;
let pending = MoSpec.pending;
let run = MoSpec.run;

let homeworkTest : Type.Homework = {
  title = "Test";
  description = "Test";
  dueDate = Time.now();
  completed = false;
};

let success = run([
  describe(
    "#addHomework",
    [
      it(
        "should add a Homework to Diary",
        do {
          let id = await day2Actor.addHomework(homeworkTest);
          assertTrue(id == 0);
        },
      ),
    ],
  ),
  describe(
    "#getHomework",
    [
      it(
        "should get a Homework by Id",
        do {
          let response = await day2Actor.getHomework(0);
          switch (response) {
            case (#ok(homework)) {
              assertTrue(homework.title == homeworkTest.title);
            };
            case (#err(message)) {
              Debug.trap("Homework not found");
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#updateHomework",
    [
      it(
        "should update an existent Homework",
        do {
          let homeworkTest2 : Type.Homework = {
            title = "Test2";
            description = "Test";
            dueDate = Time.now();
            completed = false;
          };

          let response = await day2Actor.updateHomework(0, homeworkTest2);
          switch (response) {
            case (#ok(homework)) {
              true;
            };
            case (#err(message)) {
              Debug.trap("Homework not found");
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#deleteHomework",
    [
      it(
        "should delete an existent Homework",
        do {
          let response = await day2Actor.deleteHomework(0);
          switch (response) {
            case (#ok) {
              true;
            };
            case (#err(message)) {
              Debug.trap("Homework not found");
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#getAllHomework",
    [
      it(
        "should get all Homeworks",
        do {
          ignore await day2Actor.addHomework(homeworkTest);
          let response = await day2Actor.getAllHomework();
          assertTrue(response.size() == 1);
        },
      ),
    ],
  ),
  describe(
    "#markAsCompleted",
    [
      it(
        "should mark as complete an existent Homework",
        do {
          let response = await day2Actor.markAsCompleted(0);
          switch (response) {
            case (#ok) {
              true;
            };
            case (#err(message)) {
              Debug.trap("Homework not found");
            };
          };
        },
      ),
    ],
  ),
  describe(
    "#getPendingHomework",
    [
      it(
        "should get Homework not completed",
        do {
          ignore await day2Actor.addHomework(homeworkTest);
          let response = await day2Actor.getPendingHomework();
          assertTrue(response.size() == 1);
        },
      ),
    ],
  ),
  describe(
    "#searchHomework",
    [
      it(
        "should return first match of term with title or description",
        do {
          let response = await day2Actor.searchHomework("Test");
          assertTrue(response[0].title == "Test");
        },
      ),
    ],
  ),
]);

if (success == false) {
  Debug.trap("Tests failed");
};
