import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Our Profiles')),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildProfileCard(
              'Fuaidil Ikhrom',
              'assets/images/fuadd.jpeg',
              'Mobile Developer',
              '(+62) 85975127759',
              'ifuaidil@gmail.com',
            ),
            SizedBox(height: 20.0),
            _buildProfileCard(
              'Haikal Akbar',
              'assets/images/haikal.jpeg',
              'Mobile Developer',
              '(+62) 81563472904',
              'haikal@gmail.com',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(
    String name,
    String imagePath,
    String jobTitle,
    String phoneNumber,
    String email,
  ) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 70.0,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 20.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            jobTitle,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.orange,
            ),
            title: Text(
              phoneNumber,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.orange,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.orange,
            ),
            title: Text(
              email,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
