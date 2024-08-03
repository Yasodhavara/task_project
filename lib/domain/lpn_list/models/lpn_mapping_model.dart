class BinLpnMappingListResponseModel {
  final String? status;
  final String? message;
  final String? responseStatus;
  final int? statusCode;
  final List<BinLpnMappingListDataModel>? binLpnListResponseDataModel;

  BinLpnMappingListResponseModel({
    required this.status,
    required this.message,
    required this.responseStatus,
    required this.statusCode,
    required this.binLpnListResponseDataModel,
});

  factory BinLpnMappingListResponseModel.fromJson(Map<String, dynamic>? json) {
    return BinLpnMappingListResponseModel(
        status: json?['status'],
        message: json?['message'],
        responseStatus: json?['responseStatus'],
        statusCode: json?['statusCode'],
        binLpnListResponseDataModel: json?['data']
    );
  }

}

class BinLpnMappingListDataModel {
  final String? lpnId;
  final String? quantity;
  final String? productId;
  final String? productVariantId;
  final String? storageLocation;
  final String? skuDescription;
  final String? giId;
  final String? sled;
  final String? lpnType;
  final String? uom;
  final String? variantDescription;
  final String? pkgQuantity;
  final String? lpnNumber;
  final String? skuCode;

  BinLpnMappingListDataModel({
    required this.lpnId,
    required this.quantity,
    required this.productId,
    required this.productVariantId,
    required this.storageLocation,
    required this.skuDescription,
    required this.giId,
    required this.sled,
    required this.lpnType,
    required this.uom,
    required this.variantDescription,
    required this.pkgQuantity,
    required this.lpnNumber,
    required this.skuCode,
});

  factory BinLpnMappingListDataModel.fromJson(Map<String, dynamic>? json) {
    return BinLpnMappingListDataModel(
      lpnId: json?['lpnId'],
      quantity: json?['quantity'],
      productId: json?['productId'],
      productVariantId: json?['productVariantId'],
      storageLocation: json?['storageLocation'],
      skuDescription: json?['skuDescription'],
      giId: json?['giId'],
      sled: json?['sled'],
      lpnType: json?['lpnType'],
      uom: json?['uom'],
      variantDescription: json?['variantDescription'],
      pkgQuantity: json?['pkgQuantity'],
      lpnNumber: json?['lpnNumber'],
      skuCode: json?['skuCode'],
    );
  }
}
