import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  createState() => new ShopState();
}

class ShopState extends State<Shop> {
  List<String> _items = [];

  void _addItem(value) {
    setState(() {
      _items.add(value);
    });
  }

  void _removeItem(index) {
    setState(() {
      _items.removeAt(index);
    });
  }

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

      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          _removeItem(index);
        },
      ),
      /*onTap: () {
        _removeItem(index);
      },*/
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
//                    debugPrint(value);
                    // add the item
                    _addItem(value);

                    // close route
                    // when push is used, it pushes new item on stack of navigator
                    // simply pop off stack and it goes back
                    Navigator.pop(context);

                  },
                ),
              );
            }
        )
    );
  }
}
