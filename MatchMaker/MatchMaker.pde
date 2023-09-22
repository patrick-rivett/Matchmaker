ProfileList pList;

void setup()
{
  pList = new ProfileList();
  readFile();
  pList.display();
}

void draw()
{

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
  }
}
