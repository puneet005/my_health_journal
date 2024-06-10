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
  static const String notificationSet = "${baseUrl}notification-set";
  static const String forgotPassword = "${baseUrl}forgot-password";
  static const String resetPassword = "${baseUrl}reset-password";
  static const String profileUpdate = "${baseUrl}edit-profile";
  static const String deleteAccount = "${baseUrl}delete-account";
  static const String changePassword = "${baseUrl}change-password";

  

  //Home
  static const String dashboard = "${baseUrl}dashboard";
  static const String addNewMember = "${baseUrl}add-new-member";
  static const String addProvider = "${baseUrl}add-provider";
  static const String addAppointment = "${baseUrl}add-appointment";
  static const String addSymptoms = "${baseUrl}add-symptoms";
  static const String addMedication = "${baseUrl}add-medication";
  static const String addProcedures = "${baseUrl}add-procedures";
  static const String addTestAndScan = "${baseUrl}add-test-and-scan";
  static const String addHistory = "${baseUrl}add-history";
  static const String generateInvoice = "${baseUrl}generateinvoice";
  static const String setOrder = "${baseUrl}set-order";
//  Get Api   
    static const String getProvider = "${baseUrl}get-provider";
    static const String getAppointment = "${baseUrl}get-appointment";
    static const String getSymptoms = "${baseUrl}get-symptoms";
    static const String getMedication = "${baseUrl}get-medication";
    static const String getProcedures = "${baseUrl}get-procedures";
    static const String getTestAndScan = "${baseUrl}get-test-and-scan";
    static const String getHistory = "${baseUrl}get-history";
    static const String calender = "${baseUrl}calender";
    static const String memberData = "${baseUrl}member_data";

  //  Update Api 
    static const String addProceduresComment = "${baseUrl}add-procedures-comment";
    static const String addTestAndScanComment = "${baseUrl}add-test-and-scan-comment";
    
  // Search Api 
    static const String search = "${baseUrl}search";

  // Notifications Api
      static const String notifications = "${baseUrl}notifications";

  // Buy Plan Api
   static const String buyPlan = "${baseUrl}buy_plan";



   
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
