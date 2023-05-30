import 'package:flutter/material.dart';

void main() => runApp(YouTubeApp());

class YouTubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 2.0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YouTube',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Perform search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          final video = videoList[index];
          return VideoCard(video: video);
        },
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({required this.video});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Open video player or navigate to video details screen
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              video.thumbnailUrl,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              video.title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              video.channelName,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Video {
  final String title;
  final String thumbnailUrl;
  final String channelName;

  const Video({
    required this.title,
    required this.thumbnailUrl,
    required this.channelName,
  });
}

final List<Video> videoList = [
  Video(
    title: 'Video Title 1',
    thumbnailUrl: 'https://example.com/thumbnail1.jpg',
    channelName: 'Channel 1',
  ),
  Video(
    title: 'Video Title 2',
    thumbnailUrl: 'https://example.com/thumbnail2.jpg',
    channelName: 'Channel 2',
  ),
  // Add more videos here...
];
