class Branch {
  PVector start, end;
  float angle, len;

  Branch(PVector start_, float len_, float angle_) {  
    angle = angle_;
    len = len_;
    start = start_;
    PVector c = new PVector(0, -len);
    c.rotate(angle);
    end = c.add(start);
  }

  void update() {
  }

  void display() {
    stroke(0);
    pushMatrix();
    line(start.x, start.y, end.x, end.y);
    popMatrix();
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
  
  PVector nextStart() {
    return end;
  }
}