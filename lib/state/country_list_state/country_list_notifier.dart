import 'package:country_list/data/model/country_list_model.dart';
import 'package:country_list/data/service/country_list_service.dart';
import 'package:country_list/state/country_list_state/country_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryListNotifier extends Notifier<CountryListState>{
  final CountryListService _countryListService=CountryListService();
  @override
  CountryListState build() {
    return CountryListLoading();
  }
  void getCountryList() async{
    try{
      state = CountryListLoading();
      final List<CountryListModel> countryList= await _countryListService.getCountryList();
      
      state=CountryListSuccess(countryList);
    }
    catch(e){
      // log
      print(e.toString());
      state=CountryListFailed(e.toString());
    }
  }
}