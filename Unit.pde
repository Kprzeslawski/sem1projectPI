class unit{

int level=1;

int strenght=1;
int agility=1;
int endurance=1;
int inteligence=1;

int prs=100;
int pra=0;
int pre=0;
int pri=0;

int dodge;
int crit;
int hpmax;

int hp;

void calcOtherStats(){
dodge = agility/level;
crit = agility/level;
hpmax = (20+level+endurance)*5;
}

void calcOtherStats(boolean p){
dodge = agility/level;
if(p)
if(ps.skillsunlocked[13])dodge+=2;
crit = agility/level;
if(p)
if(ps.skillsunlocked[4])crit+=2;
hpmax = (20+level+endurance)*5;
}

void setHp(){
  hp=hpmax;
}

int castAtack(){
  int dmg =(prs*strenght+pra*agility+pre*endurance+pri*inteligence)/100;
return dmg;
}

void createunit(){
  
  level = int(random(5))+p1.level;
  if(level<=0)level=1;
strenght = int(random(8)+1)+level;
agility = int(random(8)+1)+level;
endurance = int(random(8)+1)+level;
inteligence = int(random(8)+1)+level;

calcOtherStats();
setHp();
}

}
