import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class dragBox extends PApplet {

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

public void setup() {
  

  // This runs once, so we can change the rectangle x and y positions later
  rectX = width/2;
  rectY = height/2;

  rectMode(RADIUS);
}

public void draw() {
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
public void update(int x, int y) {
  if (overRect(rectX, rectY, rectSize, rectSize)) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

// Highlight the box when the mouse is over it
public boolean overRect(int x, int y, int width, int height) {
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

public void mousePressed() {
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
public void mouseDragged() {
  if (rectPressed) {
    rectX = mouseX - offsetX;
    rectY = mouseY - offsetY;
  }
}

public void mouseReleased() {
  rectPressed = false;
}

    // set offsetX = mouseX - rectX
    // set offsetY = mouseY - rectY
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dragBox" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
