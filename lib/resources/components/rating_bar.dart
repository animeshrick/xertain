import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final bool isSmall;

  const StarRating(
      {Key? key,
      this.starCount = 5,
      this.rating = 0,
      this.isSmall = false,
      required this.onRatingChanged,
      required this.color})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Colors.yellow.shade800,
        size: isSmall == true ? 15 : 24,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: isSmall == true ? 15 : 24,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: isSmall == true ? 15 : 24,
      );
    }
    return GestureDetector(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isSmall == true ? 20 : 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, int i) => buildStar(context, i),
        separatorBuilder: (_, __) => const SizedBox(
          width: 10,
        ),
        itemCount: starCount,
      ),
    );
  }
}
