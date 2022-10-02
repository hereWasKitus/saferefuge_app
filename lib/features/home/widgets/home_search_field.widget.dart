import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saferefuge_ui/saferefuge_ui.dart';

class HomeSearchField extends StatefulWidget {
  const HomeSearchField({
    Key? key,
    required this.onChange,
    this.hintText,
    this.hintTextColor,
    this.fillColor,
    this.prefixIcon,
    this.cursorColor,
    this.textColor,
    this.focusedBorderColor = const Color.fromRGBO(27, 50, 132, 0.5),
  }) : super(key: key);

  final void Function(String) onChange;
  final String? hintText;
  final Color? hintTextColor;
  final Color? fillColor;
  final Icon? prefixIcon;
  final Color? cursorColor;
  final Color? textColor;
  final Color focusedBorderColor;

  @override
  State<HomeSearchField> createState() => _HomeSearchFieldState();
}

class _HomeSearchFieldState extends State<HomeSearchField> {
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
        optionsViewBuilder: (context, Function(String) onSelected, options) =>
            _optionsViewBuilder(context, onSelected, options, constraints),
      ),
    );
  }

  FutureOr<Iterable<String>> _optionsBuilder(TextEditingValue value) {
    if (value.text.isEmpty) {
      return [];
    }

    return ['some option', 'some option 1'];

    // return languages
    //     .toList()
    //     .where((element) =>
    //         element.toLowerCase().contains(value.text.toLowerCase()))
    //     .toList();
  }

  void _onSelected(String value) {
    setState(() {
      widget.onChange(value);
    });
    _controller.clear();
    _focusNode.unfocus();
  }

  Widget _fieldViewBuilder(
      BuildContext context,
      TextEditingController controller,
      FocusNode focusNode,
      onEditingComplete) {
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
      cursorColor: widget.cursorColor,
      textColor: widget.textColor,
      focusedBorderColor: widget.focusedBorderColor,
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
