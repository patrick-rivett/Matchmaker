class Profile
{
  Profile next = null;
  String[] inform;
  int id;
  boolean matched;
  Profile matchedFirst;
  Profile matchedSecond;
  Profile matchedThird;

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
    text(inform[0] + " ," +inform[1] + " ," +inform[2] + " ," +inform[3] + " matched with " + match.inform[0], 400, 400);
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
}
