class Profile
{
  Profile next = null;
  String[] inform;
  int tempid;
  boolean searched = true;
  Profile first;
  Profile second;
  Profile third;
  boolean matched = false;

  Profile(String[] info, int tempid_)
  {
    tempid = tempid_;
    inform = info;
  }

  void setNext(Profile d)
  {
    next = d;
  }

  void display(Profile match)
  {
    textSize(25);
    fill(0);
    textAlign(CENTER);
    if (second != null && third != null) 
    {      
      text("Name: " + inform[0], 400, 400);
      text("Age: " + inform[2], 400, 430);
      text("Gender: " + inform[3], 400, 460);
      text("Level of activity (1 - 10): " + inform[1], 400, 490);
      String preference = new String();
      inform[4] = inform[4].trim();
      if(int(inform[4]) == 1) preference = "Male";
      else if(int(inform[4]) == 2) preference = "Female";
      text("Preference: " + preference, 400, 520);
      text("Past relationships: " + inform[5], 400, 550);
    }
    back.show();
  }

  float returnInt()
  {
    float score = float(inform[1]);
    score*=15;
    return score;
  }

  float returnAge()
  {
    float age = float(inform[2]);
    return age;
  }

  String getName()
  {
    return inform[0];
  }

   String getInfo()
  {
    String s = inform[0] + "," +inform[1] + "," +inform[2] + "," +inform[3] + "," + inform[4] + ","  + inform[5];
    return s;
  }
  
  int returnPref()
  {
    inform[4] = inform[4].trim();
    int pref = int(inform[4]);
    return pref;
  }

  int returnGender()
  {
    int gen;
    inform[3] = inform[3].toLowerCase();
    inform[3] = inform[3].trim();

    if (inform[3].equals("male"))
    {
      gen = 1;
    } else if (inform[3].equals("female"))
    {
      gen = 2;
    } else
    {
      gen = 0;
    }
    return gen;
  }
  
  int returnExp()
  {
    int exp = int(inform[4]);
    return exp;
  }
}
