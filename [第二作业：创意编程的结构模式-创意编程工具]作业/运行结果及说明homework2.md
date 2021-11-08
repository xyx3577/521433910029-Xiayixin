## 运行结果

## ![截屏2021-10-24 下午2.52.46](/Users/yixinxia/Desktop/截屏2021-10-24 下午2.52.46.png)



## 说明

左侧橙色斜杠从上而下、由疏到密地动态下落

右侧蓝色小方块为图案笔刷 可以自由作画

中间深蓝色圆静止着充当背景

对比色与动静结合



## 代码

int c=0;
float diaW=20;
float diaH=20;
void setup() {
  size(500, 500);
  background(100, 130, 180, 20);
  noStroke();
  fill(#6C74FF);
  ellipse(250, 240, 170, 170);
}

void draw() {
  stroke(#FFC17E);
  strokeWeight(3);
  line(30, 5*c, 100, 4*c);
  c=c+1;

  fill(#8BD5DE);
  stroke(#C9E0FF);

  rect(mouseX, mouseY, diaW, diaH);
}