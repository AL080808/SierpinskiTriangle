void setup() {
  size(600, 600);
  background(255);
  sierpinski(300, 50, 50, 550, 550, 550);
}

void draw() {
  // No need to repeatedly draw, we call it once in setup()
}

void sierpinski(float x1, float y1, float x2, float y2, float x3, float y3) {
  if (dist(x1, y1, x2, y2) <= 10) { // Base case: Stop drawing when triangles get too small
    drawTriangle(x1, y1, x2, y2, x3, y3);
  } else {
    // Midpoints of triangle edges
    float mx1 = (x1 + x2) / 2;
    float my1 = (y1 + y2) / 2;
    float mx2 = (x2 + x3) / 2;
    float my2 = (y2 + y3) / 2;
    float mx3 = (x1 + x3) / 2;
    float my3 = (y1 + y3) / 2;
    
    // Recursive case: Create three smaller triangles
    sierpinski(x1, y1, mx1, my1, mx3, my3); // Left triangle
    sierpinski(mx1, my1, x2, y2, mx2, my2); // Right triangle
    sierpinski(mx3, my3, mx2, my2, x3, y3); // Top triangle
  }
}

void drawTriangle(float x1, float y1, float x2, float y2, float x3, float y3) {
  stroke(0);
  fill(255);
  triangle(x1, y1, x2, y2, x3, y3);
}
