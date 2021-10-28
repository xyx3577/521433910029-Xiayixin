# 作业说明

点击释放彩色几何状粒子

片刻后会自动销毁



![图像](/Users/yixinxia/Desktop/图像.GIF)

class Particle{  
  PVector location;              
  PVector velocity;              
  PVector acceleration;          
  float mass;                    
  float lifespan;                
    
  float R = random(255);         
  float G = random(255);  
  float B = random(255);  

  Particle(PVector l){  
    location = l.get();  
    acceleration = new PVector(0, 0.05);  
    velocity = new PVector(random(-1, 1),random(-2, 0));  
    mass = 1.0;  
    lifespan = 255.0;  
  }  
  void run(){  
    update();  
    display();  
  }
  void applyForce(PVector force){  
    acceleration.add(PVector.div(force, mass));  
  }  
  void update(){  
    velocity.add(acceleration);  
    location.add(velocity);  
    acceleration.mult(0);  
    lifespan -= 0.8;  
  }  
  void display(){  
    stroke(R,G,B,lifespan);
    fill(255,lifespan); 
    ellipse(location.x, location.y, 8, 8);  
  }  
  boolean isDead(){  
    if(lifespan < 0.0){  
      return true;  
    }else{  
      return false;  
    }  
  }  
    
}  
 import java.util.*;  
ArrayList<ParticleSystem> systems;  
PVector gravity;  
Repeller repeller;  
void mousePressed(){  
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));  
  gravity = new PVector(0, 0.1);  
}  
void setup(){  
  size(500, 400);  
  systems = new ArrayList<ParticleSystem>();  
  repeller = new Repeller(width/2-20, height/2);  
}  
void draw(){  
 background(255);  
 Iterator<ParticleSystem> it = systems.iterator();  
 while(it.hasNext()){  
   ParticleSystem p = it.next();  
   gravity = new PVector(random(-0.1, 0.1), random(-0.1, 0.2));  
   p.applyRepeller(repeller);  
   p.applyForce(gravity);  
   p.run();  
   p.addParticle();  
   if(p.isDead()){  
     it.remove();  
   }  
 }  
 repeller.display();  
}  

class ParticleSystem{  
  ArrayList<Particle> particles;            
  PVector origin;                                 
  float aliveTime;  
  ParticleSystem(PVector location_){  
    origin = location_.get();  
    particles = new ArrayList<Particle>();  
    aliveTime = 255;  
  }  
  void update(){  
    origin = new PVector(mouseX, mouseY);  
  }  
  void addParticle(){                            
    float Rate = random(1);  
    if(Rate < 0.5)  
      particles.add(new Particle(origin));  
    else  
      particles.add(new Confetti(origin));  
  }  
  void run(){  
    Iterator<Particle> it = particles.iterator();  
    while(it.hasNext()){  
      Particle p = it.next();  
      p.run();  
      if(p.isDead()){  
        it.remove();  
      }  
    }  
    aliveTime -= 1;  
  }  
  boolean isDead(){  
    if(aliveTime <= 0){  
      return true;  
    }else{  
      return false;  
    }  
  }  
  void applyForce(PVector force){          
    for(Particle p: particles){  
      p.applyForce(force);  
    }   
  }  
  void applyRepeller(Repeller re){        
    for(Particle p: particles){  
      PVector force = re.repel(p);  
      p.applyForce(force);  
    }  
  }  
}  

class Repeller{  
  PVector location;  
  float r = 10;  
  float G = 100;  
  Repeller(float x, float y){  
    location = new PVector(x, y);  
  }  
  void display(){  
    stroke(255);  
    fill(255,0,0);  
    ellipse(location.x, location.y, r*2, r*2);  
  }  
  PVector repel(Particle p){  
    PVector dir = PVector.sub(location, p.location);  
    float d = dir.mag();  
    d = constrain(d, 5, 100);  
    dir.normalize();  
    float force = -1*G/(d*d);  
      
    dir.mult(force);  
    return dir;  
  }  
}  
class Confetti extends Particle{   
  Confetti(PVector l){  
    super(l);  
  }  
  void display(){  
    stroke(R, G, B, lifespan);  
    fill(255,lifespan); 
    rect(location.x, location.y, 8, 8); 
    triangle(location.x-5,location.y-20,location.x-11,location.y-10,location.x+1,location.y-10);
  }  
}  