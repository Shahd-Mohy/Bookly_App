import 'package:book_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,
      style: Styels.textStyle18,
    );
  }
}
