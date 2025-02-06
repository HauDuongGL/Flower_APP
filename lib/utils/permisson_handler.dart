import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<PermissionStatus> getPermissionStatus(
      PermissionWithService type) async {
    return await type.status;
  }

  static Future<void> requestPermission(
    PermissionWithService type, {
    VoidCallback? onGranted,
    VoidCallback? onDenied,
    VoidCallback? onPermanentlyDenied,
  }) async {
    final status = await type.request();
    if (status.isGranted) {
      onGranted?.call();
      return;
    }
    if (status.isDenied) {
      onDenied?.call();
      return;
    }
    if (status.isPermanentlyDenied) {
      onPermanentlyDenied?.call();
      return;
    }
  }

  static openSettings([AppSettingsType? type]) {
    if (type != null) {
      AppSettings.openAppSettings(
        type: type,
      );
    } else {
      AppSettings.openAppSettings();
    }
  }
}
