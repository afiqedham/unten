import 'package:firebase_database/firebase_database.dart';
import 'package:unten_user/global/global.dart';
import 'package:flutter/material.dart';
import 'package:unten_user/mainScreens/main_screen.dart';



class ProfileScreen extends StatefulWidget
{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
{
  String? name = '';
  String? email = '';
  String? phone = '';
  String? inputName = '';
  String? inputEmail = '';
  String? inputPhone = '';

  Future _getUserData() async
  {
    await FirebaseDatabase.instance.ref().child("users").child(currentFirebaseUser!.uid).get().then((snapshot) async
    {
      if(snapshot.value != null)
      {
        setState(() {
          name = (snapshot.value as dynamic)["name"];
          phone = (snapshot.value as dynamic)["phone"];
          email = (snapshot.value as dynamic)["email"];
        });
      }
    });
  }

  Future _updateUserName() async
  {
    await FirebaseDatabase.instance.ref().child("users").child(currentFirebaseUser!.uid).update(
        {
          'name': inputName,
        });
  }
  Future _updateUserPhone() async
  {
    await FirebaseDatabase.instance.ref().child("users").child(currentFirebaseUser!.uid).update(
        {
          'phone': inputPhone,
        });
  }
  Future _updateUserEmail() async
  {
    await FirebaseDatabase.instance.ref().child("users").child(currentFirebaseUser!.uid).update(
        {
          'email': inputEmail,
        });
  }

  _displayTextInputNameDialog(BuildContext context) async
  {
    return showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            title: const Text('Update Your Name'),
            content: TextField(
              onChanged: (value)
              {
                setState(() {
                  inputName = value;
                });
              },
              decoration: const InputDecoration(hintText: "Type Here"),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Cancel', style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              ElevatedButton(
                child: const Text('Save', style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  _updateUserName();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MainScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          );
        }
    );
  }
  _displayTextInputPhoneDialog(BuildContext context) async
  {
    return showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            title: const Text('Update Your Phone'),
            content: TextField(
              onChanged: (value)
              {
                setState(() {
                  inputPhone = value;
                });
              },
              decoration: const InputDecoration(hintText: "Type Here"),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Cancel', style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              ElevatedButton(
                child: const Text('Save', style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  _updateUserPhone();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MainScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          );
        }
    );
  }
  _displayTextInputEmailDialog(BuildContext context) async
  {
    return showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            title: const Text('Update Your Email'),
            content: TextField(
              onChanged: (value)
              {
                setState(() {
                  inputEmail = value;
                });
              },
              decoration: const InputDecoration(hintText: "Type Here"),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Cancel', style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              ElevatedButton(
                child: const Text('Save', style: TextStyle(color: Colors.white),),
                onPressed: ()
                {
                  _updateUserEmail();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MainScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          );
        }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserData();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: SingleChildScrollView(
            child: Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset("images/splash-logo.png"),
                  ),

                  const SizedBox(height: 14.0),

                  const Divider(
                    height: 3,
                    thickness: 3,
                    color: Colors.white,
                  ),

                  //addresses origin destination
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        //origin location with icon
                        Row(
                          children: [
                            Image.asset(
                              "images/userW.png",
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 14,),
                            Expanded(
                              child: Container(
                                child: Text(
                                  name!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: ()
                                {
                                  _displayTextInputNameDialog(context);
                                },
                                icon: Icon(Icons.edit, color: Colors.white,)
                            ),
                          ],
                        ),

                        const Divider(
                          height: 3,
                          thickness: 1,
                          color: Colors.white,
                        ),

                        const SizedBox(height: 20.0),

                        Row(
                          children: [
                            Image.asset(
                              "images/phoneW.png",
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 14,),
                            Expanded(
                              child: Container(
                                child: Text(
                                  phone!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: ()
                                {
                                  _displayTextInputPhoneDialog(context);
                                },
                                icon: Icon(Icons.edit, color: Colors.white,)
                            ),
                          ],
                        ),

                        const Divider(
                          height: 3,
                          thickness: 1,
                          color: Colors.white,
                        ),

                        const SizedBox(height: 20.0),

                        Row(
                          children: [
                            Image.asset(
                              "images/emailW.png",
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 14,),
                            Expanded(
                              child: Container(
                                child: Text(
                                  email!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: ()
                                {
                                  _displayTextInputEmailDialog(context);
                                },
                                icon: Icon(Icons.edit, color: Colors.white,)
                            ),
                          ],
                        ),

                        const Divider(
                          height: 3,
                          thickness: 1,
                          color: Colors.white,
                        ),

                        const SizedBox(height: 20.0),

                        ElevatedButton(
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
