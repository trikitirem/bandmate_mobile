import 'package:flutter/material.dart';
import 'package:mobile/features/swiping/view/components/musician_card/photos/change_photo_button.dart';

import '../../../../../../common/models/musician/name.dart';

const _photosLinks = <String>[
  "https://kulturalnemedia.pl/wp-content/uploads/2018/08/splash.jpg",
  "https://www.nme.com/wp-content/uploads/2022/09/NME-HERO-BMTH-1@2560x1625.jpg",
  "https://www.electriccallboy.com/wp-content/uploads/2022/04/Spaceman2-web-scaled.jpg"
];

enum Direction { forward, back }

const borderRadius = BorderRadius.only(
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);

class MusicianPhotos extends StatefulWidget {
  const MusicianPhotos({super.key, required this.name, this.description});

  final Name name;
  final String? description;

  @override
  State<MusicianPhotos> createState() => _MusicianPhotosState();
}

class _MusicianPhotosState extends State<MusicianPhotos> {
  int _currentPhoto = 0;

  changePhoto(Direction direction) {
    if (direction == Direction.forward &&
        _currentPhoto < _photosLinks.length - 1) {
      setState(() {
        _currentPhoto += 1;
      });
    }

    if (direction == Direction.back && _currentPhoto > 0) {
      setState(() {
        _currentPhoto -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 2,
          child: Image.network(
            _photosLinks[_currentPhoto],
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _currentPhoto == 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "${widget.name.firstName} ${widget.name.lastName ?? ""}",
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      widget.description != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                widget.description!,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  )
                : Container(),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Row(
            children: [
              ChangePhotoButton(onTap: () => changePhoto(Direction.back)),
              ChangePhotoButton(onTap: () => changePhoto(Direction.forward)),
            ],
          ),
        ),
      ],
    );
  }
}
