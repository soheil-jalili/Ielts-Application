import 'package:flutter/material.dart';
import 'package:ielts/gen/assets.gen.dart';
import 'package:ielts/widgets/course_title.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: CourseTitle(title: 'دوره های آموزشی'),
              ),
            ),

            SliverList.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(
                      top: index == 0 ? 20 : 0,
                      bottom: index == 3 ? 124 : 24,
                    ),
                    width: double.infinity,
                    height: 180,
                    child: Image.asset(Assets.images.banner1.path),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
