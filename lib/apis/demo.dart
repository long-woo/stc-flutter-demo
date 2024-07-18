import 'package:dio/dio.dart';

import 'api_client_base.dart';
import 'dio.dart';

class GetProjectStatusResponse implements MapSerializable<GetProjectStatusResponse> {
  bool success = false;
  String? message;
  GetProjectStatusResponseObj? obj;

  GetProjectStatusResponse({
    required this.success,
    this.message,
    this.obj
  });

  // factory GetProjectStatusResponse.fromJson(Map<String, dynamic> json) {
  //   return GetProjectStatusResponse(
  //     success: json['success'],
  //     message: json['message'],
  //     obj: GetProjectStatusResponseObj.fromJson(json['obj'])
  //   );
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['success'] = success;
    data['message'] = message;
    data['obj'] = obj;

    return data;
  }
  
  @override
  GetProjectStatusResponse fromJson(Map<String, dynamic> json) {
    return GetProjectStatusResponse(
      success: json['success'],
      message: json['message'],
      obj: GetProjectStatusResponseObj.fromJson(json['obj'])
    );
  }
}

class GetProjectStatusResponseObj implements MapSerializable<GetProjectStatusResponseObj> {
  String id = '';
  int status = 0;

  GetProjectStatusResponseObj({
    required this.id,
    required this.status
  });

  factory GetProjectStatusResponseObj.fromJson(Map<String, dynamic> json) {
    return GetProjectStatusResponseObj(
      id: json['id'],
      status: json['status']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['status'] = status;

    return data;
  }
  
  @override
  GetProjectStatusResponseObj fromJson(Map<String, dynamic> json) {
    return GetProjectStatusResponseObj(
      id: json['id'],
      status: json['status']
    );
  }
}

/// 获取项目状态
Future<void> getProjectStatus() async {
  // dio.transformer = BackgroundTransformer()..jsonDecodeCallback = GetProjectStatusResponse.fromJson;
  var _res = await request<GetProjectStatusResponse>(
    ApiClientConfig(
      url: '/api/project/getProjectStatus',
      method: 'GET',
      params: {
        'query': {
          'projectId': '7491969461726838784'
        }
      }
    ));
    // final obj = GetProjectStatusResponse.fromJson(_res);
    print(_res.success);
}