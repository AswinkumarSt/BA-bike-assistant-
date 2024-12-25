import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CB350RSPage extends StatefulWidget {
  const CB350RSPage({super.key});

  @override
  State<CB350RSPage> createState() => _CB350RSPageState();
}

class _CB350RSPageState extends State<CB350RSPage> {
  final List<String> slideshowImages = [
    'assets/icons/cb_1.avif', // Replace with your actual image paths
    'assets/icons/cb_2.jpg',
    'assets/icons/cb_3.jpg',
  ];

  final List<Map<String, String>> tutorials = [
    {
      'title': 'Front Axle Greasing',
      'description':
          'Smooth rotation of the front wheel of your Honda CB350RS depends how well you maintain its axle.',
      'videoId': 'Kk-Ka68wZt4',
    },
    {
      'title': 'Oil Change Tutorial',
      'description':
          'Learn how to change the engine oil for your Honda CB350RS for smooth performance.',
      'videoId': 'CK3BNgcaM1g',
    },
    {
      'title': 'Air Filter Replacement',
      'description': 'Step-by-step instructions to replace the air filter.',
      'videoId': 'UERG-cpbnuI',
    },
    {
      'title': 'Chain Cleaning and Lubrication',
      'description': 'Proper chain maintenance guide.',
      'videoId': 'jk03zdZ1Hhk',
    },
    {
      'title': 'Clutch Cable Replacement',
      'description': 'Replacing the clutch cable for smoother rides.',
      'videoId': 'dJnHbjK4JUY',
    },
    {
      'title': 'Battery Inspection and Replacement',
      'description': 'Learn to inspect and replace your bike battery.',
      'videoId': 'g0PLn56DNMc',
    },
    {
      'title': 'Front Wheel Removal',
      'description': 'A guide to safely remove the front wheel.',
      'videoId': '5OLva1gh0Nk',
    },
    {
      'title': 'Rear Wheel Removal',
      'description': 'Step-by-step rear wheel removal guide.',
      'videoId': 'pKiyqdzALDw',
    },
    {
      'title': 'Oil Level Inspection',
      'description': 'How to check your engine oil level.',
      'videoId': 'vKanQyUkJs',
    },
    {
      'title': 'Tubeless Tyre Puncture Repair',
      'description': 'DIY tubeless tyre puncture repair.',
      'videoId': 'MRQlUFuX-qk',
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
            'CB-350RS',
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