import 'package:flutter/material.dart';
import 'package:module_model/module_model.dart';
import 'package:provider/provider.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Items>(builder: (context, state, ___) {
      return Expanded(
        child: ListView.builder(
          itemCount: state.getItemList().length,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              secondary: state.getItemList()[index][1]
                  ? IconButton(
                      onPressed: (() {
                        state.removeItem(index);
                      }),
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                    )
                  : null,
              title: Text(
                state.getItemList()[index][0],
                textScaleFactor: 1.4,
                style: TextStyle(
                  decoration: state.getItemList()[index][1]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              value: state.getItemList()[index][1],
              onChanged: ((value) {
                state.changeItemCondition(index, value ?? false);
              }),
            );
          },
        ),
      );
    });
  }
}
