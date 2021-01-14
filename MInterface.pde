class mInterface{

  public static final int mapWDTH = 840;

  
int mapWDTH(){
return mapWDTH;
}

PImage[] itextur = new PImage[19]; 
PImage[] crafttextures =new PImage[10];
  PImage runtexture;
PImage pog;
void itemtextures(){
  
  String itsrc;
  
  for(int i=1;i<7;i++){
  itsrc="items2/"+str(i)+".png";
itextur[i-1]=loadImage(itsrc);
  }
  pog = loadImage("pogchamp.png");
  
  PImage temp = loadImage("itemiconssrc.png");
  runtexture = divimg(temp,8,4);
  
  itextur[6]=divimg(temp,9,5);
  itextur[7]=divimg(temp,10,5);
  itextur[8]=divimg(temp,7,4);
  itextur[9]=divimg(temp,7,6);
  itextur[10]=divimg(temp,3,6);
  itextur[11]=divimg(temp,12,5);
  itextur[12]=divimg(temp,3,5);
  itextur[13]=divimg(temp,4,10);
  itextur[14]=divimg(temp,5,5);
  
  itextur[15]=divimg(temp,0,18);
  itextur[16]=divimg(temp,0,8);
  
  itextur[17]=divimg(temp,2,7);
  itextur[18]=divimg(temp,8,7);
  
  crafttextures[0]=divimg(temp,13,11);
  crafttextures[1]=divimg(temp,14,11);
  crafttextures[2]=divimg(temp,15,11);
  
  crafttextures[3]=divimg(temp,0,17);
  crafttextures[4]=divimg(temp,1,17);
  crafttextures[5]=divimg(temp,2,17);
  crafttextures[6]=divimg(temp,3,17);
  crafttextures[7]=divimg(temp,4,17);
  crafttextures[8]=divimg(temp,8,17);
  
  crafttextures[9]=divimg(temp,11,15);
  
}

  
void onMap(){
fill(0);
line(mapWDTH,0,mapWDTH,DISPLAYY);
fill(#95C94D);
rect(0,0,mapWDTH,DISPLAYY);
fill(0);
rightInv();
map1.displayMap();
//grid();
}

void grid(){
  for(int i=1;i<21;i++)
line(40*i,0,40*i,DISPLAYY);
  for(int i=1;i<21;i++)
line(0,40*i,mapWDTH,40*i);
}

void rightInv(){
    fill(#FF0000);
  text(p1.hp+"/"+p1.hpmax,(DISPLAYX-mapWDTH)*0.5+mapWDTH,DISPLAYY*0.1);
    rect(DISPLAYX*0.85-150,DISPLAYY*0.15-15,300,30);
    fill(#5BA233);
    rect(DISPLAYX*0.85-150,DISPLAYY*0.15-15,300*p1.hp/p1.hpmax,30);
  noFill();
  button(mapWDTH+60,DISPLAYY*0.2,40,40);
  image(map1.it1texture[1],mapWDTH+60,DISPLAYY*0.2,40,40);
  button(mapWDTH+60,DISPLAYY*0.26,40,40);
  image(map1.it1texture[2],mapWDTH+60,DISPLAYY*0.26,40,40);
  button(mapWDTH+60,DISPLAYY*0.32,40,40);
  image(map1.it1texture[3],mapWDTH+60,DISPLAYY*0.32,40,40);
    fill(0);
    textSize(20);
    textAlign(LEFT,TOP);
        text("Smal potion ("+str(p1.shpPotions)+")",mapWDTH+105,DISPLAYY*0.2);
    text("Heal for "+str(20+p1.inteligence*2),mapWDTH+105,DISPLAYY*0.2+20);
        text("Medium potion ("+str(p1.mhpPotions)+")",mapWDTH+105,DISPLAYY*0.26);
    text("Heal for "+str(40+p1.inteligence*3),mapWDTH+105,DISPLAYY*0.26+20);
        text("Large potion ("+str(p1.lhpPotions)+")",mapWDTH+105,DISPLAYY*0.32);
    text("Heal for "+str(100+p1.inteligence*4),mapWDTH+105,DISPLAYY*0.32+20);
    textSize(32);
    image(map1.it1texture[0],mapWDTH+60,DISPLAYY*0.8,40,40);
    text(str(p1.money),mapWDTH+100,DISPLAYY*0.8);
    textAlign(CENTER,CENTER);
  clock();
  fps();
}

void rightInvonclick(){
  if(buttononclick(mapWDTH+60,DISPLAYY*0.2,40,40)&&p1.shpPotions>0){
    
    p1.shpPotions--;
    p1.hp+=20+p1.inteligence*2;
  }
  else if(buttononclick(mapWDTH+60,DISPLAYY*0.26,40,40)&&p1.mhpPotions>0){
    p1.mhpPotions--;
    p1.hp+=40+p1.inteligence*3;
  }
  else if(buttononclick(mapWDTH+60,DISPLAYY*0.32,40,40)&&p1.lhpPotions>0){
    p1.lhpPotions--;
    p1.hp+=100+p1.inteligence*4;
  }
  if(p1.hp>p1.hpmax)p1.hp=p1.hpmax;
}

void onMaponkey(){
  
  if(key=='i')whatToDisplay=8;
  if(key=='w')
  {
    
    direction=1;
        if(colision(0,-1)==0){
    p1.cordY-=1;
     map1.spawnEnemies(0,-1);
        }
        else if(colision(0,-1)==2){
        enemy.createunit();
        whatToDisplay=6;
        }
  }
  if(key=='d')
  {
    direction=2;
        if(colision(1,0)==0){
    p1.cordX+=1;
     map1.spawnEnemies(1,0);
        }
        else if(colision(1,0)==2){
        enemy.createunit();
        whatToDisplay=6;
        }
  }
  if(key=='s')
  {
    direction=3;
        if(colision(0,1)==0){
    p1.cordY+=1;
     map1.spawnEnemies(0,1);
        }
        else if(colision(0,1)==2){
        enemy.createunit();
        whatToDisplay=6;
        }
  }
  if(key=='a')
  {
    direction=4;
        if(colision(-1,0)==0){
    p1.cordX-=1;
     map1.spawnEnemies(-1,0);
        }
        else if(colision(-1,0)==2){
        enemy.createunit();
        whatToDisplay=6;
        }
  }
}

void fullInvhead(){
line(0,DISPLAYY*0.1,DISPLAYX,DISPLAYY*0.1);
DifMenu mhdisp[] = new DifMenu[5];
for(int i=0;i<5;i++)
mhdisp[i] = new DifMenu();

mhdisp[0].setValue("Inventory",DISPLAYX*0.1,DISPLAYY*0.05);
mhdisp[1].setValue("Overview",DISPLAYX*0.3,DISPLAYY*0.05);
mhdisp[2].setValue("Skills",DISPLAYX*0.5,DISPLAYY*0.05);
mhdisp[3].setValue("Crafting",DISPLAYX*0.7,DISPLAYY*0.05);
mhdisp[4].setValue("Save N Quit",DISPLAYX*0.9,DISPLAYY*0.05);

menudisplay(mhdisp,inmenu,#0EA782,5);

if(inmenu==5){
image(pog,DISPLAYX*0.5-200,DISPLAYY*0.55-200,400,400);
textSize(60);
text("Thanks for playin!!",DISPLAYX*0.5,DISPLAYY*0.55+240);
text("Thanks for playin!!",DISPLAYX*0.5,DISPLAYY*0.55-240);
textSize(32);
}
}

void fullInvheadonkey(){
  if(key=='i'){
    whatToDisplay=4;
    inmenu=1;
    return;
  }
  if(key=='d')inmenu++;
  if(key=='a')inmenu--;
  if(inmenu<1)inmenu=5;
  if(inmenu>5)inmenu=1;
  switch(inmenu){
  case 1:
  whatToDisplay=8;
  break;
  case 2:
  whatToDisplay=9;
  break;  
  case 3:
  whatToDisplay=10;
  break;  
  case 4:
  whatToDisplay=11;
  break;
  case 5:
  whatToDisplay=5;
  break;
  }
  if(key==ENTER)
  if(inmenu==5){
    ps.skillSsave();
    p1.playerSave();
    for(int i=0;i<16;i++)for(int i2=0;i2<14;i2++)
      inel[i][i2].saveitem(i+i2*16);
      for(int i=0;i<6;i++)
      pequip[i].saveitem(400+i);
    whatToDisplay=4;
    inmenu=1;
  }
}

boolean[][] ifclicked = new boolean[16][14];
boolean[] ifclickedeq = new boolean[6];

void inventory(){
  
fullInvhead();
line(DISPLAYX*0.7,DISPLAYY*0.1,DISPLAYX*0.7,DISPLAYY);
noFill();
line(DISPLAYX*0.7,DISPLAYY*0.4,DISPLAYX,DISPLAYY*0.4);
  fill(#939393);
for(int i =0;i<6;i++){
  if(ifclickedeq[i]){
    if(pequip[i].doexist){
    fill(0);
  textSize(20);
  textAlign(LEFT,TOP);
  text(pequip[i].name,DISPLAYX*0.7+10,DISPLAYY*0.4+10);
  text("Upgrade level "+str(pequip[i].upgrade),DISPLAYX*0.7+10,DISPLAYY*0.4+70);
  text("Strenght "+str(pequip[i].its),DISPLAYX*0.7+10,DISPLAYY*0.4+110);
  text("Agility "+str(pequip[i].ita),DISPLAYX*0.7+10,DISPLAYY*0.4+130);
  text("Endurance "+str(pequip[i].ite),DISPLAYX*0.7+10,DISPLAYY*0.4+150);
  text("Inteligence "+str(pequip[i].iti),DISPLAYX*0.7+10,DISPLAYY*0.4+170);
  if(pequip[i].type==0){
  text("%Strenght "+str(pequip[i].itprs)+"%",DISPLAYX*0.7+10,DISPLAYY*0.4+210);
  text("%Agility "+str(pequip[i].itpra)+"%",DISPLAYX*0.7+10,DISPLAYY*0.4+230);
  text("%Endurance "+str(pequip[i].itpre)+"%",DISPLAYX*0.7+10,DISPLAYY*0.4+250);
  text("%Inteligence "+str(pequip[i].itpri)+"%",DISPLAYX*0.7+10,DISPLAYY*0.4+270);
  }
  textAlign(CENTER,CENTER);
  if(pequip[i].upgradable())
  button("Upgrade item "+pequip[i].upgradecost(),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+pequip[i].upgradecost())-textWidth("Sell item "+(pequip[i].upgrade*10+10)))/3+textWidth("Upgrade item "+pequip[i].upgradecost())/2,DISPLAYY*0.9,16,true);
  button("Sell item "+(pequip[i].upgrade*10+10),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+pequip[i].upgradecost())-textWidth("Sell item "+(pequip[i].upgrade*10+10)))*2/3+textWidth("Upgrade item "+pequip[i].upgradecost())+textWidth("Sell item "+(pequip[i].upgrade*10+10))/2,DISPLAYY*0.9,16,true);
  textSize(32);  
    }fill(#EFFF76);}
    if(i==0)
rect(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20-DISPLAYY*0.3/5,DISPLAYY*0.1+DISPLAYY*0.3*2/5-20,40,40);
    if(i>0&&i<5)
rect(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20,DISPLAYY*0.1+DISPLAYY*0.3*i/5-20,40,40);
    if(i==5)
rect(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20+DISPLAYY*0.3/5,DISPLAYY*0.1+DISPLAYY*0.3*2/5-20,40,40);
fill(#939393);
if(pequip[i].doexist)
if(!mousePressed||!ifclickedeq[i]){

if(i==0)
image(itextur[pequip[i].texturenr],DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20-DISPLAYY*0.3/5,DISPLAYY*0.1+DISPLAYY*0.3*2/5-20,40,40);
    if(i>0&&i<5)
image(itextur[pequip[i].texturenr],DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20,DISPLAYY*0.1+DISPLAYY*0.3*i/5-20,40,40);
    if(i==5)
image(itextur[pequip[i].texturenr],DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20+DISPLAYY*0.3/5,DISPLAYY*0.1+DISPLAYY*0.3*2/5-20,40,40);

}
  
}

boolean inhand=false;
for(int i=0;i<16;i++)
for(int i2=0;i2<14;i2++){
  
  fill(#939393);
  if(ifclicked[i][i2]){
    if(inel[i][i2].doexist){
  fill(0);
  textSize(20);
  textAlign(LEFT,TOP);
  text(inel[i][i2].name,DISPLAYX*0.7+10,DISPLAYY*0.4+10);
  text("Upgrade leve l"+str(inel[i][i2].upgrade),DISPLAYX*0.7+10,DISPLAYY*0.4+70);
  text("Strenght "+str(inel[i][i2].its),DISPLAYX*0.7+10,DISPLAYY*0.4+110);
  text("Agility "+str(inel[i][i2].ita),DISPLAYX*0.7+10,DISPLAYY*0.4+130);
  text("Endurance "+str(inel[i][i2].ite),DISPLAYX*0.7+10,DISPLAYY*0.4+150);
  text("Inteligence "+str(inel[i][i2].iti),DISPLAYX*0.7+10,DISPLAYY*0.4+170);
  if(inel[i][i2].type==0){
  text("%Strenght "+str(inel[i][i2].itprs)+"%",DISPLAYX*0.7+10,DISPLAYY*0.4+210);
  text("%Agility "+str(inel[i][i2].itpra)+"%",DISPLAYX*0.7+10,DISPLAYY*0.4+230);
  text("%Endurance "+str(inel[i][i2].itpre)+"%",DISPLAYX*0.7+10,DISPLAYY*0.4+250);
  text("%Inteligence "+str(inel[i][i2].itpri)+"%",DISPLAYX*0.7+10,DISPLAYY*0.4+270);
  }
  textAlign(CENTER,CENTER);
  if(inel[i][i2].upgradable())
  button("Upgrade item "+inel[i][i2].upgradecost(),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+inel[i][i2].upgradecost())-textWidth("Sell item "+(inel[i][i2].upgrade*10+10)))/3+textWidth("Upgrade item "+inel[i][i2].upgradecost())/2,DISPLAYY*0.9,16,true);
  button("Sell item "+(inel[i][i2].upgrade*10+10),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+inel[i][i2].upgradecost())-textWidth("Sell item "+(inel[i][i2].upgrade*10+10)))*2/3+textWidth("Upgrade item "+inel[i][i2].upgradecost())+textWidth("Sell item "+(inel[i][i2].upgrade*10+10))/2,DISPLAYY*0.9,16,true);
  textSize(32);
  
  if(mousePressed){
    inhand=true;
    }
  }
  
  fill(#EFFF76);}
  rect((DISPLAYX*0.7-800)/2+5+50*i,DISPLAYY*0.1+(DISPLAYY*0.9-700)/2+5+50*i2,40,40);
  if(inel[i][i2].doexist)
 if(!inhand)
  image(itextur[inel[i][i2].texturenr],(DISPLAYX*0.7-800)/2+5+50*i,DISPLAYY*0.1+(DISPLAYY*0.9-700)/2+5+50*i2,40,40);
  inhand=false;
}



for(int i=0;i<16;i++)
for(int i2=0;i2<14;i2++)
if(ifclicked[i][i2])
if(!buttonclick("Upgrade item "+inel[i][i2].upgradecost(),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+inel[i][i2].upgradecost())-textWidth("Sell item "+(inel[i][i2].upgrade*10+10)))/3+textWidth("Upgrade item "+inel[i][i2].upgradecost())/2,DISPLAYY*0.9,16,true))
if(!buttonclick("Sell item "+(inel[i][i2].upgrade*10+10),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+inel[i][i2].upgradecost())-textWidth("Sell item "+(inel[i][i2].upgrade*10+10)))*2/3+textWidth("Upgrade item "+inel[i][i2].upgradecost())+textWidth("Sell item "+(inel[i][i2].upgrade*10+10))/2,DISPLAYY*0.9,16,true))
if(mousePressed)
if(inel[i][i2].doexist)
image(itextur[inel[i][i2].texturenr],mouseX-20,mouseY-20,40,40);

for(int i=0;i<6;i++)
if(ifclickedeq[i])
if(!buttonclick("Upgrade item "+pequip[i].upgradecost(),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+pequip[i].upgradecost())-textWidth("Sell item "+(pequip[i].upgrade*10+10)))/3+textWidth("Upgrade item "+pequip[i].upgradecost())/2,DISPLAYY*0.9,16,true))
 if(!buttonclick("Sell item "+(pequip[i].upgrade*10+10),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+pequip[i].upgradecost())-textWidth("Sell item "+(pequip[i].upgrade*10+10)))*2/3+textWidth("Upgrade item "+pequip[i].upgradecost())+textWidth("Sell item "+(pequip[i].upgrade*10+10))/2,DISPLAYY*0.9,16,true))
