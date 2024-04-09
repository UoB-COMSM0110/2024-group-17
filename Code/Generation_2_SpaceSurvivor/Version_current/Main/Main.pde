
import java.util.Random;
import java.util.Collections;
import processing.sound.*;
SoundFile file;
SoundFile StartMusic;
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
UI user;
int selectedDifficulty;
ParticleSystem ps;
Camera cam;
PMatrix2D camMat = new PMatrix2D();
boolean[] keyspressed = new boolean[50];
Random rand = new Random();
boolean is_shoot = false;

long ptime;
public long tick;
public Map map;

ArrayList<Projectile> projectilelist;

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
  selectedDifficulty = 0;
  for (int i = 0; i < 1000; i++) {
     starsX[i] = rand.nextInt(1280);
     starsY[i] = rand.nextInt(1024);
     starCloseness[i] = rand.nextInt(10);
  }
  //setup window and settings
  ellipseMode(RADIUS);
  size(1280,1024,P2D);
  frameRate(50);
   
  setupImages();
  
  //Initialise global variables
  tick = 0;
  ptime = millis();
  StartMusic = new SoundFile(this,"TitleScreen.wav");
  GameMusic = new SoundFile(this,"GameMusic.wav");
  DeathMusic = new SoundFile(this,"DeathMusic.wav");
  cam = new Camera(0,0);
  p1 = new Player(0,0,player);
  projectilelist = new ArrayList<Projectile>();  
  user = new UI(p1);
  frameRate(50);
} 

void setupImages(){
  enemyImage =loadImage("data/enemy_walk_1.png");
  enemyImage.resize(50,50);
  player = loadImage("player_ufo.png"); 
  weaponrocket= loadImage("rock.png");
  weaponrocket.resize(50,50);
  explo = loadImage("exp.png");
  player.resize(50,50);
}

void setticks(){
 tick +=floor((millis() - ptime)/10);
 ptime = millis();
}

public void startGame(int difficulty){
  map = new Map(difficulty);
  p1 = new Player(0,0,player);
  projectilelist = new ArrayList<Projectile>();
  cam = new Camera(0,0);
  ptime = millis();
  user.mainMenu = false;
}

public void stopGame(){
  GameMusic.stop();
  GameMusicPlaying = false;
  user.mainMenu=true;
}

void draw(){
  if (user.mainMenu) {
    MainMenu(); 
  }
  if(!user.paused&&!user.dead&&!user.mainMenu&&!user.difficulty){
    gameplayLoop();
  }
  if(user.paused){
    Paused();
  }
  if(user.dead){
    Dead(); 
  }
  if(user.difficulty){
    Difficulty(); 
  }
  //println(frameRate,EnemyList.size());
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
  trailX[0] = p1.xGet() - 20;
  trailY[0] = p1.yGet() - 5;
}

void drawTrail() {
  for (int i = 1; i < 15; i++) {
    fill(255, 165, 0);
    stroke(255, 165, 0);
    ellipse((int)trailX[i], (int)trailY[i], 15 - i, 15 - i);
    //println("Drawing ellipse at ", trailX[i], trailY[i]);
  }
}



void gameplayLoop(){
  //Set current tick of the frame
  setticks();
  
  //Draw the background to clear the frame, maybe not nessesary anymore
  background(0);
  
  if(!GameMusicPlaying){
    StartMusicPlaying = false;
    StartMusic.stop();
    DeathMusicPlaying = false;
    DeathMusic.stop();
    GameMusic.play();
    GameMusicPlaying = true;
  }
  
  updateStarPositions();
  for (int i = 0; i < 1000; i++) {
    fill(255);
    stroke(255);
    ellipse((int)starsX[i], (int)starsY[i], 1, 1);
  }
  cam.move(p1.xGet(),p1.yGet());
  camera(camMat, cam.x,cam.y,0.5,0.5);
  
  updateTrail();
  drawTrail();
  
 //Update the players info
  p1.doThings(keyspressed);
  

  //Update the UI info
  user.update(p1);
  user.healthbar(cam);
  user.cooldowns(cam,p1);
  user.score(cam);
  
  
}

void Paused(){
   camera(camMat, cam.x,cam.y,1,1);
   user.pausescreen(cam);  
}

void Difficulty() {
  background(0);
  for (int i = 0; i < 1000; i++) {
    fill(255);
    stroke(255);
    ellipse((int)starsX[i], (int)starsY[i], 1, 1);
  }
  camera(camMat, cam.x,cam.y,0.5,0.5);
  user.difficultyscreen(cam);
}

void Dead(){
  if(!DeathMusicPlaying){
    GameMusic.stop();
    GameMusicPlaying = false;
    DeathMusic.play();
    DeathMusicPlaying = true;
  }
  camera(camMat, cam.x,cam.y,0.5,0.5);
  user.deathscreen(cam);  
}

void MainMenu(){
  background(0);
  //updateStarPositions();
  for (int i = 0; i < 1000; i++) {
    fill(255);
    stroke(255);
    ellipse((int)starsX[i], (int)starsY[i], 1, 1);
  }
  cam.move(p1.xGet(),p1.yGet());
  camera(camMat, cam.x,cam.y,0.5,0.5);
  user.mainmenu(cam);
  if(!StartMusicPlaying){
    StartMusic.play();
    StartMusicPlaying = true;
    DeathMusicPlaying = false;
    DeathMusic.stop();
    GameMusicPlaying = false;
    GameMusic.stop();
  }
}


void mousePressed(){
  if(mouseButton == LEFT){
    keyspressed[5]=true;
  }
  if(mouseButton == RIGHT){
    keyspressed[6]=true;
  }
}
  
void mouseReleased(){
  if(mouseButton == LEFT){
    keyspressed[5]=false;
  }
  if(mouseButton == RIGHT){
    keyspressed[6]=false;
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

  if(key == 'r'){
    if(user.dead||user.paused){
      stopGame();
    }
  }

  if(keyCode == ESC){
    key = 0;
    if(user.dead){
      exit(); 
    }
    if(user.mainMenu||user.difficulty){
      return;
    }
    user.paused = !user.paused;
    if(user.paused){
      GameMusic.amp(0.25);
    }
    if(!user.paused){
       GameMusic.amp(1);
       loop();
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
