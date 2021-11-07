
int num=300;
int max_r=110;
int orbit_range=round(random(50,60));
PVector v[]=new PVector[num];
float n[]=new float[num];
float theta[]=new float[num];
float rnew[]=new float[num];
float r[]=new float[num];
float theta_gap[]=new float[num];
float easing[]=new float[num];
color c[]=new color[num];
boolean mouse_tag=true;
void setup()
{

  size(600,600);
  for (int i=1;i<=num-1;i++)
  {
    
    c[i]=color(random(100,200),255,random(180,255));
    rnew[i]=round(i/100)*(orbit_range/(round(num/100)-1))+(max_r-orbit_range);
    theta[i]=random(360)*PI/180;
   
    theta_gap[i]=random(72/PI);
  
    v[i] = new PVector(mouseX+cos(theta[i])*rnew[i],mouseY+sin(theta[i])*rnew[i]);
    easing[i]=random(0.015,0.7);
    
  }
  frameRate(60);
  smooth();
}
void draw()
{
  fill(0,0,0);
  rect(0,0,width,height);
 // pushMatrix();
  noStroke();
  
  if(mouse_tag)
  {
    
    for (int i=1; i<=num-1;i++)
   {
    r[i]=random(1,5);
    fill(c[i]);
    theta[i]+=theta_gap[i];
    
    v[i].lerp(mouseX+cos(theta[i])*(rnew[i]),mouseY+sin(theta[i])*(rnew[i]),0,easing[i]);
    ellipse(v[i].x, v[i].y, r[i],r[i]);
   }
 
 }
 

  if(!mouse_tag)
  {
   for(int i=1;i<=num-1;i++)
   {
     theta[i]+=theta_gap[i];
     r[i]=random(10,20);
     rotate(theta[i]);
    
     v[i].lerp(mouseX+cos(theta[i]),mouseY+sin(theta[i]),0,easing[i]);
     ellipse(v[i].x,v[i].y,r[i],r[i]);
   }
  }
  
}
void mousePressed()
{
  mouse_tag=!mouse_tag;
}
