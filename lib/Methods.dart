import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try{
    User? user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password)).user;

    if(user != null) {
      print("Account Creation Successful :)");
      return user;
    }
    else{
      print("Account Creation Failed");
      return user;
    }
  }
  catch(e){
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try{
    User? user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password)).user;
    if(user != null){
      print("Login Successful!!!");
      return user;
    }
    else{
      print("Login Failed :(");
      return user;
    }
  }catch(e) {
    print(e);
    return null;
  }
}

Future logOut() async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try{
    await _auth.signOut();
  }catch(e) {
    print("Error in logout!!!");
  }
}
