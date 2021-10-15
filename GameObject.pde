class GameObject
{
  //instance  variables
  int lives;
  PVector location;
  PVector velocity;
  int size;
  boolean friendly;


  //constructor
  GameObject()
  {
  }

  void  show()
  {
  }

  void act()
  {
    location.add(velocity);

    if (location.y < -70) location.y = height+70;
    if (location.y > height+70) location.y = -70;
    if (location.x < -70) location.x = width + 70;
    if (location.x > width+70) location.x = -70;
  }
}
