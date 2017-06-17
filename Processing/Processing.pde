// import ddf.minim.*;
// AudioPlayer player;
// Minim minim;
Image boden;
Level level;
Spieler spieler;
int levelNum = 1;
public  boolean[] keys = new boolean[4]; // left 0, right 1, up 2, space 3
public float rand = 100, verschoben;
public ArrayList obstacles = new ArrayList<Block>();
public ArrayList items = new ArrayList<Item>();
public ArrayList enemies = new ArrayList<Enemy>();

void setup() {
  noSmooth();
  size(1100, 640);
  background(255, 204, 0);
  frameRate(24);
  //minim = new Minim(this);
  //player = minim.loadFile("Sound/Music/Gamemusic.mp3", 2048);
  //player.loop();
  addObstaclesLevel1();
  
  items.add(new Item( (loadImage("Images/Items/Diamond.png")), 300, 600));  

  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_1/Trees_1.png");
  PImage bg = loadImage("Images/Level_1/Hintergrund.png");
  level = new Level(bg, bgs);
  boden = new Image(loadImage("Images/Böden/Boden 1.png"), 0, 0);
  PImage[] playerAnimation = new PImage[6];
  playerAnimation[0] = (loadImage("Images/Bossfight/Boss1/Tod2.png"));
  playerAnimation[1] = (loadImage("Images/Bossfight/Boss1/Tod3.png"));
  playerAnimation[2] = (loadImage("Images/Bossfight/Boss1/Tod4.png"));
  playerAnimation[3] = (loadImage("Images/Bossfight/Boss1/Tod5.png"));
  playerAnimation[4] = (loadImage("Images/Bossfight/Boss1/Tod0.png"));
  playerAnimation[5] = (loadImage("Images/Bossfight/Boss1/Tod1.png"));
  spieler = new Spieler(playerAnimation, 100.0, 100.0);
}

void draw() {
  spieler.update();
  if(spieler.x > 2000 && levelNum == 1)
    loadLevel2();
  move();
  level.display(1280 - verschoben/2, -30);
  boden.display(0, 0);
  for (int i=0; i<obstacles.size(); i++) {
    Block b = (Block)obstacles.get(i);
    b.display();
  }
  
  for (int i=0; i<enemies.size(); i++) {
    Enemy e = (Enemy)enemies.get(i);
    e.update();
    e.display((int)(e.x - verschoben),(int)e.y);
  }

  for (int i=0; i<items.size(); i++) {
    Item o = (Item)items.get(i);
    if(o.dead)
    {
      items.remove(o);
    }
  }
  for (int i=0; i<items.size(); i++) {
    Item o = (Item)items.get(i);
    o.display(verschoben);
  }
  spieler.display((int)(spieler.x - verschoben), (int)spieler.y);
}

void addObstaclesLevel1(){
  PImage[] ememyAnim = new PImage[4];
  ememyAnim[0] = (loadImage("Images/Gegner/Gegner1/enemy_swing_1.png"));
  ememyAnim[1] = (loadImage("Images/Gegner/Gegner1/enemy_swing_2.png"));
  ememyAnim[2] = (loadImage("Images/Gegner/Gegner1/enemy_swing_3.png"));
  ememyAnim[3] = (loadImage("Images/Gegner/Gegner1/enemy_swing_4.png"));
  enemies.add(new StupidEnemy(ememyAnim,200,500,200,400,5,false));
  enemies.add(new SmartEnemy(ememyAnim,400,400,5,10,false));
  obstacles.add(new Block(200, 550));  
  obstacles.add(new Block(400, 430));
}

void addObstaclesLevel2(){
  enemies.clear();
  obstacles.clear();
  PImage[] ememyAnim = new PImage[4];
  ememyAnim[0] = (loadImage("Images/Gegner/Gegner1/enemy_swing_1.png"));
  ememyAnim[1] = (loadImage("Images/Gegner/Gegner1/enemy_swing_2.png"));
  ememyAnim[2] = (loadImage("Images/Gegner/Gegner1/enemy_swing_3.png"));
  ememyAnim[3] = (loadImage("Images/Gegner/Gegner1/enemy_swing_4.png"));
  enemies.add(new StupidEnemy(ememyAnim,200,500,200,400,5,false));
  enemies.add(new SmartEnemy(ememyAnim,400,400,5,10,false));
  obstacles.add(new Block(200, 550));  
  obstacles.add(new Block(400, 430));
}

void loadLevel2(){
  levelNum = 2;
  addObstaclesLevel2();
  
  items.clear();
  items.add(new Item( (loadImage("Images/Items/Diamond.png")), 300, 600));
  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_1/Trees_1.png");
  PImage bg = loadImage("Images/Level_1/Hintergrund.png");
  level = new Level(bg, bgs);
  boden = new Image(loadImage("Images/Böden/Boden 2.png"), 0, 0);
  spieler.x = 0;
}

void move()
{
  if (spieler.x > 1100 + verschoben - rand - spieler.dx)
  {
    if (spieler.x > level.levelbreite - spieler.dx - rand)
    {
      verschoben = level.levelbreite - 1100;
    } else
    {
      verschoben = spieler.x - 1100 + spieler.dx + rand;
    }
  } else if (spieler.x < verschoben + rand)
  {
    if (spieler.x < rand)
    {
      verschoben = 0;
    } else
    {
      verschoben = spieler.x-rand;
    }
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      keys[0] = true;
      spieler.right = false;
    }
    if (keyCode == RIGHT)
    {
      keys[1] = true;
      spieler.right = true;
    }
    if (keyCode == UP)
    {
      keys[2] = true;
    }
  }
  if (key == ' ')
  {
    keys[3] = true;
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      keys[0] = false;
    }
    if (keyCode == RIGHT)
    {
      keys[1] = false;
    }
    if (keyCode == UP)
    {
      keys[2] = false;
    }
  }
  if (key == ' ')
  {
    keys[3] = false;
  }
}