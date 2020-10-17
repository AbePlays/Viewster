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

Future<void> signUp(String email, String password, String name) async {
  try {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    print(user);
    await createUserInFirestore(user, name);
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

Future<void> createUserInFirestore(User user, String name) async {
  try {
    await firestore.collection('users').doc(user.uid).set({
      "name": name,
      "email": user.email,
      "favoriteMovies": [],
      "favoriteShows": []
    });
  } catch (e) {
    print(e);
  }
}

User getCurrentUser() {
  try {
    User user = auth.currentUser;
    return user;
  } catch (e) {
    print(e);
  }

  return null;
}

Future<void> updateFirestore(List movies, List shows) async {
  User user = getCurrentUser();
  if (user == null) {
    print("Error");
    return;
  }
  try {
    DocumentSnapshot doc =
        await firestore.collection("users").doc(user.uid).get();
    Map docData = doc.data();
    docData['favoriteMovies'] = movies;
    docData['favoriteShows'] = shows;

    await firestore.collection("users").doc(user.uid).update({
      "favoriteMovies": docData['favoriteMovies'],
      "favoriteShows": docData['favoriteShows']
    });
  } catch (e) {
    print(e);
  }
}

Future<Map> getDataFromFirestore() async {
  User user = getCurrentUser();
  if (user == null) {
    print("Error");
    return null;
  }
  try {
    DocumentSnapshot doc =
        await firestore.collection("users").doc(user.uid).get();
    Map docData = doc.data();
    return docData;
  } catch (e) {
    print(e);
  }
  return null;
}
