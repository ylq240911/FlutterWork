import 'package:beauty_flutter/base_card.dart';
import 'package:flutter/material.dart';

//本周推荐
class CardRecommend extends BaseCard {
  @override
  _CardRecommendStatu createState() => _CardRecommendStatu();
}

class _CardRecommendStatu extends BaseCardState {
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  bottomContent() {
    return Expanded(
        child: Container(
          constraints: BoxConstraints.expand(),//通过BoxConstraints尽可能的充满父容器
            margin: EdgeInsets.only(top: 20),
            child: Image.network(
              'http://www.devio.org/io/flutter_beauty/card_1.jpg',
              fit: BoxFit.cover,
            )));
  }

  @override
  topTitle(String topTitle) {
    return super.topTitle("本周推进");
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle('送一天无限卡.全场书籍免费读 >');
  }
}
