import Result "mo:base/Result";

module {
  public type StudentProfile = {
    name : Text;
    team : Text;
    graduate : Bool;
  };

  public type CalculatorInterface = actor {
    add : shared (n : Int) -> async Int;
    sub : shared (n : Int) -> async Int;
    reset : shared () -> async Int;
  };

  public type TestResult = Result.Result<(), TestError>;
  public type TestError = {
    #UnexpectedValue : Text;
    #UnexpectedError : Text;
  };
};
