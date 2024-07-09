import 'dart:ui';
import 'package:carpool_2/Screens/search_page.dart';
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
    final request = http.Request('GET', Uri.parse('https://api.countrystatecity.in/v1/countries'));
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

  Widget buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async{
        await getStatus();
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => SearchPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin =  Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;
              final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      tooltip: 'Search',
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      child: const Icon(Icons.search),
    );
  }

  BottomAppBar bottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.deepPurple,
      child: SizedBox(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {}, // Replace with your search function
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_sharp),
              onPressed: () {},
              color: Colors.white,
            ),
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
        floatingActionButton: buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
