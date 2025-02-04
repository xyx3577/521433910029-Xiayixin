int rectX, rectY;      
int circleX, circleY;  
int rectSize = 50;     
int circleSize = 50;   
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

void setup() {
  size(600, 600);
  background(150);
  stroke(255);
  rectColor = color(#FF4067);
  rectHighlight = color(#FF869E);
  circleColor = color(#38F296);
  circleHighlight = color(#7AF2B7);
  baseColor = color(#FFFFFF);
  circleX = 31;
  circleY = 30;
  rectX = 8;
  rectY = 65;
}

void draw() {
  update(mouseX, mouseY);

  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  noStroke();
  rect(rectX, rectY, rectSize, rectSize);

  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  noStroke();
  ellipse(circleX, circleY, circleSize, circleSize);

  if (mousePressed == true) {
    stroke(currentColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}


void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
  }
  if (rectOver) {
    currentColor = rectColor;
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
