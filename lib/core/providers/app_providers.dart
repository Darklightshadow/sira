import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/local/csps_local_source.dart';
import '../../data/datasources/local/methode_local_source.dart';
import '../../data/datasources/local/visite_local_source.dart';
import '../../data/datasources/remote/alerte_remote_source.dart';
import '../../data/datasources/remote/auth_remote_source.dart';
import '../../data/datasources/remote/csps_remote_source.dart';
import '../../data/datasources/remote/district_remote_source.dart';
import '../../data/datasources/remote/methode_remote_source.dart';
import '../../data/datasources/remote/recommandation_remote_source.dart';
import '../../data/datasources/remote/sms_remote_source.dart';
import '../../data/datasources/remote/stock_remote_source.dart';
import '../../data/datasources/remote/visite_remote_source.dart';
import '../../data/repositories/alerte_repository_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/csps_repository_impl.dart';
import '../../data/repositories/district_repository_impl.dart';
import '../../data/repositories/methode_repository_impl.dart';
import '../../data/repositories/recommandation_repository_impl.dart';
import '../../data/repositories/sms_repository_impl.dart';
import '../../data/repositories/stock_repository_impl.dart';
import '../../data/repositories/visite_repository_impl.dart';
import '../../domain/repositories/alerte_repository.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/csps_repository.dart';
import '../../domain/repositories/district_repository.dart';
import '../../domain/repositories/methode_repository.dart';
import '../../domain/repositories/recommandation_repository.dart';
import '../../domain/repositories/sms_repository.dart';
import '../../domain/repositories/stock_repository.dart';
import '../../domain/repositories/visite_repository.dart';
import '../network/api_client.dart';
import '../network/network_checker.dart';
import '../storage/local_database.dart';
import '../storage/preferences_service.dart';
import '../storage/sync_manager.dart';

// ─── Infrastructure ───────────────────────────────────────────

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  return PreferencesService();
});

final localDatabaseProvider = Provider<LocalDatabase>((ref) {
  return LocalDatabase();
});

final networkCheckerProvider = Provider<NetworkChecker>((ref) {
  return NetworkChecker(connectivity: Connectivity());
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final prefs = ref.watch(preferencesServiceProvider);
  return ApiClient(preferencesService: prefs);
});

// ─── Sources distantes ────────────────────────────────────────

final methodeRemoteSourceProvider = Provider<MethodeRemoteSource>((ref) {
  return MethodeRemoteSource(apiClient: ref.watch(apiClientProvider));
});

final cspsRemoteSourceProvider = Provider<CspsRemoteSource>((ref) {
  return CspsRemoteSource(apiClient: ref.watch(apiClientProvider));
});

final recommandationRemoteSourceProvider =
    Provider<RecommandationRemoteSource>((ref) {
  return RecommandationRemoteSource(apiClient: ref.watch(apiClientProvider));
});

final authRemoteSourceProvider = Provider<AuthRemoteSource>((ref) {
  return AuthRemoteSource(apiClient: ref.watch(apiClientProvider));
});

final visiteRemoteSourceProvider = Provider<VisiteRemoteSource>((ref) {
  return VisiteRemoteSource(apiClient: ref.watch(apiClientProvider));
});

final stockRemoteSourceProvider = Provider<StockRemoteSource>((ref) {
  return StockRemoteSource(apiClient: ref.watch(apiClientProvider));
});

final alerteRemoteSourceProvider = Provider<AlerteRemoteSource>((ref) {
  return AlerteRemoteSource(apiClient: ref.watch(apiClientProvider));
});

final smsRemoteSourceProvider = Provider<SmsRemoteSource>((ref) {
  return SmsRemoteSource(apiClient: ref.watch(apiClientProvider));
});

final districtRemoteSourceProvider = Provider<DistrictRemoteSource>((ref) {
  return DistrictRemoteSource(apiClient: ref.watch(apiClientProvider));
});

// ─── Sources locales ──────────────────────────────────────────

final methodeLocalSourceProvider = Provider<MethodeLocalSource>((ref) {
  return MethodeLocalSource(db: ref.watch(localDatabaseProvider));
});

final cspsLocalSourceProvider = Provider<CspsLocalSource>((ref) {
  return CspsLocalSource(db: ref.watch(localDatabaseProvider));
});

final visiteLocalSourceProvider = Provider<VisiteLocalSource>((ref) {
  return VisiteLocalSource(db: ref.watch(localDatabaseProvider));
});

// ─── Repositories (type Domain = interface) ───────────────────

final methodeRepositoryProvider = Provider<MethodeRepository>((ref) {
  return MethodeRepositoryImpl(
    remoteSource: ref.watch(methodeRemoteSourceProvider),
    localSource: ref.watch(methodeLocalSourceProvider),
    networkChecker: ref.watch(networkCheckerProvider),
  );
});

final cspsRepositoryProvider = Provider<CspsRepository>((ref) {
  return CspsRepositoryImpl(
    remoteSource: ref.watch(cspsRemoteSourceProvider),
    localSource: ref.watch(cspsLocalSourceProvider),
    networkChecker: ref.watch(networkCheckerProvider),
  );
});

final recommandationRepositoryProvider =
    Provider<RecommandationRepository>((ref) {
  return RecommandationRepositoryImpl(
    remoteSource: ref.watch(recommandationRemoteSourceProvider),
  );
});

final visiteRepositoryProvider = Provider<VisiteRepository>((ref) {
  return VisiteRepositoryImpl(
    remoteSource: ref.watch(visiteRemoteSourceProvider),
    localSource: ref.watch(visiteLocalSourceProvider),
    networkChecker: ref.watch(networkCheckerProvider),
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteSource: ref.watch(authRemoteSourceProvider),
    preferencesService: ref.watch(preferencesServiceProvider),
  );
});

final stockRepositoryProvider = Provider<StockRepository>((ref) {
  return StockRepositoryImpl(
    remoteSource: ref.watch(stockRemoteSourceProvider),
    networkChecker: ref.watch(networkCheckerProvider),
  );
});

final alerteRepositoryProvider = Provider<AlerteRepository>((ref) {
  return AlerteRepositoryImpl(
    remoteSource: ref.watch(alerteRemoteSourceProvider),
  );
});

final districtRepositoryProvider = Provider<DistrictRepository>((ref) {
  return DistrictRepositoryImpl(
    remoteSource: ref.watch(districtRemoteSourceProvider),
  );
});

final smsRepositoryProvider = Provider<SmsRepository>((ref) {
  return SmsRepositoryImpl(
    remoteSource: ref.watch(smsRemoteSourceProvider),
  );
});

// ─── SyncManager ──────────────────────────────────────────────

final syncManagerProvider = Provider<SyncManager>((ref) {
  return SyncManager(
    visiteRepository:
        ref.watch(visiteRepositoryProvider) as VisiteRepositoryImpl,
    networkChecker: ref.watch(networkCheckerProvider),
  );
});
