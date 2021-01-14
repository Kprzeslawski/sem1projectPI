class PlayerSkills{
  
  boolean[] skillsunlocked = new boolean[24];
  boolean[] skillclicked = new boolean[24];
  int skillpoints=0;
  PImage[] tpskills = new PImage[6];
  
  public PlayerSkills(){
  for(int i=0;i<10;i++){
    skillsunlocked[i] = false;
   skillclicked[i]=false;
    }
  }
void loadtpskills(){
for(int i=1;i<7;i++){
    tpskills[i-1] = loadImage("skills/"+i+".png");
    }
}
  
void skillSload(){
  
String itsrc="saves/ps"+whichSave+".txt";
BufferedReader reader = createReader(itsrc);
try{
  skillpoints=int(reader.readLine());
  String[] temp=split(reader.readLine(),' ');
  for(int i=0;i<24;i++)skillsunlocked[i]=boolean(int(temp[i]));
reader.close();
}catch (IOException e) {
    e.printStackTrace();
  }
  
}

void skillSsave(){
String itsrc="saves/ps"+whichSave+".txt";
PrintWriter save = createWriter(itsrc);
save.println(skillpoints);
for(int i=0;i<24;i++)
save.print(int(skillsunlocked[i])+" ");
save.close();
}

void displaytext(int i){
  String[] skilltl=new String[8];
  for(int ii=0;ii<8;ii++)skilltl[ii] = " ";
switch(i){
case 0:
skilltl[0]="Might I";
skilltl[2]="Increase strenght";
skilltl[3]="by 2 points";
break;
case 1:
skilltl[0]="Precision I";
skilltl[2]="Increase agility";
skilltl[3]="by 2 points";
break;
case 2:
skilltl[0]="Intellect I";
skilltl[2]="Increase inteligence";
skilltl[3]="by 2 points";
break;
case 3:
skilltl[0]="Might II";
skilltl[2]="New Skill";
skilltl[3]="Mighty swing";
skilltl[4]="Deal damage equal to";
skilltl[5]="1.4 endurance";
break;
case 4:
skilltl[0]="Precision II";
skilltl[2]="Increase crit";
skilltl[3]="by 2%";
break;
case 5:
skilltl[0]="Intellect II";
skilltl[2]="New Skill";
skilltl[3]="Lightning shot";
skilltl[4]="Deal damage equal to";
skilltl[5]="2 inteligence";
break;
case 6:
skilltl[0]="Might III";
skilltl[2]="Skill Upgrade";
skilltl[3]="Mighty cut";
skilltl[4]="Deal damage equal to";
skilltl[5]="2.1 endurance";
break;
case 7:
skilltl[0]="Precision III";
skilltl[2]="New Skill";
skilltl[3]="Backstab";
skilltl[4]="Deal damage equal to";
skilltl[5]="1 agility + 0.4 strenght";
break;
case 8:
skilltl[0]="Intellect III";
skilltl[2]="Skill Upgrade";
skilltl[3]="Lightning storm";
skilltl[4]="Deal damage equal to";
skilltl[5]="3 inteligence";
break;
case 9:
skilltl[0]="Might IV";
skilltl[2]="Skill Upgrade";
skilltl[3]="Mighty slash";
skilltl[4]="Deal damage equal to";
skilltl[5]="2.8 endurance";
break;
case 10:
skilltl[0]="Precision IV";
skilltl[2]="Skill Upgrade";
skilltl[3]="In a heart";
skilltl[4]="Deal damage equal to";
skilltl[5]="1.4 agility + 0.6 strenght";
break;
case 11:
skilltl[0]="Intellect IV";
skilltl[2]="Skill Upgrade";
skilltl[3]="Overload";
skilltl[4]="Deal damage equal to";
skilltl[5]="4 inteligence";
break;
case 12:
skilltl[0]="Fortyfication I";
skilltl[2]="Increase endurance";
skilltl[3]="by 2 points";
break;
case 13:
skilltl[0]="Manual I";
skilltl[2]="Increase dodge";
skilltl[3]="by 2%";
break;
case 14:
skilltl[0]="Healing I";
skilltl[2]="Increase inteligence";
skilltl[3]="by 2 points";
break;
case 15:
skilltl[0]="Fortyfication II";
skilltl[2]="Increase endurance";
skilltl[3]="by 2 points";
break;
case 16:
skilltl[0]="Manual II";
skilltl[2]="New Skill";
skilltl[3]="Bandaging";
skilltl[4]="Reduce next enemy atack";
skilltl[5]="by 2";
skilltl[6]="Heal for 1.2 inteligence";
break;
case 17:
skilltl[0]="Healing II";
skilltl[2]="New Skill";
skilltl[3]="Cure";
skilltl[4]="Heal for 2 inteligence";
break;
case 18:
skilltl[0]="Fortyfication III";
skilltl[2]="New Skill";
skilltl[3]="Stone Skin";
skilltl[4]="Reduce next enemy atack";
skilltl[5]="by 1 endurance";
skilltl[6]="Heal for 1 inteligence";
break;
case 19:
skilltl[0]="Manual III";
skilltl[2]="Skill Upgrade";
skilltl[3]="Bandaging II";
skilltl[4]="Reduce next enemy atack";
skilltl[5]="by 5";
skilltl[6]="Heal for 1.8 inteligence";
break;
case 20:
skilltl[0]="Healing III";
skilltl[2]="Skill Upgrade";
skilltl[3]="Salvation";
skilltl[4]="Heal for 3 inteligence";
break;
case 21:
skilltl[0]="Fortyfication IV";
skilltl[2]="Skill Upgrade";
skilltl[3]="Stone Skin";
skilltl[4]="Reduce next enemy atack";
skilltl[5]="by 1.5 endurance";
skilltl[6]="Heal for 1.5 inteligence";
break;
case 22:
skilltl[0]="Manual IV";
skilltl[2]="Skill Upgrade";
skilltl[3]="Bandaging III";
skilltl[4]="Reduce next enemy atack";
skilltl[5]="by 10";
skilltl[6]="Heal for 2.4 inteligence";
break;
case 23:
skilltl[0]="Healing IV";
skilltl[2]="Skill Upgrade";
skilltl[3]="Rademption";
skilltl[4]="Heal for 4 inteligence";
break;
}
textAlign(LEFT,CENTER);
fill(0);
for(int ii=0;ii<8;ii++)
text(skilltl[ii],20,DISPLAYY*0.4+30*(1+ii));
textAlign(CENTER,CENTER);
}

boolean obtainable(int i){
if(i<3)return true;
if(i>=12&&i<=14)return true;
if(ps.skillsunlocked[i-3])return true;
return false;
}

}
