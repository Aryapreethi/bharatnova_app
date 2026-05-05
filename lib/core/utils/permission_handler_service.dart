

import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<void> requestAllPermissions() async {

    final notificationStatus = await Permission.notification.request();

    if (notificationStatus.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

}