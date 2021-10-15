//Asteroids project
//Mickey Zhao
//Oct 4th 2021

//Modes
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//text font
PFont title;
PFont text;

//variable detecting a press on the keyboard
boolean up, down, left, right, space;

//creating  spaceship
Spaceship myShip;

//creating UFO
UFO myUFO;

//bullets
ArrayList<GameObject> myObjects;

//background stars
ArrayList<Star> stars;
int count = 0;//variable for adding stars

int asteroidsCount = 0;//variable for spawnning  asteroids
int asteroidAmount =0;//number of asteroids that is spawned
int totalasteroids=0;//total amount of big and small asteroids
int spawnAmount = 5;//number of asteroids to spawn

//animated gif
PImage[] gif;
int numframe = 100;
int frame;

void setup()
{
  size(800, 800);
  imageMode(CENTER);
  myShip = new Spaceship();
  myObjects = new ArrayList<GameObject>();
  textAlign(CENTER, CENTER);

  mode = INTRO; //intro mode

  //adds spaceship
  myObjects.add(myShip);

  //test code for UFO
  myUFO = new UFO();
  myObjects.add(myUFO);

  stars = new ArrayList<Star>();

  title = loadFont("Phosphate-Inline-50.vlw");
  text = loadFont("DFWaWaSC-W5-50.vlw");

  gif=new PImage[numframe];
  int i=0;
  while (i<numframe)
  {
    gif[i] = loadImage("frame_0" + i +"_delay-0.05s.gif");
    i++;
  }
}

void draw()
{
  if (mode == INTRO)
  {
    intro();
  }
  if (mode == GAME)
  {
    game();
  }
  if (mode ==  PAUSE)
  {
    pause();
  }
  if (mode == GAMEOVER)
  {
    gameover();
  }
}
