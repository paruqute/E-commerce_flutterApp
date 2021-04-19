import 'dart:math';

import 'package:dapp/components/balance.dart';
import 'package:dapp/components/page_notifier.dart';
import 'package:dapp/constraints.dart';
import 'package:dapp/models/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'detail_page.dart';
import 'front_card.dart';


class Crid extends StatefulWidget {
  @override
  _CridState createState() => _CridState();
}

class _CridState extends State<Crid> {
  PageNotifier _pageNotifier = PageNotifier();

  int _previousIndex = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.green[800],
            size: SizeConfig.defaultHeight * 4,
          ),
        ),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => _pageNotifier,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Balance(
                  previousIndex: _previousIndex, currentIndex: _currentIndex),
              _buildCardsList(),
              _buildPageIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  _buildCardsList() => Expanded(
    child: Transform(
      transform: Matrix4.identity()
        ..translate(-SizeConfig.defaultWidth * 4)
        ..rotateZ(-pi / 2),
      alignment: Alignment.center,
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cards.length,
          controller: _pageNotifier.pageController,
          onPageChanged: (index) => setState(() {
            _previousIndex = _currentIndex;
            _currentIndex = index;
          }),
          itemBuilder: (context, index) {
            return Consumer<PageNotifier>(
              builder: (context, value, child) {
                if (value.currentPage > index) {
                  double scaleFactor =
                  max(1 - (value.currentPage - index) * 0.4, 0.6);
                  double angleFactor =
                  min((value.currentPage - index) * 20, 20);
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..scale(scaleFactor)
                      ..rotateZ(-(pi / 180) * angleFactor),
                    alignment: Alignment.center,
                    child: child,
                  );
                }
                return child;
              },
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(card: cards[index]))),
                child: Container(
                  padding:
                  EdgeInsets.only(bottom: SizeConfig.defaultHeight * 5),
                  child: FrontCard(
                    card: cards[index],
                  ),
                ),
              ),
            );
          }),
    ),
  );

  _buildPageIndicator() => Padding(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultWidth * 2,
        vertical: SizeConfig.defaultHeight * 2),
    child: SmoothPageIndicator(
      controller: _pageNotifier.pageController,
      count: cards.length,
      effect: WormEffect(
          dotHeight: SizeConfig.defaultHeight,
          dotWidth: SizeConfig.defaultHeight,
          dotColor: Colors.grey[800],
          activeDotColor: Colors.white),
    ),
  );
}
