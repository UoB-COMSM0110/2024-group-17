public class DifficultyPage extends Screen{
  PImage normalImage;
  PImage normalImage1;
  PImage normalImage2;
  PImage insaneImage;
  PImage insaneImage1;
  PImage insaneImage2;
  PImage tutorialImage;
  PImage tutorialImage1;
  PImage tutorialImage2;
  
  Menus menu;
    
  DifficultyPage(Menus menuInput){
    menu = menuInput;
    tutorialImage1 = loadImage("data/button_tutorial_1.png");    
    tutorialImage2 = loadImage("data/button_tutorial_2.png");
    normalImage1 = loadImage("data/normal_button_1.png");
    normalImage2 = loadImage("data/normal_button_2.png");
    insaneImage1 = loadImage("data/insane_button_1.png");
    insaneImage2 = loadImage("data/insane_button_2.png");
  }
  
   public void doThings(){
    background(0);
    drawStars();
    checkButtons(false);
    drawButtons();
  }
  
  @Override
  public void checkButtons(boolean isClick){
     checkTutorial(isClick);
     checkNormal(isClick);
     checkInsane(isClick);
  }
  
  private void drawButtons(){
  camera(camMat, cam.x,cam.y,0.5,0.5);
    image(tutorialImage, cam.x-180,cam.y - 200);
    image(normalImage, cam.x-180, cam.y);
    image(insaneImage, cam.x-180, cam.y+200);
    textSize(80);
    fill(255);
    text("SELECT DIFFICULTY", cam.x-30,cam.y - 400);
  }
  
  private void checkTutorial(boolean isClick){
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 - 100) && mouseY < (height / 2 - 50)) {
       tutorialImage = tutorialImage2;
       if (isClick) {
         menu.newGame(-1);
         return;
       }
       
    } else {
       tutorialImage = tutorialImage1;
    }
  }

  private void checkInsane(boolean isClick){
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 + 100) && mouseY < (height / 2 + 150)) {
       insaneImage = insaneImage2; 
       if (isClick) {
         menu.newGame(1);
         return;
       }
       
    } else {
       insaneImage = insaneImage1; 
    }
  }
  
  private void checkNormal(boolean isClick){
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50)) {
       normalImage = normalImage2; 
       if (isClick) {
         menu.newGame(0);
         return;
       }
    } else {
       normalImage = normalImage1; 
    }
  }
  
  
  
  
}
