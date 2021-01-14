class menu{
  
  void menumain(){
    textSize(32);
    
      DifMenu disp[] = new DifMenu[4];
      
      for(int i=0;i<4;i++)disp[i]=new DifMenu();
      
      disp[0].setValue("New Game",DISPLAYX*0.5,DISPLAYY*0.2);
      disp[1].setValue("Load Game",DISPLAYX*0.5,DISPLAYY*0.4);
      disp[2].setValue("Help",DISPLAYX*0.5,DISPLAYY*0.6);
      disp[3].setValue("Exit",DISPLAYX*0.5,DISPLAYY*0.8);
    
    menudisplay(disp,inmenu,#D7EA07,4);
    
  }
  void menumainonkey(){
  if(key=='s')inmenu++;
    if(key=='w')inmenu--;
    if(inmenu<1)inmenu=4;
    if(inmenu>4)inmenu=1;
    if(key==ENTER){
      switch(inmenu){
        case 1:
        newGame = true;
        whatToDisplay = 1;
        break;
        case 2:
        newGame = false;
        whatToDisplay = 1;
        break;
        case 3:
        whatToDisplay = 2;
        break;
        case 4:
        exit();
        break;
      }
      inmenu = 1;
    }
  }

  void menunewgameloadgame(){
    textSize(32);
    
      DifMenu disp[] = new DifMenu[4];
      
      for(int i=0;i<4;i++)disp[i]=new DifMenu();
      
      text("Select save slot:",DISPLAYX*0.5,DISPLAYY*0.1); //<>//
      disp[0].setValue("Slot 1",DISPLAYX*0.5,DISPLAYY*0.3);
      disp[1].setValue("Slot 2",DISPLAYX*0.5,DISPLAYY*0.5);
      disp[2].setValue("Slot 3",DISPLAYX*0.5,DISPLAYY*0.7);
      disp[3].setValue("Return",DISPLAYX*0.5,DISPLAYY*0.9);
    
    menudisplay(disp,inmenu,#D7EA07,4); //<>//
    //<>//
  }
  void menuhelp(){
  text("Remember to put points in ur stats/skills",DISPLAYX*0.5,DISPLAYY*0.2);
  text("Use wasd to move around map",DISPLAYX*0.5,DISPLAYY*0.3);
  text("Somethings u can click by ur mouse",DISPLAYX*0.5,DISPLAYY*0.4);
  text("Thanks for playin!!",DISPLAYX*0.5,DISPLAYY*0.5);
  text("Creator:",DISPLAYX*0.5,DISPLAYY*0.6);
  text("Przesławski Krzysztof",DISPLAYX*0.5,DISPLAYY*0.7);
  }
  void menunewgameloadgameonkey(){
  if(key=='s')inmenu++;
  if(key=='w')inmenu--;
  if(inmenu<1)inmenu=4;
  if(inmenu>4)inmenu=1;
  if(key==ENTER){
    switch(inmenu){
      case 4:
      whatToDisplay=0;
      break;
      default:
      whichSave=inmenu;
      whatToDisplay=3;
      break;
    }
    inmenu = 1;
   }
  }
}
