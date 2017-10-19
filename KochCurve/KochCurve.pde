ArrayList<KochLine> lines  ;   // A list to keep track of all the lines

void setup() {
  size(1280, 720);
  lines = new ArrayList<KochLine>();
  PVector start = new PVector(0, height*3/4);
  PVector end   = new PVector(width, height*3/4);
  lines.add(new KochLine(start, end));
  
  smooth();
}

void keyPressed() {
  if (key==' ')
    generate();
}

void draw() {


  background(255);

  strokeWeight(2);
  for (KochLine l : lines) {
    l.display();
  }
  if(mousePressed)
  for (KochLine l : lines) {
    l.wiggle();
  }
}

void generate() {
  ArrayList next = new ArrayList<KochLine>();    // Create emtpy list
  for (KochLine l : lines) {
    // Calculate 5 koch PVectors (done for us by the line object)
    PVector a = l.kochA();                 
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();
    // Make line segments between all the PVectors and add them
    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }
  lines = next;
}