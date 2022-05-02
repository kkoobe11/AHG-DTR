import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginCall {
  static Future<ApiCallResponse> call({
    String email = '',
    String password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'password': password,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic pathAuthorization(dynamic response) => getJsonField(
        response,
        r'''$.authToken''',
      );
}

class SignUpCall {
  static Future<ApiCallResponse> call({
    String name = '',
    String email = '',
    String password = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUp',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/auth/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'Name': name,
        'Email': email,
        'Password': password,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class TimeINCall {
  static Future<ApiCallResponse> call({
    String image = '',
    String authToken = '',
  }) {
    final body = '''
{
"image": "${image}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TimeIN',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/timeIn',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'Image': image,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetUserCall {
  static Future<ApiCallResponse> call({
    String authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getUser',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/auth/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class TimeOUTCall {
  static Future<ApiCallResponse> call({
    String authToken = '',
    String timeoutimage = '',
  }) {
    final body = '''
{
  "timeinout_id": "<timeoutID>",
  "image_upload": "${timeoutimage}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TimeOUT',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/timeOut',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'timeoutimage': timeoutimage,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class TimeProfileCall {
  static Future<ApiCallResponse> call({
    String authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'TimeProfile',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/timeProfile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
    );
  }
}

class GetIDCall {
  static Future<ApiCallResponse> call({
    int id,
    String timein = '',
    String timeout = '',
    String total = '',
    String authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getID',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/newApiEndpoint',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'id': id,
        'timein': timein,
        'timeout': timeout,
        'total': total,
      },
      returnBody: true,
    );
  }

  static dynamic getIDid(dynamic response) => getJsonField(
        response,
        r'''$[:1].id''',
      );
  static dynamic getIDtimein(dynamic response) => getJsonField(
        response,
        r'''$[:1].timeIn''',
      );
  static dynamic getIDtimeout(dynamic response) => getJsonField(
        response,
        r'''$[:1].timeOut''',
      );
  static dynamic getIDtotal(dynamic response) => getJsonField(
        response,
        r'''$[:1].total''',
      );
}

class GetCSVCall {
  static Future<ApiCallResponse> call({
    String mail = '',
    String subj = '',
    String body = '',
    String authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getCSV',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/getCSV',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'mail': mail,
        'subj': subj,
        'body': body,
      },
      returnBody: true,
    );
  }
}

class MeCall {
  static Future<ApiCallResponse> call({
    String newauthtoken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'me',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/auth/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${newauthtoken}',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
}

class ChecktimeinCall {
  static Future<ApiCallResponse> call({
    String authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'checktimein',
      apiUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:mXvNy1_3/newApiEndpoint',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
    );
  }
}
