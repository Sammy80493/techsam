import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:techsam/util/constants.dart';

class ImgFetchingWidget extends StatelessWidget {
  const ImgFetchingWidget({
    super.key,
    required this.imageUrl,
    required this.aspectRatio,
  });
  final String imageUrl;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Constants.showLoader(size: 20),
        filterQuality: FilterQuality.high,
        fadeInCurve: Curves.easeInBack,
        errorWidget: (context, url, error) => Center(
          child: Constants.showLoader(size: 20),
        ),
        fadeOutCurve: Curves.easeInQuart,
      ),
    );
  }
}
