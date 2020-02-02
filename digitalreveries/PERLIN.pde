//Perlin code
PVector[]points;
//ArrayList<PVector> points;
int randomSeed;
//float adjust = 1050;

//

void perlin(int tC) {


  for (int i = 0; i < points.length; i++) {
    //for (int i = 0; i < points.size(); i++) {
    stroke(tC, 255);
    strokeWeight(random(1, 3));
    noFill();
    noiseSeed(randomSeed);
    PVector P = points[i];
    //PVector P = points.get(i);

    beginShape();

    //to speed up the sketch, change this speed variable to a higher number:
    int speed = 2;

    for (int j = 0; j < speed; j++) {

      float A = map(noise(P.x/adjust, P.y/adjust), 0, 1, 0, TWO_PI);
      float x1, y1, x2, y2;

      x1 = P.x;
      y1 = P.y;
      x2 = x1 + (1)*cos(A);
      y2 = y1 + (1)*sin(A);

      if (min(x1, x2) > 0 && max(x1, x2) < width && min(y1, y2) > 0 && max(y1, y2) < height) {
        vertex(x1, y1);
      } else {
        endShape(OPEN);
        beginShape();
      }
      P.x = x2;
      P.y = y2;
    }
    endShape(OPEN);

    stroke(tC);
    //points.set(i, P);
    points[i]= P;
  }
}