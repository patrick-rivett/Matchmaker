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

  void display(Profile match)
  {
    textSize(20);
    text(inform[0] + " ," +inform[1] + " ," +inform[2] + " ," +inform[3] + " matched with " + match.inform[0], 400, 400);
    back.show();
  }

  float returnInt()
  {
    if (inform[1].equals(" Gym"))
    {
      return 30;
    } else if (inform[1].equals(" Playing Sports"))
    {
      return 28;
    } else if (inform[1].equals(" Walking"))
    {
      return 20;
    } else if (inform[1].equals(" Travelling"))
    {
      return 35;
    } else if (inform[1].equals(" Volunteering"))
    {
      return 15;
    } else if (inform[1].equals(" Cooking"))
    {
      return 10;
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

  String getName()
  {
    return inform[0];
  }
}
