import 'package:http/http.dart' as http;
import 'package:zealth_test_application/models/symptomsmodel.dart';
import 'package:zealth_test_application/utilities/api_helper.dart';
import 'package:zealth_test_application/utilities/api_paths.dart';

class SymptomsUpdateApiProvider {
  ApiHelper _apiHelper = ApiHelper();

  Future<bool> postSymptonsUpdate(List<Symptom> details) async {
    List<Map<String, int>> symptoms = [];
    for (var ob in details) {
      symptoms.add({ob.name: ob.severity});
    }
    Map<String, dynamic> message = {"symptoms": symptoms, "user-id": 123};
    try {
      await _apiHelper.httpPost(ApiPaths.postUpdate, message);
    } catch (e) {
      return false;
    }

    return true;
  }
}
