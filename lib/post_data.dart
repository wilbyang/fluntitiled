import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:fluntitled/models/post.dart';

class PostData {
  static Future<Post> fetchPost() async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/posts/1', headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"});

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Post>> fetchPosts(http.Client client) async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/posts', headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"});

    return compute(parsePosts, response.body);
  }

  static List<Post> parsePosts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }
}