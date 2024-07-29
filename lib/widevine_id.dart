
import 'widevine_id_platform_interface.dart';

class WidevineId {
  Future<String?> getPlatformVersion() {
    return WidevineIdPlatform.instance.getPlatformVersion();
  }
}
