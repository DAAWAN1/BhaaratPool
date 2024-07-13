import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController educationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Ojas Mehrotra';
    ratingController.text = 'Intermediate';
    emailController.text = 'ojas@example.com';
    phoneController.text = '+91 123 456 7890';
    locationController.text = 'New Delhi';
    workController.text = 'Avalon Information Systems Pvt Ltd';
    educationController.text = 'B.Tech in Computer Science';
  }

  @override
  void dispose() {
    nameController.dispose();
    ratingController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    workController.dispose();
    educationController.dispose();
    super.dispose();
  }

  Widget buildListTile({
    required String title,
    required String subtitle,
    Color titleColor = Colors.black,
    Color subtitleColor = Colors.grey,
    IconData? trailingIcon,
    Color trailingIconColor = Colors.black,
    Function()? onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: titleColor, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: subtitleColor, fontSize: 12),
      ),
      trailing: Icon(
        trailingIcon,
        size: 18,
        color: trailingIconColor,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1720637466~exp=1720641066~hmac=4d8d4e739ec80aa6acc8f8cd5aa967859ee542d7acca56dc3e88b50ae6c7be62&w=740"),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              nameController.text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Edit profile",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // Icon(
                  //   Icons.arrow_forward_ios_sharp,
                  //   size: 12,
                  //   color: Colors.blueGrey,
                  // )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              ratingController.text,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
            const SizedBox(height: 25),
            buildListTile(
              title: "Account Settings",
              subtitle: "Notifications Passwords and more",
              trailingIcon: Icons.arrow_forward_ios_sharp,
            ),
            const Divider(indent: 18.0, endIndent: 18.0),
            buildListTile(
              title: "Wallet Balances",
              subtitle: "Wallet Management, payment methods and more",
              trailingIcon: Icons.arrow_forward_ios_sharp,
            ),
            const Divider(indent: 18.0, endIndent: 18.0),
            buildListTile(
              title: "Rewards",
              subtitle: "Bharatpool Points, cashbacks and more",
              trailingIcon: Icons.arrow_forward_ios_sharp,
            ),
            const Divider(indent: 18.0, endIndent: 18.0),
            buildListTile(
              title: "Ride statistics",
              subtitle: "Rating reviews and more",
              trailingIcon: Icons.arrow_forward_ios_sharp,
            ),
            const Divider(indent: 18.0, endIndent: 18.0),
            buildListTile(
              title: "Accessibility",
              subtitle: "Language and Text icon size",
              trailingIcon: Icons.arrow_forward_ios_sharp,
            ),
            const Divider(indent: 18.0, endIndent: 18.0),
            buildListTile(
              title: "Help & Support",
              subtitle: "Language and Text icon size",
              trailingIcon: Icons.arrow_forward_ios_sharp,
            ),
            const Divider(indent: 18.0, endIndent: 18.0),
            buildListTile(
              title: "Log Out",
              subtitle: "",
              titleColor: Colors.red,

              // trailingIconColor: Colors.red,
            ),
            const SizedBox(height: 30),
            const ListTile(
              subtitle: Text(
                "T&Cs and Privacy Policy",
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              title: Row(
                children: [
                  Icon(FontAwesomeIcons.instagram),
                  SizedBox(width: 25),
                  Icon(FontAwesomeIcons.facebook),
                  SizedBox(width: 25),
                  Icon(FontAwesomeIcons.twitter),
                ],
              ),
            ),
            // SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
