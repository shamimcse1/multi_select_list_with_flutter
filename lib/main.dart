import 'package:flutter/material.dart';

import 'Item.dart';
import 'ItemCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = [
    Item('Item1', 200),
    Item('Item2', 50),
  ];
  List<Item> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          shrinkWrap: true,
          children: List.generate(
            items.length,
            (index) {
              return ItemCard(
                onTap: () {
                  setState(() {
                    if (selectedItems.contains(items[index])) {
                      selectedItems.remove(items[index]);
                    } else {
                      selectedItems.add(items[index]);
                    }
                  });
                },
                item: items[index],
                isSelected: selectedItems.contains(items[index]),
              );
            },
          ),
        ),
      ),
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: () {},
        child: Text('${selectedItems.length} Items',
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
