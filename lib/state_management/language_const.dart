List<Language> langList = [
  Khmer(),
  Language(),
];

class Language {
  //Bottom Bar
  String get movieLabel => "MOVIES";
  String get cineLabel => "CINEMAS";
  String get promoLabel => "PROMOTIONS";
  String get settingLabel => "SETTING";
  String get onlinePromoLabel => "Online Promotion";
  String get onGroundPromoLabel => "On Ground Promotion";
  String get changeLanguage => "CHANGE LANGUAGE";
  String get remindMe => "REMIND ME";
  String get showing => "NOW SHOWING";
  String get comingsoon => "COMING SOON";
}

class Khmer implements Language {
  String get movieLabel => "ភាពយន្ត";
  String get cineLabel => "រោងកុន";
  String get promoLabel => "ប្រូម៉ូសិន";
  String get settingLabel => "ការកំណត់";
  String get onlinePromoLabel => "អនឡាញប្រូម៉ូសិន";
  String get onGroundPromoLabel => "ប្រូម៉ូសិនផ្ទាល់";
  String get changeLanguage => "ផ្លាស់ប្តូរភាសា";
  String get remindMe => "រំលឹកខ្ញុំ";
  String get showing => "កំពុងបញ្ចាំ";
  String get comingsoon => "ឆាប់ៗនេះ";
}
