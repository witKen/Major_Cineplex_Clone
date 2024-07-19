import 'package:flutter/material.dart';
import 'package:major_cineplex/common/gradient_app_bar.dart';
import 'package:major_cineplex/state_management/language_const.dart';
import 'package:major_cineplex/state_management/languagesProvider.dart';
import 'package:provider/provider.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with SingleTickerProviderStateMixin {
  int _langIndex = 0;
  Language _lang = Khmer();
  late TabController _tabController;
  bool isEnglish = true;
  bool isRemindMeOn = true;
  

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleLanguage(bool isEnglishSelected) {
    setState(() {
      isEnglish = isEnglishSelected;
    });
  }

  void _toggleRemindMe(bool value) {
    setState(() {
      isRemindMeOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    _langIndex = context.watch<LanguagesProvider>().langIndex;
    _lang = context.watch<LanguagesProvider>().lang;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: GradientAppBar(
        title: _lang.settingLabel,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _lang.changeLanguage,
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: _langIndex == 1 ? 13 : 18
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){ 
                        _toggleLanguage(true);
                        context.read<LanguagesProvider>().changeToKhmer();
                      },
                      child: Text(
                        'ខ្មែរ',
                        style: TextStyle(color: !isEnglish ? Colors.grey : Colors.amber, fontSize: 18),
                      ),
                    ),
                    const Text(
                      ' | ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: (){ 
                        _toggleLanguage(false);
                        context.read<LanguagesProvider>().changeToEnglish();
                      },
                      child: Text(
                        'ENGLISH',
                        style: TextStyle(color: isEnglish ? Colors.grey : Colors.amber),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _lang.remindMe,
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: _langIndex == 1 ? 13 : 18
                  ),
                ),
                Switch(
                  value: isRemindMeOn,
                  onChanged: _toggleRemindMe,
                  activeColor: Colors.amber,
                ),
              ],
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'DEVELOPER',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  DeveloperTab(),
                ],
              ),
            ),
            const Center(
              child: Text(
                'Version 0.0.1',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeveloperTab extends StatelessWidget {
  final List<Profile> profiles = [
    Profile('https://avatars.githubusercontent.com/u/155934760?v=4', 'Kuong Sok Ken', 'Software Developer'),
    Profile('https://media.licdn.com/dms/image/D5603AQFhSpN48-plZA/profile-displayphoto-shrink_200_200/0/1693515902907?e=2147483647&v=beta&t=BQV2L8rSvMJsDum8XImcjxd5QIahhR5Np5eAwpHJWaM', 'Sophat Sophana', 'Software Developer'),
    Profile('https://media.licdn.com/dms/image/D5603AQHCRM8vqcPLFQ/profile-displayphoto-shrink_200_200/0/1686106747381?e=1726704000&v=beta&t=YVr9n8LJy0QNLs_ea_GCwYxRGmU8VwKUyAo0fmCCUfY', 'Meng Oudom', 'Software Developer'),
  ];

  DeveloperTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ProfileCard(profile: profiles[index]);
        },
      ),
    );
  }
}

class Profile {
  final String imagePath;
  final String name;
  final String title;

  Profile(this.imagePath, this.name, this.title);
}

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(profile.imagePath),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            profile.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            profile.title,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
