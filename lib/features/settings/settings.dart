import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/core/widgets/custom_drawer.dart';
import 'package:mostawak/features/auth/forgot_password/screens/forget_password_email_screen.dart';
import 'package:mostawak/features/auth/login/screens/login_screen.dart';
import 'package:mostawak/features/profile/profile.dart';
import 'package:mostawak/features/settings/controllers/switch_controller.dart';
import 'package:mostawak/features/settings/controllers/language_controller.dart';
import 'package:mostawak/generated/l10n.dart';
import 'package:mostawak/services/auth_service.dart';
import 'package:mostawak/services/firebase_notifications.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool notifications = false;
    bool offlineMode = false;

    return BlocBuilder<LanguageController, String>(
      builder: (context, languageState) {
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
                  _buildSectionTitle(S.current.appPreferences),
                  const SizedBox(height: 20),
                  BlocProvider(
                    create: (context) => SwitchController(notifications),
                    child: BlocBuilder<SwitchController, bool>(
                      builder: (context, notificationsState) {
                        return _buildToggleItem(
                            S.current.notifications, notificationsState,
                            (value) {
                          context
                              .read<SwitchController>()
                              .add(ToggleSwitch(value));
                          if (value) {
                            // Enable notifications
                            FirebaseNotifications().initialize();
                          } else {
                            // Disable notifications
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildLanguageItem(),
                  const SizedBox(height: 16),
                  BlocProvider(
                    create: (context) => SwitchController(offlineMode),
                    child: BlocBuilder<SwitchController, bool>(
                      builder: (context, offlineModeState) {
                        return _buildToggleItem(
                            S.current.offlineMode, offlineModeState, (value) {
                          context
                              .read<SwitchController>()
                              .add(ToggleSwitch(value));
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildSectionTitle(S.current.accountSettings),
                  const SizedBox(height: 20),
                  _buildNavigationItem(S.current.changePassword),
                  const SizedBox(height: 16),
                  _buildNavigationItem(S.current.userDetails),
                  const SizedBox(height: 16),
                  _buildNavigationItem(S.current.logout),
                  const SizedBox(height: 40),
                  _buildSectionTitle(S.current.legalInfo),
                  const SizedBox(height: 20),
                  _buildNavigationItem(S.current.privacyPolicy),
                  const SizedBox(height: 16),
                  _buildNavigationItem(S.current.appInfo),
                  const SizedBox(height: 16),
                  _buildNavigationItem(S.current.helpSupport),
                ],
              ),
            ),
          ),
          drawer: const CustomDrawer(),
        );
      },
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
            color: Color(0xFF82C0CB),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          thumbColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFFECE7E3);
              }
              return Colors.grey;
            },
          ),
          trackColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFF16697B);
              }
              return const Color(0xFFECE7E3);
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
        Text(
          S.current.language,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF82C0CB),
          ),
        ),
        BlocBuilder<LanguageController, String>(
          builder: (context, languageState) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context
                        .read<LanguageController>()
                        .add(ChangeLanguage('ar'));
                  },
                  child: Text(
                    'Ar',
                    style: TextStyle(
                      fontSize: 16,
                      color: languageState == 'ar'
                          ? const Color(0xFF2B7A8C)
                          : const Color(0xFF82C0CB),
                      fontWeight: languageState == 'ar'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                const Text(
                  ' | ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF82C0CB),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<LanguageController>()
                        .add(ChangeLanguage('en'));
                  },
                  child: Text(
                    'En',
                    style: TextStyle(
                      fontSize: 16,
                      color: languageState == 'en'
                          ? const Color(0xFF2B7A8C)
                          : const Color(0xFF82C0CB),
                      fontWeight: languageState == 'en'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            );
          },
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
                color: Color(0xFF82C0CB),
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Color(0xFF82C0CB),
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ),
      );
      break;
    case 'Logout':
      AuthService().signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
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
