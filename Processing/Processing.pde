//import ddf.minim.*;
//AudioPlayer player;
//Minim minim;
Image boden;
Image startScreen;
Image gameOver, blitzLinks, blitzMitte, blitzRechts;
Level level;
Spieler spieler;
int levelNum = 1, pausetime = 0;
boolean hasStarted = true;
boolean hasStoped = false;
boolean paused =false, boss = false;
public  boolean[] keys = new boolean[4]; // left 0, right 1, up 2, space 3
public float rand = 100, verschoben, playerx, playery;
public ArrayList obstacles = new ArrayList<Block>();
public ArrayList items = new ArrayList<Item>();
public ArrayList enemies = new ArrayList<Enemy>();
public ArrayList bullets = new ArrayList<Bullet>();

void setup() {
  noSmooth();
  //size(1650, 960);
  //size(1100, 640);
  size(825, 480);
  pixelDensity(1);
  startScreen = new Image(loadImage("Images/Screens/Startscreen.png"), 0, 0);
  gameOver = new Image(loadImage("Images/Screens/Game Over Screen.png"), 0, 0);
  frameRate(24);
  //minim = new Minim(this);
  //player = minim.loadFile("Sound/Music/Gamemusic.mp3", 2048);
  //player.loop();

  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_1/Trees_1.png");
  PImage bg = loadImage("Images/Level_1/Hintergrund.png");
  level = new Level(bg, bgs);
  boden = new Image(loadImage("Images/Böden/Boden 1.png"), 0, 0);
  PImage[] playerAnimation = new PImage[6];
  addObstaclesLevel1();
  playerAnimation[0] = (loadImage("Images/Bossfight/Boss1/Tod2.png"));
  playerAnimation[1] = (loadImage("Images/Bossfight/Boss1/Tod3.png"));
  playerAnimation[2] = (loadImage("Images/Bossfight/Boss1/Tod4.png"));
  playerAnimation[3] = (loadImage("Images/Bossfight/Boss1/Tod5.png"));
  playerAnimation[4] = (loadImage("Images/Bossfight/Boss1/Tod0.png"));
  playerAnimation[5] = (loadImage("Images/Bossfight/Boss1/Tod1.png"));
  spieler = new Spieler(playerAnimation, 0, 100.0);
  //loadLevel2();
  //spieler.x = 500;
  blitzLinks =  new Image(loadImage("Images/Background_environment/BlitzLinks.png"), 0, 0);
  blitzMitte =  new Image(loadImage("Images/Background_environment/BlitzMitte.png"), 0, 0);
  blitzRechts =  new Image(loadImage("Images/Background_environment/BlitzRechts.png"), 0, 0);
}

void draw() {
  scale(0.75);
  if (hasStarted && !paused) {
    spieler.update();
    if (spieler.x > 2000) {
      if (levelNum == 1)
        loadLevel2();
      else if (levelNum == 2)
        loadLevel3();
      else if (levelNum == 3)
        loadLevelBF();
    }
    if(spieler.x > 1800 && levelNum == 4 && !boss)
    {
     paused = true; 
    }
    move();
    level.display(1280 - verschoben/2, -30);
    boden.display(0, 0);
    for (int i=0; i<obstacles.size(); i++) {
      Block b = (Block)obstacles.get(i);
      b.display();
    }

    spieler.update();
    if (spieler.x > 2000 && levelNum == 1)
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
      if (e.dead)
      {
        enemies.remove(e);
      }
    }

    for (int i=0; i<enemies.size(); i++) {
      Enemy e = (Enemy)enemies.get(i);
      e.update();
      e.display((int)(e.x - verschoben), (int)e.y);
    }
    for (int i=0; i<bullets.size(); i++) {
      Bullet b = (Bullet)bullets.get(i);
      b.update();
      b.display((int)(b.x - verschoben), (int)b.y);
    }
    for (int i=0; i<bullets.size(); i++) {
      Bullet b = (Bullet)bullets.get(i);
      if (b.dead)
      {
        bullets.remove(b);
      }
    }
    for (int i=0; i<items.size(); i++) {
      Item o = (Item)items.get(i);
      if (o.dead)
      {
        items.remove(o);
      }
    }
    for (int i=0; i<items.size(); i++) {
      Item o = (Item)items.get(i);
      o.display(verschoben);
    }
    spieler.display((int)(spieler.x - verschoben), (int)spieler.y);
   
  } else if (!hasStarted)
  {
    startScreen.display(0, 0);
  } else if (paused)
  {
    if (pausetime == 0)
    {
      pausetime = millis(); 
      enemies.clear();
      playerx = spieler.x;
      playery = spieler.y;
    }
    move();
    level.display(1280 - verschoben/2, -30);
    boden.display(0, 0);
    spieler.display((int)playerx, (int)playery);
    if (millis()-pausetime > 1000 && millis()-pausetime < 1200)
    {
      blitzMitte.display(0, 0);
    } else if (millis()-pausetime > 1500 && millis()-pausetime < 1700)
    {
      blitzRechts.display(0, 0);
    } else if (millis()-pausetime > 2100 && millis()-pausetime <= 2500)
    {
      blitzLinks.display(0, 0);
    } else if (millis()-pausetime > 2500)
    {
      boss = true;
      paused = false;
    }
    spieler.x = playerx;
    spieler.y = playery;
  }
  if (spieler.hasDied)
    gameOver.display(0, 0);
}

