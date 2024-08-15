const {onRequest} = require("firebase-functions/v2/https");
const tf = require("@tensorflow/tfjs-node");
const {Buffer} = require("buffer");

/**
 * HTTP Cloud Function that handles image prediction.
 * @param {Object} request - The request object.
 * @param {Object} response - The response object.
 */
exports.api = onRequest(async (request, response) => {
  if (request.method !== "POST") {
    return response.status(405).send("Method Not Allowed");
  }

  try {
    const imageBase64 = request.body.image;
    const imageBuffer = Buffer.from(imageBase64, "base64");
    const model = await tf.loadLayersModel("file://path/to/model.json");
    const tensor = tf.node.decodeImage(imageBuffer, 3);
    const predictions = model.predict(tensor.expandDims(0));
    const output = predictions.argMax(-1).dataSync()[0];

    let result;
    if ([0, 1, 2, 3].includes(output)) {
      result = "Recyclable";
    } else {
      result = "Non-Recyclable";
    }

    return response.status(200).json({predicted_class: result});
  } catch (error) {
    console.error("Error processing image:", error);
    return response.status(500).send("Error processing image.");
  }
});
