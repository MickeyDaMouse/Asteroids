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

    size = 70;
  }


  //behaviour functions
  void show()
  {
    pushMatrix();

    //fill(255);
    //circle(location.x,location.y,size);

    translate(location.x, location.y);
    rotate(direction.heading());
    rotate(radians(90));
    stroke(255);
    fill((3-lives)*127, 0, 255-(3-lives)*127);

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
    fill((3-lives)*127, 0, 255-(3-lives)*127);
    ellipse(-15, 32.5, 12.5, 25);
    ellipse(15, 32.5, 12.5, 25);

    //shield
    if(shield)
    {
      stroke(0,255,255);
      noFill();
      circle(0,0,100);
      
    }

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

    //detecting UFO bullet impact
    int i=0;
    while (i<myObjects.size()&&shield==false)
    {
      GameObject myObj = myObjects.get(i);
      //UFO bullet collision
      if (myObj instanceof Bullet)
      {
        if (!myObj.friendly && dist(location.x, location.y, myObj.location.x, myObj.location.y)<=size/2+myObj.size/2)
        {
          myObj.lives = 0;
          //lives -= 1;
          if (lives <= 0)
          {
            mode = GAMEOVER;
          }
          shield = true;
        }
      }
      //Asteroid collision
      else if (myObj instanceof Asteroid)
      {
        if (!myObj.friendly && dist(location.x, location.y, myObj.location.x, myObj.location.y)<=size/2+myObj.size/2)
        {
          myObj.lives = 0;
          //lives -= 1;

          if (myObj.size >= 25)
          {
            myObjects.add(new Asteroid(myObj.size/2, location.x, location.y));
            myObjects.add(new Asteroid(myObj.size/2, location.x, location.y));
          }

          if (lives <= 0)
          {
            mode = GAMEOVER;
          }
          shield = true;
        }
      }
      else if (myObj instanceof UFO)
      {
        if (!myObj.friendly && dist(location.x, location.y, myObj.location.x, myObj.location.y)<=size/2+myObj.size/2)
        {
          myObj.lives = 0;
          lives -= 1;
          if (lives <= 0)
          {
            mode = GAMEOVER;
          }
          shield = true;
        }
      }

      i++;
    }
    
    //shield
    if(shieldCount<120&&shield)  shieldCount++;
    else
    {
      shieldCount  = 0;
      shield = false;
    }
    
    
    //teleport
    if(tp && tpCount == 0)
    {
      location.x = random(0,width);
      location.y = random(0,height);
      i=0;
      while (i<myObjects.size())
      {
        GameObject myObj = myObjects.get(i);
        if(myObj instanceof Spaceship)  i++;
        else
        {
          while(dist(location.x,location.y,myObj.location.x,myObj.location.y) < 200)
          {
            location.x = random(0,width);
            location.y = random(0,height);
            i=0;
          }
          
        }


        i++;
      }
      
      tp = false;
      tpCount = 600;
    }
    else  tp = false;
    if(tpCount>0)  tpCount--;
    
  }
}
