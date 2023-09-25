ProfileList pList;

void setup()
{
  size(800, 600);
  pList = new ProfileList();
  readFile();
}

void draw()
{
  background(255);
  textAlign(CENTER);
  textSize(50);
  fill(100);
  text("MATCHMAKER", 400, 100);
  pList.display();
}

void readFile()
{
  BufferedReader reader = createReader("Profiles.txt");
  String line = null;

  try {
    while ((line = reader.readLine()) != null)
    {
      String[] parts = line.split(",");

      Profile p = new Profile(parts);
      pList.add(p);
    }
    reader.close();
  }
  catch(IOException e)
  {
    println("Error loading vehicle data: " + e.getMessage());
    println("hello");
  }
}
