class AppLink {
  static const String server = "http://localhost/ecommerce";
  static const String test = "$server/test.php";

  //===================auth===================
  static const String signup = "$server/auth/signup.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";
  static const String resendCodeSignUp = "$server/auth/resend.php";

  //==================forgetpassword===========
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycode = "$server/forgetpassword/verifycode.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";

  //===============home==============
  static const String home = "$server/home.php";

  //===============images===============
  static const String images = "$server/upload";

  //================items=============
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";
  //================favorites=============
  static const String favorite = "$server/favorite";
  static const String addfavorite = "$favorite/add.php";
  static const String removefavorite = "$favorite/remove.php";
  static const String viewfavorite = "$favorite/view.php";
  static const String deletefromfavorite = "$favorite/deletefromfavorite.php";

  //================cart=============
  static const String cart = "$server/cart";
  static const String addtocart = "$cart/add.php";
  static const String removecart = "$cart/remove.php";
  static const String getcountitems = "$cart/getcountitems.php";
  static const String viewcart = "$cart/view.php";
}
