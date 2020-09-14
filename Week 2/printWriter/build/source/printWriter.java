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

public class printWriter extends PApplet {

PrintWriter output;

public void setup() {
  output = createWriter("positions.txt");
}

public void draw() {
  point(mouseX, mouseY);

}
public void mouseReleased() {
  output.println(mouseX + ", " + mouseY);
  output.flush();
  // output.close();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "printWriter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
