class Branch {
  PVector start, end;
  float angle, len, thickness;
  boolean fruit = false;

    Branch(PVector start_, float len_, float angle_, float thickness_) {  
    angle = angle_;
    len = len_;
    start = start_;
    PVector c = new PVector(0, -len);
    c.rotate(angle);
    end = c.add(start);
    thickness = thickness_;
  }

  void addFruit() {
    fruit = true;
  }

  void display() {
    stroke(0,150);
    strokeWeight(thickness);
    line(start.x, start.y, end.x, end.y);

    if (fruit) {
      noStroke();
      fill(255, 100, 0, 200);
      ellipse(end.x, end.y, 8, 8);
    }
  }

  float nextAngleA() {
    return angle+treeAngle;
  }

  float nextAngleB() {
    return angle-treeAngle;
  }

  float nextLen() {
    return len*multiplier;
  }

  float nextThickness() {
    return thickness*0.8;
  }

  PVector nextStart() {
    return end;
  }
}