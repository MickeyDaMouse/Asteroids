class Spaceship extends GameObject
{

  //instance variables
  PVector direction;

  //constructors
  Spaceship()
  {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity  = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }


  //behaviour functions
  void show()
  {
    pushMatrix();

    translate(location.x, location.y);
    rotate(direction.heading());
    rotate(radians(90));
    stroke(255);
    fill(0, 0, 255);

    //drawing spaceship
    ellipse(0, 0, 37.5, 75);

    //drawing window
    fill(255);
    ellipse(0, -10, 20, 15);

    /*
    fill(255,0,0);
     triangle(-15,32.5,-20,75,-10,75);
     triangle(15,32.5,10,75,20,75);
     */

    //drawing thrusters
    fill(0, 0, 255);
    ellipse(-15, 32.5, 12.5, 25);
    ellipse(15, 32.5, 12.5, 25);


    popMatrix();
  }

  void act()
  {
    super.act();
    //location.add(velocity);

    if (up) 
    {
      velocity.add(direction);
      if (sqrt(velocity.x*velocity.x+velocity.y*velocity.y)>10)  velocity.setMag(10);
      

      //fire
      PVector nudge1 = myShip.direction.copy();
      nudge1.rotate(PI-0.3);
      nudge1.setMag(50);
      PVector nudge2 = myShip.direction.copy();
      nudge2.rotate(PI+0.3);
      nudge2.setMag(50);
      myObjects.add(new Effects(nudge1, PI));
      myObjects.add(new Effects(nudge2, PI));
    }
    if (down)
    {
      if (sqrt(velocity.x*velocity.x+velocity.y*velocity.y)>10)  velocity.setMag(10);
      
      //fire
      velocity.sub(direction);
      PVector nudge1 = myShip.direction.copy();
      nudge1.setMag(38);
      myObjects.add(new Effects(nudge1, 0));
    }
    if (left) 
    {
      direction.rotate(radians(-3));
      
      //fire
      PVector nudge1 = myShip.direction.copy();
      nudge1.rotate(PI*3/2-0.9);
      nudge1.setMag(43);
      myObjects.add(new Effects(nudge1, PI*3/2));
    }
    if (right)
    {
      direction.rotate(radians(3));
      
      //fire
      PVector nudge1 = myShip.direction.copy();
      nudge1.rotate(PI/2+0.9);
      nudge1.setMag(43);
      myObjects.add(new Effects(nudge1, PI/2));
    }
    //    if(space) myBullets.add(new Bullet());
    
    
  }
}
