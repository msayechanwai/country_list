import 'package:country_list/const/api_const.dart';
import 'package:country_list/data/model/country_list_model.dart';
import 'package:dio/dio.dart';

class CountryListService{
  final _dio= Dio();
  Future<List<CountryListModel>> getCountryList() async{
    Uri uri=Uri.parse('${ApiConst.baseurl}${ApiConst.all}?fields=name,region,flags');
    print(uri);
    final Response response=await _dio.getUri(uri);
    return (response.data as List).map((dynamic data){
      return CountryListModel.fromJson(data);
    }).toList();

  }
}