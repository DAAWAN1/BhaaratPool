import 'dart:ui';
import 'package:carpool_2/Screens/chat_screen.dart';
import 'package:carpool_2/Screens/profile_screen.dart';
import 'package:carpool_2/widgets/floating_actionButton.dart';
import 'package:carpool_2/widgets/icon_buttons_bt_appbar.dart';
import 'package:carpool_2/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final headers = {
    'X-CSCAPI-KEY': 'YOUR_API_KEY',
  };

  Future<void> getStatus() async {
    final request = http.Request(
        'GET', Uri.parse('https://api.countrystatecity.in/v1/countries'));
    request.headers.addAll(headers);

    try {
      final http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  BottomAppBar bottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepPurple,
      child: SizedBox(
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (BuildContext context) {
                return BuildIconButtonsForBottomAppBar(
                  iconData: Icons.manage_history,
                  label: 'History',
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            BuildIconButtonsForBottomAppBar(iconData: Icons.commute_outlined, label: 'Commute', onTap: () {}),
            const Spacer(),
            BuildIconButtonsForBottomAppBar(iconData: Icons.chat, label: 'Chat', onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            }),
            BuildIconButtonsForBottomAppBar(iconData: Icons.account_circle_sharp, label: 'Profile', onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://imageio.forbes.com/specials-images/imageserve/6663091f4017ca247461dd1d/Graphic-of-tracking-information-on-a-map/960x0.jpg?format=jpg&width=1440"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Ride History',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Ride to Work'),
                subtitle: Text('January 12, 2024'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$15.00'),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.info_outline),
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                        ),
                        Text("Report", style: TextStyle(fontSize: 6),),
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.directions_bike),
                title: Text('Bike Ride'),
                subtitle: Text('January 13, 2024'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$7.00'),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.info_outline),
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                        ),
                        Text("Report", style: TextStyle(fontSize: 6),),
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.directions_bus),
                title: Text('Bus Ride'),
                subtitle: Text('January 14, 2024'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$2.50'),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.info_outline),
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                        ),
                        Text("Report", style: TextStyle(fontSize: 6),),
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Car Ride'),
                subtitle: Text('January 15, 2024'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$20'),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.info_outline),
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                        ),
                        Text("Report", style: TextStyle(fontSize: 6),),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/illustration-2.png',
              height: 350,
            ),
            Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 300,
                    height: 350,
                    child: const Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomInputField(
                                hintText: "Leaving From",
                                icon: Icons.location_on,
                                keyboardType: TextInputType.text,
                              ),
                              CustomInputField(
                                hintText: "Going To",
                                icon: Icons.location_on,
                                keyboardType: TextInputType.text,
                              ),
                              CustomInputField(
                                hintText: "Date Time",
                                icon: Icons.calendar_today,
                                keyboardType: TextInputType.datetime,
                              ),
                              CustomInputField(
                                hintText: "Number of People",
                                icon: Icons.account_circle,
                                keyboardType: TextInputType.number,
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
          ],
        ),
        bottomNavigationBar: bottomAppBar(context),
        floatingActionButton:  CustomFloatingActionButton(
          onPressed: () async {
            await getStatus();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
