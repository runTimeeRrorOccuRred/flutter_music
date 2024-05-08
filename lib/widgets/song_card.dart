import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:musicplayer_flutter/screens/song_screen.dart';

import '../models/song_model.dart';
class SongCard extends StatelessWidget {
  final Song songs;
  const SongCard({required this.songs,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Get.toNamed('/song',arguments: songs);

      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children:[
            Container(
            width: MediaQuery.of(context).size.width*0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage(songs.coverUrl),
                    fit: BoxFit.cover),

            ),
          ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.40,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(songs.title,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        softWrap: false,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.deepPurple.shade400,
                          fontWeight: FontWeight.bold
                        ),),
                        Text(songs.description,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),
                  ),
                  Icon(Icons.play_circle,
                  size: 30,
                  color: Colors.deepPurple,)
                ],
              )
            )

          ],
        ),
      ),
    );
  }
}
