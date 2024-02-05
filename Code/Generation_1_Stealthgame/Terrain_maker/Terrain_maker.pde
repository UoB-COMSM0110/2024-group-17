import java.io.PrintWriter;

int colR;
int colG;
int colB;
int size;
int scale;
int terrainno;
boolean next;
Player p1;
PMatrix2D camMat = new PMatrix2D();
boolean [] keyspressed = new boolean[5];
String [] lines;
ArrayList<Terrain> terrainlist;
PImage canvas;
PrintWriter output;

void setup(){
  size(1500,1000,P2D);
  size = 10;
  scale = 5;
  terrainno = 0;
  p1 = new Player(0,5000);
  background(255);
  strokeWeight(5);
  canvas = loadImage("background1.jpeg");
  terrainlist = new ArrayList<Terrain>();
  rect(0,0,1500,1000);
  noStroke();
  next = true;
  load();
}

void draw(){
 background(255);
 camera(camMat, p1.x,p1.y,scale,scale);
 image(canvas,0,0);
 fill(colR,colG,colB);
 rect(round((((mouseX-750)/scale)+p1.x)/10)*10,round((((mouseY-500)/scale)+p1.y)/10)*10,size,size);
  if(mousePressed && mouseButton==LEFT && next){
     terrainno++;
     next = false;
     terrainlist.add(new Terrain(round((((mouseX-750)/scale)+p1.x)/10)*10,round((((mouseY-500)/scale)+p1.y)/10)*10,colR,colG,colB,size));
     println("new terrain : %i",terrainno);
}
 for(Terrain tn : terrainlist){
      tn.render();
  }
  p1.move(keyspressed);
//  p1.render();
}

void mouseReleased(){
  next = true; 
}

void mouseWheel(MouseEvent event){
   int e = event.getCount();
   if(scale>0){
     scale-=e;
   }
   if(scale<=0){
     scale = 1; 
   }
   println(scale);
}



void keyPressed(){
  if(key == 'f'){
    output();
  }
  if(key == 'w'){
    keyspressed[0] = true;
  }
  if(key == 'a'){
    keyspressed[1] = true;
  }
  if(key == 's'){
    keyspressed[2] = true;
  }
  if(key == 'd'){
    keyspressed[3] = true;
  }

  if(key == 'z'){
    //
    colR = 255;
    colG = 0;
    colB = 0;
  }
  if(key == 'x'){
    //
    colR = 0;
    colG = 255;
    colB = 0;   
  }  
  if(key == 'c'){
    //
    colR = 0;
    colG = 0;
    colB = 255;   
  }
  if(key == 'q'){
    //
    colR = 0;
    colG = 0;
    colB = 0;    
  }
  if(key == 'e'){
    //
    colR = 255;
    colG = 255;
    colB = 255;   
  }
  if(key =='1'&&size>1){
    size-=10;
  }
  if(key=='2'){
    size+=10;
  }
  if(keyCode == BACKSPACE&&terrainno>0){
    terrainlist.remove(terrainlist.get(terrainno-1));
    terrainno--;
  }
}
void keyReleased(){
  if(key == 'w'){
    keyspressed[0] = false;
  }
  if(key == 'a'){
    keyspressed[1] = false;
  }
  if(key == 's'){
    keyspressed[2] = false;
  }
  if(key == 'd'){
    keyspressed[3] = false;
  }

}

void load(){
  lines = loadStrings("output.txt");
//  println("%s",lines[0]);
  int l = lines.length;
  for(String s:lines){
     String[] snsplit = s.split(" ");
     terrainlist.add(new Terrain(Integer.parseInt(snsplit[0]),Integer.parseInt(snsplit[1]),Integer.parseInt(snsplit[2]),Integer.parseInt(snsplit[3]),Integer.parseInt(snsplit[4]),Integer.parseInt(snsplit[5])));
  }
  terrainno = l;
}

void output(){ 
   output = createWriter("output.txt");
   for(int i=0;i<terrainno;i++){
     Terrain tn = terrainlist.get(i);
     String data = String.valueOf(tn.x) + ' ' + String.valueOf(tn.y)+ ' ' +String.valueOf(tn.colR)+ ' ' +String.valueOf(tn.colG)+ ' ' +String.valueOf(tn.colB)+ ' ' +String.valueOf(tn.size) ; 
     output.println(data);
   }
   output.flush();
   output.close();
}


PVector translation(PMatrix2D m, PVector out){
  return out.set(m.m02,m.m12,0.0);
}

PVector scaling(PMatrix2D m, PVector out){
 float magx = sqrt(m.m00 * m.m00 + m.m10 * m.m10);
 float magy = sqrt(m.m01 * m.m01 + m.m11 * m.m11);
 if(m.determinant()<0.0){
   magy = -magy;
 }
 return out.set(magx,magy);  
}

PMatrix2D decompose(PMatrix2D m, PVector pos,PVector eul, PVector scl){
 translation(m,pos); 
 scaling(m,scl);
 eul.set(0.0,0.0,atan2(-m.m01,m.m00));
 return m;
}

PMatrix2D camera(PMatrix2D cameraMatrix, float tx, float ty, float zoomW, float zoomH){
  cameraMatrix.set(1.0,0.0,width*0.5,0.0,1.0,height* 0.5);
  cameraMatrix.scale(zoomW,zoomH);
  cameraMatrix.translate(-tx,-ty);
  setMatrix(cameraMatrix);
  return cameraMatrix;
}