if(mousePressed)
if(pequip[i].doexist)
image(itextur[pequip[i].texturenr],mouseX-20,mouseY-20,40,40);
}

void itdragged(){
  
for(int i=0;i<16;i++)
for(int i2=0;i2<14;i2++)
if(ifclicked[i][i2]){
for(int i3=0;i3<16;i3++)
for(int i4=0;i4<14;i4++)
if(buttononclick((DISPLAYX*0.7-800)/2+5+50*i3,DISPLAYY*0.1+(DISPLAYY*0.9-700)/2+5+50*i4,40,40)){
item temp;
temp = inel[i][i2];
inel[i][i2]=inel[i3][i4];
inel[i3][i4]=temp;
ifclicked[i][i2]=false;
ifclicked[i3][i4]=true;
}
for(int i3=0;i3<6;i3++)
if(inel[i][i2].type==i3){

  if(i3==0)
if(buttononclick(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20-DISPLAYY*0.3/5,DISPLAYY*0.1+DISPLAYY*0.3*2/5-20,40,40)){
item temp;
pequip[i3].takestatsfromplayer();
temp = inel[i][i2];
inel[i][i2]=pequip[i3];
pequip[i3]=temp;
ifclicked[i][i2]=false;
ifclickedeq[i3]=true;
pequip[i3].givestatstoplayer();
}
    if(i3>0&&i3<5)
if(buttononclick(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20,DISPLAYY*0.1+DISPLAYY*0.3*i3/5-20,40,40)){
item temp;
pequip[i3].takestatsfromplayer();
temp = inel[i][i2];
inel[i][i2]=pequip[i3];
pequip[i3]=temp;
ifclicked[i][i2]=false;
ifclickedeq[i3]=true;
pequip[i3].givestatstoplayer();
}
    if(i3==5)
if(buttononclick(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20+DISPLAYY*0.3/5,DISPLAYY*0.1+DISPLAYY*0.3*2/5-20,40,40)){
item temp;
pequip[i3].takestatsfromplayer();
temp = inel[i][i2];
inel[i][i2]=pequip[i3];
pequip[i3]=temp;
ifclicked[i][i2]=false;
ifclickedeq[i3]=true;
pequip[i3].givestatstoplayer();
}
  
}
}

for(int i3=0;i3<6;i3++)
if(ifclickedeq[i3])
for(int i=0;i<16;i++)
for(int i2=0;i2<14;i2++)
if(pequip[i3].type==inel[i][i2].type||!inel[i][i2].doexist)
if(buttononclick((DISPLAYX*0.7-800)/2+5+50*i,DISPLAYY*0.1+(DISPLAYY*0.9-700)/2+5+50*i2,40,40)){
item temp;
pequip[i3].takestatsfromplayer();
temp = inel[i][i2];
inel[i][i2]=pequip[i3];
pequip[i3]=temp;
ifclicked[i][i2]=true;
ifclickedeq[i3]=false;
pequip[i3].givestatstoplayer();
}
}

