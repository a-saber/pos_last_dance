import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget Function(ImageProvider) imageBuilder;
  final BorderRadiusGeometry? borderRadius;
  final double width;
  final double height;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.imageBuilder,
    this.borderRadius, required this.width, required this.height
  });
  Widget _errorPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      child: const Icon(Icons.broken_image, color: Colors.grey),
    );
  }
  @override
  Widget build(BuildContext context) {
    final isValidUrl = imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true;

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: !isValidUrl ?
      _errorPlaceholder() :
      CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => imageBuilder(imageProvider),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
          child: Container(
            color: Colors.white,
          ),
        ),
        errorWidget: (context, url, error) => _errorPlaceholder(),
      ),
    );
  }
}
