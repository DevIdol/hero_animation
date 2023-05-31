import 'package:flutter/material.dart';
import 'package:hero_animation/screens/constants.dart';
import 'package:hero_animation/screens/item_detail.dart';
import 'package:hero_animation/screens/items.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final List<Items> items = [
    Items(
        id: 1, img: "assets/one.png", title: "Title One", desc: Constants.desc),
    Items(
        id: 2, img: "assets/two.png", title: "Title Two", desc: Constants.desc),
    Items(
        id: 3,
        img: "assets/three.png",
        title: "Title Three",
        desc: Constants.desc),
    Items(
        id: 4,
        img: "assets/four.png",
        title: "Title Four",
        desc: Constants.desc),
    Items(
        id: 5,
        img: "assets/five.png",
        title: "Title Five",
        desc: Constants.desc),
    Items(
        id: 6,
        img: "assets/six.png",
        title: "Title Five",
        desc: Constants.desc),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hero Animation"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Grid View"),
              Tab(text: "List View"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _gridView(items),
            _listView(items),
          ],
        ),
      ),
    );
  }
}

Widget _gridView(List<Items> items) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetail(item: item),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'image${item.id}',
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.asset(
                          item.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget _listView(List<Items> items) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetail(item: item),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            margin: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Hero(
                  tag: 'image${item.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      item.img,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.desc,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
