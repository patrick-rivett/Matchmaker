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
    Profile selectedProfile = getProfile();
    if (selectedProfile != null)
    {
      Profile s = matched(curr, first);
      selectedProfile.display(s);
    }

    // Clear the list of profiles
    sc.remove();
    search.hide();
  }

  void search(String a)
  {
    curr = first;
    a = a.toLowerCase();
    int n = 0;

    while (curr != null)
    {
      curr.tempid = -2;
      curr.searched = false;
      String b = curr.getName();
      b = b.toLowerCase();

      if (b.contains(a))
      {
        curr.searched = true;
        curr.tempid = n;
        n++;
      }

      curr = curr.next;
    }
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
  //+++++++++++++++++++++++++++++++++++++++++ END OF MATCHING ALGO ++++++++++++++++++++++++
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
      if (curr.searched)
      {
        String itemText = curr.getName();
        sc.addItem(itemText, curr);
      }

      curr = curr.next;
    }
  }



  Profile getProfile()
  {
    curr = first;

    while (curr != null)
    {
      if (selectedIndex == curr.tempid)
      {
        break;
      } else
        curr = curr.next;
    }
    return curr;
  }
}
