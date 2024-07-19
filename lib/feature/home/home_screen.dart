import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:major_cineplex/screens/detail_screen.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_handleScroll);
    // Get.find<OrderController>.getOrderList()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Image.asset(
              'assets/images/major_clean_logo.png',
              width: 100,
              height: 35,
            ),
            elevation: 0,
            titleSpacing: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFAA0000), Color(0xFF2D0D0D)
                  ],
                  stops: [0.0, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,            
                )
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.menu, color: Colors.orange)
              ),
            ],  
          ),
        ],
        body: _buildBody(),
      ),
      // appBar: GradientAppBar(
      //   title: 'Major',
      //   actions: [
      //     IconButton(
      //       onPressed: (){}, 
      //       icon: const Icon(Icons.menu, color: Colors.orange)),
      //   ],  
      // ),
      backgroundColor: Colors.black,
      // body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () async {
        if (context.mounted) {
          setState(() {});
        }
      },
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _buildAdsRow(),
          const SizedBox(
            height: 10,
          ),
          _buildTabRow(),
        ],
      ),
    );
  }

  List<String> ads = [
    "https://cdn-bnklg.nitrocdn.com/WQiharaAoSUWjdmYdQaoZKLXawgJIPOR/assets/images/source/rev-d098535/www.upmenu.com/wp-content/uploads/2023/10/food-advertisement-examples2.jpeg.webp",
    "https://i.insider.com/4f0c8843ecad042f0b000013?width=1000&format=jpeg&auto=webp",
    "https://i.ytimg.com/vi/PULiDIsBwgU/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-DoACuAiKAgwIABABGBMgPyh_MA8=&rs=AOn4CLCSOweUuzBtAzLzxG-ZXqkJvYIWVQ",
  ];

  Widget _buildAdsRow() {
    return CarouselSlider(
        items: ads.map((i) {
          return Builder(
            builder: (BuildContext context) => SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                i,
                fit: BoxFit.fill,
                height: 160,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
            viewportFraction: 1,
            height: 160,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3)));
  }

  bool _isGrid = false;
  late TabController _tabController;
  
  Widget _buildTabRow(){
    return StickyHeader(
      header: Container(
        padding: const EdgeInsets.only(top: 15.0),
        color: Colors.black,
        child: Row(
          children: [
            IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                iconColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                setState(() {
                  _isGrid = !_isGrid;
                });
              },
              icon: Icon(_isGrid ? Icons.view_list : Icons.grid_view),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TabBar(
                        indicatorColor: Colors.yellow,
                        indicatorWeight: 1,
                        labelColor: Colors.yellow,
                        unselectedLabelColor: Colors.white,
                        controller: _tabController,
                        dividerHeight: 0,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        tabs: [
                          const Tab(text: 'NOW SHOWING'),
                          const Tab(text: 'COMING SOON'),
                          Container(
                            padding: const EdgeInsets.only(left: 7),
                            alignment: Alignment.centerLeft,
                            child: const Tab(text: 'IMAX'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      content: _buildContents(),
    );
  }

  Widget _buildContents() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxHeight = 320 * movies.length / 2;
        return SizedBox(
          // height: _isGrid ? maxHeight : maxHeight * 2,
          height: maxHeight,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildNowShowing(),
              _buildComingSoon(),
              _buildIMAX(),
            ],
          ),
        );
      },
    );
  }

  static const List<Map<String, String>> movies = [
    {
      'title': 'THE WOMAN',
      'date': '18 JULY 2024',
      'image':
          'https://upload.wikimedia.org/wikipedia/en/a/a8/The_Woman_in_the_House_Across_the_Street_from_the_Girl_in_the_Window.png',
    },
    {
      'title': 'BATMAN',
      'date': '16 AUGUST 2024',
      'image': 'https://upload.wikimedia.org/wikipedia/en/f/ff/The_Batman_%28film%29_poster.jpg',
    },
    {
      'title': 'SPIDER MAN',
      'date': '09 SEPTEMBER 2024',
      'image': 'https://terrigen-cdn-dev.marvel.com/content/prod/1x/spider-mannowayhome_lob_crd_03.jpg',
    },
    {
      'title': 'DOCTOR STRANGE',
      'date': '10 OCTOBER 2024',
      'image': 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/b/be/Doctor_Strange_Poster_2.jpg/revision/latest/top-crop/width/360/height/360?cb=20220213234429',
    },
    {
      'title': 'VENOM',
      'date': '14 NOVEMBER 2024',
      'image': 'https://pics.filmaffinity.com/Venom-824559573-large.jpg',
    },
    {
      'title': 'MORBIUS',
      'date': '18 DECEMBER 2024',
      'image': 'https://media.titanbooks.com/catalog/products/Morbius.jpg',
    },
  ];

  Widget _buildNowShowing() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount: _isGrid ? 2 : 1,
        // childAspectRatio: _isGrid ? (9 / 16) : 1,
        crossAxisCount: 2 ,
        childAspectRatio: (9 / 16) ,
      ), 
      itemCount: movies.length,
      itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MovieDetailScreen(title: movies[index]['title']!, image: movies[index]['image']!, date: movies[index]['date']!)
              )
            );
          },
          child: Column(
            children: [
              SizedBox(
                height: 230,
                child: Image.network(
                  movies[index]['image']!,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                movies[index]['date']!,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 12,
                ),
              ),
              Text(
                movies[index]['title']!,
                style: const TextStyle(
                  color: Colors.white
                ),
              )
            ],
          ) 
          // : Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     ClipRRect(
          //       borderRadius: BorderRadius.circular(8.0),
          //       child: Image.network(
          //         movies[index]['image']!,
          //         fit: BoxFit.fill,
          //         height: 230,
          //         width: 170,
          //       ),
          //     ),
          //     // Text(
          //     //   movies[index]['date']!,
          //     //   style: const TextStyle(
          //     //     color: Colors.yellow,
          //     //     fontSize: 12,
          //     //   ),
          //     // ),
          //     // Text(
          //     //   movies[index]['title']!,
          //     //   style: const TextStyle(
          //     //     color: Colors.white
          //     //   ),
          //     // )
          //   ],
          // )
        );
      });  
    }

  final ScrollController _scrollController = ScrollController();
  final List<String> _months = ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  int _currentMonth = 0;
  int selectedMonthIndex = 0;

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final currentPosition = _scrollController.position.pixels;
    final movieHeight = MediaQuery.of(context).size.height * 0.6;

    for (int i = 0; i < _months.length; i++) {
      if (currentPosition >= i * movieHeight && currentPosition < (i + 1) * movieHeight) {
        if (_currentMonth != i) {
          setState(() {
            _currentMonth = i;
          });
        }
        break;
      }
    }
  }

  Widget _buildComingSoon() {
    return StickyHeader(
      header: Container(
        color: Colors.black,
        child: Row(
          children: [
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(270 * (3.14159 / 180)),
              child: const Text(
                '2024',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: _months.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMonthIndex = index;
                          });
                        },
                        child: Text(
                          _months[index],
                          style: TextStyle(
                            color: index == selectedMonthIndex ? Colors.yellow : Colors.grey,
                            fontSize: 18.0,
                            fontWeight: index == selectedMonthIndex ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      content: Row(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (9 / 16),
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(title: movies[index]['title']!, image: movies[index]['image']!, date: movies[index]['date']!)
                      )
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 230,
                        child: Image.network(
                          movies[index]['image']!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        movies[index]['date']!,
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        movies[index]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  List<String> imaxImages = [
    "https://www.glasgowsciencecentre.org/sites/default/files/styles/medium/public/inline-images/IMAX-1800-750_1.jpg.webp?itok=2OeYUS_a",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSafTb1W-5r4PFkxjIcENLw9ZpLYeRSNIcukA&s",
    "https://imaxvictoria.com/wp-content/uploads/2019/09/IMAX_Laser_WC_1500x430_V1_R2.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0lLjbfwuBn_ohx2qKCM3SlL7dw4QebJtqzQ&s"
  ];

  Widget _buildIMAX(){
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imaxImages.length,
      itemBuilder: (context, index){
        return Container(
          height: 250,
          padding: const EdgeInsets.all(8),
          child: Image.network(
            imaxImages[index],
            fit: BoxFit.cover
          ),
        );
      },
    );
  }
}

