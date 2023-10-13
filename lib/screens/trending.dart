import 'package:flutter/material.dart';
import 'package:flutter_giphy/widget/list_tile_widget.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ListTileWidget(maxHeight: 200);
                }),
          ),
        ],
      ),
    );
  }
}
