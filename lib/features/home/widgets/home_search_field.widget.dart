import 'dart:async';
import 'package:flutter/material.dart';

class HomeSearchField extends StatefulWidget {
  const HomeSearchField({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final void Function(String) onChange;

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

  Widget _fieldViewBuilder(context, controller, focusNode, onEditingComplete) {
    return TextField(
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      controller: controller,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        fillColor: Color(0xFF7D79E3),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Color.fromRGBO(27, 50, 132, 0.2),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        constraints: BoxConstraints(maxHeight: 44),
        hintText: 'What is needed?',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      onChanged: widget.onChange,
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
          constraints:
              BoxConstraints(maxWidth: constraints.maxWidth, maxHeight: 230),
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
