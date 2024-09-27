import 'package:flutter/material.dart';
import 'package:delivery_boy/constant/constant.dart';
import 'package:delivery_boy/pages/home/new_order.dart';
import 'package:delivery_boy/pages/home/active_order.dart';
import 'package:delivery_boy/pages/home/history.dart';
import 'package:page_transition/page_transition.dart';
import 'package:delivery_boy/pages/notification.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          title: Text(
            'Orders',
            style: bigHeadingStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications, color: blackColor),
              onPressed: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Notifications()));
              },
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.grey.withOpacity(0.3),
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            tabs: [
              Tab(text: 'New'),
              Tab(text: 'Active'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NewOrder(),
            ActiveOrder(),
            History(),
          ],
        ),
      ),
    );
  }
}