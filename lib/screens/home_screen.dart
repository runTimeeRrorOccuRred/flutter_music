import 'package:flutter/material.dart';
import 'package:musicplayer_flutter/models/playlist_model.dart';
import 'package:musicplayer_flutter/widgets/playlist_card.dart';

import '../models/song_model.dart';
import '../widgets/song_card.dart';
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<Song> songs= Song.songs;
  List<PlayList>playlist=PlayList.playlist;
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
          leading: Icon(Icons.grid_view_rounded,
          color: Colors.white,),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: CircleAvatar(),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
         backgroundColor: Colors.deepPurple.shade900.withOpacity(0.8),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
         //  showSelectedLabels: false,
         //  showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home'),

            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill_outlined),
                label: 'Play',),

            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined),
                label: 'Profile')

          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome",
              style: Theme.of(context).textTheme.bodyLarge,),
              SizedBox(height: 5,),
              Text('Enjoy your favourite music',
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextFormField(
                style: TextStyle(color: Colors.black38,
                  decoration: TextDecoration.none

                ),
                decoration: InputDecoration(

                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,bottom: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('90s songs',
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,fontWeight: FontWeight.bold
                          ),),
                          Text('View More',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(height: MediaQuery.of(context).size.height*0.27,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: songs.length,
                            itemBuilder: (context,index){
                            return SongCard(songs: songs[index]);
                            }),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only( right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Trending songs',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.white,fontWeight: FontWeight.bold
                            ),),
                          Text('View More',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                        padding:const EdgeInsets.only(top: 20),
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: playlist.length,
                        itemBuilder: (context,index){
                          return PlayListCard(playlist: playlist[index]);
                        })
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}




