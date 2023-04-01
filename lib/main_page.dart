// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'constants.dart';
import 'bottom_sheet.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  dynamic changeContent = slippage;

  var leftBorderBottomColor = kActiveBorderColor;
  var rightBorderBottomColor = kInactiveBorderColor;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var getInfo = await CoinData().getCoinData();

      for (int i = 0; i < getInfo['data'].length; i++) {
        content.add(SizedBox(height: 20));
        content.add(
          Resuse(
            name: getInfo['data'][i]['name'],
            abbr: getInfo['data'][i]['code'],
            img: getInfo['data'][i]['icon'],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  bool isFinished = false;
  dynamic img1 = NetworkImage(
      'https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png');
  dynamic img2 = AssetImage('images/Aave-Crypto-Logo.png');
  String name1 = 'ETH';
  String name2 = 'AAVE';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Icon(Icons.arrow_back_ios_sharp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Swap ETH',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Ethereum Mainnet'),
                ],
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: Color.fromARGB(255, 38, 45, 52)),
              borderRadius: BorderRadius.circular(22),
            ),
            margin: EdgeInsets.fromLTRB(30, 30, 30, 3),
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: img1,
                          width: 44.0,
                        ),
                        SizedBox(width: 15),
                        Text(
                          name1,
                          style: kFontStyle,
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text('Balance: 0')
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '1254',
                      style: kTextStyle,
                    ),
                    Text('₹0.00'),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 38, 45, 52),
                  borderRadius: BorderRadius.circular(22),
                ),
                margin: EdgeInsets.fromLTRB(30, 3, 30, 30),
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: img2,
                              width: 44.0,
                            ),
                            SizedBox(width: 15),
                            Text(
                              name2,
                              style: kFontStyle,
                            ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text('Balance: 0')
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.rotate_right,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: size.width * 0.375,
                top: -33,
                child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 40, 128, 158),
                  onPressed: () {
                    setState(() {
                      dynamic subImg = img1;
                      img1 = img2;
                      img2 = subImg;
                      String subName = name1;
                      name1 = name2;
                      name2 = subName;
                    });
                  },
                  child: Icon(
                    Icons.swap_vert_sharp,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    leftBorderBottomColor = kActiveBorderColor;
                    rightBorderBottomColor = kInactiveBorderColor;
                    changeContent = slippage;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: leftBorderBottomColor, width: 3))),
                  child: Text('SLIPPAGE'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    rightBorderBottomColor = kActiveBorderColor;
                    leftBorderBottomColor = kInactiveBorderColor;
                    changeContent = details;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: rightBorderBottomColor, width: 3))),
                  child: Text('DETAILS'),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(22),
            ),
            child: changeContent,
          ),
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: Color.fromARGB(255, 38, 45, 52)),
              borderRadius: BorderRadius.circular(55),
            ),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: SwipeableButtonView(
              onFinish: () {
                setState(() {
                  isFinished = false;
                });
              },
              isFinished: isFinished,
              onWaitingProcess: () {
                showBottom(context);
                setState(() {
                  isFinished = true;
                });
              },
              activeColor: Color.fromARGB(255, 17, 16, 19),
              buttonColor: Color.fromARGB(255, 40, 128, 158),
              buttonWidget: Icon(Icons.check),
              buttonText: 'Slide to pay',
            ),
          ),
        ],
      ),
    );
  }
}
