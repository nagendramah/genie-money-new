class ReferenceId{
  static final ReferenceId _singleton =ReferenceId._internal();
  int referenceId=20;

  factory ReferenceId()
  {
    return _singleton;
  }

  ReferenceId._internal();

  setReferenceId(){
    referenceId= referenceId+1;
  }
  getReferenceId(){
    return referenceId;
  }

}