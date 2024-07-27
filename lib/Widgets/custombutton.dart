import 'package:pingolearn/Constants/imports.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 30,
        borderRadius: BorderRadius.circular(12.r),

        child: Container(
          height: 60.h,
          width: 220.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: CustomColors.primaryColor,
          ),
          child: Center(
            child: Text(
              "Login",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
