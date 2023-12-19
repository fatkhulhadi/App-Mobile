import 'package:flutter/material.dart';
import 'package:uts_v3422023_fatkhul/single_item_screen.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favoriteItems = [];

  void addFavoriteItem(String item) {
    setState(() {
      favoriteItems.add(item);
    });
  }

  void removeFavoriteItem(String item) {
    setState(() {
      favoriteItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Page'),
      ),
      body: favoriteItems.isEmpty
          ? Center(
              child: Text('Favorite list is empty.'),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeFavoriteItem(favoriteItems[index]);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class SingleItemScreen extends StatefulWidget {
  final String img;

  SingleItemScreen(this.img);

  @override
  _SingleItemScreenState createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  @override
  Widget build(BuildContext context) {
    // Add your implementation for building the state here
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Item Screen'),
      ),
      body: Center(
        child: Text('Content for ${widget.img} goes here.'),
      ),
    );
  }
}