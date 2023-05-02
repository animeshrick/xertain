import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String url;
  double height;
  double width;
  BoxFit? fit;

  CustomImageView(
      {Key? key,
      required this.url,
      this.width = 0.0,
      this.height = 0.0,
      BoxFit? fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: FadeInImage(
        placeholder: const NetworkImage('https://cdn.dribbble.com/users/436757/screenshots/2415904/placeholder_shot.gif'),
        image: NetworkImage(url),
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.network(
           'https://cdn.dribbble.com/users/436757/screenshots/2415904/placeholder_shot.gif',
            width: width != 0.0 ? width : null,
            height: height != 0.0 ? height : null,
          );
        },
        fit: fit ?? BoxFit.contain,
        width: width != 0.0 ? width : null,
        height: height != 0.0 ? height : null,
      ),
    );
  }
}
