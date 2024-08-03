import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_project/domain/lpn_list/lpn_mapping_api.dart';
import 'package:task_project/serviceLocator.dart';
import '../../domain/bin_mapping/bin_mapping_api.dart';
import '../../domain/bin_mapping/models/bin_mapping_model.dart';
import '../../domain/lpn_list/models/lpn_mapping_model.dart';

final lpnListModelProvider = ChangeNotifierProvider((ctx) => serviceLocator.get<LpnListViewmodel>());

class LpnListViewmodel extends ChangeNotifier {
  final BinLpnMappingListApi binLpnMappingListApi;
  final BinMappingListApi binMappingListApi;
  LpnListViewmodel({ required this.binLpnMappingListApi, required this.binMappingListApi});

  List<BinLpnMappingListDataModel>? lpnListdata;
  List<BinMappingListDataModel>? binListData;

  Future<BinLpnMappingListResponseModel> getLpnListData() async {
    final response = await binLpnMappingListApi.getLpnListMappingData();
    lpnListdata = response.binLpnListResponseDataModel;
    notifyListeners();
    return response;
  }

  Future<BinMappingListResponseModel> getBinMappingListData() async {
    final response = await  binMappingListApi.getBinListMappingData();
    binListData = response.binListResponseDataModel;
    notifyListeners();
    return response;
  }

}