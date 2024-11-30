import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ClipRRect(borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.5 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill
            ,imageUrl: imageUrl,
            placeholder:(context, url) => const Center(child: CircularProgressIndicator(),),
            errorWidget: (context, url, error)=> const Icon(Icons.error_outline_rounded) ,),
            
        ),
      ),
    );
  }
}
