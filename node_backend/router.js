const router = require("express").Router();
const firebaseController = require("./controllers/firebaseController");

// Sending Notification to Single Device using FCM Token
router.post(
  "/sendNotificationToSingleDevice",
  firebaseController.sendNotificationToSingleDevice
);

// Sending Notification to Topic
router.post(
  "/sendNotificationToTopic/:topic",
  firebaseController.sendNotificationToTopic
);

// Sending Batch Notification to multiple FCM's
router.post(
  "/sendBatchNotificationUsingMultipleFCM",
  firebaseController.sendBatchNotificationUsingMultipleFCM
);

// Sending Notification to Multiple Topics
router.post(
  "/sendNotificationsToMultipleTopics",
  firebaseController.sendNotificationsToMultipleTopics
);

// Sending Notification with a custom image (Single device, multiple devices, topic, multiple topics --> applicable)
router.post(
  "/sendCustomImageNotification/:topic",
  firebaseController.sendCustomImageNotification
);

module.exports = router;
