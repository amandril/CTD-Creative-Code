// Alex Mandrila
// CTD Creative Code 2020
// Title: Poster, Week 2
/////////////////////////

// Turn the debugger on or off
boolean debugger = false;

PImage saltShaker;
float shakerResize = .5;

ParticleSystem ps;

// declaring shaker x and y coordinates
int shakerX = 100, shakerY = 100;
// declare shaker width and height
int shakerW, shakerH;

// whether the mouse is over the shaker
boolean shakerOver = false;
// whether the shaker has been pressed
boolean shakerPressed = false;

int offsetX = 0;
int offsetY = 0;

void setup() {
  size(800, 1280);
  saltShaker = loadImage("salt-shaker.png");

  // assigning/resizing the shaker using the shakerResize variable at the top
  shakerW = round(saltShaker.width*shakerResize);
  shakerH = round(saltShaker.height*shakerResize);

  ps = new ParticleSystem(new PVector(shakerX, shakerY));

  // output = createWriter("positions.txt");
}

void draw() {
  update(mouseX, mouseY);

  background(150);

  // ps.addParticle();
  // ps.run();

  // Text "Salt"
  PFont titleFont;
  titleFont = createFont("IBMPlexMono-Bold.ttf", 240);
  textFont(titleFont);
  fill(255, 204, 0);
  text("SALT", 80, 220);

  // Text "It makes your food taste better"
  PFont parFont;
  parFont = createFont("Roboto-Bold.ttf", 100);
  textFont(parFont);
  textSize(100);
  text("It", 80, 900);
  text("makes", 80, 995);
  text("your food", 80, 1095);
  text("taste better.", 80, 1210);

  // Boxes alongside the text
  int squareSize = 115;
  noStroke();

  // start at 250, 800
  // makeSquareDiag(80, 290, squareSize, 6);
  makeSquareDiag(80, 405, squareSize, 6);
  makeSquareDiag(80, 520, squareSize, 6);

  // Highlight salt shaker when we mouse over it
  pushMatrix();
  if (shakerOver) {
    tint(255, 255, 255);
  } else {
    tint(220, 220, 220);
  }
  image(saltShaker, shakerX, shakerY, shakerW, shakerH);
  popMatrix();


  if (debugger) {
    debugger();
  }

}

void makeSquareDiag(int x, int y, int size, int number) {
  for (int i = 0; i < number; i++) {
    rect(x+(size*i), y+(size*i), size, size);
  }
}

// Salt shaker moves when you drag it

// Check to see if the mouse is over the salt shaker
void update(int x, int y) {
  if (overShaker(shakerX, shakerY, shakerW, shakerH)) {
    shakerOver = true;
  } else {
    shakerOver = false;
  }
}

boolean overShaker(int x, int y, int width, int height) {
  if (mouseX > x && mouseX < x+width && mouseY > y && mouseY < y+height) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (shakerOver) {
    shakerPressed = true;
  } else {
    shakerPressed = false;
  }
  offsetX = mouseX - shakerX;
  offsetY = mouseY - shakerY;
}

void mouseDragged() {
  if (shakerPressed) {
    shakerX = mouseX - offsetX;
    shakerY = mouseY - offsetY;
  }
}

void mouseReleased() {
  shakerPressed = false;
}


void debugger() {
  // Position of the debugger
  translate(450, 700);
  fill(0, 255, 255);
  textSize(20);
  text("Size of the shaker: " + shakerW + ", " + shakerH, 0, 0, 100);
  text("Coordinates of the shaker: " + shakerX + ", " + shakerY, 0, 50, 100);
  text("Mouse coords: " + mouseX + ", " + mouseY, 0, 100, 100);
}



///////// Edited from Processing.org
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



// Use to get the coordinates of the mouse to draw the image - save to a txt file
// void mouseClicked() {
//   point(mouseX, mouseY);
//   output.println(mouseX + ", " + mouseY);
//   output.flush();
// }
//
// void keyPressed() {
//   output.close();
//   exit();
// }
