void game()
{
  //making stars
  if (count == 10)
  {
    count = 0;
    stars.add(new Star());
  } else
  {
    count ++;
  }

  //spawning asteroids
  if (asteroidsCount == 60 && asteroidAmount<spawnAmount)
  {
    asteroidsCount =0;
    myObjects.add(new Asteroid());
    asteroidAmount ++;
  } else {
    asteroidsCount++;
  }

  //showing stars
  int i=0;
  while (i<stars.size())
  {
    Star s = stars.get(i);
    s.show();
    s.act();
    if (s.y > height+s.size)
    {
      stars.remove(i);
      i--;
    }

    i++;
  }
  fill(0, 20);
  rect(0, 0, width, height);


  i=0;
  while (i<myObjects.size())
  {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives <= 0)
    {
      if(myObj instanceof UFO)  UFOalive = false;
      myObjects.remove(i);
    } else {
      i++;
    }
  }

  //pause text
  textFont(title);
  textSize(20);
  fill(255, 10);
  text("click to pause", 100, 20);
  
  //teleport cooldown
  pushMatrix();
  noStroke();
  rectMode(CENTER);
  textFont(text);
  fill(0,255,0);
  rect(width/2,20,tpCount/2,40);
  fill(255);
  text("teleport",width/2,20);

  
  popMatrix();

  //asteroid destroyed
  textSize(20);
  fill(255, 0, 0);
  i=0;
  totalasteroids = 0;
  while (i<myObjects.size())//counting asteroids left
  {
    GameObject myObj = myObjects.get(i);
    if (myObj instanceof Asteroid)  totalasteroids++;
    i++;
  }
  text("asteroids left: " +  totalasteroids, width-150, 20);

  if (totalasteroids == 0 && asteroidAmount==spawnAmount)
  {
    mode = GAMEOVER;
  }
  
  //UFO timer
  if(UFOtimer == 300)
  {
    myUFO = new UFO();
    myObjects.add(myUFO);
    UFOalive =true;
    UFOtimer = 0;
  }
  else if(UFOalive == false)
  {
    UFOtimer ++;
  }
  

  
}


void gameClick()
{
  mode = PAUSE;
}
