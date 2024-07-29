import 'package:flutter_test/flutter_test.dart';
import 'package:widevine_id/widevine_id.dart';
import 'package:widevine_id/widevine_id_platform_interface.dart';
import 'package:widevine_id/widevine_id_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWidevineIdPlatform
    with MockPlatformInterfaceMixin
    implements WidevineIdPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WidevineIdPlatform initialPlatform = WidevineIdPlatform.instance;

  test('$MethodChannelWidevineId is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWidevineId>());
  });

  test('getPlatformVersion', () async {
    WidevineId widevineIdPlugin = WidevineId();
    MockWidevineIdPlatform fakePlatform = MockWidevineIdPlatform();
    WidevineIdPlatform.instance = fakePlatform;

    expect(await widevineIdPlugin.getPlatformVersion(), '42');
  });
}
