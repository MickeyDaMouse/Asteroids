void  gameover()
{
  textFont(title);
  if (totalasteroids==0)
  {
    background(0, 255, 0);
    textSize(150);
    fill(255, 255, 0);
    text("YOU WIN!", width/2, height/2);
    textSize(40);
    text("You Have Destroyed All Asteroids", width/2, height*3/4);
  } else
  {
    background(255, 0, 0);
    textSize(150);
    fill(0, 255, 255);
    text("YOU LOOSE!", width/2, height/2);
    textSize(37);
    text("You Died And Your Ship Exploded In Space", width/2, height*3/4);
  }

  //decorational spaceship
  pushMatrix();

  translate(width/2, 150);
  scale(2);
  stroke(255);
  fill(0, 0, 255);
  ellipse(0, 0, 37.5, 75);
  fill(255);
  ellipse(0, -10, 20, 15);
  fill(0, 0, 255);
  ellipse(-15, 32.5, 12.5, 25);
  ellipse(15, 32.5, 12.5, 25);

  popMatrix();
}

void gameoverClick()
{
}
