
import java.util.Random;
import java.util.Collections;
import processing.sound.*;
SoundFile file;

SoundFile GameMusic;
SoundFile DeathMusic;

//All image files
import processing.awt.PGraphicsJava2D;
public PImage player;
public PImage enemyImage;
public PImage weaponrocket;
public PImage explo;

//Global variables:
Player p1;
Menus menu;
int selectedDifficulty;
Camera cam;
PMatrix2D camMat = new PMatrix2D();
boolean[] keyspressed = new boolean[50];
Random rand = new Random();
boolean is_shoot = false;

long ptime;
public long tick;
public Map map;

ArrayList<Collideable> allObjects = new ArrayList<>();

double[] starsX = new double[1000];
double[] starsY = new double[1000];
int[] starCloseness = new int[1000];
double[] trailX = new double[15];
double[] trailY = new double[15];

boolean hasStarted = false;
boolean StartMusicPlaying = false;
boolean GameMusicPlaying = false;
boolean DeathMusicPlaying = false;
int knockbackModifier =1;


//SETUP FUNCTION: called once
void setup(){
  ellipseMode(RADIUS);
  size(1280,1024,P2D);
  frameRate(50);
   
  setupImages();
  makeStars();
  tick = 0;
  ptime = millis();
  cam = new Camera(0,0);
  menu = new Menus(this);
} 

public void makeStars(){
  for (int i = 0; i < 1000; i++) {
     starsX[i] = rand.nextInt(1280);
     starsY[i] = rand.nextInt(1024);
     starCloseness[i] = rand.nextInt(10);
  }
}

void setupImages(){
  enemyImage =loadImage("data/enemy_walk_1.png");
  enemyImage.resize(50,50);
  weaponrocket= loadImage("rock.png");
  weaponrocket.resize(50,50);
  explo = loadImage("exp.png");
}

void setticks(){
 tick +=floor((millis() - ptime)/10);
 ptime = millis();
}

public void startGame(int difficulty){  
  cam = new Camera(0,0);
  p1 = new Player(0,0,allObjects,cam);
  //map = new Map()
  ptime = millis();
}

void draw(){
  background(0);
  drawStars();
  if(!menu.isPlaying()){
    menu.doThings();
  }
  else{
    gameplayLoop();
  }
}

void updateStarPositions() {
  for (int i = 0; i < 1000; i++) {
    if (keyspressed[3] == true) {
     starsX[i] -= starCloseness[i] * 0.01;
    }
    if (keyspressed[1] == true) {
      starsX[i] += starCloseness[i] * 0.01;
    }
    if (keyspressed[2] == true) {
     starsY[i] -= starCloseness[i] * 0.01;
    }
    if (keyspressed[0] == true){
      starsY[i] += starCloseness[i] * 0.01;
    }     
  }
}

void drawStars(){
 for (int i = 0; i < 1000; i++) {
    fill(255);
    stroke(255);
    ellipse((int)starsX[i], (int)starsY[i], 1, 1);
  } 
}

void updateTrail() {
  for (int i = trailX.length - 1; i > 0; i--) {
      trailX[i] = trailX[i - 1];
      trailY[i] = trailY[i - 1];
  }
  trailX[0] = p1.xGet() - 20;
  trailY[0] = p1.yGet() - 5;
}

void drawTrail() {
  for (int i = 1; i < 15; i++) {
    fill(255, 165, 0);
    stroke(255, 165, 0);
    ellipse((int)trailX[i], (int)trailY[i], 15 - i, 15 - i);
  }
}

void gameplayLoop(){
  setticks();
  background(0);
  updateStarPositions();
  
  cam.move(p1.xGet(),p1.yGet());
  camera(camMat, cam.x,cam.y,0.5,0.5);
  
  updateTrail();
  drawTrail();
  
  p1.doThings(keyspressed);
  if(p1.isDead()){map.stopMusic();menu.switchScreen(Page.DEATH);}
 // map.doThings();
}

void die(){
  if(!DeathMusicPlaying){
    GameMusic.stop();
    GameMusicPlaying = false;
    DeathMusic.play();
    DeathMusicPlaying = true;
  }
  camera(camMat, cam.x,cam.y,0.5,0.5);
}

void mousePressed(){
  if(mouseButton == LEFT){
    keyspressed[6]=true;
  }
  if(mouseButton == RIGHT){
    keyspressed[5]=true;
  }
}
  
void mouseReleased(){
  if(mouseButton == LEFT){
    keyspressed[6]=false;
  }
  if(mouseButton == RIGHT){
    keyspressed[5]=false;
  }  
}

//Code for registering presses
void keyPressed(){
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
  if(keyCode ==TAB){
    keyspressed[4] = true;  
  }
  if (key == 'e'){
     keyspressed[7] = true;
  }
  if(key == ' '){
    keyspressed[8] = true;
  }

  if(keyCode == ESC){
    key = 0;
    switch (menu.activePage){
       case PLAYING : 
         menu.switchScreen(Page.PAUSE);
         return;
       case PAUSE : 
         loop();
         menu.switchScreen(Page.PAUSE);
         return;
       case DEATH : 
          exit();
       default : 
         return;
    }
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
  if(key == 'e'){
    keyspressed[7] = false;
  }
  if(key == ' '){
    keyspressed[8] = false;
  }
}


//Code to manage the camera movements
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
