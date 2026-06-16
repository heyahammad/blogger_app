import 'package:blogger/core/theme/color_pallate.dart';
import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorPallate.gradient1,
      borderRadius: BorderRadius.circular(15),
      // child: Container(
      //   alignment: Alignment.center,
      //   height: 50,
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //     gradient: const LinearGradient(
      //       colors: [ColorPallate.gradient1, ColorPallate.gradient2],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     ),
      //   ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          child: Text(text),
        ),
      ),
    );
  }
}
