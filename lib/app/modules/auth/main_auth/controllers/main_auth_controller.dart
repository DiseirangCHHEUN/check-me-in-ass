import 'package:check_me_in/app/modules/auth/main_auth/views/main_auth_view.dart';
import 'package:check_me_in/app/modules/home/views/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainAuthController extends GetxController {
  static MainAuthController get instance => Get.find();
  // RxBool isSignIn = true.obs;

  // onToggle() {
  //   isSignIn.value = !isSignIn.value;
  // }

  // declare variable
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _firestore = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    // allow user to be null
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const MainAuthView())
        : {
            Get.offAll(() => const HomeView()),
            // profileController.fetchUserProfile(),
          };
  }

  // sign in with Google Account
  Future<User?> signInWithGoogle() async {
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
        await _auth.signInWithCredential(credential);
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
  }
}
