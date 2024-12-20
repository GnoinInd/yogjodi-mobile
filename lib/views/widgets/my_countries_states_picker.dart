import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../models/country_state_city_picker_models/country_model.dart';
import '../../models/country_state_city_picker_models/state_model.dart';

class CountriesStatesPicker extends StatefulWidget {
  final double spacing;
  final TextEditingController countriesController;

  ///List to store selected countries.
  final List<String> countries;
  final void Function(String)? onCountriesChange;
  final String? Function(String?)? countriesValidator;
  final InputDecoration? countriesInputDecoration;
  final TextEditingController statesController;

  ///List to store selected states.
  final List<String> states;
  final void Function(String)? onStatesChange;
  final String? Function(String?)? statesValidator;
  final InputDecoration? statesInputDecoration;
  final TextStyle inputTextStyle;
  final Color? dialogBGColor;
  final Color? snackBarBGColor;

  const CountriesStatesPicker({
    super.key,
    this.spacing = 8.0,
    required this.countriesController,
    required this.countries,
    this.onCountriesChange,
    this.countriesValidator,
    this.countriesInputDecoration,
    required this.statesController,
    required this.states,
    this.onStatesChange,
    this.statesValidator,
    this.statesInputDecoration,
    required this.inputTextStyle,
    this.dialogBGColor,
    this.snackBarBGColor,
  });

  @override
  State<CountriesStatesPicker> createState() => _CountriesStatesPickerState();
}

class _CountriesStatesPickerState extends State<CountriesStatesPicker> {
  List<CountryModel> _countryList = [];
  final List<StateModel> _stateList = [];

  List<CountryModel> _countrySubList = [];
  List<StateModel> _stateSubList = [];
  String _title = '';

  List<String> countries = [];
  List<String> countryIds = [];
  List<String> states = [];

  @override
  void initState() {
    countries = widget.countries;
    states = widget.states;
    _getCountry();
    super.initState();
  }

  Future<void> _getCountry() async {
    _countryList.clear();
    var jsonString = await rootBundle.loadString('assets/json/country.json');
    List<dynamic> body = json.decode(jsonString);
    setState(() {
      _countryList =
          body.map((dynamic item) => CountryModel.fromJson(item)).toList();
      _countrySubList = _countryList;
    });
  }

