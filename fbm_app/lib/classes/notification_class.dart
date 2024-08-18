import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationClass {
  late String title;
  late String subtitle;

  static List<NotificationClass> notifications = [];

  NotificationClass(String t, String s, bool truth) {
    title = t;
    subtitle = s;
    if(truth) addNotificationToFirebase(this);
    notifications.add(this);
  }

  static void addNotificationToFirebase(NotificationClass nfc) {
    CollectionReference notifications =
        FirebaseFirestore.instance.collection('notifications');

    notifications.add({'title': nfc.title, 'subtitle': nfc.subtitle});
  }

  static void loadFromFirebase() async {
    CollectionReference notifications =
        FirebaseFirestore.instance.collection('notifications');

    QuerySnapshot querySnapshot = await notifications.get();

    for (var doc in querySnapshot.docs) {
      NotificationClass(doc['title'], doc['subtitle'], false);
    }
  }
}
