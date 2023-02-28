import 'package:firebase_auth/firebase_auth.dart';
import 'package:unten_user/models/direction_details_info.dart';
import 'package:unten_user/models/user_model.dart';



final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
UserModel? userModelCurrentInfo;
List dList = []; //online-active drivers Information List
DirectionDetailsInfo? tripDirectionDetailsInfo;
String? chosenDriverId="";
String cloudMessagingServerToken = "key=AAAAeM_P2aY:APA91bHhXT8wFo0bTV-Ihdzw0OL9L4U2guYJ2_MUmzkLm8cuNmgHMHGuhlUmLB6zr4TIA3C97IGJ9TSKXbJe1lUF1aCxZW6j7lEC1AlwSqqr0mat7zPZNxRPdh4yP1eNJJGw-_5VYsuG";
String userDropOffAddress = "";
String driver_Details="";
String driverName="";
String driverPhone="";
double countRatingStars=0.0;
String titleStarsRating="";