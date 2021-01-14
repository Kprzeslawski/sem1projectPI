
class DifMenu{
  String name;
  int whereX;
  int whereY;
  
void setValue(String name1,float X,float Y){
    name = name1;
    whereX = int(X);
    whereY = int(Y);
  }
  
}

int deltaT=0;
int lastdisp=0;
String fps;

void fps(){
  if(lastdisp>500){
    fps=str(int(1000/(millis()-deltaT)));
    lastdisp=0;
  }
  textAlign(RIGHT,TOP);
text("FPS~" + fps,DISPLAYX,0);
textAlign(CENTER,CENTER);
lastdisp+=millis()-deltaT;
deltaT=millis();
}

void menudisplay(DifMenu dif[],int whattomark,int tcolor,int elements){
  
    for(int i=0;i<elements;i++){
      if(i==whattomark-1){
        fill(tcolor);
        text("> "+dif[i].name+" <",dif[i].whereX,dif[i].whereY,6);
        fill(0);
      }
      else{
      fill(0);
        text(dif[i].name,dif[i].whereX,dif[i].whereY,6);
      }
    }
}

int colision(int X,int Y){
if(enemyLayer[10+X][10+Y]==byte(1))return 2;
if(map1.struct[10+X][10+Y]<10&&map1.struct[10+X][10+Y]!=0)return 0;
return 1;
}

void clock(){
  
String time = new String();

if(hour()<10)time = "0";
time +=str(hour())+':';
if(minute()<10)time += "0";
time +=str(minute())+':';
if(second()<10)time += "0";
time +=str(second());
text(time,(DISPLAYX-inter.mapWDTH())*0.5+inter.mapWDTH(),DISPLAYY*0.9);

}

