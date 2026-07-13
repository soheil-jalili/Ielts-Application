import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GamesModel {
  final String title;
  final String level;
  final Color backgroundColor;
  final Color titleColor;
  final Color buttonTextColor;
  final int rating;
  final List<String> users;

  GamesModel({
    required this.title,
    required this.level,
    required this.rating,
    required this.backgroundColor,
    required this.titleColor,
    required this.buttonTextColor,
    required this.users,
  });

  factory GamesModel.fromJson(Map<String, dynamic> json) {
    return GamesModel(
      title: json['title'] as String,
      level: json['level'] as String,
      users: json['users'],
      rating: json['rating'] as int,
      backgroundColor: HexColor(json['backgroundColor'] as String),
      titleColor: HexColor(json['titleColor'] as String),
      buttonTextColor: HexColor(json['buttonTextColor'] as String),
    );
  }
}
