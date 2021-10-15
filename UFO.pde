class UFO extends GameObject
{

  UFO()
  {
    lives = 3;
    size = 40;

    //randomizing location
    int side = 5;//int(random(0, 4));
    if (side == 0)
    {
      location = new PVector(-50, random(0, height));
      velocity = new PVector(random(0.5, 1), random(-1, 1));
    }
    if (side == 1)  
    {
      location = new PVector(width+50, random(0, height));
      velocity = new PVector(random(-1, 0.5), random(-1, 1));
    }
    if (side == 2)  
    {
      location = new PVector(random(0, width), -50);
      velocity = new PVector(random(-1, 1), random(0.5, 1));
    }
    if (side == 3)  
    {
      location = new PVector(random(0, width), height+50);
      velocity = new PVector(random(-1, 1), random(-1, 0.5));
    }

    //test code
    location = new PVector(200, 200);
    velocity = new PVector(0, 0);
  }

  void show()
  {
    noStroke();

    fill(255, 0, 255);
    circle(location.x+17.32, location.y+10, 20);
    circle(location.x-17.32, location.y+10, 20);
    circle(location.x, location.y-20, 20);

    //changes color according to health
    if (lives == 3) fill(0, 255, 0);
    if (lives == 2) fill(255, 255, 0);
    if (lives == 1) fill(255, 0, 0);

    circle(location.x, location.y, size);
  }

  void act()
  {
    location.add(velocity);

    int i=0;
    while (i<myObjects.size())
    {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet)
      {
        if (myObj.friendly && dist(location.x, location.y, myObj.location.x, myObj.location.y)<=size/2+myObj.size/2)
        {
          myObj.lives = 0;
          lives--;
        }
      }

      i++;
    }
  }
}
