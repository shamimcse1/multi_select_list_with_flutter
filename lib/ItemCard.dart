import 'package:flutter/material.dart';

import 'Item.dart';

class ItemCard extends StatelessWidget {
  final Function() onTap;
  final bool isSelected;
  final Item item;

  const ItemCard(
      {super.key, required this.onTap,
      required this.isSelected,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){onTap();},
      child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.title, style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Text('\$${item.price}'),
                      if (isSelected) // Show tick mark only if item is selected
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.check_circle, color: Colors.green),
                        ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
    );

  }
}
