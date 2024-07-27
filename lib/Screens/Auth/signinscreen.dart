import'package:pingolearn/Constants/imports.dart';
import 'package:pingolearn/Widgets/custombutton.dart';



class SigninScreen extends StatelessWidget {
   SigninScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Text(
          "Comments",
          style: Theme
              .of(context)
              .textTheme
              .displayLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:25.h,horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CustomTextField(
              controller: _emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              validationType: ValidationType.email,
            ),
            SizedBox(height: 30.h),
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
              validationType: ValidationType.password,

            ),
            const Spacer(),
            CustomButton(
              title: "Login",
              onTap: () async {
              await login(context:context);
              },
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New here ?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    _emailController.clear();
                    _passwordController.clear();
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text(
                    " SignUp",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  login({required BuildContext context}) async{
    showLoadingDialog(context, "Logging you in...", );
    try{
      await AuthService().signInWithEmailPassword(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
      );
    }catch(e){
      customErrorToast(context, "Try logging in again");
    }
  }
}
