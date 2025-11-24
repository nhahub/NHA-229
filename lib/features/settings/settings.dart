import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/core/widgets/custom_drawer.dart';
import 'package:mostawak/features/auth/forgot_password/screens/forget_password_email_screen.dart';
import 'package:mostawak/features/auth/login/screens/login_screen.dart';
import 'package:mostawak/services/auth_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool offlineModeEnabled = true;
  String selectedLanguage = 'En';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.textColor,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: SvgPicture.asset(
              AppAssets.drawerIcon,
              width: 25,
              height: 25,
            ),
          ),
        ),
        title: SvgPicture.asset(
          AppAssets.settings,
          height: 50.h,
        ),
        centerTitle: true,
        toolbarHeight: 80.h,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildSectionTitle('App Preferences'),
              const SizedBox(height: 20),
              _buildToggleItem('notifications', notificationsEnabled, (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              }),
              const SizedBox(height: 16),
              _buildLanguageItem(),
              const SizedBox(height: 16),
              _buildToggleItem('offline mode', offlineModeEnabled, (value) {
                setState(() {
                  offlineModeEnabled = value;
                });
              }),
              const SizedBox(height: 40),
              _buildSectionTitle('Account Settings'),
              const SizedBox(height: 20),
              _buildNavigationItem('change password'),
              const SizedBox(height: 16),
              _buildNavigationItem('User details'),
              const SizedBox(height: 16),
              _buildNavigationItem('Logout'),
              const SizedBox(height: 40),
              _buildSectionTitle('Legal & Info'),
              const SizedBox(height: 20),
              _buildNavigationItem('Privacy Policy'),
              const SizedBox(height: 16),
              _buildNavigationItem('app info'),
              const SizedBox(height: 16),
              _buildNavigationItem('Help & Support'),
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
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
      ],
    );
  }

  Widget _buildToggleItem(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF9DB5BC),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          thumbColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFF2B7A8C);
              }
              return Colors.grey;
            },
          ),
          trackColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFF7AB5C1);
              }
              return Colors.grey.shade400;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'language',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF9DB5BC),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedLanguage = 'Ar';
                });
              },
              child: Text(
                'Ar',
                style: TextStyle(
                  fontSize: 16,
                  color: selectedLanguage == 'Ar'
                      ? const Color(0xFF2B7A8C)
                      : const Color(0xFF9DB5BC),
                  fontWeight: selectedLanguage == 'Ar'
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            const Text(
              ' | ',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF9DB5BC),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedLanguage = 'En';
                });
              },
              child: Text(
                'En',
                style: TextStyle(
                  fontSize: 16,
                  color: selectedLanguage == 'En'
                      ? const Color(0xFF2B7A8C)
                      : const Color(0xFF9DB5BC),
                  fontWeight: selectedLanguage == 'En'
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavigationItem(String title) {
    return SizedBox(
      height: 30,
      child: InkWell(
        onTap: () {
          _func(title, context);
        },
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

void _func(String title, BuildContext context) async {
  switch (title) {
    case 'change password':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgetPasswordEmailScreen(),
        ),
      );
      break;
    case 'User details':
      // TODO: Implement navigation to User details screen
      break;
    case 'Logout':
      AuthService().signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false,
      );
      break;
    // case 'Privacy Policy':
    //   break;
    // case 'app info':
    //   break;
    // case 'Help & Support':
    //   break;
    default:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(title),
            ),
          ),
        ),
      );
      break;
  }
}
