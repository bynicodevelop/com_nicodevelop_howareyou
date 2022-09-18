import 'package:com_nicodevelop_howareyou/config/contants.dart';
import 'package:flutter/material.dart';

class MainButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MainButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kDefaultPadding * 3,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();

          onPressed();
        },
        child: Text(text),
      ),
    );
  }
}
