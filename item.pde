class item{

boolean doexist=false;

int texturenr=0;

String name="item"+str(texturenr);

int type=0;
//stats

int its=0;
int ita=0;
int ite=0;
int iti=0;

int itprs=100;
int itpra=0;
int itpre=0;
int itpri=0;

int upgrade=0;

void givestatstoplayer(){
  if(!doexist)return;
p1.strenght+=its;
p1.agility+=ita;
p1.endurance+=ite;
p1.inteligence+=iti;
if(type==0){
p1.prs=itprs;
p1.pra=itpra;
p1.pre=itpre;
p1.pri=itpri;
}
}

void takestatsfromplayer(){
  if(!doexist)return;
p1.strenght-=its;
p1.agility-=ita;
p1.endurance-=ite;
p1.inteligence-=iti;
if(type==0){
p1.prs=100;
p1.pra=0;
p1.pre=0;
p1.pri=0;
}
}

void saveitem(int id){
String itsrc="saves/inv"+whichSave+"/inek"+id+".txt";
PrintWriter save = createWriter(itsrc);
save.println(doexist);
save.println(texturenr);
save.println(name);
save.println(type);
save.println(its);
save.println(ita);
save.println(ite);
save.println(iti);
save.println(itprs);
save.println(itpra);
save.println(itpre);
save.println(itpri);
save.println(upgrade);
save.close();
}

void loaditem(int id){
String itsrc="saves/inv"+whichSave+"/inek"+id+".txt";
BufferedReader reader = createReader(itsrc);
try{
  doexist=boolean(reader.readLine());
  texturenr=int(reader.readLine());
  name=reader.readLine();
  type=int(reader.readLine());
  its=int(reader.readLine());
  ita=int(reader.readLine());
  ite=int(reader.readLine());
  iti=int(reader.readLine());
  itprs=int(reader.readLine());
  itpra=int(reader.readLine());
  itpre=int(reader.readLine());
  itpri=int(reader.readLine());
  upgrade=int(reader.readLine());
reader.close();
}catch (IOException e) {
    e.printStackTrace();
  }
}

void createfrompattern(){
  
int item = int(random(60));

  texturenr = int(idXMLchild[item].getChild("tid").getContent());
  name = idXMLchild[item].getChild("name").getContent();
  
  its = int(idXMLchild[item].getChild("s").getContent());
  ita = int(idXMLchild[item].getChild("a").getContent());
  ite = int(idXMLchild[item].getChild("e").getContent());
  iti = int(idXMLchild[item].getChild("i").getContent());
  
  itprs = int(idXMLchild[item].getChild("ps").getContent());
  itpra = int(idXMLchild[item].getChild("pa").getContent());
  itpre = int(idXMLchild[item].getChild("pe").getContent());
  itpri = int(idXMLchild[item].getChild("pi").getContent());
  
  doexist=true;
  
  upgrade=0;
  
  type=(int(idXMLchild[item].getChild("idit").getContent())-1)%6;
  
}

void createfrompattern(int item){
  
  texturenr = int(idXMLchild[item].getChild("tid").getContent());
  name = idXMLchild[item].getChild("name").getContent();
  
  its = int(idXMLchild[item].getChild("s").getContent());
  ita = int(idXMLchild[item].getChild("a").getContent());
  ite = int(idXMLchild[item].getChild("e").getContent());
  iti = int(idXMLchild[item].getChild("i").getContent());
  
  itprs = int(idXMLchild[item].getChild("ps").getContent());
  itpra = int(idXMLchild[item].getChild("pa").getContent());
  itpre = int(idXMLchild[item].getChild("pe").getContent());
  itpri = int(idXMLchild[item].getChild("pi").getContent());
  
  doexist=true;
  
  upgrade=0;
  
  type=(int(idXMLchild[item].getChild("idit").getContent())-1)%6;
  
}

void upgradeitem(){
 
its+=int(random(2));
ita+=int(random(2));
ite+=int(random(2));
iti+=int(random(2));

if(type==0){
itprs+=int(random(5));
itpra+=int(random(5));
itpre+=int(random(5));
itpri+=int(random(5));
}
}

boolean upgradable(){
  if(upgrade==10) return false;
return true;
}

int upgradecost(){
  switch(upgrade){
  case 0:return 10;
  case 1:return 20;
  case 2:return 40;
  case 3:return 75;
  case 4:return 125;
  case 5:return 250;
  case 6:return 500;
  case 7:return 800;
  case 8:return 1200;
  case 9:return 2000;
  }
return 1;
}
}
