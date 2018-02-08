import processing.sound.*;
ArrayList<Points> pointList;
boolean showLines;
int space;
boolean march;
boolean movement;


Amplitude amp;
//AudioIn in;
SoundFile file;
float volume = 0.5;
String song;
String word = "Lucio";


void setup()
{
  size(1920, 1080);
  amp = new Amplitude(this);
  file = new SoundFile(this, "Lucio.mp3");
  song = "Overwatch - We Move Together as One";
  file.play();
  amp.input(file);
  surface.setResizable(true);
  pointList = new ArrayList<Points>();
  int index;
  space = 100;
  showLines = false;
  march = true;
  movement = true;
  for(int i = 0; i< 750; i++)
  {
   pointList.add(new Points(int(random(width)), int(random(height)))); 
  }
  
  for(Points p : pointList)
  {
   if(p.partner == null)
   {
     index = getRandom();
     while(pointList.get(index).equals(p))
     {
       index = getRandom();
     }
     p.partner = pointList.get(index);
    }
  } 
}

void draw()
{
  background(50);
  space = int(1000*amp.analyze());
  for(Points p : pointList)
  {
     
    p.display(); 
     if(showLines == true)
       p.drawLine();
     for(Points o : pointList)
     {
       if(!(p.equals(o)))
       {
         if(movement == true) 
           p.move(o);
       }
     }
     p.hitsWall();
  }
}

int getRandom()
{
   return int(random(pointList.size())); 
}

/*void mouseClicked()
{
 
  if(showLines == true)
   showLines = false;
   
  else if(showLines == false)
   showLines = true;
}*/

void keyPressed()
{
 if( key == CODED)
 {
  if(keyCode == UP)
  {
   for(int i = 0; i<5; i++)
   {
     Points p;
     pointList.add(new Points(int(random(width)), int(random(height))));
     p  = pointList.get(pointList.size()-1);
   
     int index = getRandom();
     while(pointList.get(index).equals(p))
     {
       index = getRandom();
     }
     p.partner = pointList.get(index);
   }
  }
 }
  if(key == 'q')
   {
     volume = volume + .05;
   }
   if(key == 'e')
   {
     volume = volume - .05;
   }
  if(key == 'w')
   {
     file.stop();
     file = new SoundFile(this, "sail.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 's')
   {
     file.stop();
     file = new SoundFile(this, "sia.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'a')
   {
     file.stop();
     file = new SoundFile(this, "aero.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'l')
   {
     file.stop();
     file = new SoundFile(this, "Lucio.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'o')
   {
     file.stop();
     file = new SoundFile(this, "aron.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'd')
   {
     file.stop();
     file = new SoundFile(this, "drum.mp3");
     file.play();
     amp.input(file);
   }
   if(key == 'm')
   {
     file.stop();
     file = new SoundFile(this, "moom.mp3");
     file.play();
     amp.input(file);
   }
}