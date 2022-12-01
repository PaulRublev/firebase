import 'package:flutter/material.dart';
import 'package:module_business/module_business.dart';

import 'src/widgets/app.dart';

void main() async {
  BlocFactory.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await BlocFactory.instance.mainBloc.firebaseService.firebaseInit();
  BlocFactory.instance.mainBloc.firebaseService.referenceInit();
  runApp(const App());
}
