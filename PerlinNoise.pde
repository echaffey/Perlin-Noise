int cols, rows;
int w, h;
int scale = 10;
float[][] terrain;
color[][] terraincolor;
float flying = 0;
PVector line[][];
Drone d;

void setup(){
  size(800,600,P3D);
  
  w = 1600;
  h = 1000; 
  cols = w/10;
  rows = h/10;
  terrain = new float[cols][rows];
  terraincolor = new color[cols][rows];
  line = new PVector[cols][rows];
  
  d = new Drone(width/2, height/2, 50, PI/6);
  
  frameRate(30);
}

void draw(){
  background(0);
  //stroke(0);
  
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-w/2,-h+300, -150);
  
  flying -= 0.2;
  
  float yoff = flying;
  
  for (int y = 0; y < rows; y++){
     float xoff=0;
     for(int x = 0; x < cols; x++){
       terrain[x][y] = map(noise(xoff,yoff),0,1,00,180);
       
       //forrest green
       //terraincolor[x][y] = color(map(noise(xoff,yoff),0,1,0,35),map(noise(xoff,yoff),0,1,25,100),map(noise(xoff,yoff),0,1,0,15));
       
       //desert
       //terraincolor[x][y] = color(map(noise(xoff,yoff),0,1,100,220),map(noise(xoff,yoff),0,1,90,195),map(noise(xoff,yoff),0,1,60,135));
       
       //heat map
       terraincolor[x][y] = color(map(terrain[x][y],0,180,0,225),map(terrain[x][y],0,180,255,0),0);
       
       //rainbow
       //terraincolor[x][y] = color(random(255),random(255),random(255));
       
       //Line Tracking
       if(terrain[x][y] > 150){
         System.out.println("X: "+xoff+" Y: "+yoff);
         stroke(color(255,0,0));
         //terraincolor[x][y] = color(255,0,0);
         strokeWeight(2);
         line(x*scale,y*scale,terrain[x][y],w/2, height+475,300);
         strokeWeight(1);
       }
       xoff += 0.2;
     }
     yoff += 0.2;
  }
  
  for (int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
     for(int x = 0; x < cols; x++){
       fill(terraincolor[x][y]);
       //fill(0);
       //stroke(terraincolor[x][y]);
       stroke(0);
       vertex(x*scale,y*scale,terrain[x][y]);
       vertex(x*scale,(y+1)*scale,terrain[x][y+1]); 
     }
    endShape();
  }
  

  translate(w/2-25,h-25,150);
  d.update();
  //rect(0, 0, 50, 50);
}
