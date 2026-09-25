import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscure = false,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool hideText = widget.obscure;

  static const _textStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.7,
    letterSpacing: 0,
    color: Color(0xFF000000),
  );

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) {
          final hasText = widget.controller.text.isNotEmpty;
          final border = _border(hasText ? const Color(0xFF525252) : const Color(0xFFC5C5C5));
          final textColor = widget.enabled && hasText ? const Color(0xFF000000) : const Color(0xFF717182);

          return TextField(
            controller: widget.controller,
            obscureText: hideText,
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            style: _textStyle.copyWith(color: textColor),
            decoration: InputDecoration(
              hintText: widget.hint,
              filled: true,
              fillColor: widget.enabled ? Colors.white : const Color(0xFF717182),
              hintStyle: _textStyle.copyWith(color: const Color(0xFF717182)),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              suffixIcon: widget.obscure
                  ? IconButton(
                      onPressed: () => setState(() => hideText = !hideText),
                      icon: Icon(
                        hideText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        size: 20,
                        color: const Color(0xFF717182),
                      ),
                    )
                  : null,
              enabledBorder: border,
              focusedBorder: border,
              disabledBorder: _border(const Color(0xFFC5C5C5)),
            ),
          );
        },
      ),
    );
  }
}
