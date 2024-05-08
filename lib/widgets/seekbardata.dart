import 'dart:math';

import 'package:flutter/material.dart';
class SeekBarData
{
  final Duration position;
  final Duration duration;
  SeekBarData(
    this.position,
    this.duration
);
}

class Seekbar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>?onChanged;
  final ValueChanged<Duration>?onChangeEnd;
  const Seekbar({
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangeEnd,
    Key? key}) : super(key: key);

  @override
  State<Seekbar> createState() => _SeekbarState();
}

class _SeekbarState extends State<Seekbar> {
  double? dragValue;
  String formatDuration(Duration? duration)
  {
    if(duration==null)
      {
        return '--:--';
      }
    else
      {
        String minutes=duration.inMinutes.toString().padLeft(2,'0');
        String second=duration.inSeconds.remainder(60).toString().padLeft(2,'0');
        return '$minutes:$second';
      }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(formatDuration(widget.position)),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: RoundSliderThumbShape(
                disabledThumbRadius: 4,
                enabledThumbRadius: 4,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 10,
              ),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white.withOpacity(0.2),
              thumbColor: Colors.white,
              overlayColor: Colors.white
            ),
            child: Slider(
            min: 0.0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(dragValue??widget.position.inMilliseconds.toDouble(),
            widget.duration.inMilliseconds.toDouble()),

              onChanged: (value){
              setState(() {
                dragValue=value;
              });
              if(widget.onChanged!=null)
                {
                  widget.onChanged!(
                      Duration(
                          milliseconds: value.round()));
                }
            },
              onChangeEnd: (value){
              if(widget.onChangeEnd!=null)
                {
                  widget.onChangeEnd!(
                    Duration(
                      milliseconds: value.round()
                    )
                  );
                }
              },
            ),
          ),
        ),
        Text(formatDuration(widget.duration))
      ],
    );
  }
}
