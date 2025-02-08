void setup() {
  size(600, 600);
  background(255);
  sierpinski(100, 500, 400);
}

void draw() {
  // No need to repeatedly draw, we call it once in setup()
}

void sierpinski(float x, float y, float len) {
  if (len <= 20) { // Base case: Stop drawing when triangles get too small
    drawTriangle(x, y, len);
  } else {
    // Recursive case: Create three smaller triangles
    float halfLen = len / 2;
    sierpinski(x, y, halfLen); // Left triangle
    sierpinski(x + halfLen, y, halfLen); // Right triangle
    sierpinski(x + halfLen / 2, y - halfLen * sqrt(3) / 2, halfLen); // Top triangle
  }
}

void drawTriangle(float x, float y, float len) {
  float height = len * sqrt(3) / 2;
  float x2 = x + len;
  float x3 = x + len / 2;
  float y3 = y - height;
  
  triangle(x, y, x2, y, x3, y3);
}
