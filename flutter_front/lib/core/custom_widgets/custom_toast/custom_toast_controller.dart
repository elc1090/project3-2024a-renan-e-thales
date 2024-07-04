import 'dart:async';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_front/core/custom_widgets/custom_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'custom_toast_controller.g.dart';

class CustomToastController = CustomToastControllerBase with _$CustomToastController;

abstract class CustomToastControllerBase with Store {
  @observable
  late Timer? timer;

  @observable
  late int tick;

  @observable
  late int? tickLength;

  @observable
  OverlayEntry? overlayEntry;

  @observable
  bool isRunning = false;

  @action
  Future<void> activateTimer(Duration duration, void Function()? callback) async {
    tick = 0;
    isRunning = true;
    tickLength = (duration.inMilliseconds / 100).round();
    timer = Timer.periodic(
      Duration(milliseconds: tickLength!),
      (timer) {
        if (tick < 100) {
          tick++;
        } else {
          timer.cancel();
          isRunning = false;
          if (callback != null) {
            callback.call();
          }
        }
      },
    );
  }

  @action
  createOverlay(String message, Color color, IconData icon, Duration duration) {
    return overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isRunning ? 1.0 : 0.0,
        child: Stack(
          children: [
            Positioned(
              top: 16,
              right: 16,
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                  message,
                                  size: 14,
                                ),
                              ),
                              Icon(icon, color: color),
                            ],
                          ),
                        ),
                        Observer(
                          builder: (_) => LinearProgressIndicator(
                            minHeight: 4,
                            color: color,
                            backgroundColor: color.withAlpha(100),
                            value: tick / 100,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  @action
  show(BuildContext context, String message, Color? toastColor, IconData? icon, Duration? duration) {
    createOverlay(
      message,
      toastColor ?? Colors.blue,
      icon ?? CarbonIcons.information_filled,
      duration ?? const Duration(milliseconds: 3000),
    );
    activateTimer(Duration(milliseconds: duration?.inMilliseconds ?? 3000), () {
      removeOverlay();
    });
    Overlay.of(context).insert(overlayEntry!);
  }

  @action
  void removeOverlay() {
    tick = 0;
    if (timer != null && timer!.isActive) {
      timer?.cancel();
    }
    tickLength = null;
    if (overlayEntry != null && overlayEntry!.mounted) {
      overlayEntry!.remove();
      overlayEntry?.dispose();
      overlayEntry = null;
    }
  }
}
