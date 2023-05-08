import Debug "mo:base/Debug";
import Blob "mo:base/Blob";
import MoSpec "mo:mospec/MoSpec";

import Main "main";
import Type "Types";

let day3Actor = await Main.StudentWall();

let assertTrue = MoSpec.assertTrue;
let describe = MoSpec.describe;
let context = MoSpec.context;
let before = MoSpec.before;
let it = MoSpec.it;
let skip = MoSpec.skip;
let pending = MoSpec.pending;
let run = MoSpec.run;

let contentTest : Type.Content = #Text("Test");

let success = run([
  describe(
    "#writeMessage",
    [
      it(
        "should write message on Student Wall",
        do {
          let id = await day3Actor.writeMessage(contentTest);
          assertTrue(id == 0);
        },
      ),
    ],
  ),
  describe(
    "#getMessage",
    [
      it(
        "should get message from id",
        do {
          let response = await day3Actor.getMessage(0);
          switch (response) {
            case (#ok(message)) {
              assertTrue(message.content == contentTest);
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
    "#updateMessage",
    [
      it(
        "should update message based on an Id",
        do {
          let newContent : Type.Content = #Text("Test2");
          let response = await day3Actor.updateMessage(0, newContent);
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
    "#deleteMessage",
    [
      it(
        "should delete an existent Message",
        do {
          let response = await day3Actor.deleteMessage(0);
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
    "#upVote",
    [
      it(
        "should increment vote by 1",
        do {
          let id = await day3Actor.writeMessage(contentTest);
          let response = await day3Actor.upVote(id);
          switch (response) {
            case (#ok) {
              let response = await day3Actor.getMessage(id);
              switch (response) {
                case (#ok(message)) {
                  assertTrue(message.vote == 1);
                };
                case (#err(message)) {
                  Debug.trap(message);
                };
              };
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
    "#downVote",
    [
      it(
        "should decrement vote by 1",
        do {
          let response = await day3Actor.downVote(1);
          switch (response) {
            case (#ok) {
              let response = await day3Actor.getMessage(1);
              switch (response) {
                case (#ok(message)) {
                  assertTrue(message.vote == 0);
                };
                case (#err(message)) {
                  Debug.trap(message);
                };
              };
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
    "#getAllMessages",
    [
      it(
        "should get all messages on Student Wall",
        do {
          let messages = await day3Actor.getAllMessages();
          assertTrue(messages.size() == 1);
        },
      ),
    ],
  ),
  describe(
    "#getAllMessagesRanked",
    [
      it(
        "should get all messages on Student Wall",
        do {
          let id = await day3Actor.writeMessage(contentTest);
          ignore await day3Actor.upVote(id);
          ignore await day3Actor.upVote(id);
          let messages = await day3Actor.getAllMessagesRanked();
          assertTrue(messages[0].vote == 2);
        },
      ),
    ],
  ),
]);

if (success == false) {
  Debug.trap("Tests failed");
};
