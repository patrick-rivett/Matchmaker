class Profile
{
  Profile next = null;
  String[] inform;
  float age;


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

  float returnint()
  {
    if (inform[1].equals(" Gym"))
    {
      return 1;
    } else if (inform[1].equals(" Walking"))
    {
      return 3;
    } else if (inform[1].equals(" Reading"))
    {
      return 5;
    }

    return 0;
  }
  
  float returnAge()
  {        
     age = float(inform[2]);
     return age;
  }
}
