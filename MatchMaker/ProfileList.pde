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
    //curr = first;
    //float y = 150;
    //while (curr != null)
    //{
    //  curr.display(y);
    //  matched(curr, first);
    //  curr = curr.next;
    //  y+=50;
    //}

    Profile selectedProfile = getProfile();
    if (selectedProfile != null)
      selectedProfile.display();

    // Clear the list of cars
    sc.remove();
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
      break;
    }

    float i = c.returnint();
    //println(i);
  }

  Profile getCurr()
  {
    return curr;
  }

  void setCurr()
  {
    curr = first;
  }

  void addToList()
  {
    while (curr != null) {
      String itemText = curr.getName();
      sc.addItem(itemText, curr);

      curr = curr.next;
    }
  }

  Profile getProfile()
  {
    curr = first;

    while (curr != null)
    {
      if (selectedIndex == curr.id)
      {
        break;
      } else
        curr = curr.next;
    }
    return curr;
  }
}
