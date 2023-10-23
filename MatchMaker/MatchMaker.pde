import controlP5.*;
import java.util.*;

ControlP5 cp5;

int selectedIndex = -1;
ScrollableList sc;

Button back;
Button create;
Button delete;
Button next;

Textfield search;
Textfield name;
Textfield interest;
Textfield age;
Textfield gender;
Textfield preference;

ProfileList pList;

String tInfo[] = new String[5];

boolean createCheck = false;

void setup()
{
  size(800, 600);
  pList = new ProfileList();
  readFile();

  cp5 = new ControlP5(this);

  setupScrollableList();

  back = createButton("Back", 715, 15, 70, 30); // create button with name
  create = createButton("Create", 715, 15, 70, 30);
  delete = createButton("Delete", 15, 15, 70, 30);
  next = createButton("Next", 360, 362, 70, 30);


  search = createTextfield("Search", 25, 25, 200, 25);
  name = createTextfield("Name", 300, 200, 200, 25);
  interest = createTextfield("Interest", 300, 230, 200, 25);
  age = createTextfield("Age", 300, 260, 200, 25);
  gender = createTextfield("Gender", 300, 290, 200, 25);
  preference = createTextfield("Preference", 300, 320, 200, 25);

  delete.hide();
  back.hide();
  next.hide();

  name.hide();
  interest.hide();
  age.hide();
  gender.hide();
  preference.hide();
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
  if (createCheck)
    displayAdd();
}

void displayAdd()
{
  fill(0);
  textAlign(LEFT);
  textSize(20);
  text("Name", 245, 217);
  text("Activeness (1-10)", 152, 247);
  text("Age", 250, 277);
  text("Gender", 235, 307);
  text("Preference", 205, 337);

  for (int i = 0; i < 5; i++)
  {
    if (tInfo[i] != null)
      text(tInfo[i], 515, i*30+217);
  }
}

void createFile()
{
  PrintWriter output = createWriter("Profiles.txt");
  pList.resetCurr();
  while (pList.curr != null)
  {
    Profile p = pList.getAll();
    pList.moveCurr();
    String info = p.getInfo();
    output.println(info);
  }
  if (tInfo[0] != null && tInfo[1] != null && tInfo[2] != null && tInfo[3] != null && tInfo[4] != null)
    output.println(tInfo[0] + ", " + tInfo[1] + ", " + tInfo[2] + ", " + tInfo[3] + "," + tInfo[4]);

  output.flush();
  output.close();
  pList.destroy();
  for (int i = 0; i < 5; i++)
  {
    tInfo[i] = null;
  }
}

void readFile()
{
  BufferedReader reader = createReader("Profiles.txt");
  String line = null;
  int tempid = 0;

  try {
    while ((line = reader.readLine()) != null)
    {
      String[] parts = line.split(",");

      Profile p = new Profile(parts, tempid);
      pList.add(p);
      tempid++;
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

    delete.hide();
    next.hide();
    search.show();
    create.show();

    name.hide();
    interest.hide();
    age.hide();
    gender.hide();
    preference.hide();
    next.hide();

    createCheck = false;
  }

  if (buttonName.equals("Create"))
  {
    create.hide();
    back.show();
    search.hide();

    name.show();
    interest.show();
    age.show();
    gender.show();
    preference.show();
    sc.remove();
    //next.show();

    createCheck = true;
  }

  if (buttonName.equals("Delete"))
  {
    pList.delete(selectedIndex);
    pList.resetId();
    selectedIndex = -1;
    setupScrollableList();
    back.hide();
    search.show();
    delete.hide();
    create.show();

    createFile();
    pList.destroy();
    readFile();
  }

  if (buttonName.equals("Next"))
  {
    createFile();
    readFile();
    next.hide();
  }

  if (e.isAssignableFrom(Textfield.class)) {
    String textName = e.getName();

    if (textName.equals("Search"))
    {
      sc.remove();
      String a = e.getStringValue();
      pList.search(a);
      setupScrollableList();
      create.show();
    }

    if (textName.equals("Name"))
    {
      tInfo[0] = e.getStringValue();
      println(tInfo[0]);
    }
    if (textName.equals("Interest"))
    {
      tInfo[1] = e.getStringValue();
      println(tInfo[1]);
    }
    if (textName.equals("Age"))
    {
      tInfo[2] = e.getStringValue();
      println(tInfo[2]);
    }
    if (textName.equals("Gender"))
    {
      tInfo[3] = e.getStringValue();
      println(tInfo[3]);
    }
    if (textName.equals("Preference"))
    {
      tInfo[4] = e.getStringValue();
      tInfo[4] = tInfo[4].toLowerCase();
      if (tInfo[4].equals("male"))
        tInfo[4] = "1";
      if (tInfo[4].equals("female"))
        tInfo[4] = "2";
    }
    if (tInfo[0] != null && tInfo[1] != null && tInfo[2] != null && tInfo[3] != null && tInfo[4] != null)
    {
      next.show();
    }
  }
}
