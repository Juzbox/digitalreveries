


int sizer;
float sizerSW;
void crawl(int tX, int tY) {

  float rando=80;
  tX+=random(-rando, rando);
  tY+=random(-rando, rando);
  // line(tX,tY,tX+random(9),tY+random(-9,9));


  sizerSW= map(sizer, 0, 60, 0, 2);
  strokeWeight(sizerSW);
  stroke(colorTemp, 150);
  point(tX, tY);

  if (sizer<60) {
    sizer++;
  } else {
    sizer=0;
  }
}


class Wanda 
{

  float wX1;
  float wY1;
  //float sW;

  Wanda(float twX1, float twY1) {
    wX1=twX1;
    wY1=twY1;
    //sW=tsW;
  }

  void wanderer(int tC, float sW, float rando, float opacity) {
    //float rando=6;

    //wall protection + controler
    if ((wX1>width)) {
      wX1 = 0;
    } else {
      wX1+=random(-rando, rando)+cursorHorz;
    }
    if (wX1<0) {
      wX1=width;
    } else {
      wX1+=random(-rando, rando)+cursorHorz;
    }
    if ((wY1>height)) {
      wY1 = 0;
    } else {
      wY1+=random(-rando, rando)+cursorVert;
    }
    if (wY1<0) {
      wY1=height;
    } else {
      wY1+=random(-rando, rando)+cursorVert;
    }
    //



    for (int i=0; i<10; i++) {
      strokeWeight(sW);

      stroke(tC, opacity);
      point(wX1, wY1);
    }
  }
}