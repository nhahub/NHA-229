import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RankStage {
  final String level;
  final String stageNumber;
  final String svgAssetPath;

  RankStage({
    required this.level,
    required this.stageNumber,
    required this.svgAssetPath,
  });

  String get name => '$level $stageNumber';
}

final List<RankStage> allStages = [
  // Bronze Levels
  RankStage(
      level: 'Bronze',
      stageNumber: '|',
      svgAssetPath: 'assets/images/bronze1.svg'),
  RankStage(
      level: 'Bronze',
      stageNumber: '||',
      svgAssetPath: 'assets/images/bronze2.svg'),
  RankStage(
      level: 'Bronze',
      stageNumber: '|||',
      svgAssetPath: 'assets/images/bronze3.svg'),
  // Silver Levels
  RankStage(
      level: 'Silver',
      stageNumber: '|',
      svgAssetPath: 'assets/images/silver1.svg'),
  RankStage(
      level: 'Silver',
      stageNumber: '||',
      svgAssetPath: 'assets/images/silver2.svg'),
  RankStage(
      level: 'Silver',
      stageNumber: '|||',
      svgAssetPath: 'assets/images/silver3.svg'),
  // Gold Levels
  RankStage(
      level: 'Gold', stageNumber: '|', svgAssetPath: 'assets/images/gold1.svg'),
  RankStage(
      level: 'Gold',
      stageNumber: '||',
      svgAssetPath: 'assets/images/gold2.svg'),
  RankStage(
      level: 'Gold',
      stageNumber: '|||',
      svgAssetPath: 'assets/images/gold3.svg'),
];

class RankScreen extends StatefulWidget {
  const RankScreen({super.key});

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  final int _currentStageIndex = 0;
  // final int _maxStageIndex = allStages.length - 1;
  Color _getLevelColor(String level) {
    switch (level) {
      case 'Bronze':
        return const Color(0xFFF6B8A2);
      case 'Silver':
        return const Color(0xFF9F9AC7);
      case 'Gold':
        return const Color(0xFFEE7A27);
      default:
        return Colors.black;
    }
  }

  // void _progressToNextStage() {
  //   setState(() {
  //     if (_currentStageIndex < _maxStageIndex) {
  //       _currentStageIndex++;
  //     } else {
  //       _showMessage('You have reached the highest rank (Gold III)!');
  //     }
  //   });
  // }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF336E7B),
      ),
    );
  }

  Widget _buildStageIcon(int index) {
    final stage = allStages[index];
    final bool isCompleted = index < _currentStageIndex;
    final bool isCurrent = index == _currentStageIndex;
    final bool isLocked = index > _currentStageIndex;
    double opacity = isLocked ? 0.4 : 1.0;

    String message;
    if (isCurrent) {
      message = 'This is your current stage: ${stage.name}';
    } else if (isCompleted) {
      message = 'You have completed this stage: ${stage.name}';
    } else {
      message =
          'This stage is locked! Complete ${allStages[_currentStageIndex].name} first.';
    }

    return GestureDetector(
      onTap: () => _showMessage(message),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isLocked ? Colors.grey.shade600 : Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Opacity(
              opacity: opacity,
              child: SvgPicture.asset(
                stage.svgAssetPath,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentRankDisplay(RankStage currentStage) {
    final Color levelTextColor = _getLevelColor(currentStage.level);
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF0EAE4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            currentStage.svgAssetPath,
            width: 180,
            height: 180,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          currentStage.name,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: levelTextColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStage = allStages[_currentStageIndex];
    // final nextStageName = _currentStageIndex < _maxStageIndex
    //     ? allStages[_currentStageIndex + 1].name
    //     : 'Completed';

    return Scaffold(
      backgroundColor: const Color(0xFFF0EAE4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF336E7B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: SvgPicture.asset(
          'assets/images/my_rank.svg',
          height: 60,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCurrentRankDisplay(currentStage),
            const SizedBox(height: 40),
            ...List.generate(3, (rowIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(3, (colIndex) {
                    final index = rowIndex * 3 + colIndex;
                    if (index < allStages.length) {
                      return _buildStageIcon(index);
                    }
                    return const SizedBox.shrink();
                  }),
                ),
              );
            }),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
