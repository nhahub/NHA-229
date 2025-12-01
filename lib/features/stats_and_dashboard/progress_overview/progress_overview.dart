import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/generated/l10n.dart';

class ProgressOverviewPage extends StatelessWidget {
  const ProgressOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SvgPicture.asset(
          'assets/images/statsAndDashboard.svg',
          width: 250.w,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.progressOverview,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: MyColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 2,
                    color: MyColors.borderColor,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildCourseSection(
                courseName: S.current.math,
                lectureCount: 4,
                completedPercentage: 45,
              ),
              const SizedBox(height: 30),
              _buildCourseSection(
                courseName: S.current.science,
                lectureCount: 2,
                completedPercentage: 25,
              ),
              const SizedBox(height: 30),
              _buildCourseSection(
                courseName: S.current.programming,
                lectureCount: 7,
                completedPercentage: 75,
              ),
              const SizedBox(height: 30),
              _buildCourseSection(
                courseName: S.current.english,
                lectureCount: 12,
                completedPercentage: 100,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseSection({
    required String courseName,
    required int lectureCount,
    required int completedPercentage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          courseName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: MyColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${S.current.lecture}: ',
                style: const TextStyle(
                  fontSize: 16,
                  color: MyColors.shadowColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: '$lectureCount',
                style: const TextStyle(
                  fontSize: 16,
                  color: MyColors.accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${S.current.completed}: ',
                style: const TextStyle(
                  fontSize: 16,
                  color: MyColors.shadowColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: '$completedPercentage%',
                style: const TextStyle(
                  fontSize: 16,
                  color: MyColors.accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
