import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../models/song_model.dart';
import '../widgets/seekbardata.dart';
class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  Song song= Get.arguments?? Song.songs[0];
  AudioPlayer audioPlayer=AudioPlayer();
  @override
  void initState()
  {
    super.initState();
    audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse('asset:///${song.url}'))

    ]));
  }
  @override
  void dispose()
  {
    audioPlayer.dispose();
    super.dispose();
  }
  Stream<SeekBarData> get _seekBarDataStream =>
  rxdart.Rx.combineLatest2<Duration,Duration?,SeekBarData>(
    audioPlayer.positionStream,
    audioPlayer.durationStream,
      (Duration position, Duration? duration){
      return SeekBarData(position,duration?? Duration.zero);
      }
  );
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,

        children: [
          Image.asset(song.coverUrl,
          fit: BoxFit.cover,),
          ShaderMask(
            shaderCallback: (rect){
              return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.0),
                  ],
                stops: [0.0,0.4,0.6]
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,

            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.deepPurple.shade200,
                        Colors.deepPurple.shade900
                      ]
                  )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song.title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
               const SizedBox(height: 10,),
                Text(song.description,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
               const SizedBox(height: 10,),
                StreamBuilder(stream: _seekBarDataStream, builder: (context,snapshot){
                  final positionData= snapshot.data;
                  return Seekbar(
                    position: positionData?.position ?? Duration.zero,
                    duration: positionData?.duration ?? Duration.zero,
                    onChangeEnd: audioPlayer.seek,);
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                    [
                      StreamBuilder<SequenceState?>(
                          stream: audioPlayer.sequenceStateStream,
                          builder: (context,index){
                            return IconButton(
                            onPressed: audioPlayer.hasPrevious?audioPlayer.seekToPrevious:null,
                            icon:Icon(Icons.skip_previous,
                            color: Colors.white,),
                            iconSize: 45);
                          }),
                    StreamBuilder<PlayerState>(
                        stream: audioPlayer.playerStateStream,
                        builder: (context,snapshot)
                    {
                      if(snapshot.hasData)
                        {
                          final playerState=snapshot.data;
                          final processingState=(playerState! as PlayerState).processingState;
                          if(processingState==ProcessingState.loading ||
                              processingState==ProcessingState.buffering)
                            {
                              return Container(
                                width: 64,
                                height: 64,
                                margin: EdgeInsets.all(20),
                                child: CircularProgressIndicator(),
                              );
                            }
                          else if(!audioPlayer.playing)
                            {
                              return IconButton(
                                onPressed: (){
                                audioPlayer.play();
                              }, icon: Icon(Icons.play_circle,
                              color: Colors.white,
                              ),
                                iconSize: 75,
                              );
                            }
                          else if(processingState!=ProcessingState.completed)
                            {
                              return IconButton(onPressed: (){
                                audioPlayer.pause();
                              }, icon:Icon(Icons.pause_circle,
                              color: Colors.white,) ,
                              iconSize: 75,);
                            }
                          else
                            {
                              return IconButton(onPressed: (){
                                audioPlayer.seek(
                                    Duration.zero,
                                    index: audioPlayer.effectiveIndices!.first);
                              }, icon: Icon(Icons.replay_circle_filled_outlined,
                              color: Colors.white,),
                              iconSize: 75,
                              );
                            }

                        }
                      else
                        {
                          return CircularProgressIndicator();
                        }
                    }),

                      StreamBuilder<SequenceState?>(
                          stream: audioPlayer.sequenceStateStream,
                          builder: (context,index){
                            return IconButton(
                                onPressed: audioPlayer.hasNext?audioPlayer.seekToNext:null,
                                icon:Icon(Icons.skip_next,
                                  color: Colors.white,),
                                iconSize: 45);
                          }),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
