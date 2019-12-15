//StatefulWidget 是有状态的，StatelessWidget是无状态的
//有状态的意思是可以根据状态来改变页面
import 'package:flutter/material.dart';

import 'content_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaulColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final ContentPageController _contentPageController = ContentPageController();
  @override
  Widget build(BuildContext context) {
    //Scaffold是一个页面布局机构的控件
    return Scaffold(
      //Container是flutter中容器的界面，可以定义页面的容器的背景、边框等
      body: Container(
          //装饰器，描述页面的样式
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffedeef0), Color(0xffe6e7e9)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
          ),
          child: ContentPageState(
            contentPageController: _contentPageController,
            onPageChanged: (index){
              setState(() {
                _currentIndex = index;
              });
            },

          ),
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex:_currentIndex,
          onTap: (index){
              //控制内容区域滚动到指定位置
              _contentPageController.jumpToPage(index);
              //修改状态
              setState(() {
                  _currentIndex = index;
              });
          },
          type: BottomNavigationBarType.fixed,//设置下面文字固定显示
          items: [
        _bottomItem("本周", Icons.folder, 0),
        _bottomItem("分享", Icons.explore, 1),
        _bottomItem("免费", Icons.donut_small, 2),
        _bottomItem("长安", Icons.person, 3)
      ]),
    );
  }

  //封装底部Tab
  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        //未选中的颜色
        icon: Icon(icon, color: _defaulColor),
        //选中的颜色
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaulColor : _activeColor),
        ));
  }
}
