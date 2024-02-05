class levelManager{
  Level currentlevel;
  float levelno;
  int[] leveldescriptors;
  
  levelManager(){
    levelno = 0.0;
    leveldescriptors = new int[26];
    setupdescs();
    currentlevel = new Level(levelno,leveldescriptors[(int)levelno]);
  
  }
  
  void checknext(){
    if(tick - currentlevel.ptime>currentlevel.timel){
      nextlevel();
    }
    
  }
  
  void nextlevel(){
    if(levelno < 25 && levelno>=0){
      println(levelno);
      levelno++;
      currentlevel = new Level(levelno,leveldescriptors[(int)levelno]);
    }
  }
  
  
  void setupdescs(){
    leveldescriptors[0] = 0;
    leveldescriptors[1] = 1;    
    leveldescriptors[2] = 2;    
    leveldescriptors[3] = 4;    
    leveldescriptors[4] = 8; 
    leveldescriptors[5] = 16;    
    leveldescriptors[6] = 3;    
    leveldescriptors[7] = 6;    
    leveldescriptors[8] =12;    
    leveldescriptors[9] = 17;    
    leveldescriptors[10] = 14;    
    leveldescriptors[1] = 20;    
    leveldescriptors[12] = 24;    
    leveldescriptors[13] = 11;    
    leveldescriptors[14] = 15;    
    leveldescriptors[15] = 3;    
    leveldescriptors[16] = 7;    
    leveldescriptors[17] = 24;    
    leveldescriptors[18] =28;    
    leveldescriptors[19] = 14;    
    leveldescriptors[20] = 19;    
    leveldescriptors[21] = 20;    
    leveldescriptors[22] = 28;    
    leveldescriptors[23] = 26;    
    leveldescriptors[24] = 23;    
    leveldescriptors[25] = 31;       
    
    
  }
}
