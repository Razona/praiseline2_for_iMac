// Zaseki seki1,seki2,seki3,seki4,seki5,seki6,seki7,seki8,seki9,seki10,seki11,seki12;
// ZasekiLine sekiLine1,sekiline2,sekiline3,sekiline4,sekiline5,sekiline6,sekiline7,sekiline8,sekiline9,sekiline10,sekiline11,sekiline12;
float gamen_hiritu=1;
// float gamen_hiritu=1.5;
//////席の座標
//oneto3は上司席のx軸の間隔,onaziXは同じ列の席間,retukanXは違う列の間。
float oneto3=250*gamen_hiritu;
float onaziX=100*gamen_hiritu,retukanX=150*gamen_hiritu;

//x1-x3は上司席。x4-x9は普通の席。
//x4を基準にonaziXとretukanXを足し算していい感じに。
float x1=550*gamen_hiritu,x2=x1+oneto3,x3=x2+oneto3,x4=500*gamen_hiritu,x5=x4+onaziX,x6=x5+retukanX,x7=x6+onaziX,x8=x7+retukanX,x9=x8+onaziX;


//y1は上司席。y2-y5は一般 y6は削除済み
float retukanY=135*gamen_hiritu;
float y1=150*gamen_hiritu,y2=200*gamen_hiritu,y3=y2+retukanY,y4=y3+retukanY,y5=y4+retukanY;
/////////


boolean taiki=false; //待機画面。一定時間操作がなければ待機画面に。
boolean kidou=true; //起動処理。起動時にカッコイイ演出をしたい。開発時のデフォはtrue。本番はfalse
boolean zaseki_maru_botan=true; //座席の◯を表示するかどうかの判定。ボタンをクリックしたら表示。デフォルトでオフ。
boolean zaseki_hyou_botan=true; //座席表の枠を表示するかどうかの判定。ボタンクリック。デフォでオン。
boolean zaseki_line_triger=false; //線を表示するかの判定。起動時はオフ。なんかいい感じのエフェクトで表示させたいよね。
boolean message=false;//メッセージ画面に遷移するかの判定。
boolean about_us=false;//レイアウト変更に関する判定。未実装。
boolean mainMode=true;//メイン画面のオンオフの判定。デフォルトはオン。
boolean readme=false;//リドミ画面に遷移する判定。機能は実装してるけど、遷移先は空。
boolean popSwitch=false;

int ensyutu_counter=0;
int counter=100;//起動処理の時間を処理するカウンター。
int timer=3000;//待機画面に遷移するかのタイマー。
int toumeido=255;

float switchX = 120 ;
float switchY1 = 460 ;
float switchY2 = 540 ;
float switchY3 = 620 ;

float xx=0;
float yy=0;
String num="a";
String position="a";
String name="a";



void setup(){

  size(1260,720);
  // size(1920,1080);


  // seki1 = new Zaseki(100,100,1);
  // seki2 = new Zaseki(100,200,2);
  // seki3 = new Zaseki(100,300,3);
  // seki4 =new Zaseki(200,100,4);
  // seki5 =new Zaseki(200,200,5);
  // seki6 =new Zaseki(200,300,6);
  // seki7 =new Zaseki(300,100,7);
  // seki8 =new Zaseki(300,200,8);
  // seki9 =new Zaseki(300,300,9);
  // seki10 =new Zaseki(400,100,10);
  // seki11 =new Zaseki(400,200,11);
  // seki12 =new Zaseki(400,300,12);
}

//各種設定->黒背景->起動画面(リターン)->座席表->線->座席->座席情報->メッセージ画像
void draw(){
  frameRate(10);
  stroke(255);

  println(timer);

//   if(0<timer)timer=timer-1;
//   if (timer==0)taiki=true;
//
//   if (taiki==true){
//     taiki();
//     return;
//   }
// //起動処理。タイマーだけ実装。
// //開発中に邪魔なんでコメントアウトにしときます
//   if (kidou==false){
//
//     kidou();
//     return;
//   }

  background(0);

  if(message==true){
    message_mode();
    return;
  }

  if(readme==true){
    readme_page();
    return;
  }

  if (about_us==true){
    about_us_page();
    return;
  }

  if(mainMode==true){
    mainMode();
  }


}

