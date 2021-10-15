int brightness = 0;
int change = 1;

void intro()
{
  image(gif[frame], width/2, height/2, width, height);
  frame ++;
  if (frame==numframe)    frame = 0;

  fill(brightness);

  textFont(title);
  textAlign(CENTER, CENTER);
  textSize(100);

  text("ASTEROID GAME", width/2, height/3);

  //"blinking" title 
  if (brightness >= 255)
  {
    change = -5;
  }
  if (brightness <= 0)
  {
    change = 5;
  }

  brightness += change;

  //press to start text
  fill(255, 0, 0);
  textSize(50);
  text("Click To Start", width/2, height*3/4);
}

void introClick()
{
  mode = GAME;
}
