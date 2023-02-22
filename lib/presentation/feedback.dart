import 'package:flutter/material.dart';

class FeedbackBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                _buildContactButton(
                  icon: Icons.email,
                  text: 'Email',
                  color: Colors.black,
                ),
                _buildContactButton(
                  icon: Icons.phone,
                  text: 'Phone',
                  color: Colors.blue,
                ),
                _buildContactButton(
                  icon: Icons.chat,
                  text: 'WhatsApp',
                  color: Colors.green.shade400,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                _buildContactField(
                  label: 'Email',
                  value: 'Nijas@dt.com',
                ),
                _buildContactField(
                  label: 'Phone',
                  value: '+913028471482',
                ),
                _buildContactField(
                  label: 'WhatsApp URL',
                  value: 'https://dummywhatsappurl.com',
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
