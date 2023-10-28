import 'package:flutter/material.dart';
import 'package:test_task/models/person_model.dart';
import 'package:test_task/partials/date_input_form_widget.dart';
import 'package:test_task/partials/link_button.dart';
import 'package:test_task/partials/select_modal_widget.dart';
import 'package:test_task/partials/submit_button_widget.dart';
import 'package:test_task/partials/tabs_widget.dart';
import 'package:test_task/partials/text_input_form_widget.dart';
import 'package:test_task/partials/title_widget.dart';

class OrderScreen extends StatefulWidget {
  final String? restorationId;
  const OrderScreen({super.key, this.restorationId});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // Sender
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  TextEditingController? _countryController;
  TextEditingController? _cityController;
  TextEditingController? _postcodeController;
  // Recipient
  TextEditingController? _nameRecipientController;
  TextEditingController? _emailRecipientController;
  TextEditingController? _phoneRecipientController;
  TextEditingController? _countryRecipientController;
  TextEditingController? _cityRecipientController;
  TextEditingController? _postcodeRecipientController;

  bool _modeAddAddress = true;
  bool _recipientAddAddress = true;

  @override
  void initState() {
    super.initState();
    // Sender Details
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _countryController = TextEditingController();
    _cityController = TextEditingController();
    _postcodeController = TextEditingController();
    // Recipient Address
    _nameRecipientController = TextEditingController();
    _emailRecipientController = TextEditingController();
    _phoneRecipientController = TextEditingController();
    _countryRecipientController = TextEditingController();
    _cityRecipientController = TextEditingController();
    _postcodeRecipientController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    // Sender Details
    _nameController!.dispose();
    _emailController!.dispose();
    _phoneController!.dispose();
    _countryController!.dispose();
    _postcodeController!.dispose();
    _cityController!.dispose();
    // Recipient address
    _nameRecipientController!.dispose();
    _emailRecipientController!.dispose();
    _phoneRecipientController!.dispose();
    _countryRecipientController!.dispose();
    _postcodeRecipientController!.dispose();
    _cityRecipientController!.dispose();
  }

  void toggleMode() {
    setState(() {
      _modeAddAddress = !_modeAddAddress;
    });
  }

  void toggleRecipientMode() {
    setState(() {
      _recipientAddAddress = !_recipientAddAddress;
    });
  }

  void submit() {}

  @override
  Widget build(BuildContext context) {
    List<Widget> _senderDetailsWidgets = _modeAddAddress
        ? [
            TextInputFormWidget(
              headline: 'Full Name*',
              placeholder: 'Danilev Egor',
              controller: _nameController!,
              path: 'assets/icons/person_icon.png',
            ),
            TextInputFormWidget(
              headline: 'Email*',
              placeholder: 'egor_zu@email.com',
              controller: _emailController!,
              type: TextInputType.emailAddress,
              path: 'assets/icons/email_icon.png',
            ),
            TextInputFormWidget(
                headline: 'Phone number*',
                placeholder: '+375726014690',
                controller: _phoneController!,
                type: TextInputType.phone,
                path: 'assets/icons/phone_icon.png'),
            TextInputFormWidget(
                headline: 'Country*',
                placeholder: 'Belarus',
                controller: _countryController!,
                type: TextInputType.text,
                path: 'assets/icons/location_icon.png'),
            TextInputFormWidget(
                headline: 'City*',
                placeholder: 'Minsk',
                controller: _cityController!,
                type: TextInputType.text,
                path: 'assets/icons/city_icon.png'),
            LinkButton(text: 'Add address line +', callback: () {}),
            TextInputFormWidget(
                headline: 'Postcode*',
                placeholder: '220069',
                controller: _postcodeController!,
                type: TextInputType.text,
                path: 'assets/icons/postcode_icon.png'),
          ]
        : [const SelectModalWidget(type: PersonType.sender)];

    List<Widget> _recipientAddressWidgets = _recipientAddAddress
        ? [
            TextInputFormWidget(
              headline: 'Full Name*',
              placeholder: 'Danilev Egor',
              controller: _nameRecipientController!,
              path: 'assets/icons/person_icon.png',
            ),
            TextInputFormWidget(
              headline: 'Email*',
              placeholder: 'egor_zu@email.com',
              controller: _emailRecipientController!,
              type: TextInputType.emailAddress,
              path: 'assets/icons/email_icon.png',
            ),
            TextInputFormWidget(
                headline: 'Phone number*',
                placeholder: '+375726014690',
                controller: _phoneRecipientController!,
                type: TextInputType.phone,
                path: 'assets/icons/phone_icon.png'),
            TextInputFormWidget(
                headline: 'Country*',
                placeholder: 'Belarus',
                controller: _countryRecipientController!,
                type: TextInputType.text,
                path: 'assets/icons/location_icon.png'),
            TextInputFormWidget(
                headline: 'City*',
                placeholder: 'Minsk',
                controller: _cityRecipientController!,
                type: TextInputType.text,
                path: 'assets/icons/city_icon.png'),
            LinkButton(text: 'Add address line +', callback: () {}),
            TextInputFormWidget(
                headline: 'Postcode*',
                placeholder: '220069',
                controller: _postcodeRecipientController!,
                type: TextInputType.text,
                path: 'assets/icons/postcode_icon.png'),
          ]
        : [const SelectModalWidget(type: PersonType.recipient)];
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Ordering',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TitleWidget(),
            DateInputForm(
                headline: 'Start date',
                path: 'assets/icons/date_icon.png',
                restorationId: widget.restorationId!),
            const SizedBox(height: 15),
            // Sender Details
            TabsWidget(
              callback: toggleMode,
              mode: _modeAddAddress,
            ),
            ..._senderDetailsWidgets,
            const SizedBox(height: 10),
            TabsWidget(
              headline: 'Recipient adress',
              callback: toggleRecipientMode,
              mode: _recipientAddAddress,
            ),
            // Recipient Address
            ..._recipientAddressWidgets,
            const SizedBox(height: 10),
            // Submit Button
            SubmitButtonWidget(callback: submit)
          ],
        ),
      ),
    );
  }
}
