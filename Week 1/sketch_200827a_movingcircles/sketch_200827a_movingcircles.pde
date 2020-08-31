// All circles that make up the A
int[][] a = {{200, 100, 100},
            {150, 175, 100}, 
            {100, 250, 100}, 
            {250, 175, 100}, 
            {300, 250, 100}};
float x, y, distance, diameter;

void setup() {
  size(400, 400);
}
void draw() {
  background(150);
  
  fill(255, 204, 0);
  noStroke();
  
  // Loop through the array to get dimensions/coordinates for the ellipse
  for (int i = 0; i < a.length; i++) {
    
      // Calculate x coordinate (coords in array + mouseX-width/2*.2) and save that as a variable to use
      x = a[i][0]+(mouseX-width/2)*.2;
      
      // Calculate y
      y = a[i][1]+(mouseY-height/2)*.2;
      
      distance = sqrt(pow((x-mouseX), 2)+pow((y-mouseY), 2));
      
      // Calculate diameter - make it bigger or smaller depending on where the cursor is
      diameter = a[i][2]*distance*.005+10;
      
      // New Circle function with above values
      circle(x, y, diameter);
    
      // Build each ellipse in the array and make the x and y positions move based on the cursor
      //circle(a[i][0]+(mouseX-width/2)*.2, a[i][1]+(mouseY-height/2)*.2, a[i][2]);
      
      // When the cursor gets close to one of the circles, that circle gets bigger, and the other circles get smaller
      
      // Subtract the coordinates of the balls by the coordinates of the cursor, then multiply the size by that.
     
  }
}
