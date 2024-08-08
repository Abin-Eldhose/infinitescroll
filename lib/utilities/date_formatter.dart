import 'package:timeago/timeago.dart' as timeago;

String formatDate(String? createdAt) {
  if (createdAt == null || createdAt.isEmpty) {
    return 'Unknown';
  }
  try {
    DateTime dateTime = DateTime.parse(createdAt);
    return timeago.format(dateTime);
  } catch (e) {
    return 'Invalid date';
  }
}
