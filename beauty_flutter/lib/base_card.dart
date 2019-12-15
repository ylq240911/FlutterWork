

import 'package:flutter/material.dart';

class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  Color subTitleColor = Colors.grey;
  Color bottumTitleColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    //裁切
    return PhysicalModel(color: Colors.transparent,
      clipBehavior: Clip.antiAlias,//抗锯齿
      borderRadius: BorderRadius.circular(6),//圆角
      child: Container(
        decoration: BoxDecoration(color: Colors.white),//设置白色背景
        child: Column(
          children: <Widget>[
              topContent(),
              bottomContent(),
          ],
        ),
      ),
    );
  }

  topContent() {
    return Padding(padding: EdgeInsets.only(left:20,top:26,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,//使排列方式左对齐
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[

                topTitle(''),
                topTitle2(''),
            ],
          ),
          subTitle('')
        ],
      ),
    );
  }

  bottomContent() {
    //使用Expanded可以使高度撑满
    return Container();
  }

  Widget subTitle(String title) {
    return Padding(padding: EdgeInsets.only(top:3),
      child: Text(title,style: TextStyle(fontSize: 11,color: subTitleColor),),
    );
  }

  topTitle(String topTitle) {
    return Text(topTitle,style: TextStyle(fontSize: 22),);
  }

  topTitle2(String topTitle2) {
    return Container();
  }

  bottumTitle(String title){
    return Text(title,textAlign:TextAlign.center,style: TextStyle(fontSize: 10,color:bottumTitleColor),);
  }
}
