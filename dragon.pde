PImage dragon;

void settings(){
  size(512, 512);
}

void setup(){
  noStroke();
  dragon = createImage(width, height, ARGB);
  dragon.loadPixels();
  for(int i = 0; i < width; i ++){
    for(int j = 0; j < height; j++){
      if(i >= 128 && i < 128 + 256 && j >=128 && j < 128 + 256)
        dragon.pixels[i + j * width] = color(255);
      else
        dragon.pixels[i + j * width] = color(0, 0);
    }
  }
  dragon.updatePixels();
  slideSetV(128);
  slideSetH(-64);
  
  //slideSetV(32);
  //slideSetH(16);
  
  //slideSetV(8);
  //slideSetH(4);
  
  //slideSetV(2);
  //slideSetH(1);
  //drotate();
  apply();
}

void draw(){
  //slideW(128, 128, 10);
  //slideW(256, 128, -64);
  //apply();
  noLoop();
}

void slideSetH(int resolution){
  for(int i = 0; i < 512 / abs(resolution); i ++){
    if(i % 2 == 0)
      slideH(resolution * i, resolution, resolution / 2);
    else
      slideH(resolution * i, resolution, - resolution / 2);
  }
}

void slideSetV(int resolution){
  for(int i = 0; i < 512 / abs(resolution); i ++){
    if(i % 2 == 0)
      slideV(resolution * i, resolution, resolution / 2);
    else
      slideV(resolution * i, resolution, - resolution / 2);
  }
}

void slideV(int xStart, int w, int distance){
  dragon.set(xStart, distance, dragon.get(xStart, 0, w, height));
  //dragon = dragon.get(xStart, 0, w, height);
}

void slideH(int yStart, int h, int distance){
  dragon.set(distance, yStart, dragon.get(0, yStart, width, h));
}

void drotate(){
  dragon.loadPixels();
  int[] newPixels = dragon.pixels;
  for(int i = 0; i < width; i ++){
    for(int j = 0; j < height; j ++){
      dragon.pixels[i + j * width] = dragon.pixels[j + i * width];
    }
  }
  //dragon.pixels = newPixels;
  dragon.updatePixels();
}

void apply(){
  background(200);
  image(dragon, 0, 0);
}