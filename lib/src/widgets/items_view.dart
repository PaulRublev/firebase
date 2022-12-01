import 'package:flutter/material.dart';
import 'package:module_business/module_business.dart';
import 'package:module_model/module_model.dart';

import '../filters.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key, required this.filter, required this.url});

  final Filters filter;
  final Future<String> url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: url,
          builder: (context, snapshot) {
            return Container(
              decoration: snapshot.connectionState == ConnectionState.done
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(snapshot.data!),
                        fit: BoxFit.fill,
                      ),
                    )
                  : const BoxDecoration(),
              child: StreamBuilder<List<Item>>(
                stream:
                    BlocFactory.instance.mainBloc.firebaseService.streamItems(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Container()
                      : ListView.builder(
                          itemCount: filter == Filters.all
                              ? snapshot.data!.length
                              : filter == Filters.isBought
                                  ? snapshot.data!
                                      .where((item) => item.isBought)
                                      .length
                                  : snapshot.data!
                                      .where((item) => !item.isBought)
                                      .length,
                          itemBuilder: (context, index) {
                            List<Item> items;
                            switch (filter) {
                              case Filters.all:
                                items = snapshot.data!;
                                break;
                              case Filters.toBuy:
                                items = snapshot.data!
                                    .where((item) => !item.isBought)
                                    .toList();
                                break;
                              case Filters.isBought:
                                items = snapshot.data!
                                    .where((item) => item.isBought)
                                    .toList();
                                break;
                            }

                            return CheckboxListTile(
                              secondary: items[index].isBought
                                  ? IconButton(
                                      onPressed: (() {
                                        BlocFactory
                                            .instance.mainBloc.firebaseService
                                            .removeItem(items[index]);
                                      }),
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    )
                                  : null,
                              title: Text(
                                items[index].name,
                                textScaleFactor: 1.4,
                                style: TextStyle(
                                  decoration: items[index].isBought
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              value: items[index].isBought,
                              onChanged: ((value) {
                                Item item = items[index];
                                item.isBought = !item.isBought;
                                BlocFactory.instance.mainBloc.firebaseService
                                    .addItem(item);
                              }),
                            );
                          },
                        );
                },
              ),
            );
          }),
    );
  }
}
