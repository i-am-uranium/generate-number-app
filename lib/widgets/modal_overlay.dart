import 'package:flutter/material.dart';
import 'package:numbers/widgets/hud_overlay.dart';
import 'package:numbers/widgets/modal_overlay_child.dart';

class ModalOverlay {
  static void inserOverlay(BuildContext context, String content, String title,
      {ModalType modalType}) {
    Navigator.of(context).overlay.insert(
          OverlayEntry(
            builder: (context) => HUDOverlay(
              child: ModalOverlayChild(
                content: content,
                context: context,
                title: title,
                modalType: modalType,
              ),
            ),
          ),
        );
  }
}
