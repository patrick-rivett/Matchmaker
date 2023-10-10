import controlP5.*;
import java.util.*;

ControlP5 cp5;

int selectedIndex = -1;
ScrollableList sc;

Button back;


ProfileList pList;

void setup()
{
  size(800, 600);
  pList = new ProfileList();
  readFile();

  cp5 = new ControlP5(this);

  setupScrollableList();
  back = createButton("Back", 715, 15, 70, 30); // create button with name
<<<<<<< Updated upstream
=======
  search = createTextfield("Search", 25, 25, 200, 25);
>>>>>>> Stashed changes

  back.hide();
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
}

void readFile()
{
  BufferedReader reader = createReader("Profiles.txt");
  String line = null;
  int id = 0;

  try {
    while ((line = reader.readLine()) != null)
    {
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
  sc = cp5.addScrollableList("Profiles")
    .setBarVisible(false)
    .setPosition(150, 125)
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

<<<<<<< Updated upstream
=======
Textfield createTextfield(String label, int x, int y, int width, int height)
{
  return cp5.addTextfield(label)
    .setPosition(x, y)
    .setSize(width, height)
    .setFont(createFont("Arial", 15))
    .setFocus(true)
    .setColor(color(0))
    .setColorBackground(color(255));
}

>>>>>>> Stashed changes
Button createButton(String label, int x, int y, int width, int height) {
  return cp5.addButton(label)
    .setPosition(x, y)
    .setSize(width, height);
}

void controlEvent(ControlEvent e) { //check if button has been pressed
  String buttonName = e.getController().getName();
  if (buttonName.equals("Back")) {//check what button it is
    selectedIndex = -1; // reset list
    setupScrollableList();
    back.hide();//hide back again
  }
<<<<<<< Updated upstream
=======

  if (e.isAssignableFrom(Textfield.class)) {
    //println(e.getName()+"': "+e.getStringValue());
    String name = e.getName();
    if (name.equals("Search"))
    {
      sc.remove();
      String a = e.getStringValue();
      println(a);
      pList.search(a);
      setupScrollableList();
    }
  }
>>>>>>> Stashed changes
}

public void clear() {
  cp5.get(Textfield.class, "textValue").clear();
}
