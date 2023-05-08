import Int "mo:base/Int";

actor class Calculator() {
  var counter : Int = 0;

  public func add(n : Int) : async Int {
    counter := counter + n;
    return counter;
  };

  public func sub(n : Nat) : async Int {
    counter := counter - n;
    return counter;
  };

  public func reset() : async Int {
    counter := 0;
    return counter;
  };
};
