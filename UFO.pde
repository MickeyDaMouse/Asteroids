class UFO extends GameObject
{
  int bulletTimer;

  UFO()
  {
    lives = 1;
    size = 40;

    //randomizing location
    int side = int(random(0, 4));
    if (side == 0)
    {
      location = new PVector(-50, random(0, height));
      velocity = new PVector(random(0.3,0.7),random(-0.7,0.7));

      if (location.y<height/2)
      {
        velocity.y = random(0.3, 0.7);
      } else
      {
        velocity.y = random(-0.7, -0.3);
      }
    }
    if (side == 1)  
    {
      location = new PVector(width+50, random(0, height));
      velocity = new PVector(random(-0.7, -0.3), random(-0.7, 0.7));

      if (location.y<height/2)
      {
        velocity.y = random(0.3, 0.7);
      } else
      {
        velocity.y = random(-0.7, -0.3);
      }
    }
    if (side == 2)  
    {
      location = new PVector(random(0, width), -50);
      velocity = new PVector(random(-0.7, 0.7), random(0.3, 0.7));

      if (location.x<width/2)
      {
        velocity.x = random(0.3, 0.7);
      } else
      {
        velocity.x = random(-0.7, -0.3);
      }
    }
    if (side == 3)  
    {
      location = new PVector(random(0, width), height+50);
      velocity = new PVector(random(-0.7, 0.7), random(-0.7, -0.3));

      if (location.x<width/2)
      {
        velocity.x = random(0.3, 0.7);
      } else
      {
        velocity.x = random(-0.7, -0.3);
      }
    }

    //test code
    //location = new PVector(200, 200);
    //velocity = new PVector(0, 0);
  }

  void show()
  {
    noStroke();

    fill(255, 0, 255);
    circle(location.x+17.32, location.y+10, 20);
    circle(location.x-17.32, location.y+10, 20);
    circle(location.x, location.y-20, 20);

    //changes color according to health

    fill(0, 255, 0);

    circle(location.x, location.y, size);
  }

  void act()
  {
    location.add(velocity);

    if (location.y < -70) lives = 0;
    if (location.y > height+70) lives = 0;
    if (location.x < -70) lives = 0;
    if (location.x > width+70) lives = 0;

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
          int j=0;
          while(j<25)
          {
            myObjects.add(new Effects(location));
            j++;
          }
        } else if (myObj.friendly && dist(location.x+17.32, location.y+10, myObj.location.x, myObj.location.y)<=size/4+myObj.size/2)
        {
          myObj.lives = 0;
          lives--;
          int j=0;
          while(j<25)
          {
            myObjects.add(new Effects(location));
            j++;
          }
        } else if (myObj.friendly && dist(location.x-17.32, location.y+10, myObj.location.x, myObj.location.y)<=size/4+myObj.size/2)
        {
          myObj.lives = 0;
          lives--;
          int j=0;
          while(j<25)
          {
            myObjects.add(new Effects(location));
            j++;
          }
        } else if (myObj.friendly && dist(location.x, location.y-20, myObj.location.x, myObj.location.y)<=size/4+myObj.size/2)
        {
          myObj.lives = 0;
          lives--;
          int j=0;
          while(j<25)
          {
            myObjects.add(new Effects(location));
            j++;
          }
        }
      }

      i++;
    }

    bulletTimer++;
    if (bulletTimer == 180)
    {
      myObjects.add(new Bullet(false));
      bulletTimer = 0;
    }
  }
}
