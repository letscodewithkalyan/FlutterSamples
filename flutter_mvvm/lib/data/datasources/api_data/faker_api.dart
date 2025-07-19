import 'package:flutter_mvvm/core/api_constants.dart';
import 'package:flutter_mvvm/data/datasources/api_response.dart';
import 'package:flutter_mvvm/data/datasources/api_service.dart';
import 'package:flutter_mvvm/data/models/image_model.dart';

class FakerApi {
  Future<ApiResponse<List<ImageModel>>> getImagesData() async {
    final apiData = await APIService().getData<dynamic>(
      ApiConstants.imageEndPoint,
    );
    if (apiData.data != null) {
      var imageResponse = ImageResponse.fromJson(apiData.data);
      return ApiResponse.success(data: imageResponse.data);
    }
    return ApiResponse.error(error: apiData.error);
  }
}
