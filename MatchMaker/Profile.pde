class Profile
{
  Profile next = null;
  String[] inform;
  int id;
  boolean searched = true;
  Profile first;
  Profile second;
  Profile third;
  boolean matched = false;

  Profile(String[] info, int id_)
  {
    id = id_;
    inform = info;
  }

  void setNext(Profile d)
  {
    next = d;
  }

  void display(Profile match)
  {
    textSize(20);
    if (second != null && third != null) text(inform[0] + " ," +inform[1] + " ," +inform[2] + " ," +inform[3] + " matched with "
      + match.inform[0] + ", " + second.inform[0] + ", and " + third.inform[0], 400, 400);
    back.show();
  }

  float returnInt()
  {
    float score = float(inform[1]);
    //score*=15;
    return score;
  }

  float returnAge()
  {
    float age = float(inform[2]);
    return age;
  }

  int returnPref()
  {
    int pref = int(inform[4]);
    return pref;
  }

  int returnGender()
  {
    int gen;
    if (inform[3].equals(" Male"))
    {
      gen = 1;
    } else if (inform[3].equals(" Female"))
    {
      gen = 2;
    } else
    {
      gen = 0;
    }
    return gen;
  }
  String getName()
  {
    return inform[0];
  }
}
