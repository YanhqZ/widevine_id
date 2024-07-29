package pers.yanhqz.widevine_id;

import android.media.MediaDrm;

import androidx.annotation.NonNull;

import java.util.UUID;

import io.flutter.embedding.engine.plugins.FlutterPlugin;

/**
 * WidevineIdPlugin
 */
public class WidevineIdPlugin implements FlutterPlugin, Messages.WidevineId {

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        Messages.WidevineId.setUp(flutterPluginBinding.getBinaryMessenger(), this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }

    @NonNull
    @Override
    public String id() {
        /*
         * UUID for the Widevine DRM scheme.
         * find it in https://github.com/google/ExoPlayer/blob/b1000940eaec9e1202d9abf341a48a58b728053f/library/common/src/main/java/com/google/android/exoplayer2/C.java#L767
         * <p>
         * Widevine is supported on Android devices running Android 4.3 (API Level 18) and up.
         */
        try {
            final UUID WIDEVINE_UUID = new UUID(0xEDEF8BA979D64ACEL, 0xA3C827DCD51D21EDL);
            //noinspection resource
            MediaDrm mediaDrm = new MediaDrm(WIDEVINE_UUID);
            byte[] widevineId = mediaDrm.getPropertyByteArray(MediaDrm.PROPERTY_DEVICE_UNIQUE_ID);
            StringBuilder sb = new StringBuilder();
            for (byte aByte : widevineId) {
                sb.append(String.format("%02x", aByte));
            }
            return sb.toString();
        } catch (Exception e) {
            return "";
        }
    }
}
