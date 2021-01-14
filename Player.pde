class player extends unit{

int cordX=0;
int cordY=0;

int exp=0;

int statPoints=20;
  
String name = " ";

//Inv parametrs
int money=0;

int shpPotions = 4;
int mhpPotions = 4;
int lhpPotions = 4;

int misc[] = new int[10];


void nameCh(){
text("Insert player name:",DISPLAYX*0.5,DISPLAYY*0.4);
text(name,DISPLAYX*0.5,DISPLAYY*0.6);
}

void nameChonkey(){
  if((key>='a'&&key<='z')||(key>='A'&&key<='Z')){
    if(name==" ")name=str(key);
else name += key;
}

if(key==BACKSPACE){
  if(name.length()>=1)
  name = name.substring(0,name.length()-1);
}
if(key==ENTER)whatToDisplay=4;
}

void playerSave(){
  
String src = new String("saves/player"+str(whichSave)+".txt");
  PrintWriter save = createWriter(src);
     save.println(name);
     save.println(cordX+" "+cordY);
     save.println(level+" "+exp);
     save.println(statPoints);
     save.println(strenght+" "+agility+" "+endurance+" "+inteligence);
     save.println(prs+" "+pra+" "+pre+" "+pri);
     save.println(shpPotions+" "+mhpPotions+" "+lhpPotions);
     save.println(money);
     for(int i=0;i<10;i++)
     save.print(misc[i]+" ");
     save.close();
}

void playerContinue(){
String src = new String("saves/player"+str(whichSave)+".txt");
  BufferedReader reader = createReader(src);

  try{
      name = reader.readLine();
      String line = reader.readLine();
      String[] temp1=split(line,' ');
      cordX=int(temp1[0]);
      cordY=int(temp1[1]);
      line = reader.readLine();
      String[] temp2=split(line,' ');
      level=int(temp2[0]);
      exp=int(temp2[1]);
      statPoints = int(reader.readLine());
      line = reader.readLine();
      String[] temp3=split(line,' ');
      strenght=int(temp3[0]);
      agility=int(temp3[1]);
      endurance=int(temp3[2]);
      inteligence=int(temp3[3]);
      line = reader.readLine();
      String[] temp4=split(line,' ');
      prs=int(temp4[0]);
      pra=int(temp4[1]);
      pre=int(temp4[2]);
      pri=int(temp4[3]);
      line = reader.readLine();
      String[] temp5=split(line,' ');
      shpPotions=int(temp5[0]);
      mhpPotions=int(temp5[1]);
      lhpPotions=int(temp5[2]);
      money =int(reader.readLine());
      line = reader.readLine();
      String[] temp6=split(line,' ');
      for(int i=0;i<10;i++)
      misc[i]=int(temp6[i]);
  reader.close();
  }catch (IOException e) {
    e.printStackTrace();
  }
}

}
