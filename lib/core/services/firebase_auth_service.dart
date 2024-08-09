import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitapp/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقا. الرجاء تسجيل الدخول');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من اتصالك بالانترنت');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخري');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService');
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخري');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService');
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw CustomException(
            message: 'البريد الالكتروني أو الرقم السري غير صحيح');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخري');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService');
      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخري');
    }
  }
}
