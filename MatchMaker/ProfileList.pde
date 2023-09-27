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

  void display()
  {
    curr = first;
    float y = 150;
    while (curr != null)
    {
      curr.display(y);
      matched(curr, first);
      curr = curr.next;
      y+=50;
    }
  }

  void matched(Profile c, Profile first)
  {
    Profile currTemp = first;
    Profile cu = c;
    PVector a;
    PVector b;
    PVector s = new PVector();
    //PVector s2;
    //PVector d;
    
    a = new PVector(currTemp.returnint(), currTemp.returnAge()); // current profile we are checking
    b = new PVector(cu.returnint(), cu.returnAge());
    println(a);
    while (cu != null)
    {
      if (cu != currTemp)
      {
        s.sub(a, b);
      }
    }

    float i = c.returnint();
    //println(i);
  }
}
