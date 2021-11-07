int Width = 600;
int Height = 600;
float lineSize = 0;
float columnSize = 0;

color[] colors = {#FFFFFF,#FFFFFF,#BCBCBC,#6F6F6F,#3B3B3B};


void mondrian() {
  for(int line = 0 ; line < Height ; line += lineSize + 3) {
    lineSize = random(3, Width/3);
    for(int column = 0; column < Width; column += columnSize + 3) {
      columnSize = random(4, Height/2);
 

      color rectColor = colors[int(random(colors.length))];
      fill(rectColor);
      rect(column, line, columnSize, lineSize);
      
      strokeWeight(3);
      stroke(0,0,0);
      float x = column + columnSize;
      float y = line + lineSize;
      line(0, y, Width, y);
      line(x, line, x, y);
    }
  }
}

void setup() {
  size(500,500);
  background(0,0,0);
  mondrian();
  
}
