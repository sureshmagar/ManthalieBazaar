import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelService {
  /// Singleton
  static _MixpanelService instance = _MixpanelService();
}

class _MixpanelService {
  late Mixpanel client;
}
  