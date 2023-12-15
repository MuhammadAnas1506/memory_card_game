import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final double width;
  final double? height;
  final EdgeInsets? padding;
  final Function()? onTap;
  final String text;

  const TextContainer(
      {Key? key,
      this.width = double.infinity,
      this.height,
      this.onTap,
      this.padding,
      required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 8,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AutoSizeText(
            text,
            minFontSize: 30,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