void inventoryonkey(){
fullInvheadonkey();
}

void inventoryonclick(){
for(int i=0;i<16;i++)
for(int i2=0;i2<14;i2++){
  if(ifclicked[i][i2]&&inel[i][i2].doexist){
  if(inel[i][i2].upgradable())
  if(buttonclick("Upgrade item "+inel[i][i2].upgradecost(),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+inel[i][i2].upgradecost())-textWidth("Sell item "+(inel[i][i2].upgrade*10+10)))/3+textWidth("Upgrade item "+inel[i][i2].upgradecost())/2,DISPLAYY*0.9,16,true)
  )if(p1.money>=inel[i][i2].upgradecost()){
    p1.money-=inel[i][i2].upgradecost();
    inel[i][i2].upgradeitem();
    inel[i][i2].upgrade++;
    return;
  }
  else return;
  if(buttonclick("Sell item "+(inel[i][i2].upgrade*10+10),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+inel[i][i2].upgradecost())-textWidth("Sell item "+(inel[i][i2].upgrade*10+10)))*2/3+textWidth("Upgrade item "+inel[i][i2].upgradecost())+textWidth("Sell item "+(inel[i][i2].upgrade*10+10))/2,DISPLAYY*0.9,16,true)
  ){
  p1.money+=inel[i][i2].upgrade*10+10;
  inel[i][i2].doexist=false;
  }
  }
  ifclicked[i][i2]=false;
  ifclicked[i][i2]=buttononclick((DISPLAYX*0.7-800)/2+5+50*i,DISPLAYY*0.1+(DISPLAYY*0.9-700)/2+5+50*i2,40,40);
}
for(int i=0;i<6;i++){
  if(ifclickedeq[i]&&pequip[i].doexist){
    if(pequip[i].upgradable())
  if(buttonclick("Upgrade item "+pequip[i].upgradecost(),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+pequip[i].upgradecost())-textWidth("Sell item "+(pequip[i].upgrade*10+10)))/3+textWidth("Upgrade item "+pequip[i].upgradecost())/2,DISPLAYY*0.9,16,true)
  )if(p1.money>=pequip[i].upgradecost()){
    pequip[i].takestatsfromplayer();
    p1.money-=pequip[i].upgradecost();
    pequip[i].upgradeitem();
    pequip[i].upgrade++;
    pequip[i].givestatstoplayer();
    return;
  }
  else return;
  if(buttonclick("Sell item "+(pequip[i].upgrade*10+10),DISPLAYX*0.7+(DISPLAYX*0.3-textWidth("Upgrade item "+pequip[i].upgradecost())-textWidth("Sell item "+(pequip[i].upgrade*10+10)))*2/3+textWidth("Upgrade item "+pequip[i].upgradecost())+textWidth("Sell item "+(pequip[i].upgrade*10+10))/2,DISPLAYY*0.9,16,true)
  ){
    pequip[i].takestatsfromplayer();
  p1.money+=pequip[i].upgrade*10+10;
  pequip[i].doexist=false;
  }
  }
  ifclickedeq[i]=false;
      if(i==0)
