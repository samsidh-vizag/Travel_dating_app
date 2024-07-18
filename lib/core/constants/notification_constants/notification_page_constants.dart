import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_page_constants.g.dart';

class NotificationPageConstants {
  final String txtNotifications = 'Notifications';
  final String txtAll = 'All';
  final String txtInvites = 'Invites';
  final String txtAccept = 'Accept';
  final String txtReject = 'Reject';
  final String txtNoNotification = "No Notifivation";
  final String txtSub =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor';
}

@riverpod
NotificationPageConstants notificationPageConstants(
    NotificationPageConstantsRef ref) {
  return NotificationPageConstants();
}
