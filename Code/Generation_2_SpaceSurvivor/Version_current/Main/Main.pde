
//Networking variables: if not working please install the OscP5 library
import oscP5.*;
import netP5.*;
import java.util.Random;
OscP5 oscP5;
NetAddress myBroadcastLocationAttack;
NetAddress myBroadcastLocationKill;
NetAddress myBroadcastLocationStop;
NetAddress myBroadcastLocationStart;
OscMessage attack;
OscMessage kill;
OscMessage stopsignal;
OscMessage startsignal;


//All image files
import processing.awt.PGraphicsJava2D;
PImage testimage;
PImage backgroundtile;
PImage player;
PImage playerImage;
PImage asymbol;
PImage enemyImage1;
PImage enemyImage2;
PImage enemyImage;
PImage baseBackground;

//Global variables:
Player p1;
Spawning spawn;
UI user;
BackManager background;
public levelManager management;
ParticleSystem ps;
Random rand = new Random();
int animCounter;
Camera cam;
PMatrix2D camMat = new PMatrix2D();
long starttick;
int beatlength = 0;
float x,y;
int counter = 0;
public float scale;
boolean[] keyspressed = new boolean[5];
long ptime;
public long tick;
ArrayList<Enemy> enemylist;
ArrayList<Projectile> projectilelist;
double[] starsX = new double[1000];
double[] starsY = new double[1000];
int[] starCloseness = new int[1000];
double[] trailX = new double[15];
double[] trailY = new double[15];


//SETUP FUNCTION: called once
void setup(){
  for (int i = 0; i < 1000; i++) {
     starsX[i] = rand.nextInt(1280);
     starsY[i] = rand.nextInt(1024);
     starCloseness[i] = rand.nextInt(10);
  }
  //setup window and settings
  ellipseMode(RADIUS);
  size(1280,1024,P2D);
  frameRate(100);
  
  setupOsc();
  setupImages();
  
  //Initialise global variables
  scale = 1;
  x = width/2;
  y = height/2;
  scale = .5;
  tick = 0;
  ptime = millis();
  cam = new Camera(x,y);
  p1 = new Player(50,50,player);
  management = new levelManager();
  enemylist = new ArrayList<Enemy>();
  projectilelist = new ArrayList<Projectile>();
  spawn = new Spawning();
  user = new UI(p1);
  background = new BackManager(backgroundtile);

  frameRate(50);
}

void setupOsc(){
  oscP5 = new OscP5(this, 6500);
  myBroadcastLocationAttack = new NetAddress("127.0.0.1", 6449);
  myBroadcastLocationKill = new NetAddress("127.0.0.1", 6448);
  myBroadcastLocationStop = new NetAddress("127.0.0.1", 6447);
  myBroadcastLocationStart = new NetAddress("127.0.0.1", 6446);
  attack = new OscMessage("/foo/notes");
  attack.add(1);
  kill = new OscMessage("/foo/notes2");
  kill.add(2);
  stopsignal = new OscMessage("/foo/notes3");
  startsignal = new OscMessage("/foo/notes4"); 
  
}

void setupImages(){
  enemyImage1 = loadImage("data/enemy_walk_1.png");
  enemyImage1.resize(50,50);
  enemyImage2 = loadImage("data/enemy_walk_2.png");
  enemyImage2.resize(50,50);
  enemyImage = enemyImage1;
  enemyImage.resize(50,50);
  playerImage = loadImage("data/player_ufo.png");
  player = playerImage;
  player.resize(50,50);
  //backgroundtile = loadImage("tile.png");
  //backgroundtile.resize(2560,2560);
}

void setticks(){
 tick +=floor((millis() - ptime)/10);
 ptime = millis();
}

//Reset the global variables for a new run.
void restart(){
  loop();
//  tick = 0;
  management = new levelManager();
  p1 = new Player(0,0,player);
  enemylist = new ArrayList<Enemy>();
  projectilelist = new ArrayList<Projectile>();
  spawn = new Spawning();
  user = new UI(p1);
  cam = new Camera(x,y);
  ptime = millis();
}

public void callRestart() {
   restart(); 
}

void draw(){
  if(!user.paused&&!user.dead){
    gameplayLoop();
  }
  if(user.paused){
    Paused();
  }
  if(user.dead){
    Dead(); 
  }
  //Need a start screenloop too
}

