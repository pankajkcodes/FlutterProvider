import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibleMessage = "";

  void checkEligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibleMessage = "You are Eligible";
      notifyListeners();
    } else {
      isEligible = false;
      eligibleMessage = "You are not Eligible";
      notifyListeners();
    }
  }
}
