import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatefulWidget {
  final String title;
  final String image;
  final String date;
  const MovieDetailScreen({super.key, required this.title, required this.image, required this.date});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late YoutubePlayerController _controller;
  int selectedDateIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'dQw4w9WgXcQ', // Replace with your YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onDateTap(int index) {
    setState(() {
      selectedDateIndex = index;
    });
  }

  void onTimeTap(String time) {
    // Handle time tap
    print('Time selected: $time');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('MOVIE DETAIL', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                aspectRatio: 16 / 9,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          widget.image, // Replace with your image URL
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today, color: Colors.white),
                                  const SizedBox(width: 8),
                                  Text(widget.date, style: const TextStyle(color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  Icon(Icons.category, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text('Action / Thriller', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Row(
                                children: [
                                  Icon(Icons.timer, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text('2 hrs 4 mins', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text('TBC', style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.share, color: Colors.white),
                        SizedBox(width: 8),
                        Text('SHARE', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const Divider(color: Colors.grey),
                    const TabBar(
                      indicatorColor: Colors.amber,
                      labelColor: Colors.amber,
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Tab(text: 'SHOWTIME'),
                        Tab(text: 'INFORMATION'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16), // Add space before the dates
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(7, (index) {
                                return GestureDetector(
                                  onTap: () => onDateTap(index),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'JUL',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${19 + index}',
                                          style: TextStyle(
                                              color: index == selectedDateIndex ? Colors.amber : Colors.white,
                                              fontWeight: index == selectedDateIndex ? FontWeight.bold : FontWeight.normal),
                                        ),
                                        Text(
                                          ['TODAY', 'SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU'][index],
                                          style: TextStyle(
                                              color: index == selectedDateIndex ? Colors.amber : Colors.grey,
                                              fontWeight: index == selectedDateIndex ? FontWeight.bold : FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 16), // Add space after the dates
                          const Divider(color: Colors.grey),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.search, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      'SEARCH LOCATION',
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text('TAP TO SELECT', style: TextStyle(color: Colors.amber)),
                                ),
                                const Divider(color: Colors.grey),
                                const Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      'OUR CINEMA',
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                _buildCinemaSection(
                                  'MAJOR AEON MALL PHNOM PENH',
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20221704051750.png', // Replace with your cinema logo URL
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20240410050439.png', // Replace with your additional logo URL
                                  ['11:00', '21:00'],
                                ),
                                _buildCinemaSection(
                                  'MAJOR CINEPLEX AEON SEN SOK',
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20221704051750.png', // Replace with your cinema logo URL
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20240410050439.png', // Replace with your additional logo URL
                                  ['12:30', '17:30', '20:00'],
                                ),
                                _buildCinemaSection(
                                  'MAJOR CINEPLEX AEON MEAN CHEY',
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20221704051750.png', // Replace with your cinema logo URL
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20240410050439.png', // Replace with your additional logo URL
                                  ['12:30', '17:30', '20:00'],
                                ),
                                _buildCinemaSection(
                                  'MAJOR CINEPLEX SORYA',
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20221704051750.png', // Replace with your cinema logo URL
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20240410050439.png', // Replace with your additional logo URL
                                  ['12:30', '17:30', '20:00'],
                                ),
                                _buildCinemaSection(
                                  'MAJOR PLATINUM SIEM REAP',
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20221704051750.png', // Replace with your cinema logo URL
                                  'https://www.majorcineplex.com.kh/load_file/cinema_brand/file_20240410050439.png', // Replace with your additional logo URL
                                  ['12:30', '17:30', '20:00'],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Information content',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCinemaSection(String cinemaName, String cinemaLogoUrl, String additionalLogoUrl, List<String> showtimes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Image.network(
              cinemaLogoUrl,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Text(
              cinemaName,
              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        if (showtimes.isNotEmpty)
          Column(
            children: [
              const Divider(color: Colors.grey),
              Row(
                children: [
                  Image.network(
                    additionalLogoUrl,
                    width: 48,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 24,
                    width: 1,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  const Text('THEATRE 4', style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 8),
                  const Icon(Icons.volume_up, color: Colors.white, size: 20),
                  const SizedBox(width: 4),
                  const Text('KH/EN', style: TextStyle(color: Colors.white)),
                  const Spacer(),
                  const SizedBox(width: 8),
                  const Text('2D', style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: showtimes.map((time) {
                  return GestureDetector(
                    onTap: () => onTimeTap(time),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                        color: time == '11:00' ? Colors.amber : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(time, style: const TextStyle(color: Colors.black)),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
      ],
    );
  }
}
