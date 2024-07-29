# widevine_id

A Flutter plugin to access Widevine ID in Android platform.

Widevine is a digital rights management (DRM) technology developed by Google to protect audio and video content from unauthorized copying and distribution. Widevine DRM ensures content security through encryption, license control, and secure player functionalities.

In Widevine DRM, each device is assigned a unique Widevine ID to identify the device and manage content licenses. The Widevine ID serves as a unique identifier for the device within the Widevine DRM system, facilitating device recognition and content access management.

## Getting Started

Run this command
```bash
 flutter pub add widevine_id
```
This will add a line like this to your package's pubspec.yaml
```yaml
dependencies:
  ....
  widevine_id: ^1.0.0
```

## Usage

Get the Widevine ID.
```dart
final widevineId = await WidevineId.id();
```

## Note

No permissions are required to access this ID.

Widevine is supported on Android devices running Android 4.3 (API Level 18) and up.

You will get an empty string if the device does not support Widevine.

