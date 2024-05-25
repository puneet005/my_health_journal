class ApiUrls {
  static const String domain = "https://v1.checkprojectstatus.com/health_jourlan/";
  static const String imgBaseUrl = "https://v1.checkprojectstatus.com/health_jourlan";

  // static const String domain = "https://app.trvlbag.com/"; // live Url
  static const String baseUrl = "${domain}api/";

  // Sign In And Login Api
  static const String login = "${baseUrl}login";
  static const String register = "${baseUrl}register";
  static const String logout = "${baseUrl}logout";  
  static const String profile = "${baseUrl}user-profile";
  static const String forgotPassword = "${baseUrl}forgot-password";
  static const String resetPassword = "${baseUrl}reset-password";
  static const String profileUpdate = "${baseUrl}edit-profile";
  static const String deleteAccount = "${baseUrl}delete-account";

  

  //Home
  static const String dashboard = "${baseUrl}dashboard";
  static const String addNewMember = "${baseUrl}add-new-member";
  static const String addProvider = "${baseUrl}add-provider";
    static const String addAppointment = "${baseUrl}add-appointment";
      static const String addSymptoms = "${baseUrl}add-symptoms";
      //   static const String addNewMember = "${baseUrl}add-new-member";
      //     static const String addNewMember = "${baseUrl}add-new-member";
      //       static const String addNewMember = "${baseUrl}add-new-member";
      //         static const String addNewMember = "${baseUrl}add-new-member";
  static const String removeCart = "${baseUrl}cart/remove";


//  Get Api   
    static const String getProvider = "${baseUrl}get-provider";
   
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
