import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth
      .instance; //this process can be elongated with the FirebaseApp as thus : FirebaseApp firebaseAppName = Firebase.app('firebaseAppName');   final auth = FirebaseApp.instanceFor(app: firebaseAppName);
  final _firestore = FirebaseFirestore.instance;

  Future<void> login(email, password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signup(name, email, password, phoneNumber) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'name': name,
        'email': email,
        'password': password,
        'phone': phoneNumber
      });
    }
  }

  Future<void> forgotpassword(email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signout() async{

  }
}
