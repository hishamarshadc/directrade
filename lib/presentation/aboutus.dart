import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text("Meet the team",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline)),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              children: <Widget>[
                _buildCard(
                    name: "Nijas",
                    image: "https://randomuser.me/api/portraits/men/1.jpg"),
                _buildCard(
                    name: "Rinsha",
                    image: "https://randomuser.me/api/portraits/men/1.jpg"),
                _buildCard(
                    name: "Henna",
                    image: "https://randomuser.me/api/portraits/men/1.jpg"),
                _buildCard(
                    name: "hisham",
                    image: "https://randomuser.me/api/portraits/men/1.jpg"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: const TextSpan(
                  text: "Made with",
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: " ❤️",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(
                      text: " for India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard({required String name, required String image}) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.fitHeight)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