  Future<void> _getState(List<String> countryIds) async {
    _stateList.clear();
    List<StateModel> subStateList = [];
    var jsonString = await rootBundle.loadString('assets/json/state.json');
    List<dynamic> body = json.decode(jsonString);

    subStateList =
        body.map((dynamic item) => StateModel.fromJson(item)).toList();
    for (var element in subStateList) {
      if (countryIds.contains(element.countryId)) {
        setState(() {
          _stateList.add(element);
        });
      }
    }
    _stateSubList = _stateList;

    ///Remove states which country has been removed.
    states.retainWhere((element) =>
        _stateSubList.any((stateModel) => stateModel.name == element));
    widget.statesController.text = states.isNotEmpty
        ? states.toString().substring(1, states.toString().length - 1)
        : "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Country TextField
        TextFormField(
          controller: widget.countriesController,
          validator: widget.countriesValidator,
          onTap: () {
            setState(() => _title = 'Country');
            _showDialog(context);
          },
          decoration: widget.countriesInputDecoration ??
              defaultDecoration.copyWith(hintText: 'Select country'),
          readOnly: true,
          onChanged: widget.onCountriesChange,
        ),
        const SizedBox(height: 16.0),

        ///State TextField
        TextFormField(
          controller: widget.statesController,
          validator: widget.statesValidator,
          onTap: () {
            setState(() => _title = 'State');
            if (widget.countriesController.text.isNotEmpty) {
              _showDialog(context);
            } else {
              _showSnackBar('Select Country');
            }
          },
          decoration: widget.statesInputDecoration ??
              defaultDecoration.copyWith(hintText: 'Select state'),
          readOnly: true,
          onChanged: widget.onStatesChange,
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController controller2 = TextEditingController();

    showGeneralDialog(
      barrierLabel: _title,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 350),
      context: context,
      pageBuilder: (context, __, ___) {
        return Material(
          color: Colors.transparent,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  margin: const EdgeInsets.only(top: 60, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: widget.dialogBGColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        _title,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),

                      ///Text Field
                      TextField(
                        controller:
                            _title == 'Country' ? controller : controller2,
                        onChanged: (val) {
                          setState(() {
                            if (_title == 'Country') {
                              _countrySubList = _countryList
                                  .where((element) => element.name
                                      .toLowerCase()
                                      .contains(controller.text.toLowerCase()))
                                  .toList();
                            } else if (_title == 'State') {
                              _stateSubList = _stateList
                                  .where((element) => element.name
                                      .toLowerCase()
                                      .contains(controller2.text.toLowerCase()))
                                  .toList();
                            }
                          });
                        },
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0,
                        ),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          hintText: "Search here...",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 5,
                          ),
                          isDense: true,
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),

                      ///Dropdown Items
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          itemCount: _title == 'Country'
                              ? _countrySubList.length
                              : _stateSubList.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                setState(() {
                                  if (_title == 'Country') {
                                    if (countries.contains(
                                        _countrySubList[index].name)) {
                                      countries
                                          .remove(_countrySubList[index].name);
                                      countryIds
                                          .remove(_countrySubList[index].id);
                                      _getState(countryIds);
                                    } else {
                                      countries
                                          .add(_countrySubList[index].name);
                                      countryIds.add(_countrySubList[index].id);
                                      _getState(countryIds);
                                    }
                                    widget.countriesController.text = countries
                                        .toString()
                                        .substring(
                                            1, countries.toString().length - 1);
                                  } else {
                                    if (states
                                        .contains(_stateSubList[index].name)) {
                                      states.remove(_stateSubList[index].name);
                                    } else {
                                      states.add(_stateSubList[index].name);
                                    }
                                    widget.statesController.text = states
                                        .toString()
                                        .substring(
                                            1, states.toString().length - 1);
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20.0, left: 10.0, right: 10.0),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: _title == 'Country'
                                          ? countries.contains(
                                              _countrySubList[index].name)
                                          : states.contains(
                                              _stateSubList[index].name),
                                      onChanged: (bool? checked) {
                                        setState(() {
                                          if (_title == 'Country') {
                                            if (countries.contains(
                                                _countrySubList[index].name)) {
                                              countries.remove(
                                                  _countrySubList[index].name);
                                              countryIds.remove(
                                                  _countrySubList[index].id);
                                              _getState(countryIds);
                                            } else {
                                              countries.add(
                                                  _countrySubList[index].name);
                                              countryIds.add(
                                                  _countrySubList[index].id);
                                              _getState(countryIds);
                                            }
                                            widget.countriesController.text =
                                                countries.toString().substring(
                                                    1,
                                                    countries
                                                            .toString()
                                                            .length -
                                                        1);
                                          } else {
                                            if (states.contains(
                                                _stateSubList[index].name)) {
                                              states.remove(
                                                  _stateSubList[index].name);
                                            } else {
                                              states.add(
                                                  _stateSubList[index].name);
                                            }
                                            widget.statesController.text =
                                                states.toString().substring(
                                                    1,
                                                    states.toString().length -
                                                        1);
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      _title == 'Country'
                                          ? _countrySubList[index].name
                                          : _stateSubList[index].name,
                                      style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {
                          _countrySubList = _countryList;
                          _stateSubList = _stateList;

                          controller.clear();
                          controller2.clear();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Okay',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(anim),
          child: child,
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: widget.snackBarBGColor,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  InputDecoration defaultDecoration = const InputDecoration(
    isDense: true,
    hintText: 'Select',
    suffixIcon: Icon(Icons.arrow_drop_down),
    border: OutlineInputBorder(),
  );
}
