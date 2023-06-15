import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/presentations/Main/the%20vehicle/vehicle_screen.dart';
import 'package:pick_park/shared/components/component.dart';
import 'package:country_list_pick/country_list_pick.dart';
import '../../../app/Graphql/app_mutation.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';

class CreatevehiclePage extends StatefulWidget {
  const CreatevehiclePage({Key? key}) : super(key: key);

  @override
  State<CreatevehiclePage> createState() => _CreatevehiclePageState();
}

class _CreatevehiclePageState extends State<CreatevehiclePage> {
  var describtionController = TextEditingController();
  var digitsController = TextEditingController();
  var letterController = TextEditingController();
  var country;
  var formKey = GlobalKey<FormState>();
  int digits =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          AppStrings.createVehicle.tr(),
          textAlign: TextAlign.start,
          style: getBoldStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: defaultFormField(
                  controller: describtionController,
                  label: AppStrings.description.tr(),
                  prefix: Icons.library_books,
                  type: TextInputType.name,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CountryListPick(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: const Text('Pick your country'),
                    ),
                    // if you need custom picker use this
                    // pickerBuilder: (context, CountryCode countryCode) {
                    //   return Row(
                    //     children: [
                    //       Image.asset(
                    //         countryCode.flagUri,
                    //         package: 'country_list_pick',
                    //       ),
                    //       Text(countryCode.code),
                    //       Text(countryCode.dialCode),
                    //     ],
                    //   );
                    // },
                    theme: CountryTheme(
                      isShowFlag: true,
                      isShowTitle: true,
                      isShowCode: false,
                      isDownIcon: true,
                      showEnglishName: false,
                      labelColor: Colors.blueAccent,
                    ),
                    initialSelection: '+971',
                    // or
                    // initialSelection: 'US'
                    onChanged: (CountryCode? code) {
                      // print(code.name);
                      // print(code.code);
                      // print(code.dialCode);
                      // print(code.flagUri);
                      setState(() {
                        country = code!.name;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: defaultFormField(
                  controller: digitsController,
                  label: AppStrings.plateNum.tr(),
                  prefix: Icons.directions_car_filled_outlined,
                  type: TextInputType.number,
                  onSubmit: (result){
                    setState(() {
                      digits= result;
                    });
                  },

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: defaultFormField(
                  controller: letterController,
                  label: AppStrings.plateLetter.tr(),
                  prefix: Icons.abc,
                  type: TextInputType.name,
                ),
              ),
              Spacer(),
              Mutation(
                  options: MutationOptions(
                      document: gql(AppMutations.createVehicle),
                      onCompleted: (dynamic resultData) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VehicleScreen()));
                      }),
                  builder: (RunMutation? runMutation, QueryResult? result) {
                    if (result!.isLoading) {
                      return Text(AppStrings.loading.tr());
                    }
                    if (result.hasException) {
                      print(result);
                    }
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 30),
                      child: defaultButton(
                        function: () {
                          runMutation!({
                            'input': {
                              'description': describtionController.text,
                              'country': country,
                              'plateDigits': digits,
                              'plateLetters': letterController.text,
                            },
                          });
                        },
                        text: AppStrings.create,
                        color: Color(0xff4b4eb0),
                        radius: 35,
                        isUpperCase: true,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
