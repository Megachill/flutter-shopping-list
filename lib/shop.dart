import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  createState() => new ShopState();
}

class ShopState extends State<Shop> {
  List<String> _items = [
    'Eggs',
    'Apples',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),

      body: _buildList(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Add item",
        onPressed: () {
          _pushAddItemScreen();
        },
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemBuilder: (context, index) {
          if (index < _items.length) {
            var item = _items[index];

            return _buildItem(item, index);
          }
        }
    );
  }

  Widget _buildItem(String text, int index) {
    return ListTile(
      title: Text(text),
    );
  }

  void _pushAddItemScreen() {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Add an item'),
                ),

                body: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'e.g. Eggs',
                    contentPadding: EdgeInsets.all(16)
                  ),

                  onSubmitted: (value) {
                    debugPrint(value);
                    
                  },
                ),
              );
            }
        )
    );
  }
}
