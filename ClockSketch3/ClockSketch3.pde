float x1, x2, y1, y2, xs, ys;
float angleSeconds;
float angleSeconds2;
float radius;


boolean under30s = true;
boolean under60s = true;

int s = 0;
int lastTime = 0; 
int numberSize = 48;
int segments = 20;



void setup() {
  size(1280, 720);
  stroke(0);
  fill(255, 255, 255, 100);
  textSize(48);
  
  angleSeconds = PI/30.0;
  angleSeconds2 = PI/15.0;
  x1 = 0;
  x2 = width;
  xs = x1;
  y1 = y2 = height/2;
  ys = height/2;

  
  radius = height/2;
}

void draw() {
  
  background(200, 200, 220);
 
 
  
  
 //Erste Hälfte
  push();
  
  
  translate(x1, y1);
  fill(255, 255, 255, 100);
  if(under30s){
    rotate(angleSeconds * s);
  }else if(!under30s && under60s){
    rotate(-angleSeconds * s);
  }
  noStroke();
  arc(0, 0, height, height, -HALF_PI, HALF_PI);
  
  for(int i = 0; i <= 30; i++){
    float angle = PI / 30 * i - HALF_PI;
    float xt = cos(angle) * radius;
    float yt = sin(angle) * radius;
    int size = 5;
    if(i % 2 == 0);{
    size = 10;
    }
    fill(0);
    ellipse(xt, yt, size, size);
  }
  
  for(int i = 1; i <= 6; i++){
    float angle = PI / 6 * i - HALF_PI;
    float xt = cos(angle) * radius;
    float yt = sin(angle) * radius;
    
    fill(0);
    text(str(i), xt, yt);
  }
  pop();
  
  
  //Zweite Hälfte
  push();
  fill(255, 100, 255, 100);
  translate(x2, y2);
  noStroke();
  rotate(-angleSeconds * s);
  arc(0, 0, height, height, HALF_PI, 3*HALF_PI);
   for(int i = 1; i <= 6; i++){
    float angle = PI / 6 * i + HALF_PI;
    float xt = cos(angle) * radius;
    float yt = sin(angle) * radius;
    
    fill(0);
    text(str(i+6), xt, yt);
  }
  pop();
  
  //Sekunden-Zeiger
  push();

  translate(x1, y1);
  strokeWeight(10);
  rotate(angleSeconds2 *s);
  line(0, 0, 0, -radius);
  pop();
 
 //Sekunden Berechnung
 int currentTime = millis();
  if (currentTime - lastTime >= 1000) { // 1000 ms = 1 Sekunde
     if(s == 30){
      under30s = false;
      }
      if(s == 60){
        s = 0;
      }
      
      if(under30s){
      x1 += (width/2.0)/30.0;
      x2 -= (width/2.0)/30.0;
      xs = x1;
    }
    if(!under30s && under60s){
     //angleSeconds2 = PI/30.0;
    }
    
    lastTime = currentTime;
    s++;
  }
}
