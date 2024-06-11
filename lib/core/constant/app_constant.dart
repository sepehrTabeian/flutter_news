abstract class AppConstant {
  static const String newsAPIBaseURL = String.fromEnvironment(
    "API_URL",
    defaultValue: "https://newsapi.org/v2/",
  );
  //https://newsapi.org/v2/

  static const String newsAPIEverything = "everything";
  // api key here
  static const String newsAPIKey = String.fromEnvironment(
    "API_KEY",
    defaultValue: "8b88b0b8781f481a8f7a0196b838251e",
  );
  //8b88b0b8781f481a8f7a0196b838251e

  static const String hiveDataBaseName = 'news_db';

  //! Query

  static const String countryQuery = 'en';

  static const String microsoft = 'microsoft';
  static const String apple = 'apple';
  static const String google = 'google';
  static const String tesla = 'tesla';

  static String defaultQuery = 'google';
  static const List<String> queryList = [microsoft, apple, google, tesla];

  // static const String qQuery = '$microsoft AND $apple AND $google AND $tesla';

  static const String sortedQuery = 'publishedAt';
}