ifclickedeq[i]=buttononclick(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20-DISPLAYY*0.3/5,DISPLAYY*0.1+DISPLAYY*0.3*2/5-20,40,40);
    if(i>0&&i<5)
ifclickedeq[i]=buttononclick(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20,DISPLAYY*0.1+DISPLAYY*0.3*i/5-20,40,40);
    if(i==5)
ifclickedeq[i]=buttononclick(DISPLAYX*0.7+((DISPLAYX*0.3)/2)-20+DISPLAYY*0.3/5,DISPLAYY*0.1+DISPLAYY*0.3*2/5-20,40,40);
}
}

void overview(){
fullInvhead();

line(0,DISPLAYY*0.55,DISPLAYX,DISPLAYY*0.55);
line(DISPLAYX*0.75,DISPLAYY*0.1,DISPLAYX*0.75,DISPLAYY*0.55);

line(DISPLAYX*1/6,DISPLAYY*0.55,DISPLAYX*1/6,DISPLAYY);
line(DISPLAYX*2/6,DISPLAYY*0.55,DISPLAYX*2/6,DISPLAYY);
line(DISPLAYX*3/6,DISPLAYY*0.55,DISPLAYX*3/6,DISPLAYY);
line(DISPLAYX*4/6,DISPLAYY*0.55,DISPLAYX*4/6,DISPLAYY);
line(DISPLAYX*5/6,DISPLAYY*0.55,DISPLAYX*5/6,DISPLAYY);


text(p1.name,DISPLAYX*0.125,DISPLAYY*0.15);
text("Lv. " +str(p1.level),DISPLAYX*0.125,DISPLAYY*0.23);
text("Exp. " +str(p1.exp)+"/"+str(p1.level*20),DISPLAYX*0.125,DISPLAYY*0.31);

text("Hp " + str(p1.hp)+"/"+str(p1.hpmax),DISPLAYX*0.375,DISPLAYY*0.15);
text("Dodge "+str(p1.dodge)+"%",DISPLAYX*0.375,DISPLAYY*0.23);
text("Crit "+str(p1.crit)+"%",DISPLAYX*0.375,DISPLAYY*0.31);

text("Strenght "+str(p1.strenght),DISPLAYX*0.625,DISPLAYY*0.15);
text("Agility "+str(p1.agility),DISPLAYX*0.625,DISPLAYY*0.23);
text("Endurance "+str(p1.endurance),DISPLAYX*0.625,DISPLAYY*0.31);
text("Inteligence "+str(p1.inteligence),DISPLAYX*0.625,DISPLAYY*0.39);

int milisec=millis()%2000;
int event=1;
int pt=0;
int dirloop=millis()%8000;
int dirloopev=1;

if(milisec<500)event=1;
else if(milisec<1000)event=2;
else if(milisec<1500)event=1;
else if(milisec<2000)event=3;

if(dirloop<2000)dirloopev=1;
else if(dirloop<4000)dirloopev=2;
else if(dirloop<6000)dirloopev=3;
else if(dirloop<8000)dirloopev=4;

switch(dirloopev){
case 1:
if(event==1)pt=10;
if(event==2)pt=9;
if(event==3)pt=11;
break;
case 2:
if(event==1)pt=7;
if(event==2)pt=6;
if(event==3)pt=8;
break;
case 3:
if(event==1)pt=1;
if(event==2)pt=0;
if(event==3)pt=2;
break;
case 4:
if(event==1)pt=4;
if(event==2)pt=3;
if(event==3)pt=5;
break;
}

image(map1.pltexture[pt],DISPLAYX*0.875-40,DISPLAYY*0.325-40,80,80);

textSize(20);
for(int i=0;i<6;i++){
  image(itextur[pequip[i].texturenr],DISPLAYX/12-20+i*DISPLAYX/6,DISPLAYY*0.6-20,40,40);
  
  text("Name: "+pequip[i].name,DISPLAYX/12+i*DISPLAYX/6,DISPLAYY*0.65);
  text("Upgrade: "+str(pequip[i].upgrade),DISPLAYX/12+i*DISPLAYX/6,DISPLAYY*0.7);
  
  text("Strenght "+str(pequip[i].its),DISPLAYX/12+i*DISPLAYX/6,DISPLAYY*0.75);
  text("Agility "+str(pequip[i].ita),DISPLAYX/12+i*DISPLAYX/6,DISPLAYY*0.8);
  text("Endurance "+str(pequip[i].ite),DISPLAYX/12+i*DISPLAYX/6,DISPLAYY*0.85);
  text("Inteligence "+str(pequip[i].iti),DISPLAYX/12+i*DISPLAYX/6,DISPLAYY*0.9);
    
}
textSize(32);
}

