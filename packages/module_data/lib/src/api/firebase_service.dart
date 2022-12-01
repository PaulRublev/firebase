import 'package:module_model/module_model.dart';

abstract class FirebaseService {
  void referenceInit();

  Future firebaseInit();

  Future<String> getImageUrl();

  Stream userChanges();

  Stream<List<Item>> streamItems();

  void addItem(Item item);

  void removeItem(Item item);

  void signIn();
}
