class map{

  int struct[][] = new int[21][21];
  byte mapbuffer[][] = new byte[101][101];
  
  PImage texture[]=new PImage[5];
  PImage pltexture[]=new PImage[12];
  PImage it1texture[]=new PImage[4];
  
void loadTextures(){
  
texture[0]= loadImage("objects/grass1.png");
texture[1] = loadImage("objects/rock.png");
texture[2] = loadImage("objects/tree.png");
texture[3] = loadImage("objects/bush.png");
texture[4] = loadImage("enemies/Enemy1.png");

pltexture[0] = loadImage("player/pipo-nekonin013 (2).png");
pltexture[1] = loadImage("player/pipo-nekonin013 (3).png");
pltexture[2] = loadImage("player/pipo-nekonin013 (4).png");
pltexture[3] = loadImage("player/pipo-nekonin013 (5).png");
pltexture[4] = loadImage("player/pipo-nekonin013 (6).png");
pltexture[5]= loadImage("player/pipo-nekonin013 (7).png");
pltexture[6]= loadImage("player/pipo-nekonin013 (8).png");
pltexture[7]= loadImage("player/pipo-nekonin013 (9).png");
pltexture[8]= loadImage("player/pipo-nekonin013 (10).png");
pltexture[9]= loadImage("player/pipo-nekonin013 (11).png");
pltexture[10]= loadImage("player/pipo-nekonin013 (12).png");
pltexture[11]= loadImage("player/pipo-nekonin013 (13).png");

it1texture[0]=loadImage("item1/money.png");
it1texture[1]=loadImage("item1/potion_s.png");
it1texture[2]=loadImage("item1/potion_m.png");
it1texture[3]=loadImage("item1/potion_l.png");
}
  
void displayMap(){
  
int milisec=millis()%2000;
int event=1;

if(milisec<500)event=1;
else if(milisec<1000)event=2;
else if(milisec<1500)event=1;
else if(milisec<2000)event=3;

for(int i = 0;i<21;i++)
for(int i2 = 0;i2<21;i2++){
image(texture[0],i*40,i2*40,41,41);

if(struct[i][i2]==0){
  image(texture[1],i*40,i2*40,40,40);
}
else if(struct[i][i2]==10){
  image(texture[2],i*40,i2*40,40,40);
}
else if(struct[i][i2]==11){
  image(texture[1],i*40,i2*40,40,40);
}
else if(struct[i][i2]==12){
  image(texture[3],i*40,i2*40,40,40);
}
if(enemyLayer[i][i2]==byte(1)){
  image(texture[4],i*40,i2*40,40,40);
}
}

int pt=0;

switch(direction){
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

image(pltexture[pt],400,400,40,40);
}

void generateMap(){
byte mapstruct[][]=new byte[101][101];
String src = new String("saves/map"+str(whichSave)+".txt");
  PrintWriter save;
         save = createWriter(src);
         
         
for(int i=0;i<101;i++){
  for(int i2=0;i2<101;i2++){

    if(i==0||i==100||i2==0||i2==100)mapstruct[i][i2]=0;
        else mapstruct[i][i2] = byte(random(12)+1);
            if(i==50&&i2==50)mapstruct[i][i2]=1;
            if(mapstruct[i][i2]<10)
    save.print("0"+str(mapstruct[i][i2]));
    else
    save.print(str(mapstruct[i][i2]));
  }
  save.println();
 }
 save.close();
}

void configStruct(){
  for(int i = -10;i<=10;i++)for(int i2 = -10;i2<=10;i2++)
  struct[10+i][10+i2]=getmapvalue(i,i2);
}

int getmapvalue(int delta1,int delta2){
  int val=1;
  if(50+p1.cordY+delta2>-1&&50+p1.cordY+delta2<101)
  if(50+p1.cordX+delta1>-1&&50+p1.cordX+delta1<101){
   val=int(mapbuffer[50+p1.cordX+delta1][50+p1.cordY+delta2]);
  }
return val;
}

void readMap(){
  String src = new String("saves/map"+str(whichSave)+".txt");
  BufferedReader reader = createReader(src);

  try{
    
  for(int i=0;i<101;i++){
    String line = reader.readLine();
  for(int i2=0;i2<101;i2++)
mapbuffer[i][i2]=byte(int(line.charAt(2*i2)-'0')*10+int(line.charAt(2*i2+1)-'0'));
  }
  
}catch (IOException e) {
    e.printStackTrace();
  }
}


void spawnEnemies(int X,int Y){
  configStruct();
if(X==0&&Y==0){
for(int i=0;i<21;i++)
for(int i2=0;i2<21;i2++)
if(struct[i][i2]>0&&struct[i][i2]<10)
if(int(random(20))==0)
enemyLayer[i][i2]=byte(random(1)+1);
else enemyLayer[i][i2]=0;
enemyLayer[10][10]=0;
}
//+X
else if(X>0){
for(int i=0;i<20;i++)
for(int i2=0;i2<21;i2++)
enemyLayer[i][i2]=enemyLayer[i+1][i2];

for(int i=0;i<21;i++)
if(struct[20][i]>0&&struct[20][i]<10){
if(int(random(20))==0)
enemyLayer[20][i]=byte(random(1)+1);
else enemyLayer[20][i]=0;
}

else enemyLayer[20][i]=0;
}
//-X
else if(X<0){
for(int i=20;i>0;i--)
for(int i2=0;i2<21;i2++)
enemyLayer[i][i2]=enemyLayer[i-1][i2];

for(int i=0;i<21;i++)
if(struct[0][i]>0&&struct[0][i]<10){
if(int(random(20))==0)
enemyLayer[0][i]=byte(random(1)+1);
else enemyLayer[0][i]=0;
}
else enemyLayer[0][i]=0;


}
//+Y
else if(Y>0){
for(int i=0;i<20;i++)
for(int i2=0;i2<21;i2++)
enemyLayer[i2][i]=enemyLayer[i2][i+1];

for(int i=0;i<21;i++)
if(struct[i][20]>0&&struct[i][20]<10){
if(int(random(20))==0)
enemyLayer[i][20]=byte(random(1)+1);
else enemyLayer[i][20]=0;
}
else enemyLayer[i][20]=0;
}
//-Y
else if(Y<0){
for(int i=20;i>0;i--)
for(int i2=0;i2<21;i2++)
enemyLayer[i2][i]=enemyLayer[i2][i-1];

for(int i=0;i<21;i++)
if(struct[i][0]>0&&struct[i][0]<10){
if(int(random(20))==0)
enemyLayer[i][0]=byte(random(1)+1);
else enemyLayer[i][0]=0;
}
else enemyLayer[i][0]=0;
}
}

}
