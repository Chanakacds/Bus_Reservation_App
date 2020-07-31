import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csse_booking_system/Payment/creditAccount.dart';
import 'package:csse_booking_system/Reservation/mapForReservation.dart';
import 'package:csse_booking_system/Reservation/Ticket/reservedTickets.dart';
import 'package:csse_booking_system/customWidgets/appDrawer.dart';
import 'package:csse_booking_system/services/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home();
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  BaseAuthentication auth = Authentication();
  FirebaseAuth fireAuth = FirebaseAuth.instance;
  static String currentUserId;
  Future<DocumentSnapshot> user;
  DocumentSnapshot ds;

  @override
  void initState() {
    super.initState();

    auth.getCurrentUser().then((currentuser) {
      print('Home:::: $currentuser');
      user = Firestore.instance
          .collection('users')
          .document(currentuser)
          .get()
          .then((value) {
        ds = value;
      });
    });
  }
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: ()  {
              Navigator.of(context).pop(true);
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
    
      drawer: AppDrawer(ds),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 320.0,
                    height: 150.0,
                    child: InkWell(
                      onTap: () {
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservedTickets()));
                      },
                      child: Card(
                        color: Color(0xFF18D191),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5.0,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5.0,
                            ),
                            Text("Bus Schedule",
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            Divider(
                              color: Colors.black,
                              indent: 20.0,
                              endIndent: 20.0,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Material(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(
                                      FontAwesomeIcons.listAlt,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                                //Icon(Icons.router),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 320.0,
                    height: 150.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapSample()));
                      },
                      child: Card(
                        color: Color(0xfff4c83f),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5.0,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 5.0,
                            ),
                            Text("Real Time Tracking",
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            Divider(
                              color: Colors.black,
                              indent: 20.0,
                              endIndent: 20.0,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Material(
                                  color: Colors.yellow[800],
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(
                                      FontAwesomeIcons.mapMarkedAlt,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                                //Icon(Icons.router),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 320.0,
                    height: 150.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreditAccount()));
                      },
                      // child: Card(
                      //   color: Color(0xFF45E0EC),
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10.0)),
                      //   elevation: 5.0,
                      //   child: Column(
                      //     children: <Widget>[
                      //       SizedBox(
                      //         height: 5.0,
                      //       ),
                      //       Text("Credit My Account",
                      //           style: TextStyle(
                      //               fontFamily: 'Ubuntu',
                      //               fontSize: 18.0,
                      //               fontWeight: FontWeight.bold)),
                      //       Divider(
                      //         color: Colors.black,
                      //         indent: 20.0,
                      //         endIndent: 20.0,
                      //       ),
                      //       SizedBox(
                      //         height: 5.0,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: <Widget>[
                      //           Material(
                      //             color: Colors.blue[300],
                      //             borderRadius: BorderRadius.circular(24.0),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(16.0),
                      //               child: Icon(
                      //                 FontAwesomeIcons.moneyCheck,
                      //                 color: Colors.white,
                      //                 size: 30.0,
                      //               ),
                      //             ),
                      //           ),
                      //           //Icon(Icons.router),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  getUser() async {
    var document = await Firestore.instance
        .collection('users')
        .document(currentUserId.toString());
    document.get().then((document) {
      print('::::::::::::: ${currentUserId.toString()}');
    });
  }
}
