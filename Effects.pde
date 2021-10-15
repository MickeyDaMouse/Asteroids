class Effects extends GameObject
{
  int t; //transparency
  PVector nudge;

  //constructor
  Effects(PVector nudge, float rotate)
  {
    lives = 1;
    size = int(random(5, 10));
    t = int(random(200, 255));
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
    fill(255, 0, 0, t);
    rectMode(CENTER);
    square(location.x, location.y, size);
  }
}
