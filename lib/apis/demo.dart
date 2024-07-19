import 'api_client_base.dart';
import 'dio.dart';

class GetProjectStatusResponse {
  bool success = false;
  String? message;
  GetProjectStatusResponseObj? obj;

  GetProjectStatusResponse({
    required this.success,
    this.message,
    this.obj
  });

  factory GetProjectStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetProjectStatusResponse(
      success: json['success'],
      message: json['message'],
      obj: json['obj'] == null ? null : GetProjectStatusResponseObj.fromJson(json['obj'])
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['success'] = success;
    data['message'] = message;
    data['obj'] = obj;

    return data;
  }
}

class GetProjectStatusResponseObj {
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
}

class GetPatientParamsByIdResponse {
  bool success = false;
  String? message;
  GetPatientParamsByIdResponseObj? obj;

  GetPatientParamsByIdResponse({
    required this.success,
    this.message,
    this.obj
  });

  factory GetPatientParamsByIdResponse.fromJson(Map<String, dynamic> json) {
    return GetPatientParamsByIdResponse(
      success: json['success'],
      message: json['message'],
      obj: json['obj'] == null ? null : GetPatientParamsByIdResponseObj.fromJson(json['obj'])
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['success'] = success;
    data['message'] = message;
    data['obj'] = obj;

    return data;
  }
}

class GetPatientParamsByIdResponseObj {
  int projectType;
	String params;
	String paramsName;
	String requiredParams;
	String displayParams;
	String displayParamsName;
	String batchParams;
	int patientNoRules;
	int nameAbbrRules;
	int setupDateRules;

  GetPatientParamsByIdResponseObj({
    required this.projectType,
    required this.params,
    required this.paramsName,
    required this.requiredParams,
    required this.displayParams,
    required this.displayParamsName,
    required this.batchParams,
    required this.patientNoRules,
    required this.nameAbbrRules,
    required this.setupDateRules
  });

  factory GetPatientParamsByIdResponseObj.fromJson(Map<String, dynamic> json) {
    return GetPatientParamsByIdResponseObj(
      projectType: json['projectType'],
      params: json['params'],
      paramsName: json['paramsName'],
      requiredParams: json['requiredParams'],
      displayParams: json['displayParams'],
      displayParamsName: json['displayParamsName'],
      batchParams: json['batchParams'],
      patientNoRules: json['patientNoRules'],
      nameAbbrRules: json['nameAbbrRules'],
      setupDateRules: json['setupDateRules']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['projectType'] = projectType;
    data['params'] = params;
    data['paramsName'] = paramsName;
    data['requiredParams'] = requiredParams;
    data['displayParams'] = displayParams;
    data['displayParamsName'] = displayParamsName;
    data['batchParams'] = batchParams;
    data['patientNoRules'] = patientNoRules;
    data['nameAbbrRules'] = nameAbbrRules;
    data['setupDateRules'] = setupDateRules;

    return data;
  }
}

/// 获取项目状态
Future<GetProjectStatusResponse> getProjectStatus() async {
  var _res = await request<GetProjectStatusResponse>(
    ApiClientConfig(
      url: '/api/project/getProjectStatus',
      method: 'GET',
      params: {
        'query': {
          'projectId': '7491969461726838784'
        }
      }
    ), GetProjectStatusResponse.fromJson);

    return _res;
}

Future<GetPatientParamsByIdResponse> getPatientParamsById() async {
  var _res = await request<GetPatientParamsByIdResponse>(ApiClientConfig(url: '/api/project/patientParams/{id}', method: 'GET', params: {'path': {'id': '7491969461726838784'}, 'query': { 'projectId': '7491969461726838784', 'roleId': '7877591416784052224' }}), GetPatientParamsByIdResponse.fromJson);

  return _res;
}