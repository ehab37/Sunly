import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunly/core/utils/validation_functions.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';
import 'package:sunly/widgets/custom_search_field.dart';
import 'package:sunly/widgets/custom_text_fom_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController cityNameController = TextEditingController();

  @override
  void dispose() {
    cityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Form(
            autovalidateMode: autoValidateMode,
            key: formKey,
            child: Column(
              children: [
                CustomSearchField(text: "Search about city's weather"),
                CustomTextFormField(
                  controller: cityNameController,
                  label: 'City Name',
                  hint: 'Enter City Name',
                  validator: (value) => cityValidator(value),
                  textCapitalization: TextCapitalization.words,
                  keyboard: TextInputType.text,
                  suffixIcon: Icons.search,
                  suffixPress: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      FocusScope.of(context).unfocus();
                      await context.read<GetWeatherCubit>().getCurrentWeather(
                        cityName: cityNameController.text,
                      );
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Icon(CupertinoIcons.exclamationmark_circle),
                    SizedBox(width: 10),
                    Text(
                      "there is no weather, select city to start",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
