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
      match(curr);
      curr = curr.next;
      y+=50;
    }
  }

  void match(Profile c)
  {
    Profile cu = c;
    float i = cu.returnint();
    println(i);
  }
}
