// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dev_camp_london2024/screens/mentors_details.dart';
import 'package:flutter/material.dart';

import '../model/mentors_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> topics = [
    "Introduction to flutter",
    "Flutter Basics and Layout",
    "Ïntro to state management Riverpod with API",
    "Riverpod with Firebase",
    "Flutter and API Integration",
    "Flutter with Firebase database, storage",
  ];

  final List<MentorModel> mentorModel = [
    MentorModel("assets/images/simon.jpeg", "Simon",
        "https://www.linkedin.com/in/simonlightfoot/"),
    MentorModel("assets/images/franklin.jpeg", "Franklin",
        "https://www.linkedin.com/in/franklin-oladipo/"),
    MentorModel("assets/images/nishtha.jpeg", "Nishtha",
        "https://www.linkedin.com/in/nishtha-saraswat/"),
    MentorModel("assets/images/renuka.jpeg", "Renuka",
        "https://www.linkedin.com/in/renukakelkar/"),
    MentorModel("assets/images/shree.jpeg", "Shree",
        "https://www.linkedin.com/in/shrihriday/"),
    MentorModel("assets/images/sumith.jpeg", "Sumith",
        "https://www.linkedin.com/in/sumith-damodaran/"),
    MentorModel("assets/images/yeasin.jpeg", "Yeasin",
        "https://www.linkedin.com/in/mdyeasinsheikh/"),
    MentorModel("assets/images/anthony.jpeg", "Anthony",
        "https://www.linkedin.com/in/atuoha-anthony/"),
  ];

  bool _isTopicVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "Flutter DevCamp",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                // textAlign: TextAlign.start,
                "Welcome to Flutter DevCamp",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: Image.asset(
              "assets/images/devcamp_img2.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isTopicVisible = !_isTopicVisible;
              });
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _isTopicVisible ? "Undo Review" : "Review Topics",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isTopicVisible,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 18,
                bottom: 8,
                left: 8,
                right: 8,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    return Text("${index + 1}. ${topics[index]}");
                  }),
            ),
          ),
          // SizedBox(height: 16),
          Text(
            "Mentors List",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          _isTopicVisible ? SizedBox(height: 1) : SizedBox(height: 8),
          SizedBox(
            height: 100,
            // color: Colors.red,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MentorsDetails(
                          mentorModel: mentorModel[index],
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 218,
                    width: 98,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 120,
                          width: 100,
                          child: Card(
                            elevation: 2,
                            shadowColor: Colors.blueGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(mentorModel[index].img!),
                                  ),
                                  SizedBox(height: 8),
                                  Text(mentorModel[index].name!),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 2, right: 2, left: 2),
                              child: Image.asset("assets/images/flutter.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Write your feedback",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.check_circle_sharp,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Write your feedback"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
