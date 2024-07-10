  import 'package:carpool_2/Screens/navigation_screen.dart';
  import 'package:flutter/material.dart';

  class SearchPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      TextEditingController latController = TextEditingController();
      TextEditingController longController = TextEditingController();

      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSearchField("Enter Drop Stop Latitude", latController),
                SizedBox(height: 10),
                _buildSearchField("Enter Drop Stop Longitude", longController),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    String latitude = latController.text;
                    String longitude = longController.text;
                    if (latitude.isNotEmpty && longitude.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationScreen(
                            latitude: double.parse(latitude),
                            longitude: double.parse(longitude),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _buildSearchField(String label, TextEditingController controller) {
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          // labelText: label,
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    }
  }
