class Asteroid extends GameObject
{


  //constructor
  Asteroid()
  {
    lives = 1;
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 50;
    
    location = new PVector(random(0, width), random(0, height));
    while(dist(location.x,location.y,myShip.location.x,myShip.location.y)<=myShip.size/2+size/2+20)
    {
      location = new PVector(random(0, width), random(0, height));
    }
    
  }

  Asteroid(int s, float x, float y)
  {
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = s;
  }

  void show()
  {
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }

  void act()
  {
    super.act();

    int i=0;
    while (i<myObjects.size())
    {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet)
      {
        if (myObj.friendly && dist(location.x, location.y, myObj.location.x, myObj.location.y)<=size/2+myObj.size/2)
        {
          myObj.lives = 0;
          int j=0;
          while(j<30)
          {
            myObjects.add(new Effects(location));
            j++;
          }

          
          lives = 0;
          if (size >= 25)
          {
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }

      i++;
    }
  }
}
