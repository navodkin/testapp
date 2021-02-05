import 'package:flutter_application_1/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

final FirebaseAuth _auth = FirebaseAuth.instance;

// create user object based on firebased user
  TheUser _userFromFirebaseUser(User user)
  {
    return user != null ? TheUser (uid: user.uid) : null;
  }
  
  //auth change user stream
  Stream<TheUser> get user{
    return _auth.authStateChanges()
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map((User user) => _userFromFirebaseUser(user));

  }

  // Login Anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

// sign in with email & password
Future signInWithEmailAndPassword(String email, String password) async {
  try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
  } catch(e){
    print(e.toString());
    return null;
  }
}


// register with email & password
Future registerWithEmailAndPassword(String email, String password) async {
  try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
  } catch(e){
    print(e.toString());
    return null;
  }
}

// sign out
Future signOut() async {
  try{
    return await _auth.signOut();
  } catch(e){
    print(e.toString());
    return null;
  }
}

}