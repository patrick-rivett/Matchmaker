class ProfileList
{
  Profile first = null;
  Profile curr = null;

  ProfileList()
  {
  }

  void add(Profile p)
  {
    if (first == null)
    {
      first = p;
      curr = first;
    } else
    {
      curr.setNext(p);
      curr = p;
    }
  }

  void delete(int key)
  {
    Profile curr = first;
    Profile prev = null;

    while (curr != null)
    {

      if (curr.id == key)
        break;

      prev = curr;
      curr = curr.next;
    }

    if (curr == first && curr != null)
      first = curr.next;
    else
      prev.next = curr.next;
  }

  void display()
  {
    curr = first;
    float y = 150;
    while (curr != null)
    {
      Profile s = matched(curr, first);
      curr.display(y, s);

      curr = curr.next;
      y+=50;
    }
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++ MATCHING ALGO ++++++++++++++++++++++

  Profile matched(Profile c, Profile first)
  {
    Profile currTemp = first;
    Profile insert = c;

    float s;
    float s2;

    Profile saved = null;
    while (currTemp.next != null)
    {
      if (insert == currTemp)
      {
        currTemp = currTemp.next;
        println("here");
      } else if (insert != currTemp)
      {
        boolean go = true;
        PVector a = new PVector(currTemp.returnint(), currTemp.returnAge()); // current profile we are checking
        PVector b = new PVector(insert.returnint(), insert.returnAge());
        s = PVector.dist(a, b);
        saved = currTemp;
        if (currTemp.next == insert) currTemp = currTemp.next;
        if (currTemp.next == null) go = false;
        if (go == true)
        {
          currTemp = currTemp.next;
          PVector d = new PVector(currTemp.returnint(), currTemp.returnAge());
          s2 = PVector.dist(d, b);
          if (s2 < s)
          {
            s = s2;
            saved = currTemp;
          }
        }
        //println(currTemp.inform[0] + "  " + s);
      }
      break;
    }
    return saved;
  }

  //+++++++++++++++++++++++++++++++++++++++++ END OF MATCHING ALGO ++++++++++++++++++++++++
}
