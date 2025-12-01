import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Course {
  final String title;
  final String imagePath;

  Course(this.title, this.imagePath);
}

class CoursesGrid extends StatefulWidget {
  final List<Course> courses;
  final int selectedIndex;
  final Function(int) onCourseSelected;

  const CoursesGrid({
    super.key,
    required this.courses,
    required this.selectedIndex,
    required this.onCourseSelected,
  });

  @override
  State<CoursesGrid> createState() => _CoursesGridState();
}

class _CoursesGridState extends State<CoursesGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
      ),
      itemCount: widget.courses.length,
      itemBuilder: (context, index) {
        final course = widget.courses[index];
        final bool isSelected = index == widget.selectedIndex;

        const Color selectedBorderColor = Color(0xFFFE9C04);
        const Color unselectedBorderColor = Color(0xFF16697B);
        const Color textUnselectedColor = Color(0xFF16697B);

        return Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  widget.onCourseSelected(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: isSelected
                        ? Border.all(color: selectedBorderColor, width: 3.0)
                        : Border.all(color: unselectedBorderColor, width: 3.0),
                  ),
                  child: Center(
                    child: SvgPicture.asset(course.imagePath,
                        height: 180, width: 180),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              course.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? selectedBorderColor : textUnselectedColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
