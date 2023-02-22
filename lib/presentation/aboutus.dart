import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          _buildDeveloperSection(
            name: 'Nijas Ali H',
            photoUrl: 'https://via.placeholder.com/150x150',
            color: Colors.deepPurple,
            description:
                'John is a software engineer with a background in computer science. He is an expert in developing high-performance mobile applications using Flutter. John loves working on complex problems and building beautiful user interfaces that are intuitive and easy to use.',
          ),
          _buildDeveloperSection(
            name: 'Rinsha',
            photoUrl: 'https://via.placeholder.com/150x150',
            color: Colors.indigo,
            description:
                'Jane is a graphic designer and front-end developer with over five years of experience. She is passionate about creating beautiful and responsive designs that make user experiences enjoyable and efficient. Jane specializes in designing user interfaces and brand identities.',
          ),
          _buildDeveloperSection(
            name: 'Henna',
            photoUrl: 'https://via.placeholder.com/150x150',
            color: Colors.teal,
            description:
                'Mark is a full-stack developer with experience in building web and mobile applications. He is skilled in developing scalable and efficient applications using modern technologies. Mark is passionate about software development and loves to explore new technologies and tools.',
          ),
          _buildDeveloperSection(
            name: 'Hisham C',
            photoUrl: 'https://via.placeholder.com/150x150',
            color: Colors.amber,
            description:
                'Sarah is a mobile developer with a focus on user experience and accessibility. She has experience developing mobile applications for both iOS and Android using Flutter. Sarah loves to create seamless and efficient user experiences that delight users.',
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperSection({
    required String name,
    required String photoUrl,
    required Color color,
    required String description,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(photoUrl),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
