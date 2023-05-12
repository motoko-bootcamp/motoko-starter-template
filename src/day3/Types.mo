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
};
