import'package:pingolearn/Constants/imports.dart';

enum ValidationType { name, email, password }

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValidationType validationType;

  const CustomTextField({
    super.key,
    this.hintText = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.validationType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with SingleTickerProviderStateMixin {
  bool? _isValid;
  bool _isTyping = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _validateInput(String value) {
    setState(() {
      _isTyping = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        switch (widget.validationType) {
          case ValidationType.email:
            _isValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
            break;
          case ValidationType.password:
            _isValid = value.length >= 6;
            break;
          case ValidationType.name:
            _isValid = value.isNotEmpty;
            break;
        }
        _isTyping = false;
        _animationController.forward(from: 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12.r),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: _validateInput,
        style: const TextStyle(color: Colors.black), // Text color
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black54), // Hint text color
          filled: true,
          fillColor: Colors.white, // Background color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // Border radius
            borderSide: BorderSide.none, // Remove border line
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // Border radius
            borderSide: BorderSide.none, // Remove border line
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // Border radius
            borderSide: BorderSide.none, // Remove border line
          ),
          suffixIcon: _isTyping
              ? const Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              width: 10.0,
              height: 10.0,
              child: CircularProgressIndicator(strokeWidth: 2.0),
            ),
          )
              : FadeTransition(
            opacity: _animationController,
            child: _isValid == null
                ? null
                : (_isValid!
                ? const Icon(
              Icons.check,
              color: Colors.green,
            )
                : const Icon(
              Icons.close,
              color: Colors.red,
            )),
          ),
        ),
      ),
    );
  }
}
