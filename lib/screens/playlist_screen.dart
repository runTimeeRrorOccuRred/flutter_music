
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/playlist_model.dart';
class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  bool isPlay=true;
  PlayList playlist=Get.arguments??PlayList.playlist[0];
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade900.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.8)
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("PlayList"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(playlist.imageUrl,
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.width*0.3,
                  fit: BoxFit.cover,),
                ),
                SizedBox(height: 20,),
                Text(playlist.title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isPlay=!isPlay;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Stack(
                      children:[
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 200),
                          left: isPlay?0: MediaQuery.of(context).size.width*0.45,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade400,
                              borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                        ),
                        Row(children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('Play',
                                  style: TextStyle(color:isPlay? Colors.white:Colors.deepPurple,
                                      fontSize: 18),),
                              ),
                              SizedBox(width: 10,),
                              Icon(Icons.play_circle,
                                color:isPlay? Colors.white:Colors.deepPurple,),
                            ],
                          ),
                        ),
                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Center(
                               child: Text('Shuffle',
                                 style: TextStyle(
                                     color: isPlay?Colors.deepPurple:Colors.white,
                                     fontSize: 18
                                 ),),
                             ),
                             SizedBox(width: 10,),
                             Icon(Icons.shuffle,
                               color:isPlay? Colors.deepPurple:Colors.white,)
                           ],
                         ),
                       )

                      ],)],
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: playlist.songs.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: Text('${index+1}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
                        title: Text(playlist.songs[index].title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
                        subtitle: Text('${playlist.songs[index].description} 02:45'),
                        trailing: Icon(Icons.more_vert,color: Colors.white,),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
