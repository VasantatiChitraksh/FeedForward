const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.sendNotification = functions.firestore.document("foodbank/{name}").onCreate(async (snap, context) => {
  const data = snap.data();
  const name = data.name;
  const payload = {
    notification: {
      title: name+" foodbank has started!",
      sound: "beep",
    },
  };

  const tokensSnapshot = await admin.firestore().collection("userTokens").get();
  const tokens = tokensSnapshot.docs.map((doc) => doc.data().token);

  if (tokens.length > 0) {
    const responses = await admin.messaging().sendEachForMulticast({
      tokens: tokens,
      notification: payload.notification,
    });

    responses.responses.forEach((response, idx) => {
      if (response.success) {
        console.log(`Message sent successfully to token ${tokens[idx]}`);
      } else {
        console.error(`Failed to send message to token ${tokens[idx]}`, response.error);
      }
    });
  } else {
    console.log("No tokens found");
  }
});
