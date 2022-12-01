import 'package:flutter/material.dart';
import 'package:module_business/module_business.dart';

import 'home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: BlocFactory.instance.mainBloc.firebaseService.userChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? const HomePage(title: 'Список покупок')
              : ElevatedButton(
                  onPressed:
                      BlocFactory.instance.mainBloc.firebaseService.signIn,
                  child: const Text('Login'),
                );
        },
      ),
    );
  }
}
