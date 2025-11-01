import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:mostawak/core/constants/app_colors.dart';



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
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'STATS',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.shadowColor,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: ' & ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.accentColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: 'DASHBOARD',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.shadowColor,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
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
                  const Text(
                    'Progress Overview',
                    style: TextStyle(
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
                courseName: 'Math',
                lectureCount: 4,
                completedPercentage: 45,
              ),
              const SizedBox(height: 30),
              
            
              _buildCourseSection(
                courseName: 'Science',
                lectureCount: 2,
                completedPercentage: 25,
              ),
              const SizedBox(height: 30),
              
             
              _buildCourseSection(
                courseName: 'Programming',
                lectureCount: 7,
                completedPercentage: 75,
              ),
              const SizedBox(height: 30),
              
             
              _buildCourseSection(
                courseName: 'English',
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
              const TextSpan(
                text: 'Lecture : ',
                style: TextStyle(
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
              const TextSpan(
                text: 'Completed : ',
                style: TextStyle(
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