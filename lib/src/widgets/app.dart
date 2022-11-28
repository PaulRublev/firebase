import 'package:flutter/material.dart';
import 'package:module_model/module_model.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => Items(),
        child: const HomePage(title: 'Список покупок'),
      ),
    );
  }
}
