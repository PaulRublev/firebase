import 'package:flutter/material.dart';
import 'package:module_model/module_model.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.editingController});

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.cyan,
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 200,
            child: TextField(
              controller: editingController,
              style: const TextStyle(fontWeight: FontWeight.w800),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: (() {
                Provider.of<Items>(context, listen: false).addItem(
                  [
                    editingController.value.text,
                    false,
                  ],
                );
              }),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
