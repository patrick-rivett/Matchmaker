class Profile
{
  Profile next = null;
  String[] inform;
  float age;
  int id;

  Profile(String[] info, int id_)
  {
    id = id_;
    inform = info;
  }

  void setNext(Profile d)
  {
    next = d;
  }

  void display(float k, Profile match)
  {
    textSize(20);
    text(inform[0] + " ," +inform[1] + " ," +inform[2] + " ," +inform[3] + 
    " matched with " + match.inform[0], 400, k);
  }

  float returnInt()
  {
    if (inform[1].equals(" Gym"))
    {
      return 30;
    } else if (inform[1].equals(" Walking"))
    {
      return 25;
    } else if (inform[1].equals(" Reading"))
    {
      return 20;
    }

    return 0;
  }
  
  float returnAge()
  {        
     age = float(inform[2]);
     return age;
  }
}
