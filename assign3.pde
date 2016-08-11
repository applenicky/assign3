//You should implement your assign3 here.
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_LOSE = 2;
final int Blood_Volume = 195;

PImage bg1,bg2,start1,start2,end1,end2;
PImage fighterImg,hpImg,treasureImg,enemyImg;
int bg1X,bg2X;
int gameState;
int fighterX,fighterY,fighterW,fighterH,fighterSpeed;
int hp,hpX,hpY;
int treasureX,treasureY,treasureW,treasureH;
int enemyX,enemyY,enemyW,enemyH;
int ix =-400;
int spacing =5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup () {
  size(640, 480);
  bg1  = loadImage("img/bg1.png");
  bg2  = loadImage("img/bg2.png");
  start1  = loadImage("img/start1.png");
  start2  = loadImage("img/start2.png");
  end1  = loadImage("img/end1.png");
  end2  = loadImage("img/end2.png");
  fighterImg = loadImage("img/fighter.png");
  hpImg = loadImage("img/hp.png");
  treasureImg = loadImage("img/treasure.png");
  enemyImg = loadImage("img/enemy.png");
  bg1X =0;
  bg2X =-640;
  fighterSpeed = 5;
  hpX = 10;
  hpY = 10;
  treasureW = 41;
  treasureH = 41;
  enemyW = 61;
  enemyH = 61;
  fighterW = 51;
  fighterH = 51;
  treasureX = floor(random(0,width-treasureW));
  treasureY = floor(random(0,height-treasureH));
  enemyY = floor(random(0,height-enemyH));
  gameState = GAME_START;
}

void draw() {
 // background(255);
  switch (gameState){
    case GAME_START:
    hp = 195/5;
    fighterX = 580;
    fighterY = 240;
    image(start2,0,0);
        if (mouseX > 200 && mouseX < 460 && mouseY > 380 && mouseY < 415){
        if (mousePressed){
          // click
          gameState = GAME_RUN;
        }else{
          // hover
          image(start1,0,0);
        }
      }
    break;
    case GAME_RUN:
    
    //bg
    image(bg2,bg2X,0);
    bg2X++;
    image(bg1,bg1X,0);
    bg1X++;
    bg1X=bg1X-(int(bg1X/640)*1280);
    bg2X=bg2X-(int(bg2X/640)*1280);
    
    //fighter
    image(fighterImg,fighterX,fighterY);
    if (upPressed) {
      fighterY -= fighterSpeed;
    }
    if (downPressed) {
      fighterY += fighterSpeed;
    }
    if (leftPressed) {
      fighterX -= fighterSpeed;
    }
    if (rightPressed) {
      fighterX += fighterSpeed;
    }
    if(fighterX > width - fighterW){
      fighterX = width - fighterW;
    }
    if(fighterX < 0 ){
      fighterX = 0;
    }
    if(fighterY > height - fighterH){
      fighterY = height - fighterH;
    }
    if(fighterY < 0){
      fighterY = 0;
    }
    
    //enemy
    for(int row =0; row<6;row++){
      ix += 1;
      image(enemyImg,enemyX,enemyY);
      enemyX =ix+(enemyW+spacing)*row;
    }
   
    if(enemyX>=968){
      ix = -400;
      enemyY = floor(random(0,height-enemyH));
    }
    
    //treasure
    image(treasureImg,treasureX,treasureY);
    if(treasureX+treasureW/2+fighterW/2 > fighterX && treasureX-treasureW/2-+fighterW/2 < fighterX){
      if(treasureY+treasureH/2+fighterH/2 > fighterY && treasureY-treasureH/2-fighterH/2 < fighterY){
    hp += 195*0.1;
    if(hp>=195){
      hp=195;
    }
    treasureX = floor(random(0,width-treasureW));
    treasureY = floor(random(0,height-treasureH));
    }}
    
    //hp
    rectMode(CORNER);
    stroke(#ff0000);
    fill(#ff0000);
    rect(20,15,hp,25);
    image(hpImg,hpX,hpY);
    break;
    case GAME_LOSE:
    image(end2,0,0);
        if (mouseX > 210 && mouseX < 430 && mouseY > 310 && mouseY < 348){
        if (mousePressed){
          // click
          gameState = GAME_START;
        }else{
          // hover
          image(end1,0,0);
        }
      }
    break;
  }
}

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
