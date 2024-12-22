import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ClassicRebornPage extends StatefulWidget {
  @override
  State<ClassicRebornPage> createState() => _ClassicRebornPageState();
}

class _ClassicRebornPageState extends State<ClassicRebornPage> {
  final List<String> slideshowImages = [
    'assets/icons/reborn_1.jpeg',
    'assets/icons/reborn_2.jpg',
    'assets/icons/reborn_3.jpg',
  ];

  final List<Map<String, String>> tutorials = [

    {
      'title': 'Oil Change Tutorial',
      'description':
          'Learn how to change the engine oil for your Royal Enfield Meteor for smooth performance.',
      'videoId': 'ulx8oTpdvl4',
    },
    {
      'title': 'Brake Pedal Free Play Adjustment for Drum Brakes',
      'description':
            'Learn how to adjust the brake pedal free play for drum brakes to ensure optimal braking performance and safety.',
      'videoId': 'zjhbxGVCFNU',
    },
    {
      'title': 'Air Filter Replacement',
      'description': 'Step-by-step instructions to replace the air filter.',
      'videoId': '1xn6WyArDpE',
    },
    {
      'title': 'Chain Cleaning and Lubrication',
      'description': 'Proper chain maintenance guide.',
      'videoId': 'bCM2J99Ug3Q',
    },
    {
      'title': 'Clutch Cable Replacement',
      'description': 'Replacing the clutch cable for smoother rides.',
      'videoId': 'wdTac0hDjQM',
    },
    {
      'title': 'Battery Inspection and Replacement',
      'description': 'Learn to inspect and replace your bike battery.',
      'videoId': 'JFsiLiRLnWM',
    },
   {
      'title': 'Front Axle Greasing',
      'description':
          'Smooth rotation of the front wheel of your Royal Enfield Meteor depends how well you maintain its axle.',
      'videoId': 'IZN3rOfQwFk',
    },
     {
      'title': 'Front Wheel Removal',
      'description': 'A guide to safely remove the front wheel.',
      'videoId': 'K4jcRojT04Q',
    },
    {
      'title': 'Rear Wheel Removal',
      'description': 'Step-by-step rear wheel removal guide.',
      'videoId': '7WJ10qLqQYE',
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // Filter tutorials based on the search query
    List<Map<String, String>> filteredTutorials = tutorials
        .where((tutorial) => tutorial['title']!
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Classic Reborn',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/selectionpage');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white70,
            )),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white70,
            ),
            onPressed: () {
              showSearchDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Top Section: Slideshow
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              aspectRatio: 16 / 12,
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

          // Bottom Section: Sliding Card UI
          const SizedBox(height: 0),
          Expanded(
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
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredTutorials.length,
                      itemBuilder: (context, index) {
                        final tutorial = filteredTutorials[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30, top: 20, left: 10),
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
                                        mute: true,
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

  void showSearchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String query = searchQuery;
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Search Tutorials',
            style: TextStyle(color: Colors.white70),
          ),
          content: TextField(
            style: TextStyle(color: Colors.white70),
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter tutorial title'),
            onChanged: (value) {
              query = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  searchQuery = query;
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        );
      },
    );
  }
}
