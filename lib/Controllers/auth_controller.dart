import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lawgism/Models/user.dart';

class AuthController with ChangeNotifier {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  SharedPreferences? _prefs;

  Stream<auth.User?> get authStateChanges => _auth.authStateChanges();

  User _user = User();
  bool _walkthrough = true;
  User get user => _user;
  String get uid => _auth.currentUser?.uid ?? "";
  bool get walkthrough => _walkthrough;
  set walkthrough(bool v) {
    _walkthrough = v;
    _prefs?.setBool('walkthrough', v);
  }

  bool _isLoading = false;
  bool _editEnabled = false;
  bool _isSigningIn = false;

  bool get isLoading => _isLoading;
  set isLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  bool get editEnabled => _editEnabled;
  set editEnabled(bool v) {
    _editEnabled = v;
    notifyListeners();
  }

  bool get isSigningIn => _isSigningIn;
  set isSigningIn(bool v) {
    _isSigningIn = v;
    notifyListeners();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<User> _cachedUsers = [];

  Future<User> getUser(String uid) async {
    if (uid == _auth.currentUser!.uid) return user;
    final int idx = _cachedUsers.indexWhere((e) => e.id == uid);
    if (idx != -1) return _cachedUsers[idx];
    final User fetchedUser = await fetchUserProfile(uid);
    _cachedUsers.add(fetchedUser);
    return fetchedUser;
  }

  void updateProfile({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? photoUrl,
    bool? walkthrough,
  }) {
    _user = _user.copyWith(
      name: name ?? _user.name,
      email: email ?? _user.email,
      phone: phone ?? _user.phone,
      address: address ?? _user.address,
      photoUrl: photoUrl ?? _user.photoUrl,
    );

    nameController.text = name ?? nameController.text;
    emailController.text = email ?? emailController.text;
    phoneController.text = phone ?? phoneController.text;
    addressController.text = address ?? addressController.text;

    notifyListeners();
  }

  Future<User> fetchUserProfile(String uid) async {
    return User.fromJson(
        (await _firestore.collection('Users').doc(uid).get()).data() ?? {});
  }

  Future<void> fetchProfile() async {
    isLoading = true;

    if (_auth.currentUser != null) {
      final DocumentSnapshot doc = await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (doc.exists) {
        _user = User.fromJson(doc.data() ?? {});
      } else
        _user = _user.copyWith();
    }

    nameController.text = _user.name;
    emailController.text = _user.email;
    phoneController.text = _user.phone;
    addressController.text = _user.address;

    isLoading = false;
  }

  Future<void> updateOnlineProfile() async {
    isLoading = true;

    await _firestore
        .collection('Users')
        .doc(_auth.currentUser!.uid)
        .set(_user.toJson(), SetOptions(merge: true));

    isLoading = false;
  }

  Future<void> updatePhoto(File photo) async {
    Reference photoRef = FirebaseStorage.instance
        .ref()
        .child("profile_photos")
        .child(_auth.currentUser!.uid);
    UploadTask uploadTask = photoRef.putFile(photo,
        SettableMetadata(customMetadata: {"ownerId": _auth.currentUser!.uid}));

    await uploadTask.whenComplete(() async {
      String photoUrl = (await photoRef.getDownloadURL()).toString();

      updateProfile(photoUrl: photoUrl);
      await updateOnlineProfile();

      notifyListeners();
    });
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    isSigningIn = true;

    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    _user = User(
      email: email,
      id: _auth.currentUser!.uid,
    );
    await updateOnlineProfile();

    isSigningIn = false;
  }

  Future<void> signInWithEmailAndPassword() async {
    await _signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    passwordController.text = "";
  }

  Future<void> _signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    isSigningIn = true;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {} finally {}
    _user = User(
      id: _auth.currentUser!.uid,
    );
    updateProfile(email: emailController.text);
    await updateOnlineProfile();

    isSigningIn = false;
  }

  Future<void> signInWithGoogle() async {
    isSigningIn = true;

    bool silently = true;

    GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn.standard().signInSilently();

    if (googleSignInAccount == null) {
      googleSignInAccount = await GoogleSignIn.standard().signIn();
      silently = false;
    }

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final auth.UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        if (!silently) {
          _user = User(
            id: _auth.currentUser!.uid,
            name: googleSignInAccount.displayName ?? "",
            email: googleSignInAccount.email,
            photoUrl: googleSignInAccount.photoUrl ?? "",
          );
          await updateOnlineProfile();
        }
      } on auth.FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    isSigningIn = false;
  }

  Future<void> signOut() async {
    isSigningIn = false;
    await _auth.signOut();
  }
}
