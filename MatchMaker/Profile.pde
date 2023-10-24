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
      text("Name: " + inform[0], 250, 400);
      text("Age: " + inform[2], 250, 430);
      text("Gender: " + inform[3], 250, 460);
      text("Level of activity (1 - 10): " + inform[1], 250, 490);
      String preference = new String();
      inform[4] = inform[4].trim();
      if(int(inform[4]) == 1) preference = "Male";
      else if(int(inform[4]) == 2) preference = "Female";
      text("Preference: " + preference, 250, 520);
      text("Past relationships: " + inform[5], 250, 550);
      text("MATCHES:", 600, 400);
      text(match.inform[0], 600, 450);
      text(second.inform[0], 600, 480);
      text(third.inform[0], 600, 510);
      //Picture of person====================================================
      
      noFill();
      stroke(0);
      rect(150, 130, 200, 200);
      fill(150);
      ellipse(250, 215, 80, 80);
      line(250, 255, 250, 330);
      line(250, 270, 230, 255);
      line(250, 270, 260, 300);
      fill(0);
      ellipse(240, 190, 5, 5);
      ellipse(260, 190, 5, 5);
      ellipse(250, 240, 15, 3);
      
      //picture of match -------------------------------------------------------------
      noFill();
      rect(450, 130, 200, 200);
      fill(150);
      ellipse(550, 215, 80, 80);
      line(550, 255, 550, 330);
      line(550, 270, 570, 255);
      line(550, 270, 540, 300);
      fill(0);
      ellipse(560, 190, 5, 5);
      ellipse(540, 190, 5, 5);
      ellipse(550, 240, 15, 3);
      
      //=================================the heart in middle=======================================
      
      triangle(400, 270, 370, 240, 430, 240);
      ellipse(385, 240, 29, 19);
      ellipse(415, 240, 29, 19);
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
