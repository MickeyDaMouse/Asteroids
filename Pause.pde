void pause()
{
  fill(255);
  textSize(150);
  textFont(text);
  text("GAME PAUSED", width/2, height/2);

  textSize(40);
  text("up arrow and down arrow to move the spaceship", width/2, 100);
  text("left arrow and right arrow to turn the spaceship", width/2, 150);
  text("press space to shoot bullet", width/2, 200);
  text("avoid getting hit and destroy all asteroids to win", width/2, 250);
  
  text("press ' t ' to teleport",width/2,height-250);
}

void pauseClick()
{
  mode = GAME;
}
