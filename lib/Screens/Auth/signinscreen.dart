import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingolearn/Constants/customthemes.dart';
import 'package:pingolearn/Services/AuthServices/authservices.dart';
import 'package:pingolearn/Widgets/custom_textfield.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.deepgreyColor.withOpacity(0.3),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Comments",
          style: Theme
              .of(context)
              .textTheme
              .displayLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.dg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            CustomTextField(
              controller: _emailController,
              hintText: "Email",

            ),
            SizedBox(height: 30.h,),
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
            ),
            Spacer(),
            InkWell(
              onTap: () {
                AuthService().signInWithEmailPassword(
                    context: context,
                    email: _emailController.text,
                    password: _passwordController.text);
              },
              child: Container(

                  height: 60.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: CustomColors.primaryColor),
                  child: Center(
                      child: Text("Login", style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),))
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New here ?", style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),),
                InkWell(
                  onTap: () {
                       Navigator.pushNamed(context,'/signup');
                  },
                  child: Text("SignUp", style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold,
                      color: CustomColors.primaryColor),),
                ),
              ],
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }
}
