import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController educationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Ojas Mehrotra';
    jobTitleController.text = 'Software Developer';
    emailController.text = 'ojas@example.com';
    phoneController.text = '+91 123 456 7890';
    locationController.text = 'New Delhi';
    workController.text = 'Avalon Information Systems Pvt Ltd';
    educationController.text = 'B.Tech in Computer Science';
  }

  @override
  void dispose() {
    nameController.dispose();
    jobTitleController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    workController.dispose();
    educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Profile', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white,),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.save, color: Colors.white,),
              onPressed: () {
                setState(() {
                  nameController.text = nameController.text;
                  jobTitleController.text = jobTitleController.text;
                  emailController.text = emailController.text;
                  phoneController.text = phoneController.text;
                  locationController.text = locationController.text;
                  workController.text = workController.text;
                  educationController.text = educationController.text;
                  isEditing = false;
                });
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?t=st=1720637466~exp=1720641066~hmac=4d8d4e739ec80aa6acc8f8cd5aa967859ee542d7acca56dc3e88b50ae6c7be62&w=740"),
              ),
              const SizedBox(height: 16),
              isEditing
                  ? TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              )
                  : Text(
                nameController.text,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              isEditing
                  ? TextFormField(
                controller: jobTitleController,
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                ),
              )
                  : Text(
                jobTitleController.text,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.email),
                title: isEditing
                    ? TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                  ),
                )
                    : Text(emailController.text),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: isEditing
                    ? TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone number',
                  ),
                )
                    : Text(phoneController.text),
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: isEditing
                    ? TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your location',
                  ),
                )
                    : Text(locationController.text),
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: isEditing
                    ? TextFormField(
                  controller: workController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your work place',
                  ),
                )
                    : Text(workController.text),
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: isEditing
                    ? TextFormField(
                  controller: educationController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your education',
                  ),
                )
                    : Text(educationController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
