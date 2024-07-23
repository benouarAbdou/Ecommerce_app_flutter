import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/widgets/effects/shimmer_effect.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: width - 2 * padding,
                height: height - 2 * padding,
                color: overlayColor,
                progressIndicatorBuilder: (context, url, progress) =>
                    const TShimmerEffect(
                  width: 56,
                  height: 56,
                  radius: 56,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                width: width - 2 * padding,
                height: height - 2 * padding,
                color: overlayColor,
              ),
      ),
    );
  }
}

//orgin in case of problem
/*import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/widgets/effects/shimmer_effect.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
              child: isNetworkImage
                  ? CachedNetworkImage(
                      imageUrl: image,
                      fit: fit,
                      color: overlayColor,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const TShimmerEffect(
                        width: 55,
                        height: 55,
                        radius: 55,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Image(
                      fit: fit, color: overlayColor, image: AssetImage(image))),
        ));
  }
}*/