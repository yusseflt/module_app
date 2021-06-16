import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:module_app/helpers/text_handler.dart';
import 'package:module_app/models/music_model.dart';

class PlayingContainer extends StatefulWidget {
  final AudioPlayer player;
  final Function() playPauseClick;
  final Function(double) onSliderChange;
  final MusicModel music;

  const PlayingContainer({
    Key? key,
    required this.player,
    required this.playPauseClick,
    required this.onSliderChange,
    required this.music,
  }) : super(key: key);

  @override
  _PlayingContainerState createState() => _PlayingContainerState();
}

class _PlayingContainerState extends State<PlayingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: 180,
      padding: EdgeInsets.all(16),
      child: StreamBuilder(
        stream: widget.player.positionStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: widget.player.hasPrevious
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.playPauseClick,
                      icon: Icon(
                        widget.player.playing ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: widget.player.hasPrevious
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Slider(
                  min: 0.0,
                  max: widget.music.duration?.inMilliseconds.toDouble() ?? 0.0,
                  value: snapshot.data.inMilliseconds.toDouble() ?? 0.0,
                  onChanged: widget.onSliderChange,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextHandler.musicDuration(snapshot.data),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      TextHandler.musicDuration(
                          widget.player.duration ?? Duration(seconds: 0)),
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
