import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  createState() => new ShopState();
}

class ShopState extends State<Shop> {
  List<String> _items = [
    'item1',
    'item2',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),

      body: ListView.builder(
          itemBuilder: (context, index) {

            var item = _items[index];

            return ListTile(
              title: Text(item),
            );
          },
      ),
    );
  }
}
