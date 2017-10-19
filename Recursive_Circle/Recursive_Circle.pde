void setup() {
  size(640, 480);
}

void draw() {
  background(255);

  drawCircle(width/2, height/2, 400);
}



void drawCircle(float x, float y, float d) {
  fill(255,0);
  rectMode(CENTER);
  rect(x, y, d, d);
  if (d>4) {
    drawCircle(x+d/2, y, d/2);
    drawCircle(x-d/2, y, d/2);
    //drawCircle(x, y+d/2, d/2);
    drawCircle(x, y-d/2, d/2);
  }
}