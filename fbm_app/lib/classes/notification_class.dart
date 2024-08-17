class NotificationClass {
  late String title;
  late String subtitle;

  static List<NotificationClass> notifications = [];

  NotificationClass(String t, String s) {
    title = t;
    subtitle = s;
    notifications.add(this);
  }
}
