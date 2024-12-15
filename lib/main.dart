import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自傳app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("maou_bgm_acoustic13.mp3"));
    return Scaffold(
      appBar: AppBar(
        title: Text('C111151116 梁哲華的自傳'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "GenSekiGothic2-R",),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[600]!,
        selectedItemColor: Colors.white,
        selectedFontSize: 20,
        unselectedItemColor: Colors.black45,
        unselectedFontSize: 15,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: currentIndex==0?Icon(Icons.home,size: 40,):Icon(Icons.home,size: 30,), label: '自我介紹',),
          BottomNavigationBarItem(icon: currentIndex==1?Icon(Icons.school,size: 40,):Icon(Icons.school,size: 30,), label: '學習歷程',),
          BottomNavigationBarItem(icon: currentIndex==2?Icon(Icons.schedule,size: 40,):Icon(Icons.schedule,size: 30,), label: '學習計畫',),
          BottomNavigationBarItem(icon: currentIndex==3?Icon(Icons.engineering,size: 40,):Icon(Icons.engineering,size: 30,), label: '專業方向',),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
            if (index==0) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("maou_bgm_acoustic13.mp3"));
            }
            if (index==1) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("maou_bgm_acoustic18.mp3"));
            }
            if (index==2) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("maou_bgm_acoustic49.mp3"));
            }
            if (index==3) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("maou_bgm_acoustic50.mp3"));
            }
          });
        },
      ),

    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1='我的名字叫梁哲華，2004年出生於高雄市，從高雄高工資訊科畢業後就進入高雄科技大學資訊工程系。'
      '父親的工作是63碼頭管制站專責人員，母親則是操持家務，家庭經濟小康，氣氛和樂。'
      '從小父母親對我的選擇都非常尊重也給予支持，並給我意見參考，'
      '他們常對我說要「愛你所擇，擇你所愛」，父母的關懷是我前進的動力，也讓我知道要對自己所做的每一個選擇負起責任，才算是一個成熟的人。';
  String s2='個人特質\n我認為自己是個認真努力的人，在學習方面，遇到不會的問題，我會自己思考答案或問老師、同學，在解決問題前不輕易放棄，'
      '在團隊中，雖然我的領導能力不夠好，但指派的任務我會認真的完成，討論中也適時的提出想法期望解決問題，為團隊做出努力。'
      '這樣的特質使我在高職的學習之路很順利，相信大學四年也可以保持下去，繼續在資訊領域中探索。\n'
      '我的興趣是閱讀書籍，閱讀不僅使我的身心靈放鬆，也能從書籍中獲得許多像是知識、人生道理等的事物，我喜歡有關科學的書，特別是雜誌和期刊，因為能獲得與現在時事有關的科學知識。\n'
      '另外在程式設計方面，先前我已認識了不少程式語言，例如C++、C#、Python等，但還是有些語法不太會使用，我覺得要學一項技能或科目就要學到最好，'
      '希望在大學時，能更加精熟之前所學到的程式語言，並提升程式設計能力。';
  String s3='未來展望\n期許自己在大學生活中，可以學習更多程式語言，增強程式設計能力，並考取相關的證照，往更深更廣的資訊領域前進。'
      '在出社會後，為國家貢獻微薄的心力。';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg3.jpg"),fit: BoxFit.cover,)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //放標題
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Text('關於自己', style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "GenSekiGothic2-H",
                        ),
                ),
              ),
              SizedBox(height: 15,),
              //自傳部分
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width:10),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amberAccent,
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      blurStyle: BlurStyle.solid,
                    ),
                  ],
                ),
                child: Text('家庭背景', style: TextStyle(fontSize: 30, fontFamily: "GenSekiGothic2-R",),),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.teal[900]!, width:15,),
                    bottom: BorderSide(color: Colors.teal[900]!, width:15,),
                    left: BorderSide(color: Colors.teal, width:10,),
                    right: BorderSide(color: Colors.teal, width:10,),
                  ),
                  //borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.white70, offset: Offset(0, 0)),
                  ],
                ),
                child: Text(s1, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width:10),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.amberAccent,
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        blurStyle: BlurStyle.solid,
                    ),
                  ],
                ),
                child: Text('個人特質', style: TextStyle(fontSize: 30, fontFamily: "GenSekiGothic2-R",),),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.teal[900]!, width:15,),
                    bottom: BorderSide(color: Colors.teal[900]!, width:15,),
                    left: BorderSide(color: Colors.teal, width:10,),
                    right: BorderSide(color: Colors.teal, width:10,),
                  ),
                  //borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.white70, offset: Offset(0,0),),
                  ],
                ),
                child: Text(s2, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber, width:10),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amberAccent,
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      blurStyle: BlurStyle.solid,
                    ),
                  ],
                ),
                child: Text('未來展望', style: TextStyle(fontSize: 30, fontFamily: "GenSekiGothic2-R",),),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.teal[900]!, width:15,),
                    bottom: BorderSide(color: Colors.teal[900]!, width:15,),
                    left: BorderSide(color: Colors.teal, width:10,),
                    right: BorderSide(color: Colors.teal, width:10,),
                  ),
                  //borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.white70, offset: Offset(0,0),),
                  ],
                ),
                child: Text(s3, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      )
    );
  }
}

