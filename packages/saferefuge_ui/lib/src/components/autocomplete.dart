// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saferefuge_ui/saferefuge_ui.dart';

class SRAutocomplete extends StatefulWidget {
  const SRAutocomplete({
    super.key,
    required this.onSelected,
    required this.onChange,
    this.hintText,
    this.hintTextColor,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    // this.focusSuffixIcon,
    // this.focusPrefixIcon,
    this.cursorColor,
    this.textColor,
    this.focusedBorderColor = const Color.fromRGBO(27, 50, 132, 0.5),
    required this.items,
  });

  final void Function(String) onSelected;
  final void Function(String) onChange;
  final String? hintText;
  final Color? hintTextColor;
  final Color? fillColor;
  final Widget? prefixIcon;
  // final Icon? focusPrefixIcon;
  final Widget? suffixIcon;
  // final Icon? focusSuffixIcon;
  final Color? cursorColor;
  final Color? textColor;
  final Color focusedBorderColor;
  final Set<String> items;

  @override
  State<SRAutocomplete> createState() => _SRAutocompleteState();
}

class _SRAutocompleteState extends State<SRAutocomplete> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RawAutocomplete(
        textEditingController: _controller,
        focusNode: _focusNode,
        optionsBuilder: _optionsBuilder,
        onSelected: _onSelected,
        fieldViewBuilder: _fieldViewBuilder,
        optionsViewBuilder:
            (context, void Function(String) onSelected, options) =>
                _optionsViewBuilder(context, onSelected, options, constraints),
      ),
    );
  }

  FutureOr<Iterable<String>> _optionsBuilder(TextEditingValue value) {
    if (value.text.isEmpty) {
      return [];
    }

    return widget.items
        .toList()
        .where(
          (element) => element.toLowerCase().contains(value.text.toLowerCase()),
        )
        .toList();
  }

  void _onSelected(String value) {
    setState(() {
      widget.onSelected(value);
    });
    _focusNode.unfocus();
  }

  Widget _fieldViewBuilder(
    BuildContext context,
    TextEditingController controller,
    FocusNode focusNode,
    void Function() onEditingComplete,
  ) {
    return SRTextField(
      focusNode: focusNode,
      controller: controller,
      onEditingComplete: () {
        focusNode.unfocus();
        onEditingComplete();
      },
      onChange: widget.onChange,
      hintText: widget.hintText,
      hintTextColor: widget.hintTextColor,
      fillColor: widget.fillColor,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      cursorColor: widget.cursorColor,
      textColor: widget.textColor,
      focusedBorderColor: widget.focusedBorderColor,
    );
  }

  Widget _optionsViewBuilder(
    BuildContext context,
    void Function(String) onSelected,
    Iterable<Object?> options,
    BoxConstraints constraints,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth,
            maxHeight: 230,
          ),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                // offset: const Offset(0, 0),
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
