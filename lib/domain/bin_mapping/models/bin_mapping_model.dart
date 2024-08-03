class BinMappingListResponseModel {
  final String? status;
  final String? message;
  final String? responseStatus;
  final int? statusCode;
  final List<BinMappingListDataModel>? binListResponseDataModel;

  BinMappingListResponseModel({
    required this.status,
    required this.message,
    required this.responseStatus,
    required this.statusCode,
    required this.binListResponseDataModel,
  });

  factory BinMappingListResponseModel.fromJson(Map<String, dynamic>? json) {
    return BinMappingListResponseModel(
        status: json?['status'],
        message: json?['message'],
        responseStatus: json?['responseStatus'],
        statusCode: json?['statusCode'],
        binListResponseDataModel: json?['data']
    );
  }

}

class BinMappingListDataModel {
  final String? binNumber;
  final String? quantity;
  final String? pkgQuantity;
  final String? storageLocation;
  final String? storageType;
  final String? storageSection;
  final String? binStatus;

  BinMappingListDataModel({
    required this.binNumber,
    required this.quantity,
    required this.pkgQuantity,
    required this.storageLocation,
    required this.storageType,
    required this.storageSection,
    required this.binStatus,
  });

  factory BinMappingListDataModel.fromJson(Map<String, dynamic>? json) {
    return BinMappingListDataModel(
      binNumber: json?['binNumber'],
      quantity: json?['quantity'],
      pkgQuantity: json?['pkgQuantity'],
      storageLocation: json?['storageLocation'],
      storageType: json?['storageType'],
      storageSection: json?['storageSection'],
      binStatus: json?['binStatus'],
    );
  }
}
