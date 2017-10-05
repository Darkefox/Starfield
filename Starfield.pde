Particle[] stars;
void setup()
{
  size(500,500);
  background(50);
  stars= new Particle[300];
  for(int i=0;i<stars.length;i++)
  {
    stars[i]=new Normal();
  }
  stars[1]=new Jumbo();
  stars[2]= new OddBall();
}
void draw()
{
  fill(50,50,50,10);
  rect(0,0,500,500);
  for (int i = 0; i< stars.length;i++)
  {
    stars[i].show();
    stars[i].move();
  }
}
class Normal implements Particle
{
  double myX,myY,speed,angle;
  int time;
  Normal()
  {
    myX=250;
    myY=250;
    angle=Math.random()*Math.PI*2;
    speed=Math.random()*10;   
    time=1;
  }
  public void move()
  {
    time=time+1;
    if (time <=200)
    {
      myX=myX+speed*(Math.cos(angle));
      myY=myY+speed*Math.sin(angle); 
    }
    else if(time >200)
    {
      myX=myX-speed*(Math.cos(angle));
      myY=myY-speed*Math.sin(angle); 
    }
      
  }
  public void show()
  {
    noStroke();
    fill(250);
    ellipse((float)myX,(float)myY,10,10);
  }
}
class Jumbo extends Normal
 {
   public void show()
   {
     noStroke();
     fill(250);
     ellipse((float)myX,(float)myY,50,50);
   }
 }
 
class OddBall implements Particle
{
  int sX,sY,myX,myY;
  int ranCol;
  OddBall()
  {
    sX=0;
    sY=0;
    myX=0;
    myY=0;
    //ranCol=(int)(Math.random()*240)+10;
  }
  public void move()
  {
    myX=myX+10;
    myY=myY+10;
    
    if (myX>550)
    {
      myX=0;
      myY=0;
    }
  }
  public void show()
  {
    fill(120,170,40);
    ellipse(myX,myY,sX,sY);
    
    if (sX>50)
    {
      sX=sX-5;
    }
    else if(sX<5)
    sX=sX+5;
    
    if (sY>50)
    {
      sY=sY-5;
    }
    else if(sY<5);
    sY=sY+5;
  }
}
interface Particle
{
  public void show();
  public void move();
}
