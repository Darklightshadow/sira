import 'package:dio/dio.dart';
import 'api_endpoints.dart';
import 'api_exceptions.dart';
import '../../core/storage/preferences_service.dart';

class ApiClient {
  late final Dio _dio;
  final PreferencesService _preferencesService;

  ApiClient({required PreferencesService preferencesService})
      : _preferencesService = preferencesService {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );
    _ajouterIntercepteurs();
  }

  void _ajouterIntercepteurs() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Ajoute le token JWT si disponible
          final token = await _preferencesService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) {
          handler.next(error);
        },
      ),
    );

    // Log en mode debug uniquement
    assert(() {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (log) => print(log),
      ));
      return true;
    }());
  }

  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.get(path, queryParameters: params);
    } on DioException catch (e) {
      throw _convertirErreur(e);
    }
  }

  Future<Response> post(String path,
      {required Map<String, dynamic> body}) async {
    try {
      return await _dio.post(path, data: body);
    } on DioException catch (e) {
      throw _convertirErreur(e);
    }
  }

  Future<Response> put(String path,
      {required Map<String, dynamic> body}) async {
    try {
      return await _dio.put(path, data: body);
    } on DioException catch (e) {
      throw _convertirErreur(e);
    }
  }

  Future<Response> patch(String path, {Map<String, dynamic>? body}) async {
    try {
      return await _dio.patch(path, data: body);
    } on DioException catch (e) {
      throw _convertirErreur(e);
    }
  }

  Exception _convertirErreur(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkException(
          message: 'La connexion a expiré. Vérifiez votre réseau.',
        );
      case DioExceptionType.connectionError:
        return const NetworkException();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 401:
            return const UnauthorizedException();
          case 404:
            return const NotFoundException();
          case 500:
          case 502:
          case 503:
            return const ServerException();
          default:
            return ApiException(
              message:
                  e.response?.data?['message'] as String? ?? 'Erreur inconnue.',
              statusCode: statusCode,
            );
        }
      default:
        return ApiException(message: e.message ?? 'Erreur inconnue.');
    }
  }
}
