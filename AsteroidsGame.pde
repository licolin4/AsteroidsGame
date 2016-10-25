//your variable declarations here
Particle[] one;
Spaceship bob;
boolean isHyperspace = false;
public void setup() 
{
  //your code here
  size(500,500);
  bob = new Spaceship();
  one = new Particle[100];
  for(int i = 0; i < one.length; i++)
  {
  one[i]= new NormalParticle();
  }
}
public void draw() 
{
  //your code here
  background(0);
  bob.move();
  bob.show();
  for(int i = 0; i < one.length; i++)
  {
    one[i].show();
  }
}
class Spaceship extends Floater  
{   
  //your code here
 public Spaceship() 
 {
  corners = 3;
  xCorners = new int[corners];
  xCorners[0] = -20;
  xCorners[1] = 10;
  xCorners[2] = -20;
  yCorners = new int[corners];
  yCorners[0] = 5;
  yCorners[1] = 0;
  yCorners[2] = -10;
  myColor = color(255,255,255);
  myCenterX = myCenterY = 250; //holds center coordinates
  myDirectionX = myDirectionY = 0; //holds x and y coordinates of the vector for direction of travel
  myPointDirection = 0;
}
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY = y;
  }
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
}
int countDown = 60;
void keyPressed()
{
  if (key == 'h')
  {
    bob.setDirectionX(0);
    bob.setX((int)(Math.random() * width));
    bob.setY((int)(Math.random() * height));
    bob.setPointDirection((int)(Math.random() * 360));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    isHyperspace = true;
    countDown = 60;
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Stars
{
  int x[];
  int y[];
  int s[];
  int c[];
  Stars()
  {
    x = new int[200];
    y = new int[200];
    s = new int[200];
    c = new int[200];
    for(int i = 0; i< 200; i++)
    {
      x[i] = (int)(Math.random() * width);
      y[i] = (int)(Math.random() * width);
      s[i] = (int)(Math.random() * 5) + 1;
      c[i] = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    }
  }
  void show()
  {
    
    for(int i = 0; i< 200; i++)
    {
      stroke(c[i]);
      strokeWeight(s[i]);
      point(x[i],y[i]);
    }
    strokeWeight(1);
  }
}
class NormalParticle implements Particle
{
  double myX,myY,myColor,mySize,speed,angle;
  NormalParticle()
  {
    myX=Math.random()*500;
    myY=Math.random()*500;
    mySize=Math.random()*10+1;
    myColor=color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    speed=Math.random()*10;
    angle=Math.PI;
  }
  public void show()
  { 
    stroke((float)myColor);
    ellipse((float)myX,(float)myY,(float)mySize,(float)mySize);
  }
  //your code here
}
interface Particle
{
  //your code here
  public void show();
}