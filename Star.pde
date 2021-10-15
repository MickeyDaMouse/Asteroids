class Star
{
  //instance variables
  float x, y, vx, vy, size;
  int r, g, b;

  //constructor: special function that defines how a object of this class is born
  //defines initial values for fields
  Star()
  {
    x = random(0, width);
    y = random(0);
    vx = 0;
    vy = random(0, 10);
    size = vy;

    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
  }

  //behaviour functions: these define what a star does
  void show()
  {
    noStroke();
    fill(r, g, b);
    rectMode(0);
    square(x, y, size);
  }

  void act()
  {
    y=y+vy;
  }
}
