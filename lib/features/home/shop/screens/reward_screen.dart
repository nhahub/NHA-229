import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/core/constants/app_colors.dart';
import 'package:mostawak/core/widgets/custom_drawer.dart';
import 'package:mostawak/generated/l10n.dart';
import '../../challenges/widgets/reusable_appbar.dart';
import '../widgets/info_card.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  late final String uid;
  late final DocumentReference userDoc;
  Set<String> ownedItems = {};

  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not logged in!")),
        );
        Navigator.pop(context);
      });
    } else {
      uid = currentUser.uid;
      userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      _loadOwnedItems();
    }
  }

  Future<void> _loadOwnedItems() async {
    final snapshot = await userDoc.get();
    final data = snapshot.data() as Map<String, dynamic>? ?? {};
    setState(() {
      ownedItems = Set<String>.from(data['ownedItems'] ?? []);
    });
  }

  Future<void> _buyOrApplyItem({
    required int cost,
    required String itemName,
  }) async {
    if (ownedItems.contains(itemName)) {
      // Item already purchased, apply it
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$itemName applied!")),
      );
      return;
    }

    final snapshot = await userDoc.get();
    final data = snapshot.data() as Map<String, dynamic>? ?? {};
    int coins = data['coins'] ?? 0;

    if (coins >= cost) {
      // Deduct coins and add item to ownedItems
      await userDoc.update({'coins': coins - cost});
      await userDoc.set({
        'ownedItems': FieldValue.arrayUnion([itemName])
      }, SetOptions(merge: true));

      setState(() => ownedItems.add(itemName));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$itemName purchased!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Not enough coins!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(
        centerImage: 'assets/images/shop_title.svg',
        showTabs: false,
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: userDoc.snapshots(),
          builder: (context, snapshot) {
            int coins = 0;
            if (snapshot.hasData && snapshot.data!.exists) {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              coins = data['coins'] ?? 0;
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      S.current.shopMessage,
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.monetization_on,
                          color: Colors.amber, size: 20.sp),
                      SizedBox(width: 4.w),
                      Text(
                        '${S.current.yourBalance}: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyColors.primary,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        " $coins ${S.current.coins}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  /// 🔹 First Card
                  InfoCard(
                    title1: S.current.mostawakHeroAvatar,
                    titleStyle: TextStyle(fontSize: 12.sp, color: Colors.white),
                    value1: S.current.epic,
                    title2:
                        S.current.aHeroicStyle,
                    imagePath2: "assets/images/avatar.png",
                    title3: "45",
                    imagePath3: "assets/images/coin.png",
                    buttonText: ownedItems.contains("Mostawak hero avatar")
                        ? S.current.applyNow
                        : S.current.unlock,
                    onButtonPressed: () => _buyOrApplyItem(
                        cost: 45, itemName: "Mostawak hero avatar"),
                    buttonColor: const Color(0xff16697B),
                    buttonTextColor: Colors.white,
                    cardColor: const Color(0xff489EB5),
                  ),
                  SizedBox(height: 16.h),

                  /// 🔹 Second Card
                  InfoCard(
                    title1: S.current.blackAndWhiteTheme,
                    value1: S.current.common,
                    title2:
                        S.current.aCleanBlackAndWhiteTheme,
                    imagePath2: null,
                    title3: "25",
                    imagePath3: "assets/images/coin.png",
                    buttonText: ownedItems.contains("Black and white theme")
                        ? S.current.applyNow
                        : S.current.unlock,
                    onButtonPressed: () => _buyOrApplyItem(
                        cost: 25, itemName: "Black and white theme"),
                    buttonColor: Colors.black,
                    buttonTextColor: Colors.white,
                    cardColor: Colors.white,
                  ),
                  SizedBox(height: 16.h),

                  /// 🔹 Third Card
                  InfoCard(
                    title1: S.current.doubleXP,
                    titleStyle: TextStyle(fontSize: 12.sp, color: Colors.white),
                    value1: S.current.common,
                    title2:
                        S.current.doubleXPMessage,
                    imagePath2: null,
                    title3: "35",
                    imagePath3: "assets/images/coin.png",
                    buttonText: ownedItems.contains("Double XP Weekend")
                        ? S.current.applyNow
                        : S.current.unlock,
                    onButtonPressed: () => _buyOrApplyItem(
                        cost: 35, itemName: "Double XP Weekend"),
                    buttonColor: const Color(0xff16697B),
                    buttonTextColor: Colors.white,
                    cardColor: const Color(0xff489EB5),
                  ),
                  SizedBox(height: 16.h),

                  /// 🔹 Fourth Card
                  InfoCard(
                    title1: S.current.tripleXP,
                    titleStyle: TextStyle(fontSize: 12.sp, color: Colors.white),
                    value1: S.current.common,
                    title2:
                        S.current.tripleXPMessage,
                    imagePath2: null,
                    title3: "40",
                    imagePath3: "assets/images/coin.png",
                    buttonText: ownedItems.contains("3x XP Weekend")
                        ? S.current.applyNow
                        : S.current.unlock,
                    onButtonPressed: () =>
                        _buyOrApplyItem(cost: 40, itemName: "3x XP Weekend"),
                    buttonColor: const Color(0xff16697B),
                    buttonTextColor: Colors.white,
                    cardColor: const Color(0xff489EB5),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
