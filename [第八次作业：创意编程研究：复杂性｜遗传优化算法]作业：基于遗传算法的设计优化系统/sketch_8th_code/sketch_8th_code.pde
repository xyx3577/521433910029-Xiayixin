int lifetime;  
Population population;  
int lifeCounter;          
PVector target;  

void setup() {
  size(800, 200);
  smooth();

  lifetime = 200;  //生命期
  lifeCounter = 0;  
  target = new PVector(width/2, 24);    //最终目标靶子位置
  population = new Population(0.01, 50);    //变异概率0.01, 50个火箭

}

void draw() {
  background(255);

  fill(0);
  ellipse(target.x,target.y,24,24);

  if (lifeCounter < lifetime) {
    population.live();  //火箭模拟物理运动
    lifeCounter++;
  } 
  else {
    lifeCounter = 0;
    population.fitness();   //火箭适应度
    population.selection(); //火箭选择
    population.reproduction();  //火箭繁殖
  }

  fill(0);
  text("child #: " + population.getGenerations(), 10, 18);
  text("round: " + (lifetime-lifeCounter), 10, 36);
}

void mousePressed() {   //鼠标位置为靶子位置
  target.x = mouseX;
  target.y = mouseY;
}
