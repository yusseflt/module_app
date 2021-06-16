import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:module_app/models/music_model.dart';
import 'package:rxdart/subjects.dart';

class MusicListBloc {
  PublishSubject<List<MusicModel>>? _musicListSubject;
  Stream<List<MusicModel>> get stream => _musicListSubject!.stream;
  AudioPlayer player = AudioPlayer();

  MusicListBloc() {
    _musicListSubject = PublishSubject<List<MusicModel>>();
  }

  Future getAudioList() async {
    try {
      List<MusicModel> list = [];

      Duration? duration1;
      Duration? duration2;
      Duration? duration3;
      Duration? duration4;

      await Future.wait([
        (() async {
          AudioPlayer player = AudioPlayer();
          duration1 = await player.setUrl(
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
        })(),
        (() async {
          AudioPlayer player = AudioPlayer();
          duration2 = await player.setUrl(
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3');
        })(),
        (() async {
          AudioPlayer player = AudioPlayer();

          duration3 = await player.setUrl(
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3');
        })(),
        (() async {
          AudioPlayer player = AudioPlayer();

          duration4 = await player.setAsset('assets/else.mp3');
        })(),
      ]);

      list.add(MusicModel(
        name: 'SoundHelix Song 1',
        artist: 'T. Schürger',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        duration: duration1,
      ));

      list.add(MusicModel(
        name: 'SoundHelix Song 7',
        artist: 'T. Schürger',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3',
        duration: duration2,
      ));
      list.add(MusicModel(
        name: 'SoundHelix Song 10',
        artist: 'T. Schürger',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3',
        duration: duration3,
      ));
      list.add(MusicModel(
        name: 'Else',
        artist: 'Paris',
        url: 'assets/else.mp3',
        duration: duration4,
        type: 'asset',
      ));

      _musicListSubject!.sink.add(list);
    } catch (e) {
      _musicListSubject!.addError(e);
    }
  }

  Future playOrPause() async {
    switch (player.playing) {
      case true:
        player.pause();
        break;
      default:
        player.play();
    }
  }

  Future changeTime(Duration changeTo) async {
    await player.seek(changeTo);
  }

  Future initAudioPlayer(MusicModel music, {String? type}) async {
    if (type == 'asset') {
      await player.setAsset(music.url!);
    } else {
      await player.setUrl(music.url!);
    }

    await player.play();
  }

  Future dispose() async {
    player.stop();
  }
}
