import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/features/auth/login/screens/login_screen.dart';
import 'package:mostawak/features/home/ai/screens/chat_screen.dart';
import 'package:mostawak/features/home/home/screens/main_screen.dart';
import 'package:mostawak/features/home/shop/screens/reward_screen.dart';
import 'package:mostawak/features/profile/profile.dart';
import 'package:mostawak/features/settings/settings.dart';
import 'package:mostawak/features/stats_and_dashboard/stats_and_dashboard.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF16697B),
        border: Border(
          top: BorderSide(color: Color(0XFFFFA62B), width: 3),
          right: BorderSide(color: Color(0XFFFFA62B), width: 3),
          bottom: BorderSide(color: Color(0XFFFFA62B), width: 3),
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        child: Drawer(
          backgroundColor: Colors.transparent,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Header =====
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0XFF489EB5),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: ClipOval(
                          child: SvgPicture.asset(
                            AppAssets.usama,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Usama Elgendy',
                        style: TextStyle(
                          fontFamily: 'BigShoulders',
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'usamaelgendy112@gmail.com',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 12,
                          color: Color(0xff9e9e9e),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color(0xff9e9e9e), thickness: 1),

                // ===== Drawer Items =====
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      _buildDrawerItem(
                        context,
                        AppAssets.home,
                        'Home',
                        const MainScreen(),
                      ),
                      _buildDrawerItem(
                        context,
                        AppAssets.shop,
                        'Shop',
                        const RewardScreen(),
                      ),
                      _buildDrawerItem(
                        context,
                        AppAssets.stats,
                        'Stats & Dashboard',
                        const StatsAndDashboard(),
                      ),
                      _buildDrawerItem(
                        context,
                        AppAssets.chat,
                        'Chat with AI',
                        const ChatScreen(),
                      ),
                      _buildDrawerItem(
                        context,
                        AppAssets.profile,
                        'Profile',
                        const ProfilePage(),
                      ),
                      _buildDrawerItem(
                        context,
                        AppAssets.settings,
                        'Settings',
                        const SettingsPage(),
                      ),
                      _buildDrawerItem(
                        context,
                        AppAssets.logout,
                        'Logout',
                        LoginScreen(),
                        logout: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===== Drawer Item Builder =====
  Widget _buildDrawerItem(
    BuildContext context,
    String svgPath,
    String title,
    Widget page, {
    bool logout = false,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        svgPath,
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () async {
        Navigator.pop(context);

        if (logout) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }
}
