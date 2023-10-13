import 'package:flutter/material.dart';
import 'package:flutter_giphy/widget/list_tile_widget.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({super.key});

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 15,
          itemBuilder: (context, index) {
            return const ListTileWidget(maxHeight: 150.0);
          }),
    );
  }
}
