import 'package:cloud_firestore/cloud_firestore.dart';

class LeaderboardClass {
  static String winner_volunteer = "";
  static String winner_donation = " ";

  static Map<String, int> userPointsSortedDonations = {};
  static Map<String, int> userPointsDonations = {};

  static void allocatePointsDonations() async {
    CollectionReference donations =
        FirebaseFirestore.instance.collection('donations');
    QuerySnapshot querySnapshot = await donations.get();

    for (var doc in querySnapshot.docs) {
      String username = doc['username'];
      if (userPointsDonations.containsKey(username)) {
        userPointsDonations[username] =
            calculatePointsDonations(doc) + userPointsDonations[username]!;
      } else {
        userPointsDonations[username] = calculatePointsDonations(doc);
      }
    }
  }

  static void rankUsersDonations() {
    userPointsSortedDonations = Map.fromEntries(
        userPointsDonations.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value)));

    winner_donation = userPointsSortedDonations.entries.first.key;
  }

  static int calculatePointsDonations(QueryDocumentSnapshot doc) {
    return doc['rice (kg)'] * 1 +
        doc['bread'] * 2 +
        doc['pulses'] * 3 +
        doc['simple_meals'] * 5 +
        doc['complex_meals'] * 7;
  }
}
