import 'package:flutter/material.dart';

void main() => runApp(MusicApp());

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicScreen(),
    );
  }
}

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music App'),
      ),
      body: ListView.builder(
        itemCount: songList.length,
        itemBuilder: (context, index) {
          final song = songList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(song.albumArt),
            ),
            title: Text(song.title),
            subtitle: Text(song.artist),
            trailing: IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                // Start playing the song
              },
            ),
          );
        },
      ),
    );
  }
}

class Song {
  final String title;
  final String artist;
  final String albumArt;

  const Song({
    required this.title,
    required this.artist,
    required this.albumArt,
  });
}

final List<Song> songList = [
  Song(
    title: 'Song Title 1',
    artist: 'Artist 1',
    albumArt: 'assets/album_art_1.jpg',
  ),
  Song(
    title: 'Song Title 2',
    artist: 'Artist 2',
    albumArt: 'assets/album_art_2.jpg',
  ),
  // Add more songs here...
];
