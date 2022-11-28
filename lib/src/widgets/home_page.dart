import 'package:flutter/material.dart';
import 'package:module_model/module_model.dart';
import 'package:provider/provider.dart';
import 'package:state_management/src/widgets/items_view.dart';

import 'bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> items = [];
  late TextEditingController _editingController;

  @override
  void initState() {
    _editingController = TextEditingController(text: 'Простынь');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: (() {
              Provider.of<Items>(context, listen: false).sortItems();
            }),
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const ItemsView(),
            BottomBar(editingController: _editingController),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }
}
