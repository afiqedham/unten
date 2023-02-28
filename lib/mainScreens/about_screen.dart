import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AboutScreen extends StatefulWidget
{
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}




class _AboutScreenState extends State<AboutScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(

        children: [

          //image
           Container(
            height: 230,
            child: Center(
              child: Image.asset(
                "images/splash-logo.png",
                width: 260,
              ),
            ),
          ),

          Column(
            children: [

              //about company - write some info
              const Text(
                "UNTEN is company that developed designated driver in Malaysia."
                "This application will help people to get a driver within short time. "
                "It can be useful for people.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "Contact : " "01165097507",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                    "Afiq Idham",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //close
              ElevatedButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.white),
                ),
              ),

            ],
          ),

        ],

      ),
    );
  }
}
