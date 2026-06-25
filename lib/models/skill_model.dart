import 'package:flutter/material.dart';
import 'package:ielts/gen/assets.gen.dart';

class SkillModel {
  String title;
  String image;
  Alignment titleAlignment;
  Alignment shapeAlignment;

  SkillModel({
    required this.title,
    required this.titleAlignment,
    required this.shapeAlignment,
    required this.image,
  });
}

List<SkillModel> skills = [
  SkillModel(
    title: 'نوشتن',
    titleAlignment: Alignment.topLeft,
    shapeAlignment: Alignment.bottomRight,
    image: Assets.images.zero.path,
  ),
  SkillModel(
    title: 'شنیدن',
    titleAlignment: Alignment.topRight,
    shapeAlignment: Alignment.bottomLeft,
    image: Assets.images.one.path,
  ),
  SkillModel(
    title: 'گفتگو',
    titleAlignment: Alignment.topLeft,
    shapeAlignment: Alignment.bottomRight,
    image: Assets.images.two.path,
  ),
  SkillModel(
    title: 'گرامر',
    titleAlignment: Alignment.topRight,
    shapeAlignment: Alignment.bottomLeft,
    image: Assets.images.three.path,
  ),
];