class Screen2 extends StatelessWidget {

  String s1='我現在已經是大學3年級了，從入學到現在學了不少專業知識，也學了不少程式語言，如C語言、JAVA、Python等，也了解到大學是一個自由的環境，'
      '不像之前國中、高中會有老師督促你完成作業，在大學沒有什麼人會管你的課業或成績，你要整天都在玩也沒有人限制你，可能大家的想法都不同，有的人只要能及格通過就好，成績不怎麼要求，'
      '但我覺得還是要認真顧一下課業較好，代表你有投入心力在這堂課上面，所以我會要求自己的成績要80或90以上，因為如此我的學期總成績都有90幾分，到目前為止每個學期的總成績我都保持在前三名，'
      '也因為這樣我都有拿到成績優異獎學金和校外的獎學金，我覺得能拿到獎學金，除了實際的錢以外，更像是對自己在課業上所做的努力的一種認可。';
  String s2='課業之外，我也有參與社團，在大一時參加了一個叫做音樂遊戲社的社團，我參加的時候，其實這個社團還不算正式社團，'
      '因為才剛創社不久，當初加入的契機是在網路上看到這個社團的招募資訊，而我剛好有在玩音樂遊戲，於是就加入了，但是社團的上課位置在別的校區，'
      '因為交通和時間問題，我沒辦法參加社課，只能在線上群組和其他人交流，遺憾的是這個社團在我大二下學期時因找不到社團幹部就解散了，不過群組還有保留下來，所以社團成員還是可以透過群組來交流。';
  String s3='另外我在大一上時就有參加多益輔導課程，持續到大二下學期，也從初階班上到進階班，從一開始不了解多益題目，到後來能夠對各類題目有一定的理解，認識的單字量也有所增加，'
      '在大二下學期的暑假時，我決定去參加一次多益考試，之前沒有報考是因為怕自己準備不足，在我上了4個學期的輔導課程後，我想我應該嘗試看看去考多益，'
      '而最後我也取得720分的成績，我感到很開心，因為這表示我所做的努力並非白費的。';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg2.jpg"),
              fit: BoxFit.cover,
          )
          ,
        ),
        child: SingleChildScrollView(
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Text('學習歷程', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GenSekiGothic2-H",
                  ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width:3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.white70, offset: Offset(0, 0),blurStyle: BlurStyle.outer,),
                    ],
                  ),
                  child: Text(s1, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.brown[800]!, width:5,),
                                    bottom: BorderSide(color: Colors.brown[800]!, width:5,),
                                    left: BorderSide(color: Colors.brown[600]!, width:5,),
                                    right: BorderSide(color: Colors.brown[600]!, width:5,),
                                  ),
                                  image: DecorationImage(image: AssetImage("assets/p1.jpg"),fit: BoxFit.fill,),
                                  boxShadow: [
                                  BoxShadow(color: Colors.black, blurRadius: 10,)
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54, width:5,),
                                boxShadow: [
                                  BoxShadow(color: Colors.white70, )
                                ],
                              ),
                              child: Text('大學一年級上學期\n得到系排第一名',
                                style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                            ),
                          ],
                        ),
                        SizedBox(width: 5,),
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.brown[800]!, width:5,),
                                    bottom: BorderSide(color: Colors.brown[800]!, width:5,),
                                    left: BorderSide(color: Colors.brown[600]!, width:5,),
                                    right: BorderSide(color: Colors.brown[600]!, width:5,),
                                  ),
                                  image: DecorationImage(image: AssetImage("assets/p2.jpg"),fit: BoxFit.fill,),
                                  boxShadow: [
                                  BoxShadow(color: Colors.black, blurRadius: 10,)
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54, width:5,),
                                boxShadow: [
                                  BoxShadow(color: Colors.white70, )
                                ],
                              ),
                              child: Text('大學一年級下學期\n得到系排第二名',
                                style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.brown[800]!, width:5,),
                                    bottom: BorderSide(color: Colors.brown[800]!, width:5,),
                                    left: BorderSide(color: Colors.brown[600]!, width:5,),
                                    right: BorderSide(color: Colors.brown[600]!, width:5,),
                                  ),
                                  image: DecorationImage(image: AssetImage("assets/p3.jpg"),fit: BoxFit.contain,),
                                  boxShadow: [
                                  BoxShadow(color: Colors.black, blurRadius: 10,)
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54, width:5,),
                                boxShadow: [
                                  BoxShadow(color: Colors.white70, )
                                ],
                              ),
                              child: Text('大學二年級上學期\n得到系排第二名',
                                style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                            ),
                          ],
                        ),
                        SizedBox(width: 5,),
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.brown[800]!, width:5,),
                                  bottom: BorderSide(color: Colors.brown[800]!, width:5,),
                                  left: BorderSide(color: Colors.brown[600]!, width:5,),
                                  right: BorderSide(color: Colors.brown[600]!, width:5,),
                                ),
                                image: DecorationImage(image: AssetImage("assets/p4.jpg"),fit: BoxFit.contain,),
                                boxShadow: [
                                  BoxShadow(color: Colors.black, blurRadius: 10,)
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54, width:5,),
                                boxShadow: [
                                  BoxShadow(color: Colors.white70, )
                                ],
                              ),
                              child: Text('大學二年級下學期\n得到系排第三名',
                                style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(30, 50, 30, 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width:3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.white70,  offset: Offset(0, 0),blurStyle: BlurStyle.outer,),
                    ],
                  ),
                  child: Text(s2, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width:3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        offset: Offset(0, 0),
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Text(s3, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                ),
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black54, width:2,),
                          bottom: BorderSide(color: Colors.black54, width:2,),
                          left: BorderSide(color: Colors.black26, width:2,),
                          right: BorderSide(color: Colors.black26, width:2,),
                        ),
                        image: DecorationImage(image: AssetImage("assets/toeic.jpg"),fit: BoxFit.fill,),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10,)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width:5,),
                        boxShadow: [
                          BoxShadow(color: Colors.white70, )
                        ],
                      ),
                      child: Text('大學二年級下學期暑假\n考多益得到720分',
                        style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 50, 30, 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.orange,Colors.amberAccent[400]!,Colors.amber[300]!,]),
                        border: Border.all(color: Colors.black54, width:5,),
                        boxShadow: [
                          BoxShadow(color: Colors.amber[700]!, )
                        ],
                      ),
                      child: Text('其他在學校獲得的獎狀',
                        style: TextStyle(fontSize: 24, fontFamily: "GenSekiGothic2-R",),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.brown[800]!, width:5,),
                          bottom: BorderSide(color: Colors.brown[800]!, width:5,),
                          left: BorderSide(color: Colors.brown[600]!, width:5,),
                          right: BorderSide(color: Colors.brown[600]!, width:5,),
                        ),
                        image: DecorationImage(image: AssetImage("assets/p5.jpg"),fit: BoxFit.fill,),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 10,)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width:5,),
                        boxShadow: [
                          BoxShadow(color: Colors.white70, )
                        ],
                      ),
                      child: Text('大學一年級上學期\n物理競賽成績優異',
                        style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.brown[800]!, width:5,),
                                  bottom: BorderSide(color: Colors.brown[800]!, width:5,),
                                  left: BorderSide(color: Colors.brown[600]!, width:5,),
                                  right: BorderSide(color: Colors.brown[600]!, width:5,),
                                ),
                                image: DecorationImage(image: AssetImage("assets/p6.jpg"),fit: BoxFit.contain,),
                                boxShadow: [
                                  BoxShadow(color: Colors.black, blurRadius: 10,)
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54, width:5,),
                                boxShadow: [
                                  BoxShadow(color: Colors.white70, )
                                ],
                              ),
                              child: Text('大學一年級上學期\n中文會考成績優異',
                                style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                            ),
                          ],
                        ),
                        SizedBox(width: 5,),
                        Column(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.brown[800]!, width:5,),
                                  bottom: BorderSide(color: Colors.brown[800]!, width:5,),
                                  left: BorderSide(color: Colors.brown[600]!, width:5,),
                                  right: BorderSide(color: Colors.brown[600]!, width:5,),
                                ),
                                image: DecorationImage(image: AssetImage("assets/p7.jpg"),fit: BoxFit.fill,),
                                boxShadow: [
                                  BoxShadow(color: Colors.black, blurRadius: 10,)
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54, width:5,),
                                boxShadow: [
                                  BoxShadow(color: Colors.white70, )
                                ],
                              ),
                              child: Text('大學一年級下學期\n中文會考成績優異',
                                style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {

  String s1='大學一年級:\n在熟悉學校的環境後，就要認真學習專業科目，像「計算機概論」、「數位邏輯設計」等，'
      '除了必修專業科目之外，我也會選修其他科目，像「多媒體程式設計」、「互動式網頁程式設計」等。'
      '另外我想參與一些社團活動，透過與他人互動，提升自己的人際交流能力，也能獲得專業以外的知識和技能';
  String s2='大學二年級:\n到了二年級後，持續學習程式語言以加強自己程式設計的實力，有空閒時間就會去做志工或是閱讀書籍來充實自己，'
      '同時準備在英文方面，我也要往多益600分邁進，確定自己的英文程度。';
  String s3='大學三年級:\n三年級時選修課變得比較多，其中「APP程式設計」和「動畫程式設計實務」是我感興趣的，'
      '並且也增加了專題課程，我會運用之前所學，在畢業前完成一份專題。'
      '學習專業科目之外，我會努力考取程式語言相關證照，證明自己的能力。';
  String s4='大學四年級:\n四年級的課程幾乎都是選修，我希望能修到「電腦遊戲設計實務」和「虛擬實境」這兩門課，'
      '除了課程之外，也想了解校外實習的參加條件。大學生活已經接近尾聲了，'
      '我會準備國營事業和公職的考試，如台電、中華郵政等，所以要努力準備會考的專業科目。';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg1.jpg"),fit: BoxFit.cover,),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Text('學習計畫', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GenSekiGothic2-H",
                  ),
                  ),
                ),
                SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width:3),
                        borderRadius: BorderRadius.vertical(),
                        boxShadow: [
                          BoxShadow(color: Colors.yellow, spreadRadius: 10, ),
                          BoxShadow(color: Colors.orangeAccent, spreadRadius: 0, ),
                        ],
                      ),
                      child: Text(s1, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width:3),
                            borderRadius: BorderRadius.vertical(),
                            boxShadow: [
                              BoxShadow(color: Colors.white70,),
                            ],
                          ),
                          child: ListView(
                            children: [
                              Text('目標:', style: TextStyle(fontSize: 30, fontFamily: "GenSekiGothic2-R",),),
                              Text('1.參加社團', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                              Text('2.認識新朋友', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                              Text('3.顧好課業', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width:3),
                        borderRadius: BorderRadius.vertical(),
                        boxShadow: [
                          BoxShadow(color: Colors.yellow, spreadRadius: 10, ),
                          BoxShadow(color: Colors.orangeAccent, spreadRadius: 0, ),
                        ],
                      ),
                      child: Text(s2, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                    ),
                    Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width:3),
                        borderRadius: BorderRadius.vertical(),
                        boxShadow: [
                          BoxShadow(color: Colors.white70,),
                        ],
                      ),
                      child: ListView(
                        children: [
                          Text('目標:', style: TextStyle(fontSize: 30, fontFamily: "GenSekiGothic2-R",),),
                          Text('1.程式語言學習', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                          Text('2.參與志工', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                          Text('3.準備多益考試', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width:3),
                        borderRadius: BorderRadius.vertical(),
                        boxShadow: [
                          BoxShadow(color: Colors.yellow, spreadRadius: 10, ),
                          BoxShadow(color: Colors.orangeAccent, spreadRadius: 0, ),
                        ],
                      ),
                      child: Text(s3, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                    ),
                    Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width:3),
                        borderRadius: BorderRadius.vertical(),
                        boxShadow: [
                          BoxShadow(color: Colors.white70,),
                        ],
                      ),
                      child: ListView(
                        children: [
                          Text('目標:', style: TextStyle(fontSize: 30, fontFamily: "GenSekiGothic2-R",),),
                          Text('1.持續精進自我', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                          Text('2.製作專題', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                          Text('3.考取專業證照', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width:3),
                        borderRadius: BorderRadius.vertical(),
                        boxShadow: [
                          BoxShadow(color: Colors.yellow, spreadRadius: 10, ),
                          BoxShadow(color: Colors.orangeAccent, spreadRadius: 0, ),
                        ],
                      ),
                      child: Text(s4, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                    ),
                    Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width:3),
                        borderRadius: BorderRadius.vertical(),
                        boxShadow: [
                          BoxShadow(color: Colors.white70,),
                        ],
                      ),
                      child: ListView(
                        children: [
                          Text('目標:', style: TextStyle(fontSize: 30, fontFamily: "GenSekiGothic2-R",),),
                          Text('1.持續精進自我', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                          Text('2.校外實習', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                          Text('3.準備公職考試', style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {

  String s1='我現在已經大學3年級了，對於讀研究所的事我一直在思考，因為我發覺我喜歡的是遊戲設計，而系上與之相關的課程也只有1~2個，並且到現在沒有開課過，'
      '或許其他校區的系有開，但也因時間和交通有衝突而無法選修，至於研究所的內容，聽了一些老師提過後，覺得不是我想要的，研究所偏向研究過往的學術成果，找出可以改良的地方並改善，'
      '研究的專業領域也不是我感興趣的，所以我或許不會繼續讀研究所，可能現在的風氣是讀研究所才有好薪水的工作，但我認為讓自己去做一個不感興趣的事，這種感覺是難受的，把時間用來做自己真正感興趣的事比較重要。';
  String s2='在大學畢業之後，我可能會往國營事業或是公職的工作方向前進，例如台電、中華郵政等，所以我會努力做好考取相關考試的準備，如果自己準備不來的話，就去補習班獲得更多的學習資源和幫助，'
      '使我能順利考取到國營事業或是公職的工作，在閒暇之餘，我還是會繼續專研興趣，也就是遊戲設計，即使我不是遊戲公司的員工，也不影響我想製作遊戲的心願，所以我仍會繼續研究如何開發遊戲，'
      '或許遊戲類型不是什麼知名大作，也不能用來賺錢，我還是想參與製作一個遊戲，可能是自己獨立製作或是和其他人組成團隊來共同完成，若能真的做出一個遊戲，我認為這也是完成人生中的一個里程碑了。';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg4.jpg"),
            fit: BoxFit.cover,
          )
          ,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Text('專業方向', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GenSekiGothic2-H",
                  ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width:3),
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                        colors: [Colors.cyan[100]!,Colors.cyan,Colors.cyan[900]!,],
                        radius: 0.8,
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(0, 20)),
                    ],
                  ),
                  child: Text(s1, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width:3),
                    borderRadius: BorderRadius.circular(10),
                    gradient: RadialGradient(
                        colors: [Colors.blue[100]!,Colors.blue[800]!,Colors.blueGrey,],
                        radius: 2,
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(0, 20)),
                    ],
                  ),
                  child: Text(s2, style: TextStyle(fontSize: 20, fontFamily: "GenSekiGothic2-R",),),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}