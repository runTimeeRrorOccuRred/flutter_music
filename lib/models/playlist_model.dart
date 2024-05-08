import '../models/song_model.dart';

class PlayList
{
  final String title;
  final List<Song> songs;
  final String imageUrl;

  PlayList({required this.title, required this.songs,required this.imageUrl});


  static List<PlayList> playlist=[
    PlayList(title: 'Romantic', songs: Song.songs, imageUrl: 'https://media.istockphoto.com/id/491840821/photo/vintage-audio-cassette.jpg?s=612x612&w=0&k=20&c=olm_Mlnct7FB5qfQ_Caeq9wNDKdtMy2O5VhhxarTDgs='),
    PlayList(title: 'Hard Rock', songs: Song.songs, imageUrl: 'https://media.istockphoto.com/id/683681532/photo/male-singer-with-microphone-and-rock-and-roll-band-performing-hard-rock-music-on-stage.jpg?s=612x612&w=0&k=20&c=AGAhkHK09kGd7P6Ew_GJr3q_yt33rpCH09Pi2H_ZWzA='),
    PlayList(title: 'Folk', songs: Song.songs, imageUrl: 'https://media.istockphoto.com/id/959543170/vector/vector-music-concert-poster-of-sketch-instruments.jpg?s=612x612&w=0&k=20&c=nac5M3Z-TWRCTbbiwpj59aqmEwqyX-IiTijn3Wphc88=')
  ];
}