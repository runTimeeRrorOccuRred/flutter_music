import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/playlist_model.dart';

class PlayListCard extends StatelessWidget {
  final PlayList playlist;
  const PlayListCard({required this.playlist,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/playlist',arguments: playlist);
      },
      child: Container(
        height: 70,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade900.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              child: Image.network(playlist.imageUrl,height: 50,width: 50,
                fit: BoxFit.cover,),
              borderRadius: BorderRadius.circular(15),
            ),
            SizedBox(width: 10,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(playlist.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                  Text('${playlist.songs.length} songs',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.play_circle,color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
