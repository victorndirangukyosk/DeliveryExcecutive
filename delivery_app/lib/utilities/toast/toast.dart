import 'package:flutter/material.dart';

import 'package:overlay_support/overlay_support.dart';
import 'custom_animation_toast.dart';

class AppToast {
  showToast() {
    showOverlay((context, t) {
      return CustomAnimationToast(
        value: t,
        message: 'Set password successfull',
      );
    }, key: const ValueKey('success'), curve: Curves.decelerate);
  }
}
