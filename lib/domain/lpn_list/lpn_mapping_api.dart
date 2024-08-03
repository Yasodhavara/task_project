import 'models/lpn_mapping_model.dart';


abstract class BinLpnMappingListApi {
  Future<BinLpnMappingListResponseModel> getLpnListMappingData();
}