import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:pingolearn/Constants/customthemes.dart';
import 'package:toastification/toastification.dart';

customSuccessToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    title: Text(message),
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.flat,
    alignment: Alignment.bottomCenter,
    type: ToastificationType.success,
    showProgressBar: true,
    borderRadius: BorderRadius.circular(30),
    margin: const EdgeInsets.symmetric(horizontal: 50),
    dragToClose: true,
    closeButtonShowType: CloseButtonShowType.always,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

customErrorToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    applyBlurEffect: true,
    title: Text(message),
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.flat,
    alignment: Alignment.bottomCenter,
    type: ToastificationType.error,
    showProgressBar: true,
    borderRadius: BorderRadius.circular(30.r),
    margin: EdgeInsets.symmetric(horizontal: 50.w),
    dragToClose: true,
    closeButtonShowType: CloseButtonShowType.always,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

customRandomToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    title: Text(message),
    animationDuration: const Duration(milliseconds: 300),
    autoCloseDuration: const Duration(seconds: 2),
    style: ToastificationStyle.flat,
    alignment: Alignment.bottomCenter,
    type: ToastificationType.info,
    showProgressBar: true,
    borderRadius: BorderRadius.circular(30.r),
    margin: EdgeInsets.symmetric(horizontal: 50.w),
    dragToClose: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

showLoadingDialog(BuildContext context, String? message,LottieBuilder? lottie) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              lottie ?? SpinKitDualRing(color: CustomColors.primaryColor),
              const SizedBox(height: 20.0),
              Text(
                message ?? "Loading...",
                style: TextStyle(fontSize: 16.sp,color: Colors.white),
              ),
            ],
          ),
        ),
      );
    },
  );
}
