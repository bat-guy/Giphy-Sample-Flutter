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
    return Card(
      color: Colors.cyanAccent,
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: widget.maxHeight),
            child: GifImage(
              image: NetworkImage(Constants.gif),
              controller: controller,
              fit: BoxFit.fill,
            ),
          ),
          Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.fromLTRB(10, 7, 0, 0),
              child: Image(
                image: AssetImage(Constants.favourite),
                fit: BoxFit.cover,
                width: 22,
              )),
        ],
      ),
    );
  }
}
