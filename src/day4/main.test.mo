import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import MoSpec "mo:mospec/MoSpec";

import Main "main";
import Account "Account";
import BootcampLocalActor "BootcampLocalActor";

let day4Actor = await Main.MotoCoin();
let bootcampTestActor = await BootcampLocalActor.BootcampLocalActor();

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
    "#name",
    [
      it(
        "should return coin name",
        do {
          let name = await day4Actor.name();
          assertTrue(name == "MotoCoin");
        },
      ),
    ],
  ),
  describe(
    "#symbol",
    [
      it(
        "should return coin symbol",
        do {
          let symbol = await day4Actor.symbol();
          assertTrue(symbol == "MOC");
        },
      ),
    ],
  ),
  describe(
    "#airdrop",
    [
      it(
        "should airdrop once to all Bootcamp students coin symbol",
        do {
          await day4Actor.airdrop();
          await day4Actor.airdrop(); // checking it does not airdrop twice

          true // will leave to indirectly test on totalSupply
        },
      ),
    ],
  ),
  describe(
    "#totalSupply",
    [
      it(
        "should return summed balance of all accounts",
        do {
          let students = await bootcampTestActor.getAllStudentsPrincipal();
          let totalSupply = await day4Actor.totalSupply();
          assertTrue(totalSupply == students.size() * 100);
        },
      ),
    ],
  ),
  describe(
    "#balanceOf",
    [
      it(
        "should return balance of account",
        do {
          let accountDfx = {
            owner = Principal.fromText("wo5qg-ysjiq-5da");
            subaccount = null;
          };
          let balance = await day4Actor.balanceOf(accountDfx);
          assertTrue(balance == 100);
        },
      ),
    ],
  ),
  describe(
    "#transfer",
    [
      it(
        "should transfer amount between sender and receiver",
        do {
          let senderAccount = {
            owner = Principal.fromText("wo5qg-ysjiq-5da");
            subaccount = null;
          };
          let receiverAccount = {
            owner = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");
            subaccount = null;
          };
          let response = await day4Actor.transfer(senderAccount, receiverAccount, 50);
          switch (response) {
            case (#ok) {
              let senderBalance = await day4Actor.balanceOf(senderAccount);
              let receiverBalance = await day4Actor.balanceOf(receiverAccount);
              assertTrue(senderBalance == 50 and receiverBalance == 150);
            };
            case (#err(message)) {
              Debug.trap(message);
            };
          };
        },
      ),
    ],
  ),
]);

if (success == false) {
  Debug.trap("Tests failed");
};
