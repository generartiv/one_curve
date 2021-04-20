
PImage getImg;

float a=0;
float b=0;

MovingVal vals[] = new MovingVal[20];

void setup() {
  size(1280, 720);

  for (int i=0; i<20; i++) {
    vals[i] = new MovingVal(height/2, width*0.7, random(0.001, 0.5));
  }

  vals[8] = new MovingVal(3, 2, 0.5);

  vals[9] = new MovingVal(0, 4, random(0.001, 0.7));
  vals[10] = new MovingVal(0, 4, random(0.001, 0.7));

  vals[11] = new MovingVal(width, 4, random(0.001, 0.7));
  vals[12] = new MovingVal(height, 4, random(0.001, 0.7));

  vals[13] = new MovingVal(200, 50, random(0.001, 0.7));
  vals[14] = new MovingVal(200, 50, random(0.001, 0.7));
  vals[15] = new MovingVal(200, 50, random(0.001, 0.7));

  vals[16] = new MovingVal(1.01, 0.005, random(0.001, 0.7));
  vals[17] = new MovingVal(1.01, 0.005, random(0.001, 0.7));
  vals[18] = new MovingVal(1.01, 0.005, random(0.001, 0.7));
  background(255);
}

void draw() {

  a+=0.0258;

  b+=1.0;
  if (b%6 == 0) {
    loadPixels();

    for (int x=0; x<width; x++) {
      for (int y=0; y<height; y++) {
        int numPix = y*width + x;
        color c= pixels[numPix];
        float r = red(c)*vals[16].val;
        if (r>255) {
          r = 255;
        }
        float g = green(c)*vals[17].val;
        if (g>255) {
          g = 255;
        }
        float b = blue(c)*vals[18].val;
        if (b>255) {
          b = 255;
        }
        pixels[numPix] = color(r, g, b);
      }
    }
    updatePixels();
  }

  getImg = get();
  tint(255, 255, 255, 50);
  image(getImg, vals[9].val, vals[10].val, vals[11].val, vals[12].val);

  for (int i=0; i<20; i++) {
    vals[i].calc();
  }
  stroke(vals[13].val, vals[14].val, vals[15].val, 13);
  strokeWeight(vals[8].val*4);
  noFill();
  bezier(vals[0].val, vals[1].val, vals[2].val, vals[3].val, vals[4].val, vals[5].val, vals[6].val, vals[7].val);

  stroke(36, 36, 38, 64);
  strokeWeight(1);
  noFill();
  bezier(vals[0].val, vals[1].val, vals[2].val, vals[3].val, vals[4].val, vals[5].val, vals[6].val, vals[7].val);
  
  saveFrame("/frames/frame-#######.jpg");
}