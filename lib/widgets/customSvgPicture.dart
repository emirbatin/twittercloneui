import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewSvgPicture extends StatelessWidget {
  final String imagePath;

  const NewSvgPicture({
    Key key,
    @required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      height: 20,
    );
  }
}
