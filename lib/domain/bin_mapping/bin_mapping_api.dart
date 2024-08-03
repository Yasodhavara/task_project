import 'models/bin_mapping_model.dart';

abstract class BinMappingListApi {
  Future<BinMappingListResponseModel> getBinListMappingData();
}