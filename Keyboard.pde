//detecting keyboard actions
void keyPressed()
{
  if (keyCode == UP) up= true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased()
{
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (keyCode == ' ') myObjects.add(new Bullet(true));
  if (key == 't') tp = true;
}

//detecting mouse 
void mouseReleased()
{
  if (mode == INTRO)
  {
    introClick();
  } else if (mode == GAME)
  {
    gameClick();
  } else if (mode == PAUSE)
  {
    pauseClick();
  } else if (mode == GAMEOVER)
  {
    gameoverClick();
  }
}
