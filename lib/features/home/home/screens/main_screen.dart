import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mostawak/core/constants/app_assets.dart';
import 'package:mostawak/features/auth/login/screens/login_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../shop/screens/reward_screen.dart';
import '../../challenges/screens/challenges_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            AppAssets.svgLogo,
            height: 70.h,
          ),
          centerTitle: true,
          toolbarHeight: 80.h,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.h),
            child: Container(
              color: const Color(0xff489eb5),
              child: TabBar(
                labelColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.bodySmall,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Home'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Learn'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Challenges'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              HomePage(),
              Center(
                child: Text('Welcome to the Learn Screen!'),
              ),
              ChallengesScreen(),
            ],
          ),
        ),
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart_rounded),
                  title: const Text('Shop'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RewardScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_rounded,
                    color: Colors.red,
                  ),
                  title: const Text('Logout'),
                  textColor: Colors.red,
                  onTap: () async {
                    Navigator.pop(context);
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
