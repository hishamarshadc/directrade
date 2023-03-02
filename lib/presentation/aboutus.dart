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
            photoUrl: 'https://firebasestorage.googleapis.com/v0/b/directrade-db.appspot.com/o/248027505_519623812717986_1507547566175504103_n.jpg?alt=media&token=af858667-f993-4b07-aca5-f0e2c3041b10',
            color: Colors.deepPurple,
            description:
                'A software engineer with a background in computer science. He is an expert in developing high-performance mobile applications using Flutter. Nijas loves working on complex problems and building beautiful user interfaces that are intuitive and easy to use.',
          ),
          _buildDeveloperSection(
            name: 'Rinsha',
            photoUrl: 'https://firebasestorage.googleapis.com/v0/b/directrade-db.appspot.com/o/308461870_3271640959818086_257161984558787844_n.jpg?alt=media&token=04105d8b-f980-4f83-966b-f1ab091d6c2e',
            color: Colors.indigo,
            description:
                'A graphic designer and front-end developer with over five years of experience. She is passionate about creating beautiful and responsive designs that make user experiences enjoyable and efficient. She specializes in designing user interfaces and brand identities.',
          ),
          _buildDeveloperSection(
            name: 'Hanna',
            photoUrl: 'https://firebasestorage.googleapis.com/v0/b/directrade-db.appspot.com/o/download.png?alt=media&token=257e8eeb-948d-4213-ac06-c7812734cf9d',
            color: Colors.teal,
            description:
                'A full-stack developer with experience in building web and mobile applications. He is skilled in developing scalable and efficient applications using modern technologies. She is passionate about software development and loves to explore new technologies and tools.',
          ),
          _buildDeveloperSection(
            name: 'Hisham C',
            photoUrl: 'https://firebasestorage.googleapis.com/v0/b/directrade-db.appspot.com/o/294906793_1820005718391349_3723920081550497272_n.jpg?alt=media&token=b26b215d-697c-4de1-a9e6-9a4f9864302d',
            color: Colors.amber,
            description:
                'a Mobile Developer with a focus on user experience and accessibility. She has experience developing mobile applications for both iOS and Android using Flutter. He loves to create seamless and efficient user experiences that delight users.',
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
