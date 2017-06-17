import ddf.minim.*;
AudioPlayer player;
Minim minim;
Image boden;
Level level;
Spieler spieler;
public  boolean[] keys = new boolean[4]; // left 0, right 1, up 2, space 3
public float rand = 100, verschoben;
public ArrayList obstacles = new ArrayList<Block>();
public ArrayList enemies = new ArrayList<Enemy>();

void setup() {
  noSmooth();
  size(1100, 640);
  background(255, 204, 0);
  frameRate(24);
  minim = new Minim(this);
  player = minim.loadFile("Sound/Music/Gamemusic.mp3", 2048);
  //player.loop();
  
  obstacles.add(new Block(200, 500));  

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
  playerAnimation[4] = (loadImage("Images/Bossfight/Boss1/Tod1.png"));
  playerAnimation[5] = (loadImage("Images/Bossfight/Boss1/Tod1.png"));
  spieler = new Spieler(playerAnimation, 100.0, 100.0);
}

void draw() {
   
  spieler.update();
  move();
  level.display(1280 - verschoben/2, -30);
  boden.display(0, 0);

  for (int i=0; i<obstacles.size(); i++) {
    Block b = (Block)obstacles.get(i);
    b.display();
  }
  spieler.display((int)(spieler.x - verschoben), (int)spieler.y);
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