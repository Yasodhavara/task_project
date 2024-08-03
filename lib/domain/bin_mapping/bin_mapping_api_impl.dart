import 'package:task_project/domain/bin_mapping/bin_mapping_api.dart';
import 'package:task_project/domain/bin_mapping/models/bin_mapping_model.dart';

class BinMappingListApiImpl implements BinMappingListApi {
  @override
  Future<BinMappingListResponseModel> getBinListMappingData() async {
    // TODO: implement getBinListMappingData
    // await Future.delayed(const Duration(seconds: 3));
    return BinMappingListResponseModel(
        status: "OK",
        message: "Bin mapping list is not found",
        responseStatus: "Success",
        statusCode: 200,
        binListResponseDataModel: [
          BinMappingListDataModel(
            binNumber: "B02011",
            quantity: "5",
            pkgQuantity: "9",
            storageLocation: "WH-Inbound storage for Cooler A",
            storageType: "WH-High Rack With Pallet",
            storageSection: "WH-Medium Moving",
            binStatus: "Available",
          ),
          BinMappingListDataModel(
            binNumber: "B02012",
            quantity: "1",
            pkgQuantity: "1",
            storageLocation: "WH-Inbound storage for Cooler A",
            storageType: "WH-High Rack With Pallet",
            storageSection: "WH-Medium Moving",
            binStatus: "Not Available",
          ),
          BinMappingListDataModel(
            binNumber: "B02013",
            quantity: "10",
            pkgQuantity: "1",
            storageLocation: "WH-Inbound storage for Cooler A",
            storageType: "WH-High Rack With Pallet",
            storageSection: "WH-Medium Moving",
            binStatus: "Available",
          ),
          BinMappingListDataModel(
            binNumber: "B02014",
            quantity: "6",
            pkgQuantity: "1",
            storageLocation: "WH-Inbound storage for Cooler A",
            storageType: "WH-High Rack With Pallet",
            storageSection: "WH-Medium Moving",
            binStatus: "Available",
          ),
        ]);
  }
}
