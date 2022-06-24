import 'package:flutter/material.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/registration/registration.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

import '../profile.dart';

class BranchForm extends StatefulWidget {
  const BranchForm({
    Key? key,
    this.branch = const Branch(),
    this.submitButtonText = 'Add branch',
    required this.onSubmit,
  }) : super(key: key);

  final Branch branch;
  final void Function(Branch) onSubmit;
  final String submitButtonText;

  @override
  State<BranchForm> createState() => _BranchFormState();
}

class _BranchFormState extends State<BranchForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _gap = 16;
  late Branch _branch;

  @override
  void initState() {
    setState(() {
      _branch = widget.branch.copyWith();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyFormField(
            labelText: 'Branch address',
            initialValue: _branch.address,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            onSaved: (value) {
              _branch = _branch.copyWith(address: value);
            },
          ),
          SizedBox(height: _gap),
          MyFormField(
            labelText: 'Branch phone number',
            initialValue: _branch.phone,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            onSaved: (value) {
              _branch = _branch.copyWith(phone: value);
            },
          ),
          SizedBox(height: _gap),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Services branch provide',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              CategoryList(
                onSelected: (List<String> categories) {
                  _branch = _branch.copyWith(categories: categories);
                },
              )
            ],
          ),
          SizedBox(height: _gap),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (_branch.categories!.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Choose at least one category'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: red,
                    ),
                  );

                  return;
                }

                widget.onSubmit(_branch);
              }
            },
            child: Text(widget.submitButtonText),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(defaultBorderRadius),
                ),
              ),
              primary: const Color.fromRGBO(27, 50, 132, 1),
            ),
          )
        ],
      ),
    );
  }
}
