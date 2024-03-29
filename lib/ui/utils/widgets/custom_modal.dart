import 'package:flutter/material.dart';
import 'package:tsk_mg/ui/utils/utils.dart';

Future<void> showCustomModal({
  required BuildContext context,
  required String title,
  Widget? children,
  VoidCallback? onExit,
  TextStyle? titleStyle,
  bool canScroll = true,
  Color? backColor,
}) async {
  await showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      barrierColor: backColor ?? Colors.grey.withOpacity(0.2),
      elevation: 0,
      context: context,
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      builder: (context) {
        final size = MediaQuery.of(context).size;

        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          child: Scrollbar(
            child: ListView(
              physics: canScroll ? null : const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.75,
                          child: Text(
                            title,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: titleStyle ?? t.title.copyWith(fontSize: 22),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              if (onExit != null) {
                                onExit();
                              }
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close, color: Colors.grey))
                      ],
                    )),
                const Divider(color: Colors.transparent),
                if (children != null) children,
                const Divider(color: Colors.transparent),
                const Divider(color: Colors.transparent),
              ],
            ),
          ),
        );
      });
}
