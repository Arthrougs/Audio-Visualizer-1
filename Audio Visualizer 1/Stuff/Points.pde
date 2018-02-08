class Points
{
 
  int x;
  int y;
  Points partner;
 int moveAttempts;
 float col; 
 
  
  Points(int xIn, int yIn)
  {
     x = xIn;
     y = yIn;
     partner = null;
     moveAttempts = 0;
  }
  
  
  void display()
  {
  ;
   println(col);
   fill(255,0, 0);
   
   ellipse(x, y, 10, 10);
  }
  
  void move(Points other)
  {
    if(dist(x,y,other.x,other.y) < space)
    {
      if(x <= other.x)
        x = x - 1;
      if(x >= other.x)
        x = x + 1;
        
      if(y <= other.y)
        y = y - 1;
      if(y >= other.y)
        y = y + 1;
        
      moveAttempts++;
      if(moveAttempts > 10000)
      {
        teleport();
        moveAttempts = 0; 
      }
    }
  }
  
  void teleport()
  {
   x = int(random(width));
   y = int(random(height));
  }
  
  void hitsWall()
  {
    
    if(march == true)
    {
      if(x >= width)
       x = 0;
      if(x <= 0)
       x = width;
      if(y >= height)
       y = 0;
      if(y <= 0)
       y = height;
    }
    else if(march == false)
    {
      if(x >= width)
       x = 1;
      else if(x <= 0)
       x = width-1;
      if(y >= height)
       y = 1;
      else if(y <= 0)
       y = height-1;
    }
    
  }
  
  
  void drawLine()
  {
   fill(0,255, 0);
   line(x, y, partner.x, partner.y);
  }
}