import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/registration/registration.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

class BranchForm extends StatefulWidget {
  const BranchForm({
    Key? key,
    this.branch = const POI(),
    this.submitButtonText = 'Add branch',
    required this.onSubmit,
    this.isLoading = false,
  }) : super(key: key);

  final POI branch;
  final void Function(POI) onSubmit;
  final String submitButtonText;
  final bool isLoading;

  @override
  State<BranchForm> createState() => _BranchFormState();
}

class _BranchFormState extends State<BranchForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _gap = 16;
  late POI _branch;

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
            labelText: 'Branch name*',
            initialValue: _branch.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            onSaved: (value) {
              _branch = _branch.copyWith(name: value);
            },
          ),
          SizedBox(height: _gap),
          MyFormField(
            labelText: 'Contact person*',
            initialValue: _branch.contactPerson,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              return null;
            },
            onSaved: (value) {
              _branch = _branch.copyWith(contactPerson: value);
            },
          ),
          SizedBox(height: _gap),
          MyFormField(
            labelText: 'Branch address*',
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
            labelText: 'Branch phone number*',
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
          MyFormField(
            labelText: 'Branch website*',
            initialValue: _branch.url,
            keyboardType: TextInputType.url,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              if (!RegExp(r'^https?:\/\/.*').hasMatch(value)) {
                return 'Invalid URL';
              }

              return null;
            },
            onSaved: (value) {
              _branch = _branch.copyWith(url: value);
            },
          ),
          SizedBox(height: _gap),
          MyFormField(
            labelText: 'Branch telegram',
            initialValue: _branch.telegram,
            validator: (value) {
              if (value != null && value.isNotEmpty && !RegExp(r'^@[a-zA-Z0-9_]{5,32}$').hasMatch(value)) {
                return 'Telegram is not valid';
              }

              return null;
            },
            onSaved: (value) {
              _branch = _branch.copyWith(telegram: value);
            },
          ),
          SizedBox(height: _gap),
          MyFormField(
            labelText: 'Branch whatsapp',
            initialValue: _branch.whatsapp,
            validator: (value) {
              // if (value != null && !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
              //   return 'Whatsapp is not valid';
              // }

              return null;
            },
            onSaved: (value) {
              _branch = _branch.copyWith(whatsapp: value);
            },
          ),
          SizedBox(height: _gap),
          MyFormField(
            labelText: 'Description',
            initialValue: _branch.description,
            maxLines: 6,
            onSaved: (value) {
              _branch = _branch.copyWith(description: value);
            },
            hintText: 'Please, describe the branch activity prefferably in english',
          ),
          SizedBox(height: _gap),
          _LanguageField(
            selectedLanguages: _branch.languages,
            onChange: (Set<String> languages) {
              _branch = _branch.copyWith(languages: languages);
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
                selected: _branch.categories,
                onSelected: (List<String> categories) {
                  _branch = _branch.copyWith(categories: categories.map((cat) => cat).toList());
                },
              )
            ],
          ),
          SizedBox(height: _gap),
          ElevatedButton(
            onPressed: () {
              if (widget.isLoading) {
                return;
              }

              if (_formKey.currentState!.validate()) {
                if (_branch.categories.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Choose at least one category'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: red,
                    ),
                  );

                  return;
                }

                _formKey.currentState!.save();

                widget.onSubmit(_branch);
              }
            },
            child: widget.isLoading ? const SpinKitCircle(color: Colors.white) : Text(widget.submitButtonText),
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

class _LanguageField extends StatefulWidget {
  const _LanguageField({
    Key? key,
    required this.onChange,
    this.selectedLanguages = const <String>{},
  }) : super(key: key);

  final Function(Set<String>) onChange;
  final Set<String> selectedLanguages;

  @override
  State<_LanguageField> createState() => _LanguageFieldState();
}

class _LanguageFieldState extends State<_LanguageField> {
  final Set<String> _languages = {};
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _languages.addAll(widget.selectedLanguages);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) => RawAutocomplete(
            textEditingController: _controller,
            focusNode: _focusNode,
            optionsBuilder: _optionsBuilder,
            onSelected: _onSelected,
            fieldViewBuilder: _fieldViewBuilder,
            optionsViewBuilder: (context, Function(String) onSelected, options) =>
                _optionsViewBuilder(context, onSelected, options, constraints),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: -8,
          children: _languages.map((String language) {
            return Chip(
              deleteIcon: const Icon(
                Icons.close,
                size: 18,
                color: Colors.white,
              ),
              onDeleted: () {
                setState(() {
                  _languages.remove(language);
                  widget.onChange(_languages);
                });
              },
              label: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  children: [
                    TextSpan(text: language.substring(0, 1).toUpperCase()),
                    TextSpan(text: language.substring(1)),
                  ],
                ),
              ),
              backgroundColor: const Color.fromRGBO(44, 83, 218, 0.8),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _onSelected(String language) {
    setState(() {
      _languages.add(language);
      widget.onChange(_languages);
    });
    _controller.clear();
    _focusNode.unfocus();
  }

  FutureOr<Iterable<String>> _optionsBuilder(TextEditingValue value) {
    if (value.text.isEmpty) {
      return languages.toList();
    }

    return languages.toList().where((element) => element.toLowerCase().contains(value.text.toLowerCase())).toList();
  }

  Widget _fieldViewBuilder(context, controller, focusNode, onEditingComplete) {
    return MyFormField(
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      labelText: 'Languages',
    );
  }

  Widget _optionsViewBuilder(
    BuildContext context,
    Function(String) onSelected,
    Iterable<Object?> options,
    BoxConstraints constraints,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        type: MaterialType.transparency,
        elevation: 0,
        child: Container(
          constraints: BoxConstraints(maxWidth: constraints.maxWidth, maxHeight: 230),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(
                options.elementAt(index).toString(),
              ),
              onTap: () => onSelected(options.elementAt(index).toString()),
            ),
          ),
        ),
      ),
    );
  }
}
