    
public static final int DISPLAYX = 1240;
public static final int DISPLAYY = 840;
  
void setup(){
  size(1240,840);
  fill(0);
  noTint();
  noSmooth();
  textAlign(CENTER,CENTER);
}

  menu m1=new menu();
  mInterface inter = new mInterface();
  player p1 = new player();
  map map1 = new map();
  unit enemy = new unit();
  item inel[][]= new item[16][14];
  item pequip[] = new item[6];
  PlayerSkills ps = new PlayerSkills();

  int whatToDisplay=0;
  boolean newGame = true;
  int whichSave=0;
  int inmenu=1;
  int inmenu2=1;
  int direction =1;
  boolean takenext=true;
  byte enemyLayer[][] = new byte[21][21]; 
  int toDo=-1;

  XML idataXML;
  XML[] idXMLchild;
        
void draw(){
  background(#908F8F);
  
  p1.calcOtherStats(true);
  
  if(toDo!=-1){
  switch(toDo){
  case 0:
    m1.menumainonkey();
  break;
  case 1:
    m1.menunewgameloadgameonkey();
  break;
  case 2:
     if(key==ENTER)whatToDisplay=0;
  break;
  case 4:
    inter.onMaponkey();
  break;
  case 5:
    inter.fullInvheadonkey();
  break;
  case 6:
    fightSequenceonkey();
  break;
  case 7:
     whatToDisplay=4;
  break;
  case 8:
     inter.inventoryonkey();
  break;
  case 9:
     inter.fullInvheadonkey();
  break;
  case 10:
     inter.skillsonkey();
  break;
  case 11:
     inter.craftingonkey();
  break;
  case 12:
   p1.nameChonkey();
  break;
  case 13:
  //free space
  break;
  case 14:
  whatToDisplay=4;
  break;
  }
  toDo=-1;
  takenext=true;
  }
  

   
  switch(whatToDisplay){
    case 0:
    m1.menumain();
    break;
    case 1:
    m1.menunewgameloadgame();
    break;
    case 2:
    m1.menuhelp();
    break;
    case 3:
    if(!savesOk())
    newGame=true;
    
        idataXML = loadXML("itdata.xml");
        idXMLchild = idataXML.getChildren("it");
        
       for(int i=0;i<16;i++)for(int i2=0;i2<14;i2++)inel[i][i2]= new item();
       for(int i=0;i<6;i++)pequip[i]= new item();     
       cleardisp();
       for(int i=0;i<9;i++)inter.crclicked[i]=false;
       
     
    if(newGame){
      for(int i=0;i<10;i++)p1.misc[i]=0;
      map1.generateMap();
      whatToDisplay=12;
      for(int i2=0;i2<14;i2++)
      for(int i=0;i<16;i++){
        if(i+i2*16>=60)break;
      inel[i][i2].createfrompattern(i+i2*16);
      }
      p1.playerSave();
      for(int i=0;i<16;i++)for(int i2=0;i2<14;i2++)
      inel[i][i2].saveitem(i+i2*16);
      for(int i=0;i<6;i++)
      pequip[i].saveitem(400+i);
    }
    else{
      whatToDisplay=4;
      p1.playerContinue();
      for(int i=0;i<16;i++)for(int i2=0;i2<14;i2++)
      inel[i][i2].loaditem(i+i2*16);
      for(int i=0;i<6;i++)
      pequip[i].loaditem(400+i);
      ps.skillSload();
    }
      p1.calcOtherStats();
      p1.setHp();
      map1.loadTextures();
      map1.readMap();
      map1.configStruct();
      map1.spawnEnemies(0,0);
      inter.itemtextures();
      ps.loadtpskills();
      
    break;
  case 4:
  inter.onMap();
  break;
  case 5:
  inter.fullInvhead();
  break;
  case 6:
  fightSequence();
  break;
  case 7:
  textSize(32);
  text("U have fleed from ur enemy",DISPLAYX/2,DISPLAYY/2);
  break;
  case 8:
  inter.inventory();
  break;
  case 9:
  inter.overview();
  break;
  case 10:
  inter.skills();
  break;
  case 11:
  inter.crafting();
  break;
  case 12:
  p1.nameCh();
  break;
  case 13:
  //free space
  break;
  case 14:
  reward();
  break;
  }
}

int timesiworked=0;

void keyPressed(){
  if(takenext){
  takenext=false;
  toDo=whatToDisplay;
  }
}

void mousePressed(){
  switch(whatToDisplay){
    case 4:
    inter.rightInvonclick();
    break;
  case 10:
  inter.skillonclick();
  break;
  case 8:
  inter.inventoryonclick();
  break;
  case 6:
  fightsequenceonclick();
  break;
  case 11:
  inter.craftinonclick();
  break;
  }
}

void mouseReleased(){
switch(whatToDisplay){
case 8:
inter.itdragged();
break;
}

}
