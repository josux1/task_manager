import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({super.key, required this.items});
  final int items;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = BorderRadius.circular(8);

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: items,
      itemBuilder: (context, index) {
        return SizedBox(
            height: size.height * 0.08,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardLoading(
                    height: size.height * 0.02,
                    width: size.width * 0.4,
                    borderRadius: radius,
                  ),
                  const SizedBox(height: 5),
                  CardLoading(
                    height: size.height * 0.02,
                    width: size.width * 0.9,
                    borderRadius: radius,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
