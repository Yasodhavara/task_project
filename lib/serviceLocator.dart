import 'package:get_it/get_it.dart';
import 'package:task_project/domain/lpn_list/lpn_mapping_api_impl.dart';
import 'package:task_project/domain/lpn_list/lpn_mapping_api.dart';
import 'package:task_project/pages/lpn_list/lpn_list_viewmodel.dart';
import 'domain/bin_mapping/bin_mapping_api.dart';
import 'domain/bin_mapping/bin_mapping_api_impl.dart';

final serviceLocator = GetIt.instance;
const jwt = "";

Future<void> initServiceProvider() async {

  serviceLocator.registerLazySingleton<BinLpnMappingListApi>(() => BinLpnMappingListApiImpl());
  serviceLocator.registerLazySingleton<BinMappingListApi>(() => BinMappingListApiImpl());
  serviceLocator.registerLazySingleton<LpnListViewmodel>(()=> LpnListViewmodel(binLpnMappingListApi: serviceLocator.get<BinLpnMappingListApi>(), binMappingListApi: serviceLocator.get<BinMappingListApi>()));

}