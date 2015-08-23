
PFont thefont; // the PFont

String f_prefix = "BrigidNew";
//String f_prefix = "Brian";

String f_annoyed = f_prefix+"Annoyed.txt";
String f_content = f_prefix+"Content.txt";
String f_daydream = f_prefix+"DayDream.txt";
String f_focused = f_prefix+"Focused.txt";

// symbols to use
int DELTA = 3;
int THETA = 4;
int LO_ALPHA = 5;
int HI_ALPHA = 6;
int LO_BETA = 7;
int HI_BETA = 8;
int LO_GAMMA = 9;
int MID_GAMMA = 10;
int whichchannel = 3; // use DELTA for starters
String[] channames = {
  "bullshit", "bullshit", "bullshit", "delta", "theta", "low alpha", "high alpha", "low beta", "high beta", "low gamma", "mid gamma"
};

int BIGNUMBER = int(pow(2, 32)); // BIG NUMBER

int connectthedots = 0; // connect the dots?

// these are the data objects
Brain b_annoyed = new Brain();
Brain b_content = new Brain();
Brain b_daydream = new Brain();
Brain b_focused = new Brain();

int[] stuffmax = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
int[] stuffmin = {
  BIGNUMBER, BIGNUMBER, BIGNUMBER, BIGNUMBER, BIGNUMBER, BIGNUMBER, BIGNUMBER, BIGNUMBER, BIGNUMBER, BIGNUMBER, BIGNUMBER
};

int draw_annoyed = 1;
int draw_content = 1;
int draw_daydream = 1;
int draw_focused = 1;

void setup()
{
  size(1800, 900);
  thefont = loadFont("BaskOldFace-48.vlw");
  textFont(thefont);
  textSize(24);

  // part one - load in all the crap
  b_annoyed.readfile(f_annoyed);
  b_content.readfile(f_content);
  b_daydream.readfile(f_daydream);
  b_focused.readfile(f_focused);
  // part two - do the stats
  b_annoyed.domean();
  b_content.domean();
  b_daydream.domean();
  b_focused.domean();
  // part three - set colors!
  b_annoyed.c = color(128, 0, 0);
  b_content.c = color(0, 128, 96);
  b_daydream.c = color(64, 64, 192);
  b_focused.c = color(96, 0, 96);


}

void draw()
{
  // clear the screen
  background(255);
  
  // draw the groovy text at the top
  fill(0);
  text("channel: " + channames[whichchannel], 20, 50);
  fill(b_annoyed.c);
  text("annoyed: " + b_annoyed.mean[whichchannel], 20, 80);
  fill(b_content.c);
  text("content: " + b_content.mean[whichchannel], 20, 110);
  fill(b_daydream.c);
  text("daydream: " + b_daydream.mean[whichchannel], 20, 140);
  fill(b_focused.c);
  text("focused: " + b_focused.mean[whichchannel], 20, 170);

  // draw the line graphs
  if(draw_annoyed==1) drawthisshit(b_annoyed);
  if(draw_content==1) drawthisshit(b_content);
  if(draw_daydream==1) drawthisshit(b_daydream);
  if(draw_focused==1) drawthisshit(b_focused);
}

void keyReleased()
{
  // switch channels:
  if (key=='a') whichchannel = DELTA;
  if (key=='s') whichchannel = THETA;
  if (key=='d') whichchannel = LO_ALPHA;
  if (key=='f') whichchannel = HI_ALPHA;
  if (key=='g') whichchannel = LO_BETA;
  if (key=='h') whichchannel = HI_BETA;
  if (key=='j') whichchannel = LO_GAMMA;
  if (key=='k') whichchannel = MID_GAMMA;

  // switch files:
  if (key=='q') draw_annoyed = 1-draw_annoyed;
  if (key=='w') draw_content = 1-draw_content;
  if (key=='e') draw_daydream = 1-draw_daydream;
  if (key=='r') draw_focused = 1-draw_focused;

  // graphics stuff:
  if (key=='c') connectthedots = 1-connectthedots;
}

