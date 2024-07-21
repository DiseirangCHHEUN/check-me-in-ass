import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../exceptions/authentication_failure.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  // static AuthRepository get instance => Get.put(AuthRepository());

  final _firebaseAuth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

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
        ? Get.offAllNamed(Routes.LOGIN)
        : {
            Get.offAllNamed(Routes.HOME),
            // profileController.fetchUserProfile(),
          };
    // print("Name : ${user!.displayName}");
  }

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      Get.snackbar(ex.title, ex.msg);
    } catch (_) {
      const ex = AuthenticationFailure();
      Get.snackbar(ex.title, ex.msg);
    }
  }
}
