import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hero_animation/screens/items.dart';

class ItemDetail extends StatelessWidget {
  final Items item;

  const ItemDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Hero(
                tag: 'image${item.id}', // Use the same tag as in ItemsScreen
                child: Image.asset(
                  item.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _backArrow(context),
            _bottomContainer(item),
          ],
        ),
      ),
    );
  }
}

Widget _backArrow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _bottomContainer(Items item) {
  return DraggableScrollableSheet(
    initialChildSize: 0.6,
    maxChildSize: 1.0,
    minChildSize: 0.6,
    builder: (context, scrollController) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                item.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.desc,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      );
    },
  );
}
