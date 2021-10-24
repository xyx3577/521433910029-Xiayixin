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