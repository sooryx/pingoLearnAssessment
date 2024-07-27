import 'package:pingolearn/Constants/imports.dart';
import 'package:http/http.dart' as http;

class Homescreenprovider with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  List<CommentsModel>? _commentsModel;

  List<CommentsModel>? get commentsModel => _commentsModel;

  Future<void> fetchComments() async {
    const String baseUrl = 'https://jsonplaceholder.typicode.com/comments';
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      _commentsModel = jsonResponse.map((data) => CommentsModel.fromJson(data)).toList();
      _isLoading =false;
      notifyListeners();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
