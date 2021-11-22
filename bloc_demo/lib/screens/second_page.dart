import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String title;
  final String description;


  SecondPage({required this.title, this.description = ''});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 20, top: 20),
            child: TextButton(
              child: Text('Skip'),
              onPressed: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              title,
              style: TextStyle(fontSize: 40),
            ),
          ),
          Image.asset(
            "assets/images/img_tour_guideline_1.png",
            width: 300,
            height: 300,
          ),
          Container(
            margin: EdgeInsets.only(left: 45, right: 45),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class PageScreen extends StatelessWidget {
  final _controller = PageController();

  final List<Widget> _pages = <Widget>[
    SecondPage(title: '城市冒險', description: '阿唷帶你到城市四處探險！一場場的未知關卡驚喜～等你來挖掘。',),
    SecondPage(title: '定點派對', description: '辦活動累人？定點派對搞定你想要的玩樂體驗。',),
    SecondPage(title: '踢人表決', description: '隊員表現不OK破壞遊戲體驗嗎？遊玩中你能投下匿名反對票，送他離開。',),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Stack(
      children: <Widget>[
        PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemBuilder: (context, index) {
              return _pages[index % _pages.length];
            }),
        Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: DotsIndicator(
              color: Colors.black,
              controller: _controller,
              itemCount: _pages.length,
              onPageSelected: (page) {},
            ))
      ],
    );
  }
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
