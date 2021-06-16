import 'package:flutter/material.dart';
import 'package:module_app/bloc/music_list_bloc.dart';
import 'package:module_app/helpers/text_handler.dart';
import 'package:module_app/models/music_model.dart';
import 'package:module_app/widgets/music_list_item.dart';
import 'package:module_app/widgets/playing_container.dart';

class MusicListPage extends StatefulWidget {
  const MusicListPage({Key? key}) : super(key: key);

  @override
  _MusicListPageState createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage> {
  MusicListBloc bloc = MusicListBloc();
  MusicModel? selectedMusic;

  @override
  void initState() {
    super.initState();
    bloc.getAudioList();
  }

  @override
  void deactivate() async {
    super.deactivate();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: bloc.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                child: Text(
                  'Erro: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            return Container(
              child: Stack(children: [
                ListView(
                  children: snapshot.data
                      .map<Widget>(
                        (MusicModel item) => MusicListItem(
                            isSelected: selectedMusic == item,
                            onTap: () {
                              selectedMusic = item;
                              bloc.initAudioPlayer(item, type: item.type);
                              setState(() {});
                            },
                            music: item),
                      )
                      .toList(),
                ),
                selectedMusic != null
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: PlayingContainer(
                          player: bloc.player,
                          playPauseClick: () {
                            bloc.playOrPause();
                          },
                          onSliderChange: (double value) {
                            bloc.changeTime(
                                Duration(milliseconds: value.toInt()));
                          },
                          music: selectedMusic!,
                        ),
                      )
                    : Container(),
              ]),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
