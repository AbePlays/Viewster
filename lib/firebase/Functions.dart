import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signIn(String email, String password) async {
  try {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    print(user);
  } catch (e) {
    print(e);
  }
}

Future<void> signUp(String email, String password) async {
  try {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    print(user);
    await createUserInFirestore(user);
  } catch (e) {
    print(e);
  }
}

Future<void> signout() async {
  try {
    await auth.signOut();
  } catch (e) {
    print(e);
  }
}

Future<void> createUserInFirestore(User user) async {
  try {
    await firestore.collection('users').doc(user.uid).set({
      "name": "Test",
      "email": user.email,
    });
  } catch (e) {
    print(e);
  }
}
