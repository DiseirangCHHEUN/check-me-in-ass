import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../routes/app_pages.dart';
import '../exceptions/authentication_failure.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.put(AuthRepository());

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _firestore = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    // allow user to be null
    firebaseUser = Rx<User?>(_firebaseAuth.currentUser);
    firebaseUser.bindStream(_firebaseAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAllNamed(Routes.SIGNIN)
        : {
            Get.offAllNamed(Routes.DASHBOARD),
            // profileController.fetchUserProfile(),
          };
    // print("Name : ${user!.displayName}");
  }

  // sign in with Google Account
  Future<User?> signInWithGoogle() async {
    try {
      isLoading(true);

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null; // The user canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final User? user = userCredential.user;

      // Save user data to Firestore
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set(
          {
            'fullName': user.displayName,
            'email': user.email,
            'imageUrl': user.photoURL,
            'lastSignInTime': user.metadata.lastSignInTime,
            'creationTime': user.metadata.creationTime,
          },
          SetOptions(
              merge: true), // Merge true to avoid overwriting existing data
        );
      }

      isLoading(false);

      // Get.offAllNamed(Routes.HOME);

      return user;
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      Get.snackbar(e.code.toString(), ex.toString());
      // print(ex);
    } catch (_) {
      const ex = AuthenticationFailure();
      Get.snackbar("Error occured!", ex.msg);
      // print(ex);
    }
    return null;
  }

  // sign out method
  Future<void> signOut() async {
    try {
      isLoading(true);
      await _firebaseAuth.signOut();
      isLoading(false);
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      Get.snackbar(e.code.toString(), ex.toString());
      // print(ex);
    } catch (_) {
      const ex = AuthenticationFailure();
      Get.snackbar("Error occured!", ex.msg);
      // print(ex);
    }
  }

  // Future<void> login() async {
  //   String username = emailController.text;
  //   String password = passwordController.text;

  //   if (username.isEmpty || password.isEmpty) {
  //     Get.snackbar('Invalid!', 'Please enter both username and password.');
  //     return;
  //   }

  //   try {
  //     isLoading(true);
  //     // Fetch the document from Firestore where the username matches
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('user')
  //         .where('id', isEqualTo: username)
  //         .limit(1)
  //         .get();

  //     if (querySnapshot.docs.isEmpty) {
  //       Get.snackbar(
  //           'Invalid credentail!', 'No user found with that username.');

  //       return;
  //     }

  //     // Assuming usernames are unique, there will be only one document
  //     DocumentSnapshot userDoc = querySnapshot.docs.first;

  //     // Check if the password matches
  //     if (userDoc['password'] == password) {
  //       Get.snackbar('Successful!', 'Sign in successfully.');
  //       // Navigate to the next page, e.g., HomePage
  //       Get.offAllNamed('/dashboard');
  //     } else {
  //       Get.snackbar('Invalid!', 'Incorrect password.');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     final ex = AuthenticationFailure.code(e.code);
  //     Get.snackbar(ex.title, ex.msg);
  //   } catch (e) {
  //     Get.snackbar(
  //         'Invalid!', 'An error occurred during login. Please try again.');
  //     const ex = AuthenticationFailure();
  //     Get.snackbar(ex.title, ex.msg);
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
