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
     
    //  curr.display(y, s);

    //  curr = curr.next;
    //  y+=20;
    //}

    Profile selectedProfile = getProfile();
    if (selectedProfile != null)
    {
      Profile s = matched(curr, first);
      selectedProfile.display(s);
    }

    // Clear the list of cars
    sc.remove();
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++ MATCHING ALGO ++++++++++++++++++++++

  Profile matched(Profile c, Profile first_)
  {
    Profile pA = c;
    Profile pB = first_;

    Profile saved = null;
    float sD = 1000;

    PVector a = new PVector(pA.returnInt(), pA.returnAge());
    PVector b;

    boolean first = true;

    while (pB != null)
    {
      if (pB == pA)
      {
        pB = pB.next;
        if (pB == null)
        {
          break;
        }
      }

      b = new PVector(pB.returnInt(), pB.returnAge());

      float d = a.dist(b);

      if (first)
      {
        saved = pB;
        sD = d;
        first = false;
      } else if (!first && d < sD)
      {
        sD = d;
        saved = pB;
      }
      pB = pB.next;
    }


    return saved;
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

//+++++++++++++++++++++++++++++++++++++++++ END OF MATCHING ALGO ++++++++++++++++++++++++
