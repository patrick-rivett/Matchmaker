import controlP5.*;
import java.util.*;

int selectedIndex = -1;
ScrollableList sc;

ControlP5 cp5;

ProfileList pList;

void setup()
{
  size(800, 600);
  pList = new ProfileList();
  readFile();

  cp5 = new ControlP5(this);

  setupScrollableList();
}

void draw()
{
  background(255);
  textAlign(CENTER);
  textSize(50);
  fill(100);
  text("MATCHMAKER", 400, 100);
  if (selectedIndex >= 0)
    pList.display();
  match();
}

void readFile()
{
  BufferedReader reader = createReader("Profiles.txt");
  String line = null;
  int id = 0;

  try {
    while ((line = reader.readLine()) != null)
    {
      println(id);
      String[] parts = line.split(",");

      Profile p = new Profile(parts, id);
      pList.add(p);
      id++;
    }
    reader.close();
  }
  catch(IOException e)
  {
    println("Error loading vehicle data: " + e.getMessage());
    println("hello");
  }
}

void setupScrollableList()
{
  sc = cp5.addScrollableList("Vehicles")
    .setBarVisible(false)
    .setPosition(150, 100)
    .setSize(500, 500)
    .setItemHeight(30)
    .setColorBackground(color(0))
    .setColorForeground(color(210))
    .setColorActive(color(0, 255, 0))
    .setColorCaptionLabel(color(255))
    .setColorValue(color(255))
    .setFont(createFont("Arial", 15));

  //if (firstTime)
  //  readFile(vList);
  //firstTime = false;


  pList.setCurr();
  pList.addToList();

  sc.addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      if (event.getAction() == ControlP5.ACTION_CLICK) {
        selectedIndex = (int) sc.getValue();
        pList.display();
      }
    }
  }
  );
}

void match()
{
  //float i = pList.first.returnint();
  //println(i);
}
