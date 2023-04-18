import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/shared/components/component.dart';

import '../../presentations/resources/styles_manager.dart';

class AddPaymentCard extends StatefulWidget {
  const AddPaymentCard({Key? key}) : super(key: key);

  @override
  State<AddPaymentCard> createState() => _AddPaymentCardState();
}

class _AddPaymentCardState extends State<AddPaymentCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  OutlineInputBorder border = OutlineInputBorder(
  borderSide: BorderSide(
  color: Colors.grey.withOpacity(0.7),
  width: 2.0));
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          AppStrings.newCard.tr(),
          style: getSemiBoldStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: '',
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange:
                  (CreditCardBrand creditCardBrand) {},

            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                         text:
                          AppStrings.addTheCard.tr(),
                        function: () {
                      if (formKey.currentState!.validate()) {
                        print('valid!');
                      } else {
                        print('invalid!');
                      }
                    },
                          ),
              ]
              )
              )
              )
        ]
    )
              ),
            );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}