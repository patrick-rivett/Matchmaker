class ProfileList
{
  Profile first = null;
  Profile curr = null;

  ProfileList()
  {
  }

  void resetCurr()
  {
    curr = first;
  }

  void moveCurr()
  {
    curr = curr.next;
  }

  void add(Profile p)
  {
    curr = first;

    if (first == null)
    {
      first = p;
      curr = first;
    } else
    {
      while (curr != null)
      {
        if (curr.next == null)
          break;

        curr = curr.next;
      }
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

      if (curr.tempid == key)
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
      //Profile s = matched(curr, first);
      selectedProfile.display();
      delete.show();
      create.hide();
    }

    // Clear the list of profiles
    sc.remove();
    search.hide();
  }

  void resetId()
  {
    int id = 0;
    curr = first;
    while (curr != null)
    {
      curr.tempid = id;
      id++;
      curr = curr.next;
    }
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

  void resetSearch()
  {
    resetCurr();
    while (curr != null)
    {
      curr.resetSearch();
      curr = curr.next;
    }
  }

  void destroy()
  {
    curr = first;
    while (curr != null)
    {
      delete(curr.tempid);
      curr = curr.next;
    }
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++ MATCHING ALGO ++++++++++++++++++++++

  void match()
  {
    resetCurr();
    while (curr!=null)
    {
      matched(curr, first);
      curr = curr.next;
    }
  }

  void matched(Profile c, Profile first_)
  {
    Profile pA = c;
    Profile pB = first_;

    float sD = 1000;
    float sD2 = 1000;
    float sD3 = 1000;

    int pref = pA.returnPref();
    int gen = pA.returnGender();

    PVector a = new PVector(pA.returnInt(), pA.returnAge(), pA.returnExp());
    PVector b;

    while (pB != null)
    {
      b = new PVector(pB.returnInt(), pB.returnAge(), pB.returnExp());

      int tempPref = pB.returnPref();
      int tempGen = pB.returnGender();

      float d;

      if (pref == tempGen && gen == tempPref && pB != pA)
      {
        
        d = a.dist(b);
        
        if (d < sD3)
        {
          if (d < sD2)
          {
            if (d < sD)
            {
              sD3 = sD2;
              sD2 = sD;
              sD = d;

              pA.third = pA.second;
              pA.second = pA.first;
              pA.first = pB;
            } else
            {
              sD3 = sD2;
              sD2 = d;

              pA.third = pA.second;
              pA.second = pB;
            }
          } else
          {
            sD3 = d;
            pA.third = pB;
          }
        }
      }
      pB = pB.next;
    }
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

  Profile getAll()
  {
    return curr;
  }
}
