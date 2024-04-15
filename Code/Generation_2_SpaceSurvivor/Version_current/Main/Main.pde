import java.util.Random;
import java.util.Collections;
import processing.awt.PGraphicsJava2D;
import ddf.minim.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

public PImage player;
public PImage enemyImage;
public PImage weaponrocket;
public PImage explo;

PMatrix2D camMat = new PMatrix2D();
Camera cam;
Menus menu;
boolean[] keyspressed = new boolean[50];

Random rand = new Random();

public long tick;
public long pTime;
public double[] starsX = new double[1000];
public double[] starsY = new double[1000];
public int[] starCloseness = new int[1000];


Minim minim;
AudioSample  bumpSound;
AudioSample  explosionSound;
AudioSample  hitmarkerSound;
AudioSample  launcherFire;
AudioSample  playerDamageSound;
AudioSample  portalTravelSound;
AudioSample  replicatorDestroyed;
AudioSample  shotgunSound;
FilePlayer  portalIdleSound;
FilePlayer  flyingSoundEffect;
TickRate rateControl;
TickRate rateControlPortal;
AudioOutput out;

//SETUP FUNCTION: called once
void setup(){
  ellipseMode(RADIUS);
  textAlign(CENTER);
  size(1280,1024,P2D);
  frameRate(50);
   
  setupImages();
  setupSounds();
  makeStars();

  cam = new Camera(0,0);
  menu = new Menus(this, cam);
} 

void setupImages(){
  enemyImage =loadImage("data/enemy_walk_1.png");
  enemyImage.resize(50,50);
  weaponrocket= loadImage("rock.png");
  weaponrocket.resize(50,50);
  explo = loadImage("exp.png");
}

void setupSounds(){
 minim = new Minim(this);
 bumpSound =  minim.loadSample("bumpSound.wav",512); 
 explosionSound = minim.loadSample("explosionSound.wav",512);
 hitmarkerSound = minim.loadSample("hitmarkerSound.wav",512);
 launcherFire = minim.loadSample("launcherFire.wav",512);
 playerDamageSound = minim.loadSample("playerDamageSound.wav",512);
 portalIdleSound = new FilePlayer( minim.loadFileStream("portalIdleSound.wav") );
 portalTravelSound = minim.loadSample("portalTravelSound.wav",512);
 replicatorDestroyed = minim.loadSample("replicatorDestroyed.wav",512);
 shotgunSound = minim.loadSample("shotgunSound.wav",512);  
 flyingSoundEffect = new FilePlayer( minim.loadFileStream("flyingSoundEffect.wav") );
 rateControl = new TickRate(1.f);
 rateControl.setInterpolation( true );
 out = minim.getLineOut();
 rateControlPortal = new TickRate(1.f);
 rateControlPortal.setInterpolation( true );
 flyingSoundEffect.patch(rateControl).patch(out);
 portalIdleSound.patch(rateControlPortal).patch(out);
}

public void makeStars(){
  for (int i = 0; i < 1000; i++) {
     starsX[i] = rand.nextInt(1280);
     starsY[i] = rand.nextInt(1024);
     starCloseness[i] = rand.nextInt(10);
  }
}

void draw(){
  menu.doThings(keyspressed);
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
    menu.doClick();
  }
  if(mouseButton == RIGHT){
    keyspressed[5]=false;
  }  
}

//Code for registering presses
void keyPressed(){
  if(key == 'w'|| key == 'W'){
    keyspressed[0] = true;
  }
  if(key == 'a'|| key == 'A'){
    keyspressed[1] = true;
  }  
  if(key == 's'|| key == 'S'){
    keyspressed[2] = true;
  }
  if(key == 'd'|| key == 'D'){
    keyspressed[3] = true;
  }
  if(keyCode ==TAB){
    keyspressed[4] = true;  
  }
  if (key == 'e'|| key == 'E'){
     keyspressed[7] = true;
  }
  if(key == ' '){
    keyspressed[8] = true;
  }

  if(keyCode == ESC){
    key = 0;
    switch (menu.activePage){
       case PLAYING : 
         menu.pauseGame();
         return;
       case PAUSE : 
         menu.switchScreen(Page.PLAYING,menu.playingScreen);
         return;
       case DEATH : 
          exit();
       default : 
         return;
    }
  }
}

void keyReleased(){
  if(key == 'w' || key == 'W'){
    keyspressed[0] = false;
  }
  if(key == 'a'|| key == 'A'){
    keyspressed[1] = false;
  }
  if(key == 's'|| key == 'S'){
    keyspressed[2] = false;
  }
  if(key == 'd'|| key == 'D'){
    keyspressed[3] = false;
  }
  if(keyCode ==TAB){
    keyspressed[4] = false;  
  }
  if(key == 'e'|| key == 'E'){
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
