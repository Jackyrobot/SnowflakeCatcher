Snowflake [] snow ;
void setup()
{ 
  snow = new Snowflake[125];
  for(int i = 1;i < snow.length; i++)
    snow[i] = new Snowflake();
  background(0);
  size(600,600);
}
void draw()
{
  
  for(int j = 1; j<snow.length; j++)
  {
    snow[j].lookDown();
    snow[j].move();
    snow[j].erase();
    snow[j].show();
    snow[j].wrap();  
  }   
}
void mouseDragged()
{
  noStroke();
  fill(0,230,255);
  ellipse(mouseX,mouseY,10,10);
}

void keyPressed()
{
  setup(); 
}

class Snowflake
{
  boolean t; 
  int x,y,size;
  Snowflake()
  {
    x = (int)(Math.random()*600);
    y = (int)(Math.random()*600);
    size =(int)(Math.random()*9 + 4);
    t = true;
  }
  void show()
  {
     noStroke();
     fill(255);
     ellipse(x,y,size,size);
  }
  void lookDown()
  {
    if(get(x,y+(size/2)+1) == color(0,230,255))
      t = false;
    else
      t = true;
  }
  void erase()
  {
    stroke(0);
    fill(0);
    ellipse(x,y-2,size,size-1);
  }
  void move()
  {
    if( t == true)
      y+=1;
    else
      y = y;    
  }
  void wrap()
  {
     if(y%600 == 0){
     stroke(0);
     fill(0);
     ellipse(x,y,size+2,size+2);
     y = 0;
     x = (int)(Math.random()*600);
     size = (int)(Math.random()*9 + 4);
  }
  }
}
