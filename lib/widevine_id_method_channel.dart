import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'widevine_id_platform_interface.dart';

/// An implementation of [WidevineIdPlatform] that uses method channels.
class MethodChannelWidevineId extends WidevineIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('widevine_id');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
