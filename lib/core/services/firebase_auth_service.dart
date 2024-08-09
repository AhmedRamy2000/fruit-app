import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruitapp/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  //create user with email and password service
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

//login with email and password service
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

//login use gmail account service
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

//login use facebook account service
  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

//login use apple account service
  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential)).user!;
  }
}
