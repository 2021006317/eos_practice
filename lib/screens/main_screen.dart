import 'package:flutter/material.dart';
import '../config/palette.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  late bool isSignupScreen = false; // TODO : isSignupScreen 변수 선언

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor, // TODO : background color로 palette의 backgroundColor 설정,
      body: Stack(
          children: [
            Positioned( // 배경
              top:0, left:0, right:0, // TODO : top, left, right 모두 0으로 설정
              child: Container( // background
                height: 550, // TODO : height 300으로 설정
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.png'), // TODO : background.png 넣기
                    fit: BoxFit.fill
                  ),
                ),
                child: Container( // text
                  padding: EdgeInsets.fromLTRB(20, 90, 0, 0), // TODO: padding top 90, left 20
                  child: Column(
                    crossAxisAlignment : CrossAxisAlignment.start, // TODO: 왼쪽 정렬
                    children:[
                      RichText(
                        text: TextSpan(
                          text: 'Welcome',
                          style: TextStyle(letterSpacing: 1.0, fontSize: 50, color: Colors.white),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? ' to EOS chat!' : ' back',
                              style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        )
                      ),
                    SizedBox(height: 5.0,),
                    isSignupScreen ? Text('Signup to continue', style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 20)) : Text('Signin to continue', style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
              )
            ),
            Positioned( // 흰색 박스
              top: 280, // TODO: top 150
              child: Container( // TODO: height 280.0, padding 모두 20, width 핸드폰 가로 길이 – 40, margin 가로로 양쪽 20
                height: isSignupScreen ? 320.0 : 290.0,
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width-40,
                margin: EdgeInsets.fromLTRB(20,0,0,20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white, // TODO: color white, border radius 15
                  boxShadow: [
                    BoxShadow(
                      // TODO: color black, 투명도 0.3, blur radius 15, spread radius 5
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5, )
                  ]
                ),
                child: Column( // box 안에 정렬
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, // 사이사이 공백 alignment
                      children: [
                        GestureDetector(
                          child: Column(
                            children: [
                              TextButton(
                                child: Text('LOGIN',
                                  style: TextStyle( // TODO: font size 16, bold, isSignupScreen이 false면 activeColor, true면 textColor1
                                    fontSize: 16, fontWeight: FontWeight.bold,
                                    color: isSignupScreen ? Palette.textColor1 : Palette.activeColor,
                                  ),
                                ),
                                onPressed: (){
                                  setState(() {
                                    isSignupScreen = false;
                                  });
                                },
                              ),
                              if(isSignupScreen==false)// TODO: isSignupScreen이 false일 때만 밑줄이 생기도록
                              Container(
                                margin: EdgeInsets.only(top:3),
                                height: 2, width: 55, color: Colors.green, // TODO: margin top만 3, height 2, width 55, color green
                            )],
                          ),
                        ),
                        GestureDetector(
                          child: Column(
                            children: [
                              TextButton(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle( // TODO: font size 16, bold, isSignupScreen이 false면 activeColor, true면 textColor1
                                    fontSize: 16, fontWeight: FontWeight.bold,
                                    color: isSignupScreen ? Palette.activeColor : Palette.textColor1,
                                  ),
                                ),
                                onPressed: (){
                                  setState(() {
                                    isSignupScreen = true;
                                  });
                                },
                              ),
                              if (isSignupScreen==true)
                              Container(
                                margin: EdgeInsets.only(top:3.0),
                                height: 2, width: 55, color: Colors.green, // TODO: margin top만 3, height 2, width 55, color green
                              )],
                          )
                        )
                      ],
                    ),
                    isSignupScreen ? // signup : user name, email, password
                    Container( // 입력칸
                      margin: EdgeInsets.only(top:20),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle, color: Palette.iconColor), // TODO: prefix icon 원하는 icon 입력, color은 palette 의 iconColor
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                  borderSide: BorderSide(color: Palette.textColor1), // TODO: borderside 색은 palette의 textColor1
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                  borderSide: BorderSide(color: Palette.textColor1),// TODO: borderside 색은 palette의 textColor1
                                ),
                                hintText: 'User name',
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email, color: Palette.iconColor), // TODO: prefix icon 원하는 icon 입력, color은 palette 의 iconColor
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                  borderSide: BorderSide(color: Palette.textColor1), // TODO: borderside 색은 palette의 textColor1
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                  borderSide: BorderSide(color: Palette.textColor1),// TODO: borderside 색은 palette의 textColor1
                                ),
                                hintText: 'Email',
                              ),
                            ),
                            SizedBox(height: 8,),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock, color: Palette.iconColor), // TODO: prefix icon 원하는 icon 입력, color은 palette 의 iconColor
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                  borderSide: BorderSide(color: Palette.textColor1), // TODO: borderside 색은 palette의 textColor1
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                  borderSide: BorderSide(color: Palette.textColor1),// TODO: borderside 색은 palette의 textColor1
                                ),
                                hintText: 'Password',
                              ),
                            ),
                          ]
                        ),
                      )
                    )
                    : Container( // login
                        margin: EdgeInsets.only(top:20),
                        child: Form(
                          child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email, color: Palette.iconColor), // TODO: prefix icon 원하는 icon 입력, color은 palette 의 iconColor
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                      borderSide: BorderSide(color: Palette.textColor1), // TODO: borderside 색은 palette의 textColor1
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                      borderSide: BorderSide(color: Palette.textColor1),// TODO: borderside 색은 palette의 textColor1
                                    ),
                                    hintText: 'Email',
                                  ),
                                ),
                                SizedBox(height: 8,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock, color: Palette.iconColor), // TODO: prefix icon 원하는 icon 입력, color은 palette 의 iconColor
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                      borderSide: BorderSide(color: Palette.textColor1), // TODO: borderside 색은 palette의 textColor1
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(35)), // TODO: border radius는 모두 35
                                      borderSide: BorderSide(color: Palette.textColor1),// TODO: borderside 색은 palette의 textColor1
                                    ),
                                    hintText: 'Password',
                                  ),
                                ),
                              ]
                          ),
                        )
                    ),
                  ]
                ),
              )
            ),
            Positioned( // 화살표 동그라미 버튼
              top: isSignupScreen ? 545 : 525, // 320, 290
              right: 0, left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15), height: 90, width: 90, // TODO: padding은 모두 15, height 90, width 90
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(50),),  // TODO: 하얀색, borderRadius는 50
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.lightGreen, Colors.green],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0,1)
                          )
                        ]
                      ),
                      child: Icon(Icons.arrow_forward, color: Colors.white)
                    )
                )
              )
            ),
            Positioned( // 구글 로그인 버튼
              top: MediaQuery.of(context).size.height -125, right: 0, left: 0, // TODO: top은 핸드폰 세로길이에서 -125, right 0, left 0
              child: Column(
                children: [
                  TextButton(
                    child: isSignupScreen ? Text('or Signin with', style: TextStyle(color: Colors.black),) : Text('or Signup with' , style: TextStyle(color: Colors.black),),
                    onPressed: (){},
                  ),
                  // TODO: LOGIN 누르면 'or Signup with'
                  // TODO: SIGNUP 누르면 'or Signin with'
                  // TODO: SizedBox height 10으로 사이 공간 주기
                  SizedBox(height: 10,),
                  TextButton.icon(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(155,40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: Palette.googleColor,  // TODO: 배경색은 palette의 googleColor
                    ),
                    icon: Icon(Icons.add, color: Colors.white,),
                    label: Text('Google'),  // TODO: 더하기 아이콘 넣고 'Google' 쓰기
                  )
                ]
              )
            )
          ])
    );
  }
}