//スイッチ類の描画。
//スイッチの機能実装は後回し。最悪なくて良い。
void switchs(){
  noFill();
  strokeWeight(0.8);
  // rect(100,480,100,50);



  rect(switchX*gamen_hiritu,switchY1*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  rect(switchX*gamen_hiritu,switchY2*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  rect(switchX*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  textSize(16*gamen_hiritu);
  textAlign(CENTER,CENTER);
  fill(255);
  text("readme",switchX*gamen_hiritu,switchY1*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  text("about us",switchX*gamen_hiritu,switchY2*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  text("message",switchX*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);

  //メッセージのSwitch実装。
  if(mousePressed==true&&switchX*gamen_hiritu<mouseX&&mouseX<(switchX+100)*gamen_hiritu&&switchY3*gamen_hiritu<mouseY&&mouseY<(switchY3+50)*gamen_hiritu){
    message=true;
  }

  if(switchX*gamen_hiritu<mouseX&&mouseX<(switchX+100)*gamen_hiritu&&switchY3*gamen_hiritu<mouseY&&mouseY<(switchY3+50)*gamen_hiritu){
    fill(255);
    rect(switchX*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    fill(0);
    text("message",switchX*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    noFill();
  }

  //about_usスイッチの実装。
  if(mousePressed==true&&switchX*gamen_hiritu<mouseX&&mouseX<(switchX+100)*gamen_hiritu&&switchY2*gamen_hiritu<mouseY&&mouseY<(switchY2+50)*gamen_hiritu){
    about_us=true;
  }

  if(switchX*gamen_hiritu<mouseX&&mouseX<(switchX+100)*gamen_hiritu&&switchY2*gamen_hiritu<mouseY&&mouseY<(switchY2+50)*gamen_hiritu){
    fill(255);
    rect(switchX*gamen_hiritu,switchY2*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    fill(0);
    text("about us",switchX*gamen_hiritu,switchY2*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    noFill();
  }

  //りどみページの未実装
  if(mousePressed==true&&switchX*gamen_hiritu<mouseX&&mouseX<(switchX+100)*gamen_hiritu&&switchY1*gamen_hiritu<mouseY&&mouseY<(switchY1+50)*gamen_hiritu){
    readme=true;
  }

  if(switchX*gamen_hiritu<mouseX&&mouseX<(switchX+100)*gamen_hiritu&&switchY1*gamen_hiritu<mouseY&&mouseY<(switchY1+50)*gamen_hiritu){
    fill(255);
    rect(switchX*gamen_hiritu,switchY1*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    fill(0);
    text("readme",switchX*gamen_hiritu,switchY1*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    noFill();
  }
}

//座席表の枠組みを表示する関数。これはもうイラレでやったほうが早くない？とも思う。
void zaseki_hyou(){
  noFill();
  strokeWeight(0.6);
  //line(300,50,300,680);
  rect(400*gamen_hiritu,50*gamen_hiritu,800*gamen_hiritu,630*gamen_hiritu);
}

//座席に◯を描きます。パワーコードです。
void seki_maru(){
    // seki1.display();
    // seki2.display();
    // seki3.display();
    // seki4.display();
    // seki5.display();
    // seki6.display();
    // seki7.display();
    // seki8.display();
    // seki9.display();
    // seki10.display();
    // seki11.display();
    // seki12.display();

    float seki_size=3*gamen_hiritu;

    fill(255);

    noStroke();
    fill(30,180,30);
    ellipse(x1,y1,seki_size,seki_size);
    fill(255);
    stroke(255);
    ellipse(x2,y1,seki_size,seki_size);
    ellipse(x3,y1,seki_size,seki_size);

    ellipse(x4,y2,seki_size,seki_size);
    ellipse(x5,y2,seki_size,seki_size);
    noStroke();
    fill(180,30,30);
    ellipse(x6,y2,seki_size,seki_size);
    fill(255);
    stroke(255);
    ellipse(x7,y2,seki_size,seki_size);
    ellipse(x8,y2,seki_size,seki_size);
    ellipse(x9,y2,seki_size,seki_size);

    ellipse(x4,y3,seki_size,seki_size);
    noStroke();
    fill(180,30,30);
    ellipse(x5,y3,seki_size,seki_size);
    fill(255);
    stroke(255);
    ellipse(x6,y3,seki_size,seki_size);
    ellipse(x7,y3,seki_size,seki_size);
    ellipse(x8,y3,seki_size,seki_size);
    noStroke();
    fill(180,30,30);
    ellipse(x9,y3,seki_size,seki_size);
    fill(255);
    stroke(255);

    //コイツの画面って設定。　円のサイズも大きいし色も赤。
    // fill(180,30,30);
    // stroke(180,30,30);
    ellipse(x4,y4,10*gamen_hiritu,10*gamen_hiritu);

    stroke(255);
    fill(255);
    ellipse(x5,y4,seki_size,seki_size);
    ellipse(x7,y4,seki_size,seki_size);
    ellipse(x6,y4,seki_size,seki_size);
    ellipse(x8,y4,seki_size,seki_size);
    ellipse(x9,y4,seki_size,seki_size);

    noStroke();
    fill(180,30,30);
    ellipse(x4,y5,seki_size,seki_size);
    fill(255);
    stroke(255);
    ellipse(x5,y5,seki_size,seki_size);
    ellipse(x7,y5,seki_size,seki_size);
    ellipse(x6,y5,seki_size,seki_size);
    ellipse(x8,y5,seki_size,seki_size);
    ellipse(x9,y5,seki_size,seki_size);

    // ellipse(x4,y6,seki_size,seki_size);
    // ellipse(x5,y6,seki_size,seki_size);
    // ellipse(x7,y6,seki_size,seki_size);
    // ellipse(x6,y6,seki_size,seki_size);
    // ellipse(x8,y6,seki_size,seki_size);
    // ellipse(x9,y6,seki_size,seki_size);

}



void praiseline_ensyutu(float x_left,float y_left,float x_right,float y_right){

    // for(i=0; i<5; i++){
    //   kaisuu=i;
    //   float ensyutu_x=x_left+((abs(x_right - x_left)/4)*i);
    //   float ensyutu_y=y_left+((abs(y_right - y_left)/4)*i);
    //   ellipse(ensyutu_x,ensyutu_y,10,10);
    //   println(ensyutu_x);
    //   if (i==4)i=0;
    // }
    //


}

void praiseline_ensyutu_list(){
  praiseline_ensyutu(x4,y3,x4,y2);


}

//線の表示を制御する関数。パワーコード予定
void praisline(){
  stroke(255);
  line(x1,y1,x8,y5);
  line(x6,y4,x8,y2);
  line(x5,y5,x4,y3);
  line(x3,y1,x8,y4);
  line(x1,y1,x5,y2);
  line(x1,y1,x9,y2);
  line(x2,y1,x4,y5);
  line(x4,y3,x5,y3);
  line(x4,y3,x7,y3);
  line(x4,y3,x6,y4);
  line(x4,y3,x8,y2);
  line(x4,y3,x4,y2);
  line(x4,y3,x5,y4);
  line(x4,y3,x2,y1);
  line(x5,y3,x5,y3);
  line(x7,y3,x5,y3);
  line(x6,y4,x2,y1);
  line(x7,y4,x6,y3);
  line(x7,y4,x3,y2);
  line(x7,y4,x2,y1);
  line(x7,y4,x8,y3);
  line(x7,y4,x1,y1);
  line(x8,y5,x3,y1);
  line(x8,y5,x2,y1);
  line(x8,y5,x5,y4);
  line(x8,y5,x8,y2);
  line(x8,y5,x4,y3);
  line(x9,y5,x4,y2);
  line(x8,y5,x5,y4);


  //自分が送った線の色。今は仮に赤。
  stroke(180,30,30);
  line(x4,y4,x4,y5);
  line(x4,y4,x9,y3);
  line(x4,y4,x6,y2);
  line(x4,y4,x5,y3);

  //自分宛の線の色。今は仮に緑にしてる。
  stroke(30,180,30);
  line(x4,y4,x1,y1);


  stroke(255);
}

void message_pop(){
  float gosa=20*gamen_hiritu;


  if (mousePressed==true&&mouseX < x9+gosa && x9-gosa < mouseX && mouseY < y3+gosa && y3-gosa < mouseY){
    xx=x9;
    yy=y3;
    num="3";
    position="designer";
    name="Motino Runa";
  }

  if (mousePressed==true&&mouseX < x4+gosa && x4-gosa < mouseX && mouseY < y5+gosa && y5-gosa < mouseY){
    xx=x4;
    yy=y5;
    num="8";
    position="director";
    name="Hino Rinka";
  }

  if (mousePressed==true&&mouseX < x6+gosa && x6-gosa < mouseX && mouseY < y2+gosa && y2-gosa < mouseY){
    xx=x6;
    yy=y2;
    num="5";
    position="designer";
    name="Sakashita Atsuko";
  }

  if (mousePressed==true&&mouseX < x5+gosa && x5-gosa < mouseX && mouseY < y3+gosa && y3-gosa < mouseY){
    xx=x5;
    yy=y3;
    num="6";
    position="director";
    name="Araki Chikako";
  }

  message_pop_hinagata(xx,yy,num,position,name);
}

void message_pop_hinagata(float info_x,float info_y,String num,String position,String name){
  float gosa=20*gamen_hiritu;

  float xmin=info_x-gosa;
  float xmax=info_x+gosa;
  float ymin=info_y-gosa;
  float ymax=info_y+gosa;

  PImage pop_image=loadImage("messageImage"+num+"_large.jpg");

if (gamen_hiritu==1){
    pop_image=loadImage("messageImage"+num+"_midle.jpg");
}


  if (mousePressed==true&&mouseX < xmax && xmin < mouseX && mouseY < ymax && ymin < mouseY){
    popSwitch=true;
  }

  if(popSwitch==true){
    fill(0,200);
    stroke(255*gamen_hiritu,200*gamen_hiritu);
    noStroke();
    rect(460*gamen_hiritu,140*gamen_hiritu,660*gamen_hiritu,510*gamen_hiritu);

    image(pop_image,460*gamen_hiritu,130*gamen_hiritu);
    textSize(40);
    fill(255);
    text(position,460*gamen_hiritu,520*gamen_hiritu,650*gamen_hiritu,80*gamen_hiritu);
    text(name,460*gamen_hiritu,570*gamen_hiritu,650*gamen_hiritu,80*gamen_hiritu);

    fill(50,200);
    stroke(255*gamen_hiritu,200*gamen_hiritu);
    rect(1075*gamen_hiritu,130*gamen_hiritu,40*gamen_hiritu,40*gamen_hiritu);
    line(1075*gamen_hiritu,130*gamen_hiritu,1115*gamen_hiritu,170*gamen_hiritu);
    line(1115*gamen_hiritu,130*gamen_hiritu,1075*gamen_hiritu,170*gamen_hiritu);
    if (mousePressed==true&&mouseX < 1110*gamen_hiritu&& 1070*gamen_hiritu < mouseX && mouseY < 170*gamen_hiritu && 130*gamen_hiritu < mouseY){
      popSwitch=false;
    }

    fill(255);
  }

}

//マウスオーバーで席の情報を表示。氏名と部署名かな。
//その人からのメッセージがある場合はクリックしたらメモを表示
//seki_info_hinagata に情報を送るための関数。パワーコード。
void seki_info(){

  if (popSwitch==false){
    seki_info_hinagata("ceo","Miyashita Rion",x1,y1);
    seki_info_hinagata("cto","Abe Hideaki",x2,y1);
    seki_info_hinagata("cco","Ooishi Morihiro",x3,y1);

    seki_info_hinagata("director","Sugiura Keisuke",x4,y2);
    seki_info_hinagata("director","Uchida Hideo",x5,y2);
    seki_info_hinagata("director","Sakashita Atsuko",x6,y2);
    seki_info_hinagata("director","Inoue Hikaru",x7,y2);
    seki_info_hinagata("catalyst","Koizumi Ginzou",x8,y2);
    seki_info_hinagata("catalyst","Higashiyama Waka",x9,y2);

    seki_info_hinagata("director","Nozaki Rui",x4,y3);
    seki_info_hinagata("director","Araki Chikako",x5,y3);
    seki_info_hinagata("director","Shiomi Yoshirou",x6,y3);
    seki_info_hinagata("director","Yanagihara Kaho",x7,y3);
    seki_info_hinagata("designer","Maruyama Hitomi",x8,y3);
    seki_info_hinagata("designer","Motino Runa",x9,y3);
    seki_info_hinagata_You("You","",x4,y4);
    // seki_info_hinagata("You","Kameyama Kureha",x4,y4);
    seki_info_hinagata("designer","Koga Tomoji",x5,y4);
    seki_info_hinagata("designer","Seo Masako",x6,y4);
    seki_info_hinagata("designer","Murase Tokio",x7,y4);
    seki_info_hinagata("engineer","Shiraishi Yoshinobu",x8,y4);
    seki_info_hinagata("engineer","Mimura Haruna",x9,y4);

    seki_info_hinagata("director","Hino Rinka",x4,y5);
    seki_info_hinagata("designer","Umemura Atsuhiko",x5,y5);
    seki_info_hinagata("designer","Nishi Masayasu",x6,y5);
    seki_info_hinagata("engineer","KawaseT oshie",x7,y5);
    seki_info_hinagata("engineer","Oonishi Tomekichi",x8,y5);
    seki_info_hinagata("engineer","Oka Akihiro",x9,y5);

    // seki_info_hinagata("engineer","Kagawa Atsumori",x4,y6);
    // seki_info_hinagata("engineer","Atsumi Katsuo",x5,y6);
    // seki_info_hinagata("designer","Miyajima Tetsuo",x6,y6);
    // seki_info_hinagata("designer","Yokoyama Kenji",x7,y6);
    // seki_info_hinagata("director","Saegusa Norio",x8,y6);
    // seki_info_hinagata("director","Horie Momoka",x9,y6);
  }


}

void seki_info_hinagata(String katagaki,String name,float info_x,float info_y){
  //マウスオーバーの判定を行うif文章。中身は未実装。
  //マウスオーバーしてたら四角と文章を作る的な。

  float gosa=20*gamen_hiritu;

  float xmin=info_x-gosa;
  float xmax=info_x+gosa;
  float ymin=info_y-gosa;
  float ymax=info_y+gosa;

  if (mouseX < xmax && xmin < mouseX && mouseY < ymax && ymin < mouseY){
    println("いぇえええええ");
    fill(0);
    rect(info_x,info_y,100*gamen_hiritu,50*gamen_hiritu);

    fill(255);
    textAlign(CENTER,TOP);
    text(katagaki,info_x,info_y+5*gamen_hiritu,100*gamen_hiritu,40*gamen_hiritu);
    textAlign(CENTER,BOTTOM);
    textSize(10*gamen_hiritu);
    text(name,info_x,info_y+5*gamen_hiritu,100*gamen_hiritu,40*gamen_hiritu);
    textSize(16*gamen_hiritu);
  }
}

void seki_info_hinagata_You(String katagaki,String name,float info_x,float info_y){
  //マウスオーバーの判定を行うif文章。中身は未実装。
  //マウスオーバーしてたら四角と文章を作る的な。

  float gosa=20*gamen_hiritu;

  float xmin=info_x-gosa;
  float xmax=info_x+gosa;
  float ymin=info_y-gosa;
  float ymax=info_y+gosa;

  if (mouseX < xmax && xmin < mouseX && mouseY < ymax && ymin < mouseY){
    fill(0);
    stroke(255);
    rect(info_x,info_y,100*gamen_hiritu,50*gamen_hiritu);


    fill(255);
    textAlign(CENTER,CENTER);
    text(katagaki,info_x,info_y+5*gamen_hiritu,100*gamen_hiritu,40*gamen_hiritu);
    textSize(16*gamen_hiritu);
    fill(255);
  }
}


//線を表示するかどうかの判定。起動時に映像を表示させたりしたらカッコ良いよね。
//てかそもそも起動画面つくりたいな。
void zaseki_line_triger(){
}


//待機画面の中身。
void taiki(){
  toumeido = toumeido-5;

  rect(0*gamen_hiritu,0*gamen_hiritu,1260*gamen_hiritu,720*gamen_hiritu);
  fill(0,0,0,0);
  // textSize(200);
  // text("praiseline",500,500);

  message=false;

  noFill();

  if (mousePressed==true||keyPressed==true){

    taiki=false;

    kidou=false;
    timer=3000;

    background(0);

  }

}

void kidou(){
  ellipse(100*gamen_hiritu,100*gamen_hiritu,counter,counter);
  counter=counter-10;

  println("counter"+counter);
  if (counter==0)kidou=true;

  fill(255);
  textSize(200*gamen_hiritu);
  text("BOOT",500*gamen_hiritu,200*gamen_hiritu);

}


//マウスを動かすとタイマーがリセット
void mouseMoved(){
  timer=3000;
}

//いろいろなスイッチ類の制御をここで行いたい。
void mousePressed(){
}

//メッセージ閲覧画面。画像がなきゃ始まらない。
void message_mode(){
  noFill();
  rect(100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  textSize(16*gamen_hiritu);
  textAlign(CENTER,CENTER);
  fill(255);
  text("back",100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  noFill();



  if(mousePressed==true&&100*gamen_hiritu<mouseX&&mouseX<200*gamen_hiritu&&switchY3*gamen_hiritu<mouseY&&mouseY<(switchY3+50)*gamen_hiritu){
    message=false;
  }

  if(100*gamen_hiritu<mouseX&&mouseX<200*gamen_hiritu&&switchY3*gamen_hiritu<mouseY&&mouseY<(switchY3+50)*gamen_hiritu){
    fill(255);
    rect(100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    fill(0);
    text("back",100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    noFill();
  }

  message_image_prv();
}

void message_image_prv(){


  PImage messageImage0 = loadImage("messageImage0.jpg");
  PImage messageImage1_prv = loadImage("messageImage1_prv.jpg");
  PImage messageImage2_prv = loadImage("messageImage2_prv.jpg");
  PImage messageImage3_prv = loadImage("messageImage3_prv.jpg");
  PImage messageImage4_prv = loadImage("messageImage4_prv.jpg");
  PImage messageImage5_prv = loadImage("messageImage5_prv.jpg");
  PImage messageImage6_prv = loadImage("messageImage6_prv.jpg");
  PImage messageImage7_prv = loadImage("messageImage7_prv.jpg");
  PImage messageImage8_prv = loadImage("messageImage8_prv.jpg");
  PImage messageImage9_prv = loadImage("messageImage9_prv.jpg");
  PImage messageImage10_prv = loadImage("messageImage10_prv.jpg");
  PImage messageImage11_prv = loadImage("messageImage11_prv.jpg");
  PImage messageImage12_prv = loadImage("messageImage12_prv.jpg");

  float prv_x_margin=270;
  float prv_y_margin =200;
  float prv_x1=300,prv_x2=prv_x1+prv_x_margin,prv_x3=prv_x2+prv_x_margin;
  float prv_y1=100,prv_y2=prv_y1+prv_y_margin,prv_y3=prv_y2+prv_y_margin;

  image(messageImage1_prv,prv_x1*gamen_hiritu,prv_y1*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
  image(messageImage2_prv,prv_x2*gamen_hiritu,prv_y1*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
  image(messageImage3_prv,prv_x3*gamen_hiritu,prv_y1*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
  image(messageImage4_prv,prv_x1*gamen_hiritu,prv_y2*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
  image(messageImage5_prv,prv_x2*gamen_hiritu,prv_y2*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
  image(messageImage6_prv,prv_x3*gamen_hiritu,prv_y2*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
  image(messageImage7_prv,prv_x1*gamen_hiritu,prv_y3*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
  image(messageImage8_prv,prv_x2*gamen_hiritu,prv_y3*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
  image(messageImage9_prv,prv_x3*gamen_hiritu,prv_y3*gamen_hiritu,182*gamen_hiritu,110*gamen_hiritu);
}

void logo(){
  PImage logo=loadImage("logo.png");

  image(logo,40*gamen_hiritu,70*gamen_hiritu,253*1.3*gamen_hiritu,201*1.3*gamen_hiritu);
}

void mainMode(){
  //左下にスイッチを表示する。


    logo();

    switchs();

    //オフィスのレイアウトを表示。
    if (zaseki_hyou_botan ==true){
      zaseki_hyou();
    }


    //線を表示。
    praisline();


    //座席に合わせて円を表示。基本はオフにするか迷う。
    if(zaseki_maru_botan==true){
      seki_maru();
    }

    //線に沿って光の玉が動く。
    praiseline_ensyutu_list();




    seki_info();

    message_pop();
}

void readme_page(){

  //全体の枠
  noFill();
  // rect(360*gamen_hiritu,50*gamen_hiritu,700*gamen_hiritu,620*gamen_hiritu);

  PImage how_to = loadImage("PraislineHow.jpg");
  image(how_to,360*gamen_hiritu,50*gamen_hiritu,700*gamen_hiritu,620*gamen_hiritu);

  //タイトル
  // rect(360*gamen_hiritu,50*gamen_hiritu,700*gamen_hiritu,100*gamen_hiritu);
  // textSize(50);
  // text("How to use",360*gamen_hiritu,50*gamen_hiritu,700*gamen_hiritu,100*gamen_hiritu);
  //

  //backボタン関係
  noFill();
  rect(100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  textSize(16*gamen_hiritu);
  textAlign(CENTER,CENTER);
  fill(255);
  text("back",100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  noFill();



  if(mousePressed==true&&100*gamen_hiritu<mouseX&&mouseX<200*gamen_hiritu&&switchY3*gamen_hiritu<mouseY&&mouseY<(switchY3+50)*gamen_hiritu){
    readme=false;
  }

  if(100*gamen_hiritu<mouseX&&mouseX<200*gamen_hiritu&&switchY3*gamen_hiritu<mouseY&&mouseY<(switchY3+50)*gamen_hiritu){
    fill(255);
    rect(100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    fill(0);
    text("back",100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    noFill();
  }


}


//about usなページの実装。パンフのイラレデータから引っ張ります。
void about_us_page(){

  PImage about_image=loadImage("about_us.png");
  if (gamen_hiritu==1.5)about_image=loadImage("about_us_large.png");

  image(about_image,500*gamen_hiritu,75*gamen_hiritu);

  //backボタンの実装。
  noFill();
  rect(100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  textSize(16*gamen_hiritu);
  textAlign(CENTER,CENTER);
  fill(255);
  text("back",100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
  noFill();



  if(mousePressed==true&&100*gamen_hiritu<mouseX&&mouseX<200*gamen_hiritu&&switchY3*gamen_hiritu<mouseY&&mouseY<(switchY3+50)*gamen_hiritu){
    about_us=false;
  }

  if(100*gamen_hiritu<mouseX&&mouseX<200*gamen_hiritu&&switchY3*gamen_hiritu<mouseY&&mouseY<(switchY3+50)*gamen_hiritu){
    fill(255);
    rect(100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    fill(0);
    text("back",100*gamen_hiritu,switchY3*gamen_hiritu,100*gamen_hiritu,50*gamen_hiritu);
    noFill();
  }
}
//下2つのクラスは削除予定
//座席の持ち主の情報を管理するクラス。でもこれいらないかも？
// class Zaseki{
//   float ZasekiX,ZasekiY;
//   int ZasekiID;
//   String ZasekiName;
//
//   Zaseki(float x,float y,int id){
//     ZasekiX=x;
//     ZasekiY=y;
//     ZasekiID=id;
//   }
//
//
//   void display(){
//     ellipse(ZasekiX,ZasekiY,30,30);
//   }
// }

//線の表示を制御するクラスにしたい。 現在力技でコードを書いてる節がある。
// class ZasekiLine{
//   float ZasekiX1,ZasekiY1,ZasekiX2,ZasekiY2;
//   int ZasekiID;
//   ZasekiLine(float x1,float y1,float x2,float y2,int id){
//     ZasekiX1=x1;
//     ZasekiX2=x2;
//     ZasekiY1=y1;
//     ZasekiY2=y2;
//     ZasekiID=id;
//   }
//   void display(){
//     line(ZasekiX1,ZasekiY1,ZasekiX2,ZasekiY2);
//   }
// }
