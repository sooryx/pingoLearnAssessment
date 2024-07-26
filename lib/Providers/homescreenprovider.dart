import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pingolearn/Models/commentsmodel.dart';
import 'package:http/http.dart' as http;
class Homescreenprovider with ChangeNotifier {
  CommentsModel? _commentsModel;

  CommentsModel? get commentsModel => _commentsModel;

  Future<void> fetchComments() async {
    const String baseUrl = 'https://jsonplaceholder.typicode.com/comments';
    final response = await http.get(Uri.parse('$baseUrl/comments'));

    if (response.statusCode == 200) {

      List<dynamic> jsonResponse = json.decode(response.body);
      List<CommentsModel> comments = jsonResponse.map((data) => CommentsModel.fromJson(data)).toList();

      _commentsModel = comments.isNotEmpty ? comments.first : null;
      notifyListeners();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}