class Bullet extends GameObject
{
  //instance variables
  int timer;
  PVector nudge;

  //constructors
  Bullet(boolean friend)
  {
    timer = 100;
    lives = 1;
    friendly = friend;

    if (friendly)
    {
      nudge = myShip.direction.copy();
      nudge.setMag(37.5+size);

      location = new PVector(myShip.location.x, myShip.location.y);
      location.add(nudge);
      velocity = new PVector(myShip.direction.x, myShip.direction.y);
      velocity.setMag(10);
      size = 10;
    } else
    {
      location = new PVector(myUFO.location.x, myUFO.location.y);
      velocity = new PVector(myShip.location.x-myUFO.location.x, myShip.location.y-myUFO.location.y);
      velocity.setMag(10);
      

      size = 10;
    }
  }


  //behaviour functions
  void show()
  {
    noStroke();

    if (friendly) fill(255, 255, 0);
    else  fill(0, 255, 255);
    ellipse(location.x, location.y, size, size);
  }

  void act()
  {
    super.act();
    //location.add(velocity);
    timer--;
    if (timer == 0)
    {
      lives = 0;
    }
  }
}
