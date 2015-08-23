
void drawthisshit(Brain b)
{
  stroke(b.c);
  noFill();
  float x, y;
  float oldx = 0;
  float oldy = height;

  // points
  for (int i = 0; i<b.stuff.length; i++)
  {
    x = map(i, 0, b.stuff.length, 0, width);
    y = map(b.stuff[i][whichchannel], stuffmin[whichchannel], stuffmax[whichchannel], height, 0);

    // connect
    if (connectthedots==1)
    {
      line(x, y, oldx, oldy);
      oldx = x;
      oldy = y;
    }

    ellipse(x, y, 5, 5);
  }

  // mean line
  stroke(b.c);
  y = map(b.mean[whichchannel], stuffmin[whichchannel], stuffmax[whichchannel], height, 0);
  line(0, y, width, y);
}

