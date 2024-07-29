import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'widevine_id_method_channel.dart';

abstract class WidevineIdPlatform extends PlatformInterface {
  /// Constructs a WidevineIdPlatform.
  WidevineIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static WidevineIdPlatform _instance = MethodChannelWidevineId();

  /// The default instance of [WidevineIdPlatform] to use.
  ///
  /// Defaults to [MethodChannelWidevineId].
  static WidevineIdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WidevineIdPlatform] when
  /// they register themselves.
  static set instance(WidevineIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
