import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/apis/dio.dart';

void main() {
  test('Test case 1: Replace path parameters with values', () {
    var url = "/users/{id}";
    var pathParams = {"id": "123"};
    expect(parseUrl(url, pathParams), equals("/users/123"));
  });

  test('Test case 2: Leave path parameters unchanged if no values provided', () {
    var url = "/users/:id";
    var pathParams = {"id": "123"};
    expect(parseUrl(url, pathParams), equals("/users/123"));
  });

  test('Test case 3: Handle multiple path parameters', () {
    var url = "/users/{id}/posts/{postId}";
    var pathParams = {"id": "123", "postId": "456"};
    expect(parseUrl(url, pathParams), equals("/users/123/posts/456"));
  });

  test('Test case 4: Handle path parameters with different formats', () {
    var url = "/users/{id}?sort={sort}";
    var pathParams = {"id": "123", "sort": "asc"};
    expect(parseUrl(url, pathParams), equals("/users/123?sort=asc"));
  });

  test('Test case 5: Handle path parameters with empty values', () {
    var url = "/users/{id}";
    var pathParams = {"id": ""};
    expect(parseUrl(url, pathParams), equals("/users/"));
  });

  test('Test case 6: Handle path parameters with missing values', () {
    var url = "/users/123";
    Map<String, String> pathParams = {};
    expect(parseUrl(url, pathParams), equals("/users/123"));
  });

  test('Test case 7: Handle path parameters with special characters in the URL', () {
    var url = "/users/{id}/posts/{postId}";
    var pathParams = {"id": "123", "postId": "456/789"};
    // Assuming the function is expected to URL-encode special characters
    expect(parseUrl(url, pathParams), equals("/users/123/posts/456%2F789"));
  });
}