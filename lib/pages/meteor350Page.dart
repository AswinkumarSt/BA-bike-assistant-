import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Meteor350Page extends StatefulWidget {
  const Meteor350Page({super.key});

  @override
  State<Meteor350Page> createState() => _Meteor350PageState();
}

class _Meteor350PageState extends State<Meteor350Page> {
  final List<String> slideshowImages = [
    'assets/icons/meteor350_1.jpg', // Replace with your actual image paths
    'assets/icons/meteor350_2.jpg',
    'assets/icons/meteor350_3.jpg',
  ];

  final List<Map<String, String>> tutorials = [
    {
      'title': 'Front Axle Greasing',
      'description':
          'Smooth rotation of the front wheel of your Royal Enfield Meteor depends how well you maintain its axle. Follow the steps in this video to do it yourself.',
      'videoId': 'Kk-Ka68wZt4', // Replace with the actual YouTube video ID
    },
    {
      'title': 'Oil Change Tutorial',
      'description':
          'Learn how to change the engine oil for your Royal Enfield Meteor to ensure smooth performance.',
      'videoId': 'CK3BNgcaM1g', // Replace with another YouTube video ID
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Section: Slideshow
          Expanded(
            flex: 0,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 1 / 1,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: slideshowImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),

          // Bottom Section: Sliding Card UI
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'DIY Tutorials',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tutorials.length,
                      itemBuilder: (context, index) {
                        final tutorial = tutorials[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.grey[900],
                            child: SizedBox(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId: tutorial['videoId']!,
                                      flags: const YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: false,
                                      ),
                                    ),
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.red,
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      tutorial['title']!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      tutorial['description']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
