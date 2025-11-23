import 'package:flutter/material.dart';
import 'package:mostawak/core/constants/app_colors.dart';

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
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: MyColors.accentColor),
          onPressed: () {},
        ),
        title: const Icon(
          Icons.settings,
          color: MyColors.accentColor,
          size: 32,
        ),
        centerTitle: true,
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
    return InkWell(
      onTap: () {},
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
    );
  }
}
