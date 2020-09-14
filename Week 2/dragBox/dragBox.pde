// Make a rectangle we can drag across the screen

int offsetX = 0;
int offsetY = 0;

int rectX;
int rectY;
int rectSize = 75;

// whether or not the mouse is over the rectangle
boolean rectOver = false;
// whether or not the rectangle has been pressed
boolean rectPressed = false;

void setup() {
  size(640, 480);

  // This runs once, so we can change the rectangle x and y positions later
  rectX = width/2;
  rectY = height/2;

  rectMode(RADIUS);
}

void draw() {
  background(200);

  update(mouseX, mouseY);

  if (rectOver) {
    fill(200, 100, 50);
  } else {
    fill(255, 204, 0);
  }

  noStroke();
  rect(rectX, rectY, rectSize, rectSize);
}

// Send the mouseX and mouseY values to a function to check if the mouse is over a rectangle
void update(int x, int y) {
  if (overRect(rectX, rectY, rectSize, rectSize)) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

// Highlight the box when the mouse is over it
boolean overRect(int x, int y, int width, int height) {
  // if mouseX > box start && mouseX < box end
  // && same for mouseY
  if (mouseX > x-width && mouseX < x+width && mouseY > y-height && mouseY < y+height) {
    // returns true for "mouse is over" the rectangle
    return true;
  } else {
    // mouse is not over the rectangle
    return false;
  }
}

void mousePressed() {
  if (rectOver) {
    rectPressed = true;
  } else {
    rectPressed = false;
  }
  offsetX = mouseX - rectX;
  offsetY = mouseY - rectY;
}

  // mouseDragged
  // if "moused-over" is true, do the following
void mouseDragged() {
  if (rectPressed) {
    rectX = mouseX - offsetX;
    rectY = mouseY - offsetY;
  }
}

void mouseReleased() {
  rectPressed = false;
}

    // set offsetX = mouseX - rectX
    // set offsetY = mouseY - rectY