void redcross(float xx,float yy,float sizex,float sizey){
fill(#FC0303);
line(xx,yy,xx+sizex,yy+sizey);
line(xx+sizex,yy,xx,yy+sizey);
fill(0);
}

void allignbuttons(boolean skillu,PImage skilltexture,float xx,float yy,float sizex,float sizey){
if(skillu)image(skilltexture,xx,yy,sizex,sizey);
else redcross(xx,yy,sizex,sizey);
}

  boolean c1=false,c2=false;
  
  String[] fdisp = new String[14];

void cleardisp(){
  fdisp[0]="Turn "+turncounter+" has began!!";
  for(int i=1;i<14;i++)fdisp[i]=" ";
  
}

void fightSequence(){
  
for(int i=0;i<13;i++)
if(i!=3&&i!=9)
button(DISPLAYX*(i+1)/14-30,DISPLAYY*0.9-30,60,60);

allignbuttons(ps.skillsunlocked[3]||ps.skillsunlocked[6]||ps.skillsunlocked[9],ps.tpskills[0],DISPLAYX/14-30,DISPLAYY*0.9-30,60,60);
allignbuttons(ps.skillsunlocked[7]||ps.skillsunlocked[10],ps.tpskills[1],DISPLAYX*2/14-30,DISPLAYY*0.9-30,60,60);
allignbuttons(ps.skillsunlocked[5]||ps.skillsunlocked[8]||ps.skillsunlocked[11],ps.tpskills[2],DISPLAYX*3/14-30,DISPLAYY*0.9-30,60,60);

allignbuttons(true,inter.itextur[pequip[0].texturenr],DISPLAYX*5/14-30,DISPLAYY*0.9-30,60,60);
allignbuttons(p1.shpPotions>0,map1.it1texture[1],DISPLAYX*6/14-30,DISPLAYY*0.9-30,60,60);
allignbuttons(p1.mhpPotions>0,map1.it1texture[2],DISPLAYX*7/14-30,DISPLAYY*0.9-30,60,60);
allignbuttons(p1.lhpPotions>0,map1.it1texture[3],DISPLAYX*8/14-30,DISPLAYY*0.9-30,60,60);
allignbuttons(true,inter.runtexture,DISPLAYX*9/14-30,DISPLAYY*0.9-30,60,60);

allignbuttons(ps.skillsunlocked[18]||ps.skillsunlocked[21],ps.tpskills[3],DISPLAYX*11/14-30,DISPLAYY*0.9-30,60,60);
allignbuttons(ps.skillsunlocked[16]||ps.skillsunlocked[19]||ps.skillsunlocked[22],ps.tpskills[4],DISPLAYX*12/14-30,DISPLAYY*0.9-30,60,60);
allignbuttons(ps.skillsunlocked[17]||ps.skillsunlocked[20]||ps.skillsunlocked[23],ps.tpskills[5],DISPLAYX*13/14-30,DISPLAYY*0.9-30,60,60);

    textSize(20);
    
  text('S',DISPLAYX*1/14,DISPLAYY*0.9-50);    
  text('D',DISPLAYX*2/14,DISPLAYY*0.9-50);    
  text('F',DISPLAYX*3/14,DISPLAYY*0.9-50);
      
  text('A',DISPLAYX*5/14,DISPLAYY*0.9-50);    
  text('1',DISPLAYX*6/14,DISPLAYY*0.9-50);    
  text('2',DISPLAYX*7/14,DISPLAYY*0.9-50);    
  text('3',DISPLAYX*8/14,DISPLAYY*0.9-50);    
  text('R',DISPLAYX*9/14,DISPLAYY*0.9-50);
      
  text('Q',DISPLAYX*11/14,DISPLAYY*0.9-50);    
  text('W',DISPLAYX*12/14,DISPLAYY*0.9-50);    
  text('E',DISPLAYX*13/14,DISPLAYY*0.9-50);
  
  
     line(0,DISPLAYY*0.8,DISPLAYX,DISPLAYY*0.8);
     line(DISPLAYX*0.3,0,DISPLAYX*0.3,DISPLAYY*0.8);
     line(DISPLAYX*0.7,0,DISPLAYX*0.7,DISPLAYY*0.8);

    text("Player hp:",DISPLAYX*0.15,DISPLAYY*0.1);
    text(str(p1.hp)+"/"+str(p1.hpmax),DISPLAYX*0.15,DISPLAYY*0.2);
    text("Enemy hp:",DISPLAYX*0.85,DISPLAYY*0.1);
    text(str(enemy.hp)+"/"+str(enemy.hpmax),DISPLAYX*0.85,DISPLAYY*0.2);
    fill(#FF0000);
    rect(DISPLAYX*0.15-150,DISPLAYY*0.15-15,300,30);
    rect(DISPLAYX*0.85-150,DISPLAYY*0.15-15,300,30);
    fill(#5BA233);
    rect(DISPLAYX*0.15-150,DISPLAYY*0.15-15,300*p1.hp/p1.hpmax,30);
    rect(DISPLAYX*0.85-150,DISPLAYY*0.15-15,300*enemy.hp/enemy.hpmax,30);
    fill(0);
    
        line(0,DISPLAYY*0.25,DISPLAYX*0.3,DISPLAYY*0.25);
        line(DISPLAYX*0.7,DISPLAYY*0.25,DISPLAYX,DISPLAYY*0.25);
        
    text("Level "+p1.level,DISPLAYX*0.15,DISPLAYY*0.3);
    text("Strenght "+p1.strenght,DISPLAYX*0.15,DISPLAYY*0.4);
    text("Agility "+p1.agility,DISPLAYX*0.15,DISPLAYY*0.45);
    text("Endurance "+p1.endurance,DISPLAYX*0.15,DISPLAYY*0.5);
    text("Inteligence "+p1.inteligence,DISPLAYX*0.15,DISPLAYY*0.55);
    
    text("Crit "+p1.crit+"%",DISPLAYX*0.15,DISPLAYY*0.65);
    text("Dodge "+p1.dodge+"%",DISPLAYX*0.15,DISPLAYY*0.7);
    
    text("Level "+enemy.level,DISPLAYX*0.85,DISPLAYY*0.3);
    text("Strenght "+enemy.strenght,DISPLAYX*0.85,DISPLAYY*0.4);
    text("Agility "+enemy.agility,DISPLAYX*0.85,DISPLAYY*0.45);
    text("Endurance "+enemy.endurance,DISPLAYX*0.85,DISPLAYY*0.5);
    text("Inteligence "+enemy.inteligence,DISPLAYX*0.85,DISPLAYY*0.55);
    
    text("Crit "+enemy.crit+"%",DISPLAYX*0.85,DISPLAYY*0.65);
    text("Dodge "+enemy.dodge+"%",DISPLAYX*0.85,DISPLAYY*0.7);
    
    for(int i=0;i<14;i++)
    text(fdisp[i],DISPLAYX*0.5,DISPLAYY*0.05*(1+i));
}

int turncounter=1;

void fdisp(String flog){
for(int i=0;i<14;i++){
if(fdisp[i]==" "){
fdisp[i]=flog;
return;
}
}

for(int i=0;i<13;i++){
fdisp[i]=fdisp[i+1];
}
fdisp[13]=flog;
}

void enemyturn(int dmg,int dmgred){
  
  if(dmg>0){
    if(enemy.dodge<=int(random(100))){
enemy.hp-=dmg;
if(c1)fdisp("Critical hit ! "+dmg);
else fdisp("U dealt "+dmg);
    } else fdisp("Enemy dodged ur atack!");
  }
  if(dmg<0)fdisp("U healed self by "+(-dmg));
  
  if(enemy.hp<=0){
  fdisp("Victory!!");
  turncounter=1;
  doreward();
  whatToDisplay=14;
  cleardisp();
  switch(direction){
  case 1: enemyLayer[10][9]=0;
  break;
  case 2: enemyLayer[11][10]=0;
  break;
  case 3: enemyLayer[10][11]=0;
  break;
  case 4: enemyLayer[9][10]=0;
  break;
  }
  return;
  }
  
  dmg=enemy.castAtack();
  
  if(int(random(100))<=enemy.crit){
    dmg *=2;
    c2=true;
  }else c2=false;
  
  dmg-=dmgred;
  
  if(p1.dodge<=int(random(100))){
p1.hp-=dmg;
if(c2)fdisp("Recived critical hit ! "+dmg);
else fdisp("Taken "+dmg+" dmg");
    } else fdisp("U dodged enemy atack!");
  
  if(p1.hp<=0){
  fdisp("U lost!!");
  p1.hp=1;
  turncounter=1;
  whatToDisplay=14;
  cleardisp();
  return;
  }
  
  turncounter++;
  fdisp("Turn "+turncounter+" has began!!");
}

void patack(int c){
int dmg=0;
int dmgred=0;
   
  switch(c){
    case 0:
    return;
  case 1:
  if(ps.skillsunlocked[9])dmg=int(2.8*p1.endurance);
  else if(ps.skillsunlocked[6])dmg=int(2.1*p1.endurance);
  else if(ps.skillsunlocked[3])dmg=int(1.4*p1.endurance);
  else return;
  break;
  case 2:
  if(ps.skillsunlocked[10])dmg=int(1.4*p1.agility+0.6*p1.strenght);
  else if(ps.skillsunlocked[7])dmg=int(1*p1.agility+0.4*p1.strenght);
  else return;
  break;
  case 3:
  if(ps.skillsunlocked[11])dmg=int(4*p1.inteligence);
  else if(ps.skillsunlocked[8])dmg=int(3*p1.inteligence);
  else if(ps.skillsunlocked[5])dmg=int(2*p1.inteligence);
  else return;
  break;
  case 4:
  dmg=p1.castAtack();
  break;
  case 5:
  if(p1.shpPotions>0){
    p1.shpPotions--;
    p1.hp+=20+p1.inteligence*2;
  }else return;
  break;
  case 6:
  if(p1.mhpPotions>0){
    p1.mhpPotions--;
    p1.hp+=40+p1.inteligence*3;
  }else return;
  break;
  case 7:
  if(p1.lhpPotions>0){
    p1.lhpPotions--;
    p1.hp+=100+p1.inteligence*4;
  }else return;
  break;
  case 8:
  whatToDisplay=7;
  turncounter=0;
  return;
  case 9:
  if(ps.skillsunlocked[21]){
    dmg=-int(1.5*p1.inteligence);
    dmgred=int(1.5*p1.endurance);
  }
  else if(ps.skillsunlocked[18]){
    dmg=-int(1*p1.inteligence);
    dmgred=int(1*p1.endurance);
  }
  else return;
  break;
  case 10:
  if(ps.skillsunlocked[22]){
    dmg=-int(2.4*p1.inteligence);
    dmgred=10;
  }
  else if(ps.skillsunlocked[19]){
    dmg=-int(1.8*p1.inteligence);
    dmgred=5;
  }
  else if(ps.skillsunlocked[16]){
    dmg=-int(1.2*p1.inteligence);
    dmgred=2;
  }
  else return;
  break;
  case 11:
  if(ps.skillsunlocked[23]){
    p1.hp+=4*p1.inteligence;
    dmg=-4*p1.inteligence;
  }
  else if(ps.skillsunlocked[20]){
    p1.hp+=3*p1.inteligence;
    dmg=-3*p1.inteligence;
  }
  else if(ps.skillsunlocked[17]){
    p1.hp+=2*p1.inteligence;
    dmg=-2*p1.inteligence;
  }
  else return;
  break;
  }
  
  if(p1.hp>p1.hpmax){
    dmg=dmg+p1.hp-p1.hpmax;
    p1.hp=p1.hpmax;
  }
  
  if(dmg>0)
  if(int(random(100))<=p1.crit){
    dmg *=2;c1=true;
  }
  else c1=false;else c1=false;
  
enemyturn(dmg,dmgred);
}

void fightSequenceonkey(){
  int acase=0;
switch(key){
case 's':
acase=1;
  break;
case 'd':
acase=2;
  break;
case 'f':
acase=3;
  break;
case 'a':
acase=4;
  break;
case '1':
acase=5;
  break;
case '2':
acase=6;
  break;
case '3':
acase=7;
  break;
case 'r':
acase=8;
  break;
case 'q':
acase=9;
  break;
case 'w':
acase=10;
  break;
case 'e':
acase=11;
  break;
}
patack(acase);
}

void fightsequenceonclick(){
  int acase=0;
  if(buttononclick(DISPLAYX*1/14-30,DISPLAYY*0.9-30,60,60))acase=1;
  if(buttononclick(DISPLAYX*2/14-30,DISPLAYY*0.9-30,60,60))acase=2;
  if(buttononclick(DISPLAYX*3/14-30,DISPLAYY*0.9-30,60,60))acase=3;
  if(buttononclick(DISPLAYX*5/14-30,DISPLAYY*0.9-30,60,60))acase=4;
  if(buttononclick(DISPLAYX*6/14-30,DISPLAYY*0.9-30,60,60))acase=5;
  if(buttononclick(DISPLAYX*7/14-30,DISPLAYY*0.9-30,60,60))acase=6;
  if(buttononclick(DISPLAYX*8/14-30,DISPLAYY*0.9-30,60,60))acase=7;
  if(buttononclick(DISPLAYX*9/14-30,DISPLAYY*0.9-30,60,60))acase=8;
  if(buttononclick(DISPLAYX*11/14-30,DISPLAYY*0.9-30,60,60))acase=9;
  if(buttononclick(DISPLAYX*12/14-30,DISPLAYY*0.9-30,60,60))acase=10;
  if(buttononclick(DISPLAYX*13/14-30,DISPLAYY*0.9-30,60,60))acase=11;
patack(acase);
}

int rewtab[]= new int[15];



void doreward(){
  p1.exp+=enemy.level*2;
  if(p1.exp>p1.level*20){
  p1.exp-=p1.level*20;
  p1.level++;
  p1.statPoints+=4;
  ps.skillpoints+=1;
  }
rewtab[0]=int(random(5*float(enemy.level)));
p1.money+=rewtab[0];

if(int(random(4))==0)
rewtab[1]=1;
else rewtab[1]=0;
p1.shpPotions+=rewtab[1];

if(int(random(8))==0)
rewtab[2]=1;
else rewtab[2]=0;
p1.mhpPotions+=rewtab[2];

if(int(random(12))==0)
rewtab[3]=1;
else rewtab[3]=0;
p1.lhpPotions+=rewtab[3];

if(int(random(10))==0)
for(int i2=0;i2<14;i2++)
for(int i=0;i<16;i++)
if(!inel[i][i2].doexist){
inel[i][i2].createfrompattern();
rewtab[4]=1;
tittext=inter.itextur[inel[i][i2].texturenr];
}
else rewtab[4]=0;
else rewtab[4]=0;

for(int i =0;i<10;i++){
if(int(random(10))==0){
p1.misc[i]+=1;
rewtab[5+i]=1;
}else rewtab[5+i]=0;
}
}

PImage tittext;

void reward(){
  
text("U won battle!",DISPLAYX*0.5,DISPLAYY*0.1);
text("Exp +"+str(enemy.level*2),DISPLAYX*0.5,DISPLAYY*0.15);
textAlign(LEFT,TOP);
int i2=0;
for(int i =0;i<4;i++){
if(rewtab[i]>0){
image(map1.it1texture[i],DISPLAYX*0.3,DISPLAYY*(0.2+0.05*i2),40,40);
text(str(rewtab[i]),DISPLAYX*0.3+40,DISPLAYY*(0.2+0.05*i2));
i2++;
}
}
if(rewtab[4]>0){
image(tittext,DISPLAYX*0.3,DISPLAYY*(0.2+0.05*i2),40,40);
i2++;
}
for(int i =0;i<10;i++){
  if(rewtab[5+i]>0){
image(inter.crafttextures[i],DISPLAYX*0.3,DISPLAYY*(0.2+0.05*i2),40,40);
i2++;
}
}

textAlign(CENTER,CENTER);

}

void button(String s,float bx, float by,float h){
fill(#C1C1C1);
float wdyh = textWidth(s);
wdyh +=4;
int a=4,b=17;
if(mouseX<bx+(wdyh/2))
if(mouseX>bx-(wdyh/2))
if(mouseY>by-a-h)
if(mouseY<by+b+h)
fill(#EBEDEC);
rect(bx-(wdyh/2),by-4-h,wdyh,21+2*h);
fill(0);
text(s,bx,by);
}

void button(String s,float bx, float by,float h,boolean reAl){
fill(#C1C1C1);
float wdyh = textWidth(s);
wdyh +=4;
int a=4,b=17;
if(reAl){
a=0;
b=0;
}
if(mouseX<bx+(wdyh/2))
if(mouseX>bx-(wdyh/2))
if(mouseY>by-a-h)
if(mouseY<by+b+h)
fill(#EBEDEC);
rect(bx-(wdyh/2),by-a-h,wdyh,b+a+2*h);
fill(0);
text(s,bx,by);
}

boolean buttonclick(String s,float bx, float by,float h){
float wdyh = textWidth(s);
wdyh +=4;
if(mouseX<bx+(wdyh/2))
if(mouseX>bx-(wdyh/2))
if(mouseY>by-4-h)
if(mouseY<by+17+h)
return true;
return false;
}

boolean buttonclick(String s,float bx, float by,float h,boolean reAl){
float wdyh = textWidth(s);
wdyh +=4;
int a=4,b=17;
if(reAl){
a=0;
b=0;
}
if(mouseX<bx+(wdyh/2))
if(mouseX>bx-(wdyh/2))
if(mouseY>by-a-h)
if(mouseY<by+b+h)
return true;
return false;
}

void button(float xx,float yy,float sizxx,float sizyy){
fill(#C1C1C1);
if(mouseX<xx+sizxx)
if(mouseX>xx)
if(mouseY>yy)
if(mouseY<yy+sizyy)
fill(#EBEDEC);
rect(xx,yy,sizxx,sizyy);
fill(0);
}

boolean buttononclick(float xx,float yy,float sizxx,float sizyy){
if(mouseX<xx+sizxx)
if(mouseX>xx)
if(mouseY>yy)
if(mouseY<yy+sizyy)
return true;
return false;
}

boolean savesOk(){
  
  String fstr = "saves/map" + str(whichSave) + ".txt";
  BufferedReader reader = createReader(fstr);
  if(reader==null)
    return false;
    fstr = "saves/ps"+whichSave+".txt";
    reader = createReader(fstr);
    if(reader==null)
    return false;
  fstr = "saves/player" + str(whichSave) + ".txt";
  reader = createReader(fstr);
  if(reader==null)
    return false;
    for(int i=0;i<13*16+15;i++){
    fstr = "saves/inv" + str(whichSave) +"/inek"+i+".txt";
    reader = createReader(fstr);
    if(reader==null)
    return false;
    }
    for(int i=0;i<6;i++){
    fstr = "saves/inv" + str(whichSave) +"/inek"+(400+i)+".txt";
    reader = createReader(fstr);
    if(reader==null)
    return false;
    }
  return true;
}

PImage divimg(PImage divided,int ximg,int yimg){
  
PImage res = createImage(32,32,ARGB);
  for(int i=0;i<32;i++)for(int i2=0;i2<32;i2++)
  res.pixels[i+i2*32]=divided.get(ximg*32+i,yimg*32+i2);
return res;

}
