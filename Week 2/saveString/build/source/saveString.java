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

public class saveString extends PApplet {
  public void setup() {
String words = "apple bear cat dog";
String[] list = split(words, ' ');

// Writes the strings to a file, each on a separate line
saveStrings("nouns.txt", list);
    noLoop();
  }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "saveString" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
