import 'package:book_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onSubmitted, required this.controller});

  final void Function(String)? onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted ,
      controller: controller,

      decoration: InputDecoration(
        
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.white)),
        focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: Colors.white)) ,
        hintText: 'Search',prefixIcon: IconButton(onPressed: () {
                GoRouter.of(context).pop();
              }, icon: Icon(Icons.arrow_back_rounded)), suffixIcon: IconButton(onPressed: (){}, icon: const Opacity(opacity: 0.8,
          child: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 24,
                ),

        ),)
      ),
    );
  }
}
