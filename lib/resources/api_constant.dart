class ApiUrls {
  static const String domain = "https://v1.checkprojectstatus.com/health_jourlan/";

  // static const String domain = "https://app.trvlbag.com/"; // live Url
  static const String baseUrl = "${domain}api/";

  // Sign In And Login Api
  static const String login = "${baseUrl}login";
  static const String register = "${baseUrl}register";
  static const String logout = "${baseUrl}logout";  
  static const String profile = "${baseUrl}user-profile";
  static const String forgotpassword = "${baseUrl}forgotpassword";
  static const String changepassword = "${baseUrl}changepassword";
  static const String profileUpdate = "${baseUrl}profileUpdate";

  //Cart
  static const String cart = "${baseUrl}cart/list";
  static const String addCart = "${baseUrl}cart";
  static const String removeCart = "${baseUrl}cart/remove";

//Category
  static const String category = "${baseUrl}category";
  static const String subCategory = "${baseUrl}subCategory";
  static const String documentation = "${baseUrl}documents";
  static const String trainingList = "${baseUrl}training-list";

  //Subscription Plan
  static const String getSubscriptionPlan = "${baseUrl}plan";
  static const String createSubscriptionPlan = "${baseUrl}subscription/create";

  //Card
  static const String addCard = "${baseUrl}card/add";
  static const String getCardList = "${baseUrl}card/list";
  static const String setDefaultCard = "${baseUrl}card/setdefault";
  static const String removeCard = "${baseUrl}card/remove";

  //Favourites
  static const String favouriteList = "${baseUrl}favouriteList";
  static const String favouriteAddRemove = "${baseUrl}favourite";
  static const String purchasedList = "${baseUrl}myPurchaseItem";

  //CMS Pages
  static const String cmsPages = "${baseUrl}page";
  
  // Payment Api
  static const String singleAppleGooglePay = "${baseUrl}single-apple-google-pay";
  static const String cartAppleGooglePay = "${baseUrl}cart-apple-google-pay";
}
