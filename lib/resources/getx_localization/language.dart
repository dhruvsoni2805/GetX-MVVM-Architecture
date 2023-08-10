import "package:get/get_navigation/src/root/internacionalization.dart";

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          //Splash Screen
          "welcome.title": "Welcome\nBack",

          //Login Screen
          "loginform.title": "login form",
          "login.btntitle": "Login",
          "email.hinttext": "Enter Your Email Id",
          "email.example": "Example@gmail.com",
          "eamil.invalid": "Your Email Address Format is Wrong",
          "password.hinttext": "Enter Your Password",
          "password.example": "* * * * * *",
          "password.invalid": "Your password is too Short.",

          //User List
          "userlist.apptitle": "User List",
          "id": "Id",
          "name": "Name",
          "email": "Email",

          //User list Drawer
          'themelight': "Light Theme",
          'themedart': "Dark Theme",
          'ownername': "Dhruv Soni",
          'ownermail': "dhruvsoni285@gmail.com",
          'usermaterial': "User Material",

          //user material list
          'year': "Year",
          'color': "Colour",
          'pantone_value': "Pantone Value",

          //dailogBox
          "exit": "Exit App",
          "content": "Do You Really Want To Exit App",
          "yes": "Yes",
          "no": "No",

          //Internet Exception
          "nointernetexception":
              "We're Unable to Load Result.\n Please Check Your Internet Connection",

          //Genral Exception
          "genralexception":
              "We're Unable to Process Your Data. \n Please Try Again",
        },
      };
}
