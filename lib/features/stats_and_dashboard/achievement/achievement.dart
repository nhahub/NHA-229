import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_colors.dart';


class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

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
                  fontStyle: FontStyle.normal,
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Achievements',
                  style: TextStyle(
                    fontSize: 20,
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
            
         
            _buildStatItem(
              label: 'Coins Gained',
              value: '1205',
              valueColor: MyColors.accentColor,
              icon: Icons.monetization_on,
            ),
             SizedBox(height: 35.h),
            
            _buildStatItem(
              label: 'Completed Tests',
              value: '41',
              valueColor: MyColors.accentColor,
            ),
           SizedBox(height: 35.h),
            
            
            _buildStatItem(
              label: 'Success Rate',
              value: '80%',
              valueColor: MyColors.accentColor,
            ),
            SizedBox(height: 35.h),
            
            _buildStatItem(
              label: 'Daily Streak',
              value: '31 day',
              valueColor: MyColors.accentColor,
            ),
          SizedBox(height: 35.h),
             
            _buildStatItem(
              label: 'Completed Lessons',
              value: '17',
              valueColor: MyColors.accentColor,
            ),
           SizedBox(height: 35.h),
            
            
            _buildStatItem(
              label: 'Completed Courses',
              value: '0',
              valueColor: MyColors.accentColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required Color valueColor,
    IconData? icon,
  }) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$label : ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: MyColors.shadowColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontSize: 16,
                    color: valueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (icon != null)
          Icon(
            icon,
            color: MyColors.accentColor,
            size: 20,
          ),
      ],
    );
  }
}