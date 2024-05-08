class Song
{
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl
  });
  static List<Song> songs=[
    Song(
        title: 'Pehela nasha',
        description: 'Jo Jeeta Wohi Sikandar',
        url: 'assets/music/pehela_nasha.mp3',
        coverUrl: 'assets/image/pehela_nasha.jpeg'),
    Song(
        title: 'Gazab ka hain din',
        description: 'Quamat se quamat tak',
        url: 'assets/music/Gazab_ka_hain_din.mp3',
        coverUrl: 'assets/image/gazab_ka_hain_din.jpg'),
    Song(
        title: 'Jadoo hain tera hi jadoo',
        description: 'Ghulam',
        url: 'assets/music/Jadoo_hain.mp3',
        coverUrl: 'assets/image/jadoo_hain.jpeg')
  ];
}