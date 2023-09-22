class ProfileList
{

  Profile first = null;
  Profile curr;

  ProfileList()
  {
  }

  void display()
  {
    curr = first;

    while (curr!=null)
    {
      curr.display();
      curr = curr.next;
    }
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
}
