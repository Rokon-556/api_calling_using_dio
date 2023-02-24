import '../api_services/api_service.dart';
import '../api_services/base_service.dart';
import '../model/product_response_model.dart';
import '../utils/api_constants.dart';

class ApiRepository {
  final BaseService _apiService = ApiService();

  Future<ProductResponseModel> fetchProductList(int pageNo) async {
    dynamic response = await _apiService
        .getGetResponse("${ApiConstants.PRODUCT_LIST_URL}$pageNo");
    return ProductResponseModel.fromJson(response["data"]);
  }
}
