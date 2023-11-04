class ProfileList
{
  Profile first = null;
  Profile curr = null;

  float dists[] = new float[0];
  Profile tempPList[] = new Profile[0];

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
      matched(curr);
      curr = curr.next;
    }
  }

  void matched(Profile c)
  {
    Profile pA = c;
    Profile pB = first;

    int pref = pA.returnPref();
    int gen = pA.returnGender();

    PVector distA = new PVector(pA.returnInt(), pA.returnAge(), pA.returnExp());
    PVector distB;


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

      int tempPref = pB.returnPref();
      int tempGen = pB.returnGender();

      float d;

      if (pref == tempGen && gen == tempPref && pB != pA)
      {
        distB = new PVector(pB.returnInt(), pB.returnAge(), pB.returnExp());
        d = distA.dist(distB);

        dists = append(dists, d);
        tempPList = (Profile[])append(tempPList, pB);
      }
      pB = pB.next;
    }
    sort(0, dists.length-1);
    
    pA.first = tempPList[0];
    pA.second = tempPList[1];
    pA.third = tempPList[2];
    
    resetArray();
  }

  void sort(int low, int high)
  {
    int i = low;
    int j = high;
    float pivot = dists[low+(high-low)/2]; // find the pivot (middle number)
    // Divide in 2
    while (i <= j) {

      while (dists[i] < pivot) { //while current nember is less than piviot move on( if num is greater than piviot stop)
        i++;
      }
      while (dists[j] > pivot) { //while current number is greater than piviot move on ( if num is less than piviot stop)
        j--;
      }
      if (i <= j) { // if i and j have not crossed
        swap(i, j); // swich them
        i++;// move i
        j--;//move j
      }
    }
    if (low < j) //recurse until done
      sort(low, j);
    if (i < high)
      sort(i, high);
  }
  
  void swap(int a, int b)
{
  float temp = dists[a]; // set temp value to a
  dists[a] = dists[b]; // set a to b
  dists[b] = temp; // set b to temp
  
  Profile temp2 = tempPList[a];
  tempPList[a] = tempPList[b];
  tempPList[b] = temp2;
}

void resetArray()
{
  dists = new float[0];
  tempPList = new Profile[0];
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