void startOver() {
  levelNum = 1;
  obstacles = new ArrayList<Block>();
  items = new ArrayList<Item>();
  enemies = new ArrayList<Enemy>();
  hasStoped = false;
  hasStarted = true;
  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_1/Trees_1.png");
  PImage bg = loadImage("Images/Level_1/Hintergrund.png");
  level = new Level(bg, bgs);
  boden = new Image(loadImage("Images/Böden/Boden 1.png"), 0, 0);
  PImage[] playerAnimation = new PImage[6];
  addObstaclesLevel1();
  playerAnimation[0] = (loadImage("Images/Bossfight/Boss1/Tod2.png"));
  playerAnimation[1] = (loadImage("Images/Bossfight/Boss1/Tod3.png"));
  playerAnimation[2] = (loadImage("Images/Bossfight/Boss1/Tod4.png"));
  playerAnimation[3] = (loadImage("Images/Bossfight/Boss1/Tod5.png"));
  playerAnimation[4] = (loadImage("Images/Bossfight/Boss1/Tod0.png"));
  playerAnimation[5] = (loadImage("Images/Bossfight/Boss1/Tod1.png"));
  spieler = new Spieler(playerAnimation, 0, 100.0);
}

void addObstaclesLevel1() {
  PImage[] ememyAnim = new PImage[4];
  ememyAnim[0] = (loadImage("Images/Gegner/Gegner1/enemy_swing_1.png"));
  ememyAnim[1] = (loadImage("Images/Gegner/Gegner1/enemy_swing_2.png"));
  ememyAnim[2] = (loadImage("Images/Gegner/Gegner1/enemy_swing_3.png"));
  ememyAnim[3] = (loadImage("Images/Gegner/Gegner1/enemy_swing_4.png"));
  PImage[] vowelAnim = new PImage[2];
  vowelAnim[0] = (loadImage("Images/Gegner/Gegner3/bird_1.png"));
  vowelAnim[1] = (loadImage("Images/Gegner/Gegner3/bird_2.png"));  
  for (int i = 0; i < 3; i++)
  {
    items.add(new Item( (loadImage("Images/Items/Diamond.png")), 400 + 20 * i, 500, 1));
    items.add(new Item( (loadImage("Images/Items/Coin.png")), 300 + 20 * i, 600, 0));
    items.add(new Item( (loadImage("Images/Items/Coin.png")), 700 + 20 * i, 600, 0));
  }
  items.add(new Item( (loadImage("Images/Items/Speed.png")), 800, 600, 6));

  for (int i=50; i<200; i += 16)
    obstacles.add(new Block(i, 650-i));
  for (int i=194; i<300; i += 16)
    obstacles.add(new Block(i, 650-194));
  for (int i=304; i<450; i += 16)
    obstacles.add(new Block(i, i+152));
  enemies.add(new StupidEnemy(ememyAnim, 460, 600, 460, 600, false));

  enemies.add(new Fowel(vowelAnim, 400, 200, 0, 1000, 10, 12));
  enemies.add(new Fowel(vowelAnim, 400, 100, 100, 1100, 10, 17));


  obstacles.add(new Block(1400, 500));
  obstacles.add(new Block(1500, 400));
  obstacles.add(new Block(1600, 400));
  obstacles.add(new Block(1700, 400));


  /*enemies.add(new StupidEnemy(ememyAnim, 200, 500, 200, 400, false));
   enemies.add(new SmartEnemy(ememyAnim, 400, 400, 10, false));
   enemies.add(new Fowel(vowelAnim, 400, 200, 0, 1000, 10, 12));
   enemies.add(new Fowel(vowelAnim, 400, 100, 100, 1100, 10, 17));
   enemies.add(new StupidEnemy(ememyAnim, 200+random(100), 500, 200, 400, false));
   enemies.add(new SmartEnemy(ememyAnim, 400+random(100), 400, 10, false));
   obstacles.add(new Block(200, 550));  
   
   
   items.add(new Item( (loadImage("Images/Items/key.png")), 600, 600, 4));  
   items.add(new Item( (loadImage("Images/Items/heart.png")), 400, 600, 3));  
   items.add(new Item( (loadImage("Images/Items/Shield.png")), 500, 600, 5)); 
   obstacles.add(new Block(400, 430));*/
}

