//import processing.pdf.*;



int [] Xx;
int [] Yy;

float randoColor;

int colorSample;
int topColor;
int mouseColor;
int colorTemp;
int popColor;
int perlinColor=202020;
float easing = 0.1;

int a; 
int b;

float adjust;
float timer;

int numFrames = 15;  // The number of frames in the animation
PImage[] images = new PImage[numFrames];
int counter;

int colorPicker;

Wanda w1, w2, w3, w4;

void setup() {
  //size(800, 1000);
  size(1920, 1080);
  frameRate(24);

  //size(3000, 2500);
  images[0]  = loadImage("1.jpg");
  images[1]  = loadImage("2.jpg"); 
  images[2]  = loadImage("3.jpg");
  images[3]  = loadImage("4.jpg"); 
  images[4]  = loadImage("5.jpg");
  images[5]  = loadImage("6.jpg");
  images[6]  = loadImage("7.jpg");
  images[7]  = loadImage("8.jpg");
  images[8]  = loadImage("9.jpg");
  images[9]  = loadImage("10.jpg");
  images[10]  = loadImage("11.jpg");
  images[11]  = loadImage("12.jpg");
  images[12]  = loadImage("13.jpg");
  images[13]  = loadImage("14.jpg");
  images[14]  = loadImage("15.jpg");
  //images[15]  = loadImage("16.jpg");



  adjust  = random(20, 100);


  Xx = new int[width/6];
  Yy = new int[height/4];

  w1 = new Wanda(random(width), random(height));
  w2 = new Wanda(width/2, height/2);
  w3 = new Wanda(random(width), random(height));
  w4 = new Wanda(mouseX, mouseY);


  //load Xx
  for (int i = 1; i <= Xx.length-1; i++) {
    Xx[i]=Xx[i-1]+width/Xx.length;
  }


  //Load Yy
  for (int j = 1; j <= Yy.length-1; j++) {
    Yy[j]=Yy[j-1]+height/Yy.length;
  }



  points= new PVector[int(random(600, 2000))];
  for (int i = 0; i < points.length; i++) {
    PVector P = new PVector(random(2*width)-width/2, random(2*height)-height/2);
    points[i]=P;
  }


  randomSeed=10;

  //Ornament generator

  switchVal=int(random(10));
  colorPicker=int(random(4));

  //beginRecord(PDF, "Line###.pdf");
  //background(images[int(random(14))].get(width/2, height/2));
  background(images[int(random(14))].get(mouseX, mouseY));
  perlinColor = mouseColor;


  if (colorPicker<=1) {
    a=0; 
    b=5;
  }

  if (colorPicker==2) {
    a=10;
    b=13;
  }

  if (colorPicker>=3) {
    a=5;
    b=9;
  }
  mouseColor= images[counter].get(mouseX, mouseY);
  perlinColor = images[counter].get(int(random(width)), int(random(height)));
} 



void draw() { 

  randoColor = counter;  

  for (int i = 0; i < Xx.length-1; i++) {
    if ((red(colorTemp)>40)&&((blue(colorTemp)>40))&&((green(colorTemp)>40))) {
      colorSample = colorTemp;
    } else {
      colorSample=mouseColor;
    }

    w1.wanderer(mouseColor, random(5, 15),8,10);
    w2.wanderer(colorSample, random(2, 5), 10, 25);

    for (int j = 0; j < Yy.length-1; j++) {
      mouseColor= images[counter].get(mouseX, mouseY);
      colorTemp= images[int(randoColor)].get(Xx[i], Yy[j]);

      stroke(colorTemp, 150);
      noFill();
      crawl(Xx[i], Yy[j]);
    }


    w3.wanderer(mouseColor, random(2, 5), 10, 25);
    w4.wanderer(perlinColor, random(2, 5), 6, 25);
  }


  //Perlin color
  int colorLimit=80;
  if ((red(mouseColor)>colorLimit)&&((blue(mouseColor)>colorLimit))&&((green(mouseColor)>colorLimit))) {
    perlinColor = mouseColor;
  }


  gridder(mouseColor);
  perlin(perlinColor); 
  gridder(mouseColor);

  if (switchVal<=7) {
    circlr(mouseColor);
  }



  if (timer<5) {
    timer++;
  } else {
    colorizer();

    timer=0;
  }
println("colorPicker is "+colorPicker);
  println("tic toc "+timer);
   println("counter "+counter); 
  saveFrame("clouds-######.tif");
}
