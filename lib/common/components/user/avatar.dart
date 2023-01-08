import 'package:flutter/material.dart';

enum AvatarSize { big, small }

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.imageSrc, this.size});

  final String imageSrc;
  final AvatarSize? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size == AvatarSize.small ? 32 : 64,
      width: 64,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Image.network(
          imageSrc,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
