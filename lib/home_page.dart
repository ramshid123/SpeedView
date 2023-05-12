import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:money_tracker/color_constants.dart';
import 'package:money_tracker/speed_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: purple_clr,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: purple_clr,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sensors_rounded), label: 'Service'),
          BottomNavigationBarItem(icon: Icon(Icons.wifi), label: 'VPN'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 300),
                  Container(color: white_background, height: 580),
                ],
              ),
              Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                      'assets/globe.png')),
              Padding(
                padding: EdgeInsets.only(top: 15,left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo,  Tania',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '+91 9847969456',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.notifications, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: black_background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Balance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '200,000',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () {
                              Get.dialog(SuccessDialog());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: purple_clr,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.wallet, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text('Top Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: black_background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Package Detail',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(height: 13),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: grey_clr,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.signal_cellular_alt,
                                    color: Colors.white, size: 20),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Internet',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 185),
                                      Row(
                                        children: [
                                          Text(
                                            '12',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'GB',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        height: 7,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            color: purple_clr,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(50),
                                                bottomLeft:
                                                    Radius.circular(50))),
                                      ),
                                      Container(
                                        height: 7,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color: grey_clr,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(50),
                                                bottomRight:
                                                    Radius.circular(50))),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(color: grey_clr, thickness: 2),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: grey_clr,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.phone,
                                        color: Colors.white, size: 20),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '25',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  SizedBox(width: 5),
                                  Text('Days',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13))
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: grey_clr,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.bento_sharp,
                                        color: Colors.white, size: 20),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '25',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  SizedBox(width: 5),
                                  Text('Min',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13))
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: grey_clr,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.chat_bubble_sharp,
                                        color: Colors.white, size: 20),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '25',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  SizedBox(width: 5),
                                  Text('Days',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SpeedPage());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: white_background,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: purple_clr, width: 2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wifi, color: purple_clr),
                            SizedBox(width: 10),
                            Text(
                              'Speed Test Your Internet',
                              style: TextStyle(
                                  color: purple_clr,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Quick Menu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    // SizedBox(height: 20),
                    DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          TabBar(
                            padding: EdgeInsets.all(0),
                            indicatorColor: Colors.deepPurple,
                            labelColor: purple_clr,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Internet',
                                            style: TextStyle(fontSize: 11))
                                      ]),
                                  icon:
                                      Icon(Icons.signal_cellular_4_bar_sharp)),
                              Tab(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Credit',
                                            style: TextStyle(fontSize: 11))
                                      ]),
                                  icon: Icon(Icons.credit_card)),
                              Tab(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('WhatsApp',
                                            style: TextStyle(fontSize: 11))
                                      ]),
                                  icon: Icon(Icons.chat)),
                              Tab(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Phone',
                                            style: TextStyle(fontSize: 11))
                                      ]),
                                  icon: Icon(Icons.call)),
                            ],
                          ),
                          SizedBox(
                            width: Get.width - 30,
                            height: 300,
                            child: TabBarView(
                              children: [
                                ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    listItem(
                                        'Mumbet', '25', '180,000', 'Internet'),
                                    listItem(
                                        'Murce', '10', '100,000', 'Internet'),
                                    listItem(
                                        'Vasool', '15', '150,000', 'Internet'),
                                    listItem(
                                        'Maja', '30', '300,000', 'Internet'),
                                  ],
                                ),
                                ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    listItem(
                                        'Mumbet', '25', '180,000', 'Credit'),
                                    listItem(
                                        'Murce', '10', '100,000', 'Credit'),
                                    listItem(
                                        'Vasool', '15', '150,000', 'Credit'),
                                    listItem('Maja', '30', '300,000', 'Credit'),
                                  ],
                                ),
                                ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    listItem('Mumbet', '25', '180,000', 'Data'),
                                    listItem('Murce', '10', '100,000', 'Data'),
                                    listItem('Vasool', '15', '150,000', 'Data'),
                                    listItem('Maja', '30', '300,000', 'Data'),
                                  ],
                                ),
                                ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    listItem(
                                        'Mumbet', '25', '180,000', 'Talk Time'),
                                    listItem(
                                        'Murce', '10', '100,000', 'TalkTime'),
                                    listItem(
                                        'Vasool', '15', '150,000', 'TalkTime'),
                                    listItem(
                                        'Maja', '30', '300,000', 'TalkTime'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listItem(String package, String GB, String Rp, String type) {
  return Container(
    margin: EdgeInsets.only(top: 15),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade300)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                '$package Package',
                style: TextStyle(color: purple_clr, fontSize: 12),
              ),
            ),
            Row(
              children: [
                Icon(Icons.signal_cellular_alt, color: purple_clr),
                SizedBox(width: 5),
                Text(
                  type,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        Divider(color: Colors.grey[300]),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${GB}GB / Month',
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
                SizedBox(height: 5),
                Text(
                  'Rp$Rp',
                  style: TextStyle(color: purple_clr, fontSize: 13),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.dialog(SuccessDialog());
              },
              child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: purple_clr,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Buy Now ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )
                    ],
                  )),
            )
          ],
        )
      ],
    ),
  );
}

Widget SuccessDialog() {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 200),
      decoration: BoxDecoration(
          color: white_background, borderRadius: BorderRadius.circular(30)),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset('assets/success.png', height: 150),
            SizedBox(height: 20),
            Text(
              'Successfull',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Congrats for your purchase\nour credit',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                decoration: BoxDecoration(
                  color: purple_clr,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ));
}
