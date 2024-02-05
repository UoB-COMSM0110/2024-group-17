class Level{
  char character;
  int timel;
  int damage;
  int bounce;
  int doubledamage;
  boolean cordmove;
  int fast;
  int morespawns;
  long ptime;
  
  int colr;
  int colg;
  int colb;
  
  Level( float levelnum, int leveldisc){
     character =(char)( (int)levelnum + (int)'a');
     extractinfo(leveldisc);
     timel = floor(750*(cos(levelnum/4.0)+1.1));
     setcolours(levelnum);
//     timel = 1000;
     ptime = tick;
  }
  
  void setcolours(float levelnum){
    int m = (int)levelnum*21;
    if(levelnum<13){
      colr = 255 - m;
      colg = m;
      colb = 0;
    }
    else{
      colr = 0;
      colg = 525 - m;
      colb = m-300;
    }
  }
  
  void extractinfo(int leveldisc){
     if((1&leveldisc)>0){
       bounce = 20;
     }
     else{
       bounce = 10;
     }
     if((2&leveldisc)>0){
       doubledamage = 2;
     }
     else{
       doubledamage = 1;
     }     
     if((4&leveldisc)>0){
       cordmove = true;
     }
     else{
       cordmove = false;
     }     
     if((8&leveldisc)>0){
       fast = 2;
     }
     else{
       fast = 1;
     }     
     if((16&leveldisc)>0){
       morespawns = 75;
     }
     else{
       morespawns = 100;
     }     
     
  }
  
}  
