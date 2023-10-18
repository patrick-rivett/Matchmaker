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
      Profile s = matched(curr, first);
      selectedProfile.display(s);
      delete.show();
      create.hide();
    }

    // Clear the list of profiles
    sc.remove();
    search.hide();
  }
  
  void graph()
  {
    
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
  
  void destroy()
  {
    curr = first;
    while(curr != null)
    {
      delete(curr.tempid);
      curr = curr.next;
    }
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++ MATCHING ALGO ++++++++++++++++++++++

  Profile matched(Profile c, Profile first_)
  {
    Profile pA = c;
    Profile pB = first_;
    Profile second = first_.next;

    Profile saved = null;
    float sD = 1000;
    float sD2 = 1000;
    float sD3 = 1000;
    
    int pref = pA.returnPref();
    int gen = pA.returnGender();

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
      int tempPref = pB.returnPref();
      int tempGen = pB.returnGender();
      float d = a.dist(b);

      if (first && !pB.matched && pref == tempGen && gen == tempPref)
      {
        saved = pB; //because its the first one it is saved as the closest right away
        sD = d; //save the distance that it was from pA (inputted profile)
        pA.first = pB; //make inputted profiles first saved match within profile pB
        first = false; //first becomes false, so now we can use this to identify whether we are on first profile or not
      } else if (!first && !pB.matched && pref == tempGen && gen == tempPref) // if we are NOT on the first profiile and pB is not matched to anything...
      {
        if (pB == second) // if pB is the second profile in the list
        {
          pA.second = pB; //it is assumed second best matched right away
          sD2 = d;
          println(1);
        } else if (pB == second.next)
        {
          if (d < sD2)
          {
            sD3 = sD2;
            sD3 = d;
            Profile temp = pA.second;
            pA.second = pB;
            pA.third = temp;
            println(2);
          } else
          {
            pA.third = pB;
            sD3 = d;            
          }
        }else
         if (d < sD)
        {
          sD3 = sD2;
          pA.third = pA.second;
          sD2 = sD;
          pA.second = saved;
          sD = d;
          saved = pB;
        } else if (d < sD2) 
        {
          sD3 = sD2;
          pA.third = pA.second;
          sD2 = d;
          pA.second = pB;
        }
        else if (d < sD3) 
        {
          sD3 = d;
          pA.third = pB;
        }
      }
      pB = pB.next;
    }

    //pA.matched = true;
    //if (saved != null)saved.matched = true;
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

  Profile getAll()
  {
    return curr;
  }
}
