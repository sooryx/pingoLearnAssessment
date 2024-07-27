import 'package:pingolearn/Constants/imports.dart';

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Text(
          "Comments",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CustomTextField(
              controller: _nameController,
              hintText: "Name",
              validationType: ValidationType.name,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: _emailController,
              hintText: "Email",
              validationType: ValidationType.email,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
              validationType: ValidationType.password,
            ),
            const Spacer(),
            InkWell(
              onTap: () async {
             await signup(context:context);
              },
              child: Material(
                elevation: 30,
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                    height: 60.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: CustomColors.primaryColor),
                    child: Center(
                        child: Text(
                      "Signup",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ))),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    _nameController.clear();
                    _emailController.clear();
                    _passwordController.clear();
                    Navigator.pushReplacementNamed(context, "/signin");
                  },
                  child: Text(
                    " Signin",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

  signup({required BuildContext context}) async{
    showLoadingDialog(context, "Signing you up ...");
    try {
      await AuthService().registerWithEmailPassword(
          context: context,
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text);
    } catch (e) {
      Navigator.pop(context);
      customErrorToast(context, "Try again");
    }
  }
}
