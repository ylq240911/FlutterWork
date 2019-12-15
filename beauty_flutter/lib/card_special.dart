//长安十二时

import 'package:beauty_flutter/base_card.dart';
import 'package:flutter/material.dart';

class CardSpecial extends BaseCard {
  @override
  _ClassBaseState createState() => _ClassBaseState();
}

class _ClassBaseState extends BaseCardState {
  @override
  void initState() {
    bottumTitleColor = Colors.blue;
    super.initState();
  }
  @override
  topContent() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 66, right: 66, top: 30, bottom: 30),
          decoration: BoxDecoration(
              color: Color(0xfffffcf7)
          ),
          child: Container(
            //用盒式装饰器设置阴影
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20, //模糊半径
                      offset: Offset(
                          0, //水平偏移的距离
                          10 //垂直偏移的距离
                      )
                  ),
                ]
            ),
            child: Image.network(
                'http://www.devio.org/io/flutter_beauty/changan_book.jpg',
                height: 200,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 15),
          decoration: BoxDecoration(color: Color(0xfff7f3ea)),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('长安十二时辰...',
                    style: TextStyle(fontSize: 18, color: Color(0xff473b25)),),
                  Padding(padding: EdgeInsets.only(top: 5),
                      child: Text('马伯庸', style: TextStyle(
                          fontSize: 13, color: Color(0xff7d725c)),)
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Color(0xffd9bc82),
                      Color(0xffecd9ae)
                    ],
                    ), //设置颜色渐变

                  ),
                  child:Text('分享免费领',style: TextStyle(color: Color(0xff4f3b1a),fontSize: 13),)
              )
            ],
          ),
        )
      ],

    );
  }

  @override
  bottomContent() {

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, //使水平撑开
        mainAxisAlignment: MainAxisAlignment.spaceAround,//均匀分布
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //使其居左
              children: <Widget>[
                Image.network('http://www.devio.org/io/flutter_beauty/double_quotes.jpg',
                height: 20,
                width: 20,
                ),
                Text('揭露历史真相')
              ],
            ),
          ),
          bottumTitle('更多免费好书领不停>')
        ],
      ),
    );
  }
}