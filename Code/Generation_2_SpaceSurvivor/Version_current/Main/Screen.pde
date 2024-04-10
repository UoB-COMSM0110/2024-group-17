public abstract class Screen{
  
  
  
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
  
  
}
