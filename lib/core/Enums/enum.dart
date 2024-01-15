// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum Interests {
  // Anxiety, Depression, Insomnia,
  Studies(title: "Studies"),
  Reading(title: "Reading"),
  Technologies(title: "Technologies"),
  Travel(title: "Travel"),
  Psychology(title: "Psychology"),
  Gaming(title: "Gaming"),
  TVMovies(title: "TV/Movies"),
  Sports(title: "Sports"),
  Languages(title: "Languages"),
  Fashion(title: "Fashion"),
  Fitness(title: "Fitness"),
  Pets(title: "Pets"),
  Food(title: "Food"),
  ClimageChange(title: "Climate Change"),
  SelfCare(title: "Self-Care"),
  WorkLife(title: "Work life"),
  Culture(title: "Culture"),
  Design(title: "Design"),
  Sociology(title: "Sociology"),
  Music(title: "Music"),
  Outdoor(title: "Outdoor"),
  Networking(title: "Networking"),
  Romance(title: "Romance"),
  Shopping(title: "Shopping"),
  SightSeeing(title: "Sight-Seeing");

  const Interests({required this.title});
  final String title;
}

enum ProfileStats {
  Challenges(
    title: "Challenges",
    amount: "17",
    isSVG: false,
    imageAsset: "assets/icons/target.png",
  ),
  LessonsPassed(
    title: "Lessons Passed",
    amount: "17",
    isSVG: true,
    imageAsset: "assets/icons/lesson_icon.svg",
  ),
  DiamondGem(
    title: "Total Diamond",
    amount: "05",
    imageAsset: "assets/icons/diamond_icon.png",
    isSVG: false,
  ),
  LifetimeXP(
    title: "Total Lifetime XP",
    amount: "11,147",
    imageAsset: "assets/icons/lightning_bolt.svg",
    isSVG: true,
  ),
  Streaks(
    title: "Streaks",
    amount: "17",
    imageAsset: "assets/icons/fire_icon.png",
    isSVG: false,
  ),
  TopPercent(
    title: "Top 20% Global",
    amount: "36",
    imageAsset: "assets/icons/badge_image.png",
    isSVG: false,
  ),
  ;

  const ProfileStats(
      {required this.title,
      required this.isSVG,
      required this.imageAsset,
      required this.amount});

  final String title;
  final String imageAsset;
  final bool isSVG;
  final String amount;
}

enum Lessons {
  FirstTrip(
      lessonName: "First Trip",
      assetImage: "assets/images/lesson_image_1.jpeg",
      iconColor: Color(0xFFE16723),
      details:
          "Here you will listen to conversations between tourists and learn to speak together with them!"),
  FreelanceWork(
      lessonName: "Freelance Work",
      iconColor: Color(0xFF918A89),
      assetImage: "assets/images/lesson_image_2.jpeg",
      details:
          "Here you will listen to conversations between tourists and learn to speak together with them!"),
  FirstMeeting(
      lessonName: "First Meeting",
      iconColor: Color(0xFFCB9937),
      assetImage: "assets/images/lesson_image_3.jpeg",
      details:
          "After taking this classes, you will be able to take orders from foreigners!"),
  MeetintWithPartners(
      lessonName: "Meeting With Partners",
      iconColor: Colors.black,
      assetImage: "assets/images/lesson_image_4.jpeg",
      details:
          "You will learn to communicate with your colleagues and understand them!"),
  ;

  const Lessons({
    required this.lessonName,
    required this.assetImage,
    required this.details,
    required this.iconColor,
  });
  final String lessonName;
  final String assetImage;
  final String details;
  final Color iconColor;
}
