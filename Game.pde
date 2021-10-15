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

    if (myObj.lives == 0)
    {
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
}


void gameClick()
{
  mode = PAUSE;
}
