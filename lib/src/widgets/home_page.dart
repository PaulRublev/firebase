import 'package:flutter/material.dart';
import 'package:module_model/module_model.dart';
import 'package:provider/provider.dart';
import 'package:state_management/src/filters.dart';
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
  Filters _filter = Filters.all;

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
          IconButton(
            onPressed: (() {
              switch (_filter) {
                case Filters.all:
                  _filter = Filters.toBuy;
                  break;
                case Filters.toBuy:
                  _filter = Filters.isBought;
                  break;
                case Filters.isBought:
                  _filter = Filters.all;
                  break;
              }
              setState(() {});
              // Provider.of<Items>(context, listen: false).sortItems();
            }),
            icon: makeIcon(_filter),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ItemsView(filter: _filter),
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

  Widget makeIcon(Filters filter) {
    switch (filter) {
      case Filters.all:
        return const Icon(Icons.library_add_check_outlined);
      case Filters.toBuy:
        return const Icon(Icons.check_box_outline_blank_outlined);
      case Filters.isBought:
        return const Icon(Icons.check_box_outlined);
    }
  }
}
