import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../global/global.dart';

class MyOneSignal {
  static void init() {
    //Remove this method to stop OneSignal Debugging
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.initialize(oneSignalAppId);

    // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt.
    // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.Notifications.requestPermission(true);
  }

  static void initPlatform() {
    OneSignal.User.getOnesignalId().then(
      (oneSignalId) {
        if (deviceId.isEmpty) {
          deviceId = oneSignalId ?? "";
          if (kDebugMode) {
            log("One Signal ID :-> $oneSignalId");
          }
        }
      },
    );

    OneSignal.User.addObserver((state) {
      var userState = state.jsonRepresentation();
      if (deviceId.isEmpty) {
        deviceId = state.current.onesignalId ?? "";
        if (kDebugMode) {
          log("One Signal ID :-> ${state.current.onesignalId}");
        }
      }
      log('OneSignal user changed: $userState');
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      log("Has permission $state");
    });

    OneSignal.Notifications.addClickListener((event) {
      if (kDebugMode) {
        print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      }
      log("Clicked notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      if (kDebugMode) {
        print(
            'NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');
      }

      /// Display Notification, preventDefault to not display
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();

      log("Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
    });
  }
}