void addObstaclesLevel2() {
  enemies.clear();
  obstacles.clear();
  PImage[] ememyAnim = new PImage[4];
  ememyAnim[0] = (loadImage("Images/Gegner/Gegner1/enemy_swing_1.png"));
  ememyAnim[1] = (loadImage("Images/Gegner/Gegner1/enemy_swing_2.png"));
  ememyAnim[2] = (loadImage("Images/Gegner/Gegner1/enemy_swing_3.png"));
  ememyAnim[3] = (loadImage("Images/Gegner/Gegner1/enemy_swing_4.png"));
  float a = 1.9;
  obstacles.add(new Block(42*a, 550));  
  obstacles.add(new Block(70*a, 450));

  for (int i=100; i<165; i += 8)
    obstacles.add(new Block(i*a, 350));
  enemies.add(new StupidEnemy(ememyAnim, 100*a, 300, 100*a, 164*a, 5, false));
  enemies.add(new StupidEnemy(ememyAnim, 100*a, 500, 100*a, 150*a, 6, false));

  for (int i=350; i<600; i += 16)
    obstacles.add(new Block(170*a, i));
  enemies.add(new SmartEnemy(ememyAnim, 400*a, 550, 10, false));

  for (int i=100; i<450; i += 16)
    obstacles.add(new Block(271*a, i));
  for (int i=500; i<600; i += 16)
    obstacles.add(new Block(271*a, i));

  obstacles.add(new Block(403*a, 500));
  obstacles.add(new Block(450*a, 400));
  obstacles.add(new Block(500*a, 300));

  obstacles.add(new Block(503*a, 500));
  obstacles.add(new Block(550*a, 400));
  obstacles.add(new Block(600*a, 300));

  for (int i=(int)(600*a); i<(int)(700*a); i += 16)
    obstacles.add(new Block(i, i-700));

  obstacles.add(new Block(703*a, 500));
  obstacles.add(new Block(750*a, 400));
  obstacles.add(new Block(766*a, 400));
  obstacles.add(new Block(782*a, 400));

  obstacles.add(new Block(800*a, 600));
  obstacles.add(new Block(850*a, 600));
  obstacles.add(new Block(900*a, 600));
  obstacles.add(new Block(950*a, 600));
  obstacles.add(new Block(1000*a, 600));
  obstacles.add(new Block(1050*a, 600));
}

void addObstaclesLevel3() {
  enemies.clear();
  obstacles.clear();
  PImage[] ememyAnim = new PImage[4];
  ememyAnim[0] = (loadImage("Images/Gegner/Gegner1/enemy_swing_1.png"));
  ememyAnim[1] = (loadImage("Images/Gegner/Gegner1/enemy_swing_2.png"));
  ememyAnim[2] = (loadImage("Images/Gegner/Gegner1/enemy_swing_3.png"));
  ememyAnim[3] = (loadImage("Images/Gegner/Gegner1/enemy_swing_4.png"));
  enemies.add(new StupidEnemy(ememyAnim, 200, 500, 200, 400, 5, false));
  enemies.add(new SmartEnemy(ememyAnim, 400, 400, 5, 10, false));
  obstacles.add(new Block(200, 550));  
  obstacles.add(new Block(400, 430));
}

void addObstaclesBF() {
  enemies.clear();
  obstacles.clear();
  PImage[] ememyAnim = new PImage[4];
  ememyAnim[0] = (loadImage("Images/Gegner/Gegner1/enemy_swing_1.png"));
  ememyAnim[1] = (loadImage("Images/Gegner/Gegner1/enemy_swing_2.png"));
  ememyAnim[2] = (loadImage("Images/Gegner/Gegner1/enemy_swing_3.png"));
  ememyAnim[3] = (loadImage("Images/Gegner/Gegner1/enemy_swing_4.png"));
  PImage[] vowelAnim = new PImage[2];
  vowelAnim[0] = (loadImage("Images/Gegner/Gegner3/bird_1.png"));
  vowelAnim[1] = (loadImage("Images/Gegner/Gegner3/bird_2.png"));
  for (int i=0; i<10; i++) {
    enemies.add(new Fowel(vowelAnim, 0+random(2000), 20+random(50), 0, 2000, 10, 12+(int)random(5)));
    enemies.add(new Fowel(vowelAnim, 0+random(2000), 70+random(50), 0, 2000, 10, 17+(int)random(5)));
  }
  for (int i=0; i<50; i++) {
    enemies.add(new StupidEnemy(ememyAnim, 200+random(1000), 500, 200, 400, false));
    enemies.add(new SmartEnemy(ememyAnim, 400+random(1000), 400, 10, false));
    obstacles.add(new Block(200, 550));  
    obstacles.add(new Block(400, 430));
  }
}

void loadLevelBF() {
  levelNum = 4;
  addObstaclesBF();

  items.clear();
  items.add(new Item( (loadImage("Images/Items/Diamond.png")), 100, 600, 1));
  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_2/Trees_2.png");
  PImage bg = loadImage("Images/Level_2/BG lvl 2.png");
  level = new Level(bg, bgs);
  boden = new Image(loadImage("Images/Böden/Boden 3.png"), 0, 0);
  spieler.x = 0;
}
void loadLevel3() {
  levelNum = 3;
  addObstaclesLevel3();

  items.clear();
  items.add(new Item( (loadImage("Images/Items/Diamond.png")), 100, 600, 1));
  PImage[] bgs = new PImage[1];
  bgs[0] = loadImage("Images/Level_2/Trees_2.png");
  PImage bg = loadImage("Images/Level_2/BG lvl 2.png");
  level = new Level(bg, bgs);
  boden = new Image(loadImage("Images/Böden/Boden 3.png"), 0, 0);
  spieler.x = 0;
}

void loadLevel2() {
  levelNum = 2;
  addObstaclesLevel2();

  items.clear();
  items.add(new Item( (loadImage("Images/Items/Diamond.png")), 100, 600, 1));
  items.add(new Item( (loadImage("Images/Items/food.png")), 300, 600, 2));  
  items.add(new Item( (loadImage("Images/Items/food.png")), 400, 600, 2));  
  items.add(new Item( (loadImage("Images/Items/food.png")), 500, 600, 2));  

  PImage[] bgs = new PImage[2];
  bgs[0] = loadImage("Images/Level_2/Trees_2.png");
  bgs[1] = loadImage("Images/Level_2/Nebel.png");
  PImage bg = loadImage("Images/Level_2/BG lvl 2.png");
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
  hasStarted = true;
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
  if (key == 'x')
  {
    if (spieler.eggs > 0)
    {
      PImage[] bulletAnim = new PImage[2];
      bulletAnim[0] =  (loadImage("Images/Items/Spiegelei1.png"));    
      bulletAnim[1] =  (loadImage("Images/Items/Spiegelei2.png"));
      bullets.add(new Bullet(bulletAnim, spieler.x + (spieler.dx / 2), spieler.y + (spieler.dy / 2), mouseX, mouseY));
      spieler.eggs--;
    }
  }
}

void keyReleased()
{
  if (spieler.hasDied)
    startOver();
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

void mouseClicked() {
  hasStarted = true;
}