import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mostawak/core/constants/app_colors.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.textColor,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: MyColors.accentColor),
          onPressed: () {},
        ),
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'MY',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: MyColors.shadowColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: ' PROFILE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MyColors.accentColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 60),
         
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
              child :    SvgPicture.asset(
                      'assets/images/person.svg',
                    ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                

                    
                  ),
                ),
         
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7AB5C1),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
           SizedBox(height: 20),
         
          const Text(
            'Usama Elgendy',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B7A8C),
            ),
          ),
          const SizedBox(height: 8),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'plat V',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9DB5BC),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF9C7FB8),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile Info',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2B7A8C),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 2,
                  color: const Color(0xFF2B7A8C),
                ),
                const SizedBox(height: 20),
                _buildMenuItem(
                  context,
                  'User details',
                  () {},
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  context,
                  'Settings',
                  () {},
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  context,
                  'Logout',
                  () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF9DB5BC),
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Color(0xFF9DB5BC),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}