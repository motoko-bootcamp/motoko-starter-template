import Time "mo:base/Time";
module {
  public type Time = Time.Time;
  public type Homework = {
    title : Text;
    description : Text;
    dueDate : Time;
    completed : Bool;
  };
};
