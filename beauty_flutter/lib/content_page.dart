import 'package:beauty_flutter/card_free.dart';
import 'package:beauty_flutter/card_recommend.dart';
import 'package:beauty_flutter/card_share.dart';
import 'package:beauty_flutter/card_special.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_appbar.dart';

class ContentPageState extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPageController contentPageController;

  /**onPageChanged的构造方法**/
  const ContentPageState({Key key, this.onPageChanged,this.contentPageController})
      //初始化列表
      :super(key: key);

  @override
  _ContentPageStateState createState() => _ContentPageStateState();
}

class _ContentPageStateState extends State<ContentPageState> {
  PageController _pageController = new PageController(
      /**视图比例**/
      viewportFraction: 0.85);
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.lightGreen
  ];

  @override
  void initState() {
    if(widget.contentPageController!=null){
        widget.contentPageController._pageController = _pageController;
    }
    _statuBar();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appBar
        CustomAppBar(),
        //撑开页面布局的，用来可以填充
        Expanded(
            /**高度撑开否则在Column中没有高度会报错**/
            child: PageView(
          onPageChanged: widget.onPageChanged,
          controller: _pageController,
          children: <Widget>[
            _wrapItem(CardRecommend()),
            _wrapItem(CardShare()),
            _wrapItem(CardFree()),
            _wrapItem(CardSpecial())
          ],
        ))
      ],
    );
  }

  Widget _wrapItem(Widget widget) {
    return Padding(
        padding: EdgeInsets.all(10),
        child:widget,
    );
  }
  //状态栏样式，沉浸式状态栏
  _statuBar(){
    /**黑色沉浸状态栏，基于SystemUiOverlayStyle.dark修改了statusBarColor**/
    SystemUiOverlayStyle _systemUiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(_systemUiOverlayStyle);
  }
}

class ContentPageController{
  PageController _pageController;
  void jumpToPage(int page){
    /**dart语言的安全调用 ？.**/
    _pageController?.jumpToPage(page);
}
}
