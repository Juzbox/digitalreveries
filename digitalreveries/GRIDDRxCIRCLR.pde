int switchVal;
float rX;
float rY;


PShape s;

void gridder(int tC) {
  strokeWeight(2);

  int Xs=10;
  int Ys=10;
  float checkDist;

  //float opaciter=150;

  rX=random(20, width-20);
  rY=random(100, height);
  for (int i = Xs*2; i<width-Xs*2; i=i+Xs*2) {

    for (int j = Ys*2; j<height-Ys*2; j=j+Ys*2) {

      checkDist = dist(rX, rY, i, j);
      //checkDist = dist(mouseX,mouseY, i, j);
      //opaciter= map(checkDist, 0, (width*height/2), 0, 255);
      s = createShape();
      s.beginShape();
      s.vertex(i-random(Xs), j-random(Ys));
      s.vertex(i+random(Xs), j-random(Ys));
      s.vertex(i+random(Xs), j+random(Ys));
      s.vertex(i-random(Xs), j+random(Ys));
      s.vertex(i-random(Xs), j+random(Ys));
      s.endShape(OPEN);

      if ((checkDist<70)) {
        tC=images[int(random(10,11))].get(i,j);
        stroke(tC, random(150,255));

        shape(s, i, j);
        //ellipse(i-random(Xs), j+random(Ys),10,10);
      }
    }
  }
}

float degrees;
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency;

void circlr(int cT) {

  // Rotates rectangle around circle
  int spacer=int(random(5, 10));

  noFill();

  float starterX=random(width);
  float starterY=random(height);
  for ( int r=int(random(60, 100)); r<100; r= r+10) {
    for (int i=int(spacer); i<int(360); i=i+spacer) {

      px = starterX+ cos(radians(angle))*(r);
      py = starterY+ sin(radians(angle))*(r);
      frequency=i;
      angle= frequency;
      cT=images[int(random(10,11))].get(int(starterX),int(starterY));
      stroke(cT, random(250));
      strokeWeight(3);
      point (px, py);
    }
  }
}