class Profile
{
  Profile next = null;  
  String[] inform;
  
  Profile(String[] info)
  {
    inform = info;
  }
  
  void setNext(Profile d)
  {
    next = d;
  }
  
  void display(float k)
  {
    textSize(20);
    text(inform[0] + " ," +inform[1] + " ," +inform[2] + " ," +inform[3], 400, k);    
  }
}
