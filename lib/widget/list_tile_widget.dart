import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_giphy/constants.dart';

class ListTileWidget extends StatefulWidget {
  final double maxHeight;

  const ListTileWidget({super.key, required this.maxHeight});

  @override
  State<StatefulWidget> createState() {
    return _ListTileWidgetState();
  }
}

class _ListTileWidgetState extends State<ListTileWidget>
    with SingleTickerProviderStateMixin<ListTileWidget> {
  late FlutterGifController controller = FlutterGifController(vsync: this);

  @override
  void initState() {
    super.initState();

    controller = FlutterGifController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.repeat(min: 0, max: 9, period: Duration(milliseconds: 1000));
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
    return Center(
      child: Card(
        color: Colors.cyanAccent,
        child: Column(
          children: [
            GifImage(
              height: widget.maxHeight,
              image: NetworkImage(
                  "https://user-images.githubusercontent.com/14011726/94132137-7d4fc100-fe7c-11ea-8512-69f90cb65e48.gif"),
              controller: controller,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 10),
                child: Image(
                  image: AssetImage(Constants.favourite),
                  fit: BoxFit.cover,
                  width: 22,
                )),
          ],
        ),
      ),
    );
  }
}
