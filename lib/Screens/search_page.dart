import 'package:carpool_2/Screens/navigation_screen.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  Widget _buildSearchField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  final latController = TextEditingController();
  final longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Search', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSearchField("Enter Drop Stop Latitude", latController),
              const SizedBox(height: 10),
              _buildSearchField("Enter Drop Stop Longitude", longController),
              const SizedBox(height: 10),
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
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
