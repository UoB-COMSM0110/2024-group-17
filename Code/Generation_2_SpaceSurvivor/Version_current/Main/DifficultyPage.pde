public class DifficultyPage{
  PImage normalImage;
  PImage normalImage1;
  PImage normalImage2;
  PImage insaneImage;
  PImage insaneImage1;
  PImage insaneImage2;
  
  Menus menu;
    
  DifficultyPage(Menus menuInput){
    menu = menuInput;
    normalImage1 = loadImage("data/normal_button_1.png");
    normalImage2 = loadImage("data/normal_button_2.png");
    insaneImage1 = loadImage("data/insane_button_1.png");
    insaneImage2 = loadImage("data/insane_button_2.png");
  }
  
   public void doThings(){
    checkNormal();
    checkInsane();
    drawButtons();
  }
  
  private void drawButtons(){
  camera(camMat, cam.x,cam.y,0.5,0.5);
    image(normalImage, cam.x-180, cam.y);
    image(insaneImage, cam.x-180, cam.y+200);
  }

  private void checkInsane(){
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2 + 100) && mouseY < (height / 2 + 150)) {
       insaneImage = insaneImage2; 
       if (mouseButton == LEFT) {
         selectedDifficulty = 1;
         menu.switchScreen(Page.PLAYING);
         startGame(1);
         return;
       }
       
    } else {
       insaneImage = insaneImage1; 
    }
  }
  
  private void checkNormal(){
    if (mouseX > (width / 2 - 100) && mouseX < (width / 2 + 75) && mouseY > (height / 2) && mouseY < (height / 2 + 50)) {
       normalImage = normalImage2; 
       if (mouseButton == LEFT) {
         selectedDifficulty =0;
         menu.switchScreen(Page.PLAYING);
         startGame(0);
         return;
       }
    } else {
       normalImage = normalImage1; 
    }
  }
  
  
  
  
}
