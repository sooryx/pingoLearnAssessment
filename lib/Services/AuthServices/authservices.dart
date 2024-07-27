
import'package:pingolearn/Constants/imports.dart';



class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await SharedPreferencesManager().setLoggedIn(true);
      await SharedPreferencesManager().storeLoginData(name: result.user?.displayName ?? "User", email: email);
      await customSuccessToast(context, "Login Success");

      await Navigator.pushNamed(context, "/homescreen");

      return result.user;

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
        case 'user-disabled':
          errorMessage = "This user has been disabled.";
          break;
        case 'user-not-found':
          errorMessage = "No user found with this email.";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password.";
          break;
        default:
          errorMessage = "Login Failed! ${e.message}";
          break;
      }
      await customErrorToast(context, errorMessage);
      return null;
    } catch (e) {
      await customErrorToast(context, "Login Failed! An unknown error occurred.");
      return null;
    }
  }


  Future<User?> registerWithEmailPassword(
      {required BuildContext context,required String name, required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'user_name': name,
        'user_email': email,
      });
      await SharedPreferencesManager().setLoggedIn(true);
      await SharedPreferencesManager().storeLoginData(name: result.user?.displayName ?? "User", email: email);
      await customSuccessToast(context, "Registered Successfully");
      await Navigator.pushNamed(context, "/homescreen");

      return user;
    } on FirebaseAuthException {
      Navigator.pop(context);
      await customErrorToast(context, "Registeration failed !");

      return null;
    }
  }

  static Future<void>userLogout({
    required BuildContext context
})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.pushReplacementNamed(context,'/signin');
  }
}
