import 'package:flutter/foundation.dart';
import 'package:telmeeth/core/api/model/response/website_activity.dart';
import 'package:telmeeth/core/api/student/services/activity_website_services.dart';

class WebsiteActivityController extends ChangeNotifier {
  ActivityWebsiteServices _services = ActivityWebsiteServices();

  WebsiteActivity? websiteActivity; // <- هنا النوع WebsiteActivity
  bool isLoading = false;

  Future<void> getWebsiteActivity() async {
    isLoading = true;
    notifyListeners();

    websiteActivity = await _services.getWebsiteActivity();

    isLoading = false;
    notifyListeners();
  }
}
