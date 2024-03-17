
import java.util.Random;
import java.util.Collections;
import processing.sound.*;
SoundFile file;
SoundFile StartMusic;
SoundFile GameMusic;
SoundFile DeathMusic;

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
PImage baseBackground;PImage weaponrocket;
PImage explo;

//Global variables:
Player p1;
Spawning spawn;
UI user;
int selectedDifficulty;
weaponsystem w1;
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
boolean[] keyspressed = new boolean[6];
boolean is_shoot = false;
long ptime;
public long tick;
ArrayList<Enemy> EnemyList;
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
  scale = 1;
  x = width/2;
  y = height/2;
  scale = .5;
  tick = 0;
  ptime = millis();
  StartMusic = new SoundFile(this,"TitleScreen.wav");
  GameMusic = new SoundFile(this,"GameMusic.wav");
  DeathMusic = new SoundFile(this,"DeathMusic.wav");
  cam = new Camera(x,y);
  p1 = new Player(50,50,player);
  w1 = new weaponsystem();
  management = new levelManager();
  projectilelist = new ArrayList<Projectile>();
  EnemyList = new ArrayList<Enemy>();  
  spawn = new Spawning();
  user = new UI(p1);
  background = new BackManager(backgroundtile);
  frameRate(50);
} 

void setupImages(){
  enemyImage1 = loadImage("data/enemy_walk_1.png");
  enemyImage1.resize(50,50);
  enemyImage2 = loadImage("data/enemy_walk_2.png");
  enemyImage2.resize(50,50);
  enemyImage = enemyImage1;
  enemyImage.resize(50,50);
  player = loadImage("player_ufo.png"); 
  weaponrocket= loadImage("rock.png");
  weaponrocket.resize(50,50);
  explo = loadImage("exp.png");
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

  GameMusic.stop();
  GameMusicPlaying = false;
//  tick = 0;
  management = new levelManager();
  p1 = new Player(0,0,player);
  projectilelist = new ArrayList<Projectile>();
  spawn = new Spawning();
//  user = new UI(p1);
  cam = new Camera(x,y);
  ptime = millis();
  w1= new weaponsystem();
  for(int i=EnemyList.size()-1;i>=0;i--){
  Enemy En = EnemyList.get(i);
     EnemyList.remove(En);  
  }  
  user.mainMenu=true;
}

public void callRestart() {
   restart(); 
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
  trailX[0] = p1.x - 20;
  trailY[0] = p1.y - 5;
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
  //println(frameRate);
  
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
  cam.move(p1.x,p1.y);
  camera(camMat, cam.x,cam.y,scale,scale);
  
  updateTrail();
  drawTrail();
  
  //Call the enemy and projectile subDraw functions
  Enemyfunctioncall();
  Projectilefunction();
  
  //Update the players info
  p1.updatecds();
  p1.move(keyspressed);
  p1.render();
  
  //Update weapon info
  w1.useweapon(is_shoot,p1.x,p1.y);
  w1.move();
  //Update the UI info
  user.update(p1);
  user.healthbar(cam);
  user.cooldowns(cam,p1);
  user.score(cam);
  
  //Check for spawns for the next frame;
  spawn.randspawn(p1);
  management.checknext();   
}

void Enemyfunctioncall(){
  Collections.sort(EnemyList);
  int size = EnemyList.size();
  int ra = w1.getR();
  for(int i=0;i<size;i++){
     Enemy En = EnemyList.get(i);
     En.updateVector(p1);
     En.chase(i,size,knockbackModifier);
     En.collideTest(p1);
     En.updateRock(w1);
     En.collTest(w1,ra);
     image(enemyImage, En.x - 50, En.y - 50);       
  } 
  for(int i=size-1;i>=0;i--){
  Enemy En = EnemyList.get(i);
    if(En.shouldRemove){
      EnemyList.remove(En);  
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

void Difficulty() {
  background(0);

  //updateStarPositions();
  for (int i = 0; i < 1000; i++) {
    fill(255);
    stroke(255);
    ellipse((int)starsX[i], (int)starsY[i], 1, 1);
  }
  camera(camMat, cam.x,cam.y,scale,scale);
  user.difficultyscreen(cam);
}

void Dead(){
  if(!DeathMusicPlaying){
    GameMusic.stop();
    GameMusicPlaying = false;
    DeathMusic.play();
    DeathMusicPlaying = true;
  }
  camera(camMat, cam.x,cam.y,scale,scale);
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
  cam.move(p1.x,p1.y);
  camera(camMat, cam.x,cam.y,scale,scale);
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
  if(key == ' '){
    keyspressed[5] = true;
    //p1.roll(keyspressed); 
  }
  if (key == 'e'){
    is_shoot = true;
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
    is_shoot = false;
  }
  if(key == ' '){
    keyspressed[5] = false;
    //p1.roll(keyspressed); 
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
