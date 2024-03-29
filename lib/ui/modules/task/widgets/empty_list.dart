import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsk_mg/core/services/assets/assets.dart';
import 'package:tsk_mg/ui/utils/utils.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key, required this.onRefresh});
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: [
          SizedBox(height: size.height * 0.1),
          SvgPicture.asset(AppAssets.svgOffline, height: size.height * 0.2),
          SizedBox(height: size.height * 0.02),
          Center(
              child: Text('Sorry, we have a problem. Try later.',
                  style: t.medium)),
        ],
      ),
    );
  }
}
