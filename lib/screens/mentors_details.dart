// ignore_for_file: prefer_const_constructors

import 'package:dev_camp_london2024/model/mentors_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorsDetails extends StatelessWidget {
  const MentorsDetails({super.key, required this.mentorModel});

  final MentorModel mentorModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${mentorModel.name}'s Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Image.asset(mentorModel.img!),
          SizedBox(height: 28),
          InkWell(
            onTap: () async {
              _luanchUrl(mentorModel.url!);
            },
            child: Text(
              mentorModel.name!,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 24,
                decoration: TextDecoration.underline,
                decorationColor: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _luanchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception("Could not Launch $url");
  }
}
