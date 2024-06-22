import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Utils {
  // Tweek this function based on your requirements
  static Future<String> logout(fcmToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // String? role = prefs.getString('role');

    // String? clss = prefs.getString("class");

    // if (role == "student") {
    //   FirebaseMessaging.instance.unsubscribeFromTopic(clss.toString());
    // } else {
    //   FirebaseMessaging.instance.unsubscribeFromTopic("teacher_$clss");
    // }
    // FirebaseMessaging.instance.unsubscribeFromTopic("common");

    await prefs.clear();
    await prefs.setString("fcmToken", fcmToken);
    await prefs.setBool("isVisited", true);

    return "ok";
  }

  // Tweek this function based on your requirements
  static Future<String> setSession(session, token, classRecord, role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String ans = jsonEncode(session);
    print("Ans: $ans");

    if (role == "student") {
      await prefs.setInt('student_gr_number', session["gr_number"]);
      await prefs.setString(
        'name',
        session["first_name"] + " " + session["last_name"],
      );
      await prefs.setString(
        'username',
        session["student_username"],
      );
      await prefs.setString(
        'class',
        classRecord["name"] + "-" + classRecord["division"],
      );
      FirebaseMessaging.instance.subscribeToTopic(
          classRecord["name"] + "-" + classRecord["division"]);
      FirebaseMessaging.instance.subscribeToTopic("common");

      await prefs.setInt("classId", classRecord["id"]);
      await prefs.setString("dob", session["dob"]);
      await prefs.setInt('rollNo', session["roll_number"]);
      await prefs.setString("gender", session["gender"]);
      await prefs.setString('role', 'student');
      await prefs.setString("user_image", "");
      await prefs.setString('token', token);

      await prefs.setBool('isloggedIn', true);

      return "ok";
    } else {
      await prefs.setInt('teacherId', session["id"]);
      await prefs.setString(
        'name',
        session["first_name"] + " " + session["last_name"],
      );
      await prefs.setString(
        'username',
        session["teacher_username"],
      );
      await prefs.setString(
        'class',
        classRecord["name"] + "-" + classRecord["division"],
      );
      await prefs.setString('role', 'teacher');
      await prefs.setString("teacher_image", "");
      await prefs.setString('token', token);
      await prefs.setString("gender", session["gender"]);

      await prefs.setBool('isloggedIn', true);

      FirebaseMessaging.instance.subscribeToTopic(
          // ignore: prefer_interpolation_to_compose_strings
          "${"teacher_" + classRecord["name"]}-" + classRecord["division"]);
      FirebaseMessaging.instance.subscribeToTopic("common");

      return "ok";
    }
  }
}
