import Debug "mo:base/Debug";
import Main "main";
import MoSpec "mo:mospec/MoSpec";

let day1Actor = await Main.Calculator();

let assertTrue = MoSpec.assertTrue;
let describe = MoSpec.describe;
let context = MoSpec.context;
let before = MoSpec.before;
let it = MoSpec.it;
let skip = MoSpec.skip;
let pending = MoSpec.pending;
let run = MoSpec.run;

let success = run([
  describe(
    "#add",
    [
      it(
        "should add a number to counter",
        do {
          let response = await day1Actor.add(2.0);
          assertTrue(response == 3.0);
        },
      ),
    ],
  ),
  describe(
    "#sub",
    [
      it(
        "should sub a number to counter",
        do {
          let response = await day1Actor.sub(1.0);
          assertTrue(response == 2.0);
        },
      ),
    ],
  ),
  describe(
    "#mul",
    [
      it(
        "should multiply a number to counter",
        do {
          let response = await day1Actor.mul(2.0);
          assertTrue(response == 4.0);
        },
      ),
    ],
  ),
  describe(
    "#div",
    [
      it(
        "should divide a number to counter",
        do {
          let response = await day1Actor.div(2.0);
          assertTrue(response == ?2.0);
        },
      ),
    ],
  ),
  describe(
    "#reset",
    [
      it(
        "should reset counter",
        do {
          ignore day1Actor.reset();
          let response = await day1Actor.add(3.0);
          assertTrue(response == 3.0);
        },
      ),
    ],
  ),
  describe(
    "#see",
    [
      it(
        "should return counter",
        do {
          let response = await day1Actor.see();
          assertTrue(response == 3.0);
        },
      ),
    ],
  ),
  describe(
    "#power",
    [
      it(
        "should multiply counter to the power of a number",
        do {
          let response = await day1Actor.power(2.0);
          assertTrue(response == 9.0);
        },
      ),
    ],
  ),
  describe(
    "#sqrt",
    [
      it(
        "should return the square root of counter",
        do {
          let response = await day1Actor.sqrt();
          assertTrue(response == 3.0);
        },
      ),
      it(
        "should not save it",
        do {
          let response = await day1Actor.see();
          assertTrue(response == 9.0);
        },
      ),
    ],
  ),
  describe(
    "#floor",
    [
      it(
        "should return counter rounded to a lower bound int",
        do {
          ignore day1Actor.add(0.6);
          let response = await day1Actor.floor();
          assertTrue(response == 9);
        },
      ),
    ],
  ),
]);

if (success == false) {
  Debug.trap("Tests failed");
};
