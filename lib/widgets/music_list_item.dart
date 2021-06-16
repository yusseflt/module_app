import 'package:flutter/material.dart';
import 'package:module_app/helpers/text_handler.dart';
import 'package:module_app/models/music_model.dart';

class MusicListItem extends StatelessWidget {
  final bool isSelected;
  final Function() onTap;
  final MusicModel music;

  const MusicListItem({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.music,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextHandler.musicDuration(music.duration!),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    music.name!,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    music.artist!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            isSelected
                ? Container(
                    child: Text(
                      'PLAYING',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