void skills(){

fullInvhead();
textAlign(LEFT,CENTER);

text("Strenght "+str(p1.strenght),DISPLAYX*0.05,DISPLAYY*0.2);
text("Agility "+str(p1.agility),DISPLAYX*0.05,DISPLAYY*0.25);
text("Endurance "+str(p1.endurance),DISPLAYX*0.05,DISPLAYY*0.3);
text("Inteligence "+str(p1.inteligence),DISPLAYX*0.05,DISPLAYY*0.35);
line(DISPLAYX*0.25,DISPLAYY*0.1,DISPLAYX*0.25,DISPLAYY);
line(0,DISPLAYY*0.4,DISPLAYX*0.25,DISPLAYY*0.4);
line(DISPLAYX*0.25,DISPLAYY*0.2,DISPLAYX,DISPLAYY*0.2);
line(DISPLAYX*0.25,DISPLAYY*0.3,DISPLAYX,DISPLAYY*0.3);
line(DISPLAYX*0.25+DISPLAYX*0.75/2,DISPLAYY*0.2,DISPLAYX*0.25+DISPLAYX*0.75/2,DISPLAYY);
for( int i=0;i<7;i++) 
line(DISPLAYX*0.25+(DISPLAYX*0.75*(1+i)/8),DISPLAYY*0.3+(DISPLAYY*0.7/5)+30,DISPLAYX*0.25+(DISPLAYX*0.75*(1+i)/8),DISPLAYY*0.3+(DISPLAYY*0.7*4/5));

  text("Points left: "+str(p1.statPoints),DISPLAYX*0.05,DISPLAYY*0.15);
  
if(p1.statPoints>0){
  
textAlign(CENTER,CENTER);

button("+",DISPLAYX*0.05-32,DISPLAYY*0.2,4);
button("+",DISPLAYX*0.05-32,DISPLAYY*0.25,4);
button("+",DISPLAYX*0.05-32,DISPLAYY*0.3,4);
button("+",DISPLAYX*0.05-32,DISPLAYY*0.35,4);

}
textAlign(CENTER,CENTER);

text("Skill points "+ps.skillpoints,DISPLAYX*0.25+DISPLAYX*0.75/2,DISPLAYY*0.15);
text("Offense",DISPLAYX*0.25+DISPLAYX*0.75/4,DISPLAYY*0.25);
text("Defense",DISPLAYX*0.25+DISPLAYX*0.75*3/4,DISPLAYY*0.25);

for(int i=0;i<12;i++){
fill(#908F8F);
if(ps.skillclicked[i])fill(#EFFF76);
if(ps.skillsunlocked[i])fill(#4FB757);
rect(DISPLAYX*0.25+(DISPLAYX*0.75*(1+i%3)/8)-30,DISPLAYY*0.3+(DISPLAYY*0.7*(1+i/3)/5)-30,60,60);
image(ps.tpskills[i%3],DISPLAYX*0.25+(DISPLAYX*0.75*(1+i%3)/8)-30,DISPLAYY*0.3+(DISPLAYY*0.7*(1+i/3)/5)-30,60,60);
}

for(int i=0;i<12;i++){
fill(#908F8F);
if(ps.skillsunlocked[12+i])fill(#4FB757);
if(ps.skillclicked[12+i])fill(#EFFF76);
rect(DISPLAYX*0.25+(DISPLAYX*0.75*(5+i%3)/8)-30,DISPLAYY*0.3+(DISPLAYY*0.7*(1+i/3)/5)-30,60,60);
image(ps.tpskills[i%3+3],DISPLAYX*0.25+(DISPLAYX*0.75*(5+i%3)/8)-30,DISPLAYY*0.3+(DISPLAYY*0.7*(1+i/3)/5)-30,60,60);
}

  textSize(20);
for(int i=0;i<24;i++)
if(ps.skillclicked[i]){
  ps.displaytext(i);
if(!ps.skillsunlocked[i])if(ps.obtainable(i)){
  
if(i<12)
button("Click to unlock - cost "+(1+i/3),DISPLAYX*0.25/2,DISPLAYY*0.9,16,true);
else
button("Click to unlock - cost "+(1+(i-12)/3),DISPLAYX*0.25/2,DISPLAYY*0.9,16,true);

}
}
  textSize(32);

}

void skillsonkey(){
fullInvheadonkey();
}

void skillonclick(){
if(p1.statPoints>0){
if(buttonclick("+",DISPLAYX*0.05-32,DISPLAYY*0.2,4))p1.strenght++;
else if(buttonclick("+",DISPLAYX*0.05-32,DISPLAYY*0.25,4))p1.agility++;
else if(buttonclick("+",DISPLAYX*0.05-32,DISPLAYY*0.3,4))p1.endurance++;
else if(buttonclick("+",DISPLAYX*0.05-32,DISPLAYY*0.35,4))p1.inteligence++;
else p1.statPoints++;
p1.statPoints--;
}

for(int i=0;i<24;i++)
if(ps.skillclicked[i])
if(!ps.skillsunlocked[i])
if(ps.obtainable(i))
if(buttonclick("Click to unlock - cost "+1,DISPLAYX*0.25/2,DISPLAYY*0.9,16,true)){
int cost=i/3+1;
if(cost>4)cost-=4;
if(cost<=ps.skillpoints){
ps.skillpoints-=cost;
switch(i){
case 0:
p1.strenght+=2;
break;
case 1:
p1.agility+=2;
break;
case 2:
p1.inteligence+=2;
break;
case 12:
p1.endurance+=2;
break;
case 14:
p1.inteligence+=2;
break;
case 15:
p1.endurance+=2;
break;
}
ps.skillsunlocked[i]=true;
}
return;
}

for(int i=0;i<12;i++){
if(buttononclick(DISPLAYX*0.25+(DISPLAYX*0.75*(1+i%3)/8)-30,DISPLAYY*0.3+(DISPLAYY*0.7*(1+i/3)/5)-30,60,60))
ps.skillclicked[i]=true;
else ps.skillclicked[i]=false;
if(buttononclick(DISPLAYX*0.25+(DISPLAYX*0.75*(5+i%3)/8)-30,DISPLAYY*0.3+(DISPLAYY*0.7*(1+i/3)/5)-30,60,60))
ps.skillclicked[12+i]=true;
else ps.skillclicked[12+i]=false;
}
}

boolean[] crclicked = new boolean[9];

void crafting(){
  
fullInvhead();
line(DISPLAYX*0.5,DISPLAYY*0.1,DISPLAYX*0.5,DISPLAYY*0.8);
line(0,DISPLAYY*0.2,DISPLAYX,DISPLAYY*0.2);
line(0,DISPLAYY*0.8,DISPLAYX,DISPLAYY*0.8);

text("Your items",DISPLAYX*0.25,DISPLAYY*0.15);
text("Reciepies",DISPLAYX*0.75,DISPLAYY*0.15);

textSize(20);
textAlign(LEFT,CENTER);

for(int i=0;i<10;i++){
image(crafttextures[i],DISPLAYX*0.02-20,DISPLAYY*0.25+DISPLAYY*i/20-20,40,40);
text(p1.misc[i],DISPLAYX*0.02+30,DISPLAYY*0.25+DISPLAYY*i/20);
}

for(int i=0;i<4;i++)
image(map1.it1texture[i],DISPLAYX*0.27-20,DISPLAYY*0.25+DISPLAYY*i/20-20,40,40);

text(p1.money,DISPLAYX*0.27+30,DISPLAYY*0.25);
text(p1.shpPotions,DISPLAYX*0.27+30,DISPLAYY*0.25+DISPLAYY*1/20);
text(p1.mhpPotions,DISPLAYX*0.27+30,DISPLAYY*0.25+DISPLAYY*2/20);
text(p1.lhpPotions,DISPLAYX*0.27+30,DISPLAYY*0.25+DISPLAYY*3/20);


for(int i=0;i<9;i++){
if(crclicked[i])fill(#4FB757);
  else fill(#908F8F);
  rect(DISPLAYX*0.55-20,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*i,40,40);
  if(i<3)image(map1.it1texture[i+1],DISPLAYX*0.55-20,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*i,40,40);
  if(i>=3)image(itextur[i-3],DISPLAYX*0.55-20,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*i,40,40);
}
fill(0);
text("Small hp potion",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*0+20);
text("Medium hp potion",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*1+20);
text("Large hp potion",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*2+20);

text("Random weapon",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*3+20);
text("Random helmet",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*4+20);
text("Random armour",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*5+20);
text("Random leggins",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*6+20);
text("Random boots",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*7+20);
text("Random off-hand item",DISPLAYX*0.55+30,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*8+20);

//line(0,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*1,DISPLAYX,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*1);

int displayedcraft = 10;

for(int i=0;i<9;i++)if(crclicked[i])displayedcraft=i;

if(displayedcraft!=10)text("Required indegriends",30,DISPLAYY*0.8+30);



switch(displayedcraft){
case 0:
image(crafttextures[0],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("1",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[1],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("1",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[2],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("1",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(map1.it1texture[0],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("10",DISPLAYX*0.27+30,DISPLAYY*0.95);
break;
case 1:
image(crafttextures[0],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[1],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[2],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(map1.it1texture[0],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("25",DISPLAYX*0.27+30,DISPLAYY*0.95);
break;
case 2:
image(crafttextures[0],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("3",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[1],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("3",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[2],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("3",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(map1.it1texture[0],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("40",DISPLAYX*0.27+30,DISPLAYY*0.95);
break;
case 3:
image(crafttextures[3],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("4",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[6],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[7],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("1",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(map1.it1texture[0],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("40",DISPLAYX*0.27+30,DISPLAYY*0.95);
break;
case 4:
image(crafttextures[4],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[5],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[6],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(crafttextures[7],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("1",DISPLAYX*0.27+30,DISPLAYY*0.95);
image(map1.it1texture[0],DISPLAYX*0.52-20,DISPLAYY*0.9-20,40,40);text("40",DISPLAYX*0.52+30,DISPLAYY*0.9);
break;
case 5:
image(crafttextures[4],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[5],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[7],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("1",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(crafttextures[8],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("2",DISPLAYX*0.27+30,DISPLAYY*0.95);
image(map1.it1texture[0],DISPLAYX*0.52-20,DISPLAYY*0.9-20,40,40);text("40",DISPLAYX*0.52+30,DISPLAYY*0.9);
break;
case 6:
image(crafttextures[5],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[7],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[8],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(crafttextures[9],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("1",DISPLAYX*0.27+30,DISPLAYY*0.95);
image(map1.it1texture[0],DISPLAYX*0.52-20,DISPLAYY*0.9-20,40,40);text("40",DISPLAYX*0.52+30,DISPLAYY*0.9);
break;
case 7:
image(crafttextures[4],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[6],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[8],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(crafttextures[9],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("1",DISPLAYX*0.27+30,DISPLAYY*0.95);
image(map1.it1texture[0],DISPLAYX*0.52-20,DISPLAYY*0.9-20,40,40);text("40",DISPLAYX*0.52+30,DISPLAYY*0.9);
break;
case 8:
image(crafttextures[3],DISPLAYX*0.02-20,DISPLAYY*0.9-20,40,40);text("2",DISPLAYX*0.02+30,DISPLAYY*0.9);
image(crafttextures[7],DISPLAYX*0.02-20,DISPLAYY*0.95-20,40,40);text("1",DISPLAYX*0.02+30,DISPLAYY*0.95);
image(crafttextures[9],DISPLAYX*0.27-20,DISPLAYY*0.9-20,40,40);text("4",DISPLAYX*0.27+30,DISPLAYY*0.9);
image(map1.it1texture[0],DISPLAYX*0.27-20,DISPLAYY*0.95-20,40,40);text("40",DISPLAYX*0.27+30,DISPLAYY*0.95);
break;
}

textSize(32);
textAlign(CENTER,CENTER);

if(displayedcraft!=10){
button(DISPLAYX-DISPLAYY*0.2+20,DISPLAYY*0.8+20,DISPLAYY*0.2-40,DISPLAYY*0.2-40);
text("CRAFT",DISPLAYX-DISPLAYY*0.1,DISPLAYY*0.9);
}
}

void craftingonkey(){
fullInvheadonkey();
}

void craftinonclick(){

  int whattocraft=10;
  for(int i=0;i<9;i++)if(crclicked[i])if(buttononclick(DISPLAYX-DISPLAYY*0.2+20,DISPLAYY*0.8+20,DISPLAYY*0.2-40,DISPLAYY*0.2-40))whattocraft=i;
  
  switch(whattocraft){
  case 0:
  if(p1.misc[0]>=1&&p1.misc[1]>=1&&p1.misc[2]>=1&&p1.money>=10){
  p1.misc[0]-=1;
  p1.misc[1]-=1;
  p1.misc[2]-=1;
  p1.money-=10;
    p1.shpPotions+=1;
  }
    return;
  case 1:
  if(p1.misc[0]>=2&&p1.misc[1]>=2&&p1.misc[2]>=2&&p1.money>=25){
  p1.misc[0]-=2;
  p1.misc[1]-=2;
  p1.misc[2]-=2;
  p1.money-=25;
    p1.mhpPotions+=1;
  }
    return;
  case 2:
  if(p1.misc[0]>=3&&p1.misc[1]>=3&&p1.misc[2]>=3&&p1.money>=40){
  p1.misc[0]-=3;
  p1.misc[1]-=3;
  p1.misc[2]-=3;
  p1.money-=40;
    p1.lhpPotions+=1;
  }
    return;
  case 3:
  if(p1.misc[3]>=4&&p1.misc[6]>=2&&p1.misc[7]>=1&&p1.money>=40){
  p1.misc[3]-=4;
  p1.misc[6]-=2;
  p1.misc[7]-=1;
  p1.money-=40;
  }
    return;
  case 4:
  if(p1.misc[4]>=2&&p1.misc[5]>=2&&p1.misc[6]>=2&&p1.misc[7]>=1&&p1.money>=40){
  p1.misc[4]-=2;
  p1.misc[5]-=2;
  p1.misc[6]-=2;
  p1.misc[7]-=1;
  p1.money-=40;
  }
    return;
  case 5:
  if(p1.misc[4]>=2&&p1.misc[5]>=2&&p1.misc[8]>=2&&p1.misc[7]>=1&&p1.money>=40){
  p1.misc[4]-=2;
  p1.misc[5]-=2;
  p1.misc[8]-=2;
  p1.misc[7]-=1;
  p1.money-=40;
  }
    return;
  case 6:
  if(p1.misc[9]>=1&&p1.misc[5]>=2&&p1.misc[8]>=2&&p1.misc[7]>=2&&p1.money>=40){
  p1.misc[9]-=1;
  p1.misc[5]-=2;
  p1.misc[8]-=2;
  p1.misc[7]-=2;
  p1.money-=40;
  }
    return;
  case 7:
  if(p1.misc[9]>=1&&p1.misc[4]>=2&&p1.misc[8]>=2&&p1.misc[6]>=2&&p1.money>=40){
  p1.misc[9]-=1;
  p1.misc[4]-=2;
  p1.misc[8]-=2;
  p1.misc[6]-=2;
  p1.money-=40;
  }
    return;
  case 8:
  if(p1.misc[9]>=4&&p1.misc[3]>=2&&p1.misc[7]>=1&&p1.money>=40){
  p1.misc[9]-=4;
  p1.misc[3]-=2;
  p1.misc[7]-=1;
  p1.money-=40;
  }
    return;
  }
  
  
  for(int i=0;i<9;i++)
  if(buttononclick(DISPLAYX*0.55-20,DISPLAYY*0.26-36+(DISPLAYY*0.06+4)*i,40,40)){
  
  crclicked[i]=true;
  
  }else crclicked[i]=false;
  
  
}

}
