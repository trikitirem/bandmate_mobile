import 'package:flutter/material.dart';

enum AvatarSize { big, small }

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.imageSrc, this.size});

  final String imageSrc;
  final AvatarSize? size;

  @override
  Widget build(BuildContext context) {
    final width = size == AvatarSize.small ? 48.0 : 64.0;

    return SizedBox(
      height: width,
      width: width,
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(size == AvatarSize.small ? 16.0 : 24.0),
        child: Image.network(
          imageSrc,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
