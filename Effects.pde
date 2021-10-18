class Effects extends GameObject
{
  int t; //transparency
  color c;
  PVector nudge;

  //constructor
  Effects(PVector loc)
  {
    lives = 1;
    size = int(random(2, 7));
    t = int(random(200, 255));
    c=#FFFFFF;

    location = loc.copy();
    velocity = new PVector(random(0, 3), random(0, 3));
    velocity.rotate(random(-PI, PI));
    //velocity.setMag(3);
  }

  Effects(PVector nudge, float rotate)
  {
    lives = 1;
    size = int(random(5, 10));
    t = int(random(200, 255));
    c=#FF0000;

    //location = new PVector(myShip.location.x-15,myShip.location.y+75);
    location = myShip.location.copy();

    location.add(nudge);

    velocity = myShip.direction.copy();
    velocity.rotate(rotate+random(-0.2, 0.2));
    velocity.setMag(3);
  }

  void act()
  {
    super.act();
    t -= 5;
    if (t<=0) lives = 0;
  }

  void show()
  {
    noStroke();
    fill(c, t);
    rectMode(CENTER);
    square(location.x, location.y, size);
  }
}
