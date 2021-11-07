int RAY = 100;
int WIDTH = 800;
int HEIGHT = 700; //定义

String[] s_texte = {"optimism", "incarnation", "Love", "work ethic", "Pursuit", "atmosphere", "Rivalry", "Discovery", "Underdog", "Maturation", "spontaneous", "Escape", "Transformation", "submerge", "Temptation", "The Riddle", "Revenge", }; //需要输入想要文本（单词）,我此处填写的，部分是自己生词本上的词

PVector[] pos_texte = new PVector[s_texte.length];
PVector vect_rot;
PVector pos_cam;
PFont font;
color[] c_texte = new color[s_texte.length];
color backg = color(200, 200, 250, 255);

void initialise() {
  for (int i = 0; i < s_texte.length; i++) {
    float alp_t = random(0, TWO_PI);
    float bet_t = random(0, TWO_PI);

    float x_t = RAY * (-cos(alp_t)) * sin(bet_t);
    float z_t = RAY * sin(alp_t) * sin(bet_t);
    float y_t = RAY * cos(bet_t);

    pos_texte[i] = new PVector(x_t, y_t, z_t);
    c_texte[i] = color(255, 255, 255);
  }

  vect_rot = new PVector(0, 0, 0);
}

float dt = 1;

void rafraichis_texte() {
  float dplcmt_x = map(mouseY, 0, WIDTH, 0.05, -0.05);
  float dplcmt_y = map(mouseX, 0, HEIGHT, -0.05, 0.05);

  if (sq(dplcmt_x) < sq(0.01)) {
    dplcmt_x = 0;
  }
  if (sq(dplcmt_y) < sq(0.01)) {
    dplcmt_y = 0;
  }

  vect_rot = new PVector(dplcmt_x, dplcmt_y, 0);

  for (int i = 0; i < s_texte.length; i++) {
    PVector vit_i = new PVector(pos_texte[i].z * vect_rot.y - pos_texte[i].y * vect_rot.z, pos_texte[i].x * vect_rot.z - pos_texte[i].z * vect_rot.x, pos_texte[i].y * vect_rot.x - pos_texte[i].x * vect_rot.y);
    pos_texte[i] = PVector.add(pos_texte[i], PVector.mult(vit_i, dt));
    pos_texte[i].mult(RAY/pos_texte[i].mag());
  }
}

void affiche_texte() {
  for (int i = 0; i < s_texte.length; i++) {
    fill(c_texte[i]);
    translate(pos_texte[i].x, pos_texte[i].y, pos_texte[i].z);
    text(s_texte[i], 0, 0, 0);
    translate(-pos_texte[i].x, -pos_texte[i].y, -pos_texte[i].z);
  }
}

void initialise_camera() {
  pos_cam = new PVector(0, 0, 3*RAY);
}
void rafraichis_camera() {
  background(backg);
  camera(pos_cam.x, pos_cam.y, pos_cam.z, 00, 00, 00, 00, 01, 00);
}

void setup() {
  size (400, 400, P3D);
  background(backg);
  smooth();
  initialise();
  initialise_camera();
}

void draw() {
  rafraichis_camera();
  rafraichis_texte();
  affiche_texte();
}
