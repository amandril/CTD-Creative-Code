PrintWriter output;

void setup() {
  output = createWriter("positions.txt");
}

void draw() {
  point(mouseX, mouseY);

}
void mouseReleased() {
  output.println(mouseX + ", " + mouseY);
  output.flush();
  // output.close();
}