void updateStarPositions() {
  // move the stars in a parallax type of way depending on their 'closeness' to the player
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

void updateTrail() {
  for (int i = trailX.length - 1; i > 0; i--) {
      trailX[i] = trailX[i - 1];
      trailY[i] = trailY[i - 1];
  }
  trailX[0] = p1.x - 20;
  trailY[0] = p1.y - 5;
}

void drawTrail() {
  for (int i = 1; i < 15; i++) {
    fill(255, 165, 0);
    stroke(255, 165, 0);
    ellipse((int)trailX[i], (int)trailY[i], 15 - i, 15 - i);
    println("Drawing ellipse at ", trailX[i], trailY[i]);
  }
}



void gameplayLoop(){
  //Set current tick of the frame
  setticks();
  println(frameRate);
  
  //Draw the background to clear the frame, maybe not nessesary anymore
  background(0);
  updateStarPositions();
  for (int i = 0; i < 1000; i++) {
    fill(255);
    stroke(255);
    ellipse((int)starsX[i], (int)starsY[i], 1, 1);
  }
  cam.move(p1.x,p1.y);
  camera(camMat, cam.x,cam.y,scale,scale);
  
  // incomplete; need to work out how to draw the trail
  updateTrail();
  drawTrail();

  
  //Move the camera to the right place

  
  //Set up the background first, so we draw stuff on top
  //background.isdiff(p1);
  //background.renderall();
  
  //Call the enemy and projectile subDraw functions
  Enemyfunctioncall();
  Projectilefunction();
  
  //Update the players info
  p1.updatecds();
  p1.move(keyspressed);
  p1.render();
  
  //Update the UI info
  user.update(p1);
  user.healthbar(cam);
  user.cooldowns(cam,p1);
  user.score(cam);
  
  //Check for spawns for the next frame;
  spawn.randspawn(p1,enemylist);
  management.checknext();   
}

void Enemyfunctioncall(){
  for(int i=enemylist.size()-1;i>=0;i--){
    Enemy enemy = enemylist.get(i);
    enemy.updateVector(p1);
    enemy.chase();
    enemy.collideTest(p1);
    if(enemy.shouldRemove){
      enemylist.remove(enemy);  
    }
    else{
      image(enemyImage, enemy.x - 50, enemy.y - 50);
    }
  }   
}


void Projectilefunction(){
  for (int i = projectilelist.size() - 1; i >= 0; i-- ) {
    Projectile p = projectilelist.get(i);
    p.move();
    if (p.shouldDestroy) {
       projectilelist.remove(p); 
    } else {
        fill(0, 255, 0);
        ellipse(p.originX, p.originY, p.w, p.h);
    }    
  }  
}


void Paused(){
   camera(camMat, cam.x,cam.y,scale,scale);
   user.pausescreen(cam);  
  
}

void Dead(){
  camera(camMat, cam.x,cam.y,scale,scale);
  user.deathscreen(cam);  
}

void setAnimCounter(){
  if (animCounter == 5) {
    if (enemyImage == enemyImage1) {
       enemyImage = enemyImage2; 
    } else if (enemyImage == enemyImage2) {
       enemyImage = enemyImage1; 
    }
     animCounter = 0; 
  }
  animCounter++; 
}



//Function to check for the Attack 
void mousePressed(){
  if(mouseButton == LEFT && !p1.bAoncd && !p1.rolling && !p1.attacking && (tick - p1.aTick > p1.bAcd)){
     println("click registered");   
     oscP5.send(attack, myBroadcastLocationAttack);
     float mpx = ((mouseX-(width/2))/scale)+p1.x;
     float mpy = ((mouseY-(height/2))/scale)+p1.y;
     p1.basicAttack(mpx,mpy);
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
  if(key == 'r'){
    if(user.dead||user.paused){
      restart();
    }
  }
  if(keyCode ==TAB){
    keyspressed[4] = true;  
  }
  if(keyCode == ESC){
    key = 0;
    if(user.dead){
      exit(); 
    }
    user.paused = !user.paused;
    oscP5.send(stopsignal,myBroadcastLocationStop);
    if(!user.paused){
       loop();
    }
  }
  if(key == ' '){
    p1.roll(keyspressed); 
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


//Code to manage messages from ChucK
void oscEvent(OscMessage themessage){
   startBeat(themessage.get(0).intValue());
  
}
void startBeat(int tempo){
   starttick = tick; 
   beatlength = 6000/tempo;    
}
int beatdist(){
  if(beatlength==0){
    return 0;
  }
  return (int)(tick-starttick)%beatlength - beatlength;
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
