// ignore_for_file: empty_catches, unused_catch_clause

import 'package:authcheck/src/features/repository/exceptions/signup_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables

  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser = firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    // ignore: unrelated_type_equality_checks
    user == null
        // ignore: unrelated_type_equality_checks
        ? Get.offAll('/welcomepage')
        : Get.offAll('/homepage');
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseUser.value != null) {
        print('FIREBASE USER -${firebaseUser.value}');
        Get.offAll('/homepage');
      } else {
        Get.to('/welcomepage');
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION -${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
