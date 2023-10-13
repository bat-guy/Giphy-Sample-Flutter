import 'package:flutter/material.dart';
import 'package:flutter_giphy/screens/favourite.dart';
import 'package:flutter_giphy/screens/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin<StatefulWidget> {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Giphy Sample'),
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(text: 'Trending'),
              Tab(text: 'Favourite'),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            TrendingWidget(),
            FavouriteWidget(),
          ],
        ),
      ),
    );
  }
}
