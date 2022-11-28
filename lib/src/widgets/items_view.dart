import 'package:flutter/material.dart';
import 'package:module_model/module_model.dart';
import 'package:provider/provider.dart';

import '../filters.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key, required this.filter});

  final Filters filter;

  @override
  Widget build(BuildContext context) {
    return Consumer<Items>(builder: (context, state, ___) {
      List<List<dynamic>> items = [];
      switch (filter) {
        case Filters.all:
          items = state.getItemList();
          break;
        case Filters.toBuy:
          items = state
              .getItemList()
              .where((element) => element[1] == false)
              .toList();
          break;
        case Filters.isBought:
          items = state
              .getItemList()
              .where((element) => element[1] == true)
              .toList();
          break;
      }

      return Expanded(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              secondary: items[index][1]
                  ? IconButton(
                      onPressed: (() {
                        state.removeItem(items[index][0]);
                      }),
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                    )
                  : null,
              title: Text(
                items[index][0],
                textScaleFactor: 1.4,
                style: TextStyle(
                  decoration: items[index][1]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              value: items[index][1],
              onChanged: ((value) {
                items[index][1] = !items[index][1];
                state.notify();
              }),
            );
          },
        ),
      );
    });
  }
}
