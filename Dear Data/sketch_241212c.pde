// ArrayLists to store the data for each day (these hold the shapes for each day)
ArrayList<ShapeData> mondayData = new ArrayList<ShapeData>();  // Monday shapes
ArrayList<ShapeData> tuesdayData = new ArrayList<ShapeData>(); // Tuesday shapes
ArrayList<ShapeData> wednesdayData = new ArrayList<ShapeData>(); // Wednesday shapes
ArrayList<ShapeData> thursdayData = new ArrayList<ShapeData>(); // Thursday shapes
ArrayList<ShapeData> fridayData = new ArrayList<ShapeData>(); // Friday shapes
ArrayList<ShapeData> saturdayData = new ArrayList<ShapeData>(); // Saturday shapes
ArrayList<ShapeData> sundayData = new ArrayList<ShapeData>(); // Sunday shapes

// Variable to track which day of the week to show (1 - Monday, 7 - Sunday)
int clickCount = 0;

// Scalar factor to control how the size of shapes scales with time spent
float sizeScalar = 10; // 10 pixels rounded to every 20 mins (was 1 hour so slight inconsistency in naming) 

void setup() {
  size(600, 600); // Set canvas size to 600x600
  
  // Data is added to each day as ShapeData (position, size, color, and shape type)
  
  // MONDAY - Shape: Circle, AppTypes: 2
  mondayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(4), color(0, 255, 0), "circle")); // Entertainment: 80 minutes
  mondayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(1), color(0, 0, 255), "circle")); // Social: 20 minutes

  
  // TUESDAY - Shape: Triangle, AppTypes: 3
  tuesdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(4), color(0, 255, 0), "triangle")); // Entertainment: 80 minutes
  tuesdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(3), color(0, 0, 255), "triangle")); // Social: 60 minutes
  tuesdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(5), color(255, 0, 0), "triangle")); // Ganes: 100 minutes

  
  // WEDNESDAY - Shape: Square, AppTypes: 2
  wednesdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(3), color(0, 255, 0), "square")); // Entertainment: 60 minutes
  wednesdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(2), color(0, 0, 255), "square")); // Social: 40 minutes

  
  // **THURSDAY - Shape: Pentagon, AppTypes: 3
  thursdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(2), color(0, 255, 0), "pentagon")); // Entertainment: 40 minutes
  thursdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(1), color(0, 0, 255), "pentagon")); // Social: 20 minutes
  thursdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(2), color(255, 0, 0), "pentagon")); // Games: 40 minutes

  
  // FRIDAY - Shape: Hexagon, AppTypes: 2
  fridayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(7), color(0, 255, 0), "hexagon")); // Entertainment: 140 minutes
  fridayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(6), color(0, 0, 255), "hexagon")); // Social: 120 minutes

  
  // SATURDAY -- Shape: Heptagon, AppTypes: 2
  saturdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(5), color(0, 0, 255), "heptagon")); // Social: 100 minutes
  saturdayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(2), color(255, 0, 0), "heptagon")); // Games: 40 minutes

  
  // SUNDAY - Shape: Octagon, AppTypes: 1
  sundayData.add(new ShapeData(random(50, width-50), random(50, height-50), calculateSize(1), color(0, 255, 0), "octagon")); // Entertainment: 20 minutes
}

void draw() {
  background(255); // Clear the screen on each frame, so shapes remain once revealed
  

  // Each time the user clicks, more shapes for each day will be revealed, starting from Monday.

  if (clickCount >= 1) {
    drawShapes(mondayData); // Draw Monday shapes
  }
  if (clickCount >= 2) {
    drawShapes(tuesdayData); // Draw Tuesday shapes
  }
  if (clickCount >= 3) {
    drawShapes(wednesdayData); // Draw Wednesday shapes
  }
  if (clickCount >= 4) {
    drawShapes(thursdayData); // Draw Thursday shapes
  }
  if (clickCount >= 5) {
    drawShapes(fridayData); // Draw Friday shapes
  }
  if (clickCount >= 6) {
    drawShapes(saturdayData); // Draw Saturday shapes
  }
  if (clickCount >= 7) {
    drawShapes(sundayData); // Draw Sunday shapes
  }
}
// Function to draw all shapes for a given list of ShapeData
void drawShapes(ArrayList<ShapeData> dataList) {
  for (ShapeData sd : dataList) {
    fill(sd.shapeColor); // Set the color for the shape
    pushMatrix(); // Save current transformations
    translate(sd.x, sd.y); // Move to the shape's position
    
    if (sd.shapeType.equals("circle")) {
      ellipse(0, 0, sd.shapeSize * 2, sd.shapeSize * 2); // Draw a circle
    } else if (sd.shapeType.equals("triangle")) {
      float h = sd.shapeSize * sqrt(3) / 2; // height of equilateral triangle
      triangle(0, -sd.shapeSize, h, h, -h, h); // Draw a triangle
    } else if (sd.shapeType.equals("square")) {
      rectMode(CENTER);
      rect(0, 0, sd.shapeSize * 2, sd.shapeSize * 2); // Draw a square
    } else if (sd.shapeType.equals("pentagon")) {
      drawPolygon(5, sd.shapeSize); // Draw a pentagon
    } else if (sd.shapeType.equals("hexagon")) {
      drawPolygon(6, sd.shapeSize); // Draw a hexagon
    } else if (sd.shapeType.equals("heptagon")) {
      drawPolygon(7, sd.shapeSize); // Draw a heptagon
    } else if (sd.shapeType.equals("octagon")) {
      drawPolygon(8, sd.shapeSize); // Draw an octagon
    }
    
    popMatrix(); // Restore transformations
  }
}

// Function to draw regular polygons 
void drawPolygon(int sides, float radius) {
  beginShape();
  for (int i = 0; i < sides; i++) {
    float angle = map(i, 0, sides, 0, TWO_PI);
    float x = radius * cos(angle);
    float y = radius * sin(angle);
    vertex(x, y); // Draw each vertex of the polygon
  }
  endShape(CLOSE); // Close the shape
}

// Function to calculate the size of the shape based on the number of hours spent on an app
float calculateSize(float hours) {
  // Scalar factor controls the pixel size per 0.5 hours of usage
  return hours * sizeScalar; // Multiply hours by the sizeScalar to get the size
}

// Mouse click event to reveal data for the next day
void mousePressed() {
  // Increment the click count and stop at 7 (Sunday)
  if (clickCount < 7) {
    clickCount++; // Reveal the next day's data
  }
}

// Class to represent each shape's data (position, size, color, and shape type)
class ShapeData {
  float x, y;  // Position of the shape
  float shapeSize;  // Size of the shape (depends on time spent)
  color shapeColor; // Color of the shape (represents the app used)
  String shapeType; // Type of the shape (circle, triangle, etc.)
  
  // Constructor for the shape data
  ShapeData(float x, float y, float shapeSize, color shapeColor, String shapeType) {
    this.x = x;
    this.y = y;
    this.shapeSize = shapeSize; // Shape Size
    this.shapeColor = shapeColor; // Shape Colour
    this.shapeType = shapeType; // Shape Type 
  }
}
