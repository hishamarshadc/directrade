import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackBox extends StatelessWidget {
  final cmail=Uri.parse('mailto:project.directrade@gmail.com');
  final cphone=Uri.parse('tel:+919207631619');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Contact Us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact us via',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    launchUrl(
                      cmail
                    );
                  },
                  child: _buildContactButton(
                    icon: Icons.email,
                    text: 'Email',
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(cphone);
                  },
                  child: _buildContactButton(
                    icon: Icons.phone,
                    text: 'Phone',
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                _buildContactField(
                  label: 'Email',
                  value: 'project.directrade@gmail.com',
                ),
                _buildContactField(
                  label: 'Phone',
                  value: '+91 9207631619',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactField({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Calibri',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
