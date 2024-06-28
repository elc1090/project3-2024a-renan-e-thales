// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_toast_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomToastController on CustomToastControllerBase, Store {
  late final _$timerAtom = Atom(name: 'CustomToastControllerBase.timer', context: context);

  @override
  Timer? get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  bool _timerIsInitialized = false;

  @override
  set timer(Timer? value) {
    _$timerAtom.reportWrite(value, _timerIsInitialized ? super.timer : null, () {
      super.timer = value;
      _timerIsInitialized = true;
    });
  }

  late final _$tickAtom = Atom(name: 'CustomToastControllerBase.tick', context: context);

  @override
  int get tick {
    _$tickAtom.reportRead();
    return super.tick;
  }

  bool _tickIsInitialized = false;

  @override
  set tick(int value) {
    _$tickAtom.reportWrite(value, _tickIsInitialized ? super.tick : null, () {
      super.tick = value;
      _tickIsInitialized = true;
    });
  }

  late final _$tickLengthAtom = Atom(name: 'CustomToastControllerBase.tickLength', context: context);

  @override
  int? get tickLength {
    _$tickLengthAtom.reportRead();
    return super.tickLength;
  }

  bool _tickLengthIsInitialized = false;

  @override
  set tickLength(int? value) {
    _$tickLengthAtom.reportWrite(value, _tickLengthIsInitialized ? super.tickLength : null, () {
      super.tickLength = value;
      _tickLengthIsInitialized = true;
    });
  }

  late final _$overlayEntryAtom = Atom(name: 'CustomToastControllerBase.overlayEntry', context: context);

  @override
  OverlayEntry? get overlayEntry {
    _$overlayEntryAtom.reportRead();
    return super.overlayEntry;
  }

  @override
  set overlayEntry(OverlayEntry? value) {
    _$overlayEntryAtom.reportWrite(value, super.overlayEntry, () {
      super.overlayEntry = value;
    });
  }

  late final _$isRunningAtom = Atom(name: 'CustomToastControllerBase.isRunning', context: context);

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  late final _$activateTimerAsyncAction = AsyncAction('CustomToastControllerBase.activateTimer', context: context);

  @override
  Future activateTimer(Duration duration, void Function()? callback) {
    return _$activateTimerAsyncAction.run(() => super.activateTimer(duration, callback));
  }

  late final _$CustomToastControllerBaseActionController = ActionController(name: 'CustomToastControllerBase', context: context);

  @override
  dynamic createOverlay(String message, Color color, IconData icon, Duration duration) {
    final _$actionInfo = _$CustomToastControllerBaseActionController.startAction(name: 'CustomToastControllerBase.createOverlay');
    try {
      return super.createOverlay(message, color, icon, duration);
    } finally {
      _$CustomToastControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic show(BuildContext context, String message, Color? toastColor, IconData? icon, Duration? duration) {
    final _$actionInfo = _$CustomToastControllerBaseActionController.startAction(name: 'CustomToastControllerBase.show');
    try {
      return super.show(context, message, toastColor, icon, duration);
    } finally {
      _$CustomToastControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeOverlay() {
    final _$actionInfo = _$CustomToastControllerBaseActionController.startAction(name: 'CustomToastControllerBase.removeOverlay');
    try {
      return super.removeOverlay();
    } finally {
      _$CustomToastControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timer: ${timer},
tick: ${tick},
tickLength: ${tickLength},
overlayEntry: ${overlayEntry},
isRunning: ${isRunning}
    ''';
  }
}
