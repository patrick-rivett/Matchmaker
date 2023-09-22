class Profile
{

  Profile next;
  String[] info;

  Profile(String[] info_)
  {
    info = info_;
  }
  
  void display()
  {
    println(info[2]);
  }

  void setNext(Profile p)
  {
    next = p;
  }
}
