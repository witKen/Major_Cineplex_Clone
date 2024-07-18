import 'package:flutter/material.dart';
import 'package:major_cineplex/common/gradient_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    // Get.find<OrderController>.getOrderList()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: 'Major',
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.menu, color: Colors.orange)),
        ],  
      ),
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return RefreshIndicator( 
      onRefresh: () async {
        if (context.mounted){
          setState(() {
          });
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
          _buildContents()
        ],
      ),
    );
  }

  List<String> ads = [
    "https://cdn-bnklg.nitrocdn.com/WQiharaAoSUWjdmYdQaoZKLXawgJIPOR/assets/images/source/rev-d098535/www.upmenu.com/wp-content/uploads/2023/10/food-advertisement-examples2.jpeg.webp",
    "https://i.insider.com/4f0c8843ecad042f0b000013?width=1000&format=jpeg&auto=webp",
    "https://i.ytimg.com/vi/PULiDIsBwgU/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-DoACuAiKAgwIABABGBMgPyh_MA8=&rs=AOn4CLCSOweUuzBtAzLzxG-ZXqkJvYIWVQ",
  ];

  Widget _buildAdsRow(){
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
        autoPlayInterval: const Duration(seconds: 3)
      ));
  }


  bool _isGrid = false;
  late TabController _tabController;
  
  Widget _buildTabRow(){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
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
    );
  }

  Widget _buildContents(){
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxHeight = 320 * movies.length/2;
        return SizedBox(
          // height: _isGrid ? maxHeight : maxHeight * 2,
          height: maxHeight,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildNowShowing(),
              Container(),
              Container(),
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
      'image': 'https://upload.wikimedia.org/wikipedia/en/a/a8/The_Woman_in_the_House_Across_the_Street_from_the_Girl_in_the_Window.png',
    },
    {
      'title': 'BATMAN',
      'date': '16 JUNE 2024',
      'image': 'https://upload.wikimedia.org/wikipedia/en/f/ff/The_Batman_%28film%29_poster.jpg',
    },
    {
      'title': 'SPIDER MAN',
      'date': '09 JULY 2024',
      'image': 'https://terrigen-cdn-dev.marvel.com/content/prod/1x/spider-mannowayhome_lob_crd_03.jpg',
    },
    {
      'title': 'DOCTOR STRANGE',
      'date': '10 JULY 2024',
      'image': 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/b/be/Doctor_Strange_Poster_2.jpg/revision/latest/top-crop/width/360/height/360?cb=20220213234429',
    },
    {
      'title': 'VENOM',
      'date': '14 JUNE 2024',
      'image': 'https://pics.filmaffinity.com/Venom-824559573-large.jpg',
    },
    {
      'title': 'MORBIUS',
      'date': '18 MAY 2024',
      'image': 'https://media.titanbooks.com/catalog/products/Morbius.jpg',
    },
    
  ];

  Widget _buildNowShowing(){
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
          onTap: (){},
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
}