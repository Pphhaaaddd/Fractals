ArrayList<Branch> tree;   // A list to keep track of all the lines

float treeAngle = PI/4;
float multiplier = 0.5;
int num = 1;

void setup() {
  size(1280, 720);
  smooth();
  tree = new ArrayList<Branch>();
}

void keyPressed() {
  if (key=='a')
    num++;
  if (key=='z' && num>1)
    num--;
  println(num);
}

void draw() {
  treeAngle = map(mouseX, 0, width, 0.01, PI);
  multiplier = map(mouseY, 0, height, 0.1, 0.9);

  background(255);
  tree = new ArrayList<Branch>();
  PVector start = new PVector(width/2, height);
  float len = 200;
  tree.add(new Branch(start, len, 0, 15));

  strokeWeight(2);
  for (int i=0; i<num-1; i++) {
    generate(i);
  }
  for (Branch t : tree) {
    t.display();
  }
}

void generate(int count) {
  for (int i=tree.size()-1; i>=pow(2,count)-1; i--) {
    // Get the parameters from previous
    PVector start = tree.get(i).nextStart();                 
    float len = tree.get(i).nextLen();
    float thickness = tree.get(i).nextThickness();
    float angleA = tree.get(i).nextAngleA();
    float angleB = tree.get(i).nextAngleB();

    Branch A = new Branch(start, len, angleA, thickness);
    Branch B = new Branch(start, len, angleB, thickness);

    if (i > 50) {
      A.addFruit();
      B.addFruit();
    }

    tree.add(A);
    tree.add(B);
  }
}