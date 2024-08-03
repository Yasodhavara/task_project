import 'package:task_project/domain/lpn_list/lpn_mapping_api.dart';
import 'package:task_project/domain/lpn_list/models/lpn_mapping_model.dart';

class BinLpnMappingListApiImpl implements BinLpnMappingListApi {

  // final ApiService apiService;
  // BinMappingListApiImpl({required this.apiService});
  final String loginUrl = "https://prod.gcf.education/auth/v1/login/";


  @override
  Future<BinLpnMappingListResponseModel> getLpnListMappingData() async {
    // TODO: implement getBinListMappingData
    // await Future.delayed(const Duration(seconds: 3));
    return BinLpnMappingListResponseModel(status: "OK",
        message: "Bin Lpn mapping list is not found",
        responseStatus: "Success",
        statusCode: 200,
        binLpnListResponseDataModel: [
          BinLpnMappingListDataModel(
              lpnId: "7707a256-ffeb-47a0-8a57-9698e63f5799",
              quantity: "250",
              productId: "e78aff63-5818-4e66-9e13-802e67c5893d",
              productVariantId: "906eb8bc-86a4-4102-bd00-870c23ab5855",
              storageLocation: "WH-Inbound storage for Cooler B",
              skuDescription: "California Strawberries One lb Pack",
              giId: "e7303eec-94e7-4772-8f1f-a01154e6d2a3",
              sled: "2024-07-12T18:30",
              lpnType: "Pallet",
              uom: "Pounds (lbs)",
              variantDescription: "Bright red strawberries with a sweet and tart flavor, perfect for desserts",
              pkgQuantity: "1",
              lpnNumber: "WHP2047",
              skuCode: "STRAWBERRY-CA"
          ),
          BinLpnMappingListDataModel(
              lpnId: "371759b6-861e-4513-bb9d-fde4fa31c7bb",
              quantity: "1",
              productId: "d5843390-966d-4a31-aaa4-0cc584ca67ce",
              productVariantId: "c38556d9-3bbb-4dcf-902f-2ef0ecd9063b",
              storageLocation: "Freezer",
              skuDescription: "GRS-123",
              giId: "065360b6-45a2-43e9-b223-49c7a80584a4",
              sled: "2024-08-09T00:28:21",
              lpnType: "Pallet",
              uom: "Pounds (lbs)",
              variantDescription: "sku for testing",
              pkgQuantity: "10",
              lpnNumber: "WHP2032",
              skuCode: "SKU-BER-GRA-00004"
          ),
          BinLpnMappingListDataModel(
              lpnId: "f6de7397-584e-4763-9ff0-a247cb607f1a",
              quantity: "10",
              productId: "d5843390-966d-4a31-aaa4-0cc584ca67ce",
              productVariantId: "c38556d9-3bbb-4dcf-902f-2ef0ecd9063b",
              storageLocation: "WH-Inbound storage for Cooler B",
              skuDescription: "GRS-123",
              giId: "07b5d566-19b5-4065-928b-54a0ef6852f7",
              sled: "2024-08-09T00:16:46",
              lpnType: "Pallet",
              uom: "Pounds (lbs)",
              variantDescription: "sku for testing",
              pkgQuantity: "1",
              lpnNumber: "WHP2033",
              skuCode: "SKU-BER-GRA-00004"
          ),
          BinLpnMappingListDataModel(
              lpnId: "b96eaa83-2707-4726-b6a0-bf6f7886333f",
              quantity: "6",
              productId: "39694a93-3f90-46c3-91a6-9cba4418f5c1",
              productVariantId: "e0186418-c6c4-4aeb-9adb-24698951ef94",
              storageLocation: "WH-Inbound storage for Cooler B",
              skuDescription: "Night Shade",
              giId: "552a74a7-4ff9-4e65-b8e1-0abc5609e8f4",
              sled: "2024-08-18T19:37:15",
              lpnType: "Pallet",
              uom: "Pounds (lbs)",
              variantDescription: "Should be of uniform shape and size and color typical of the variety",
              pkgQuantity: "1",
              lpnNumber: "WHP2034",
              skuCode: "NIG-PEP-00002"
          ),
        ]);

  }

}