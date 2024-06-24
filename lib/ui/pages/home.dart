import 'package:country_list/data/model/country_list_model.dart';
import 'package:country_list/state/country_list_state/country_list_notifier.dart';
import 'package:country_list/state/country_list_state/country_list_state.dart';
import 'package:country_list/ui/widget/country_list_view.dart';
import 'package:country_list/ui/widget/error_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final countryNotifierProvider =
      NotifierProvider<CountryListNotifier, CountryListState>(() {
    return CountryListNotifier();
  });
  late CountryListNotifier countryListNotifier;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      countryListNotifier?.getCountryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    countryListNotifier = ref.read(countryNotifierProvider.notifier);
    final countryListState = ref.watch(countryNotifierProvider);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Country List")),
        body: switch (countryListState) {
          CountryListLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          CountryListSuccess(countryList: List<CountryListModel> countryList) =>
            CountryListView(countryList: countryList),
          CountryListFailed(errorMessage: String errorMessage) => FailedWidget(
              errorMessage: errorMessage,
              tryAgain: () {
                countryListNotifier.getCountryList();
              },
            )
        });
  }
}
