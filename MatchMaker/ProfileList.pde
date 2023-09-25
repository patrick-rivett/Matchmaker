class ProfileList
{
  Profile first = null;
  Profile curr = null;

  ProfileList()
  {
  }

  void add(Profile p)
  {
    println("we did it");
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
      curr = curr.next;
      y+=50;
    }
  }
}
