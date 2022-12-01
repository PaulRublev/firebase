import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:module_data/module_data.dart';
import 'package:module_model/module_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../firebase_options.dart';

class MyFirebaseService implements FirebaseService {
  late final CollectionReference<Item> _items;

  void referenceInit() {
    _items = FirebaseFirestore.instance.collection('items').withConverter<Item>(
          fromFirestore: (snapshot, options) => Item.fromJson(snapshot.data()!),
          toFirestore: (item, options) => item.toJson(),
        );
  }

  @override
  Future<FirebaseApp> firebaseInit() async {
    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Stream<List<Item>> streamItems() {
    return _items.snapshots().map(
          (event) => event.docs.map((e) => e.data()).toList(),
        );
  }

  @override
  void addItem(Item item) {
    _items.doc(item.name.toString().toLowerCase()).set(item);
  }

  @override
  void removeItem(Item item) {
    _items.doc(item.name.toString().toLowerCase()).delete();
  }

  @override
  void signIn() {
    kIsWeb ? _signInWithGoogleWeb() : _signInWithGoogle();
  }

  Future<UserCredential> _signInWithGoogleWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  Future<UserCredential?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}
