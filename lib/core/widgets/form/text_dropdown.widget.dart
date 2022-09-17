import 'package:flutter/material.dart';
import 'package:protect_ua_women/core/widgets/form/my_form_field.dart';

class TextDropdown extends StatefulWidget {
  const TextDropdown({
    Key? key,
    required this.onChange,
    required this.onItemSelect,
    required this.items,
    this.label = '',
    this.hintText = '',
    this.hideDropdown = false,
    this.suffixIcon,
    this.validator,
    this.controller,
  }) : super(key: key);

  final Function(String?) onChange;
  final Function(DropdownItemModel) onItemSelect;
  final List<DropdownItemModel> items;
  final String label;
  final String hintText;
  final bool hideDropdown;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<TextDropdown> createState() => _TextDropdownState();
}

class _TextDropdownState extends State<TextDropdown> {
  late TextEditingController _controller;
  late List<DropdownItemModel> _filteredItems;
  OverlayEntry? _entry;
  final _link = LayerLink();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    _filteredItems = widget.items;
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _showOverlay());

    _focusNode.addListener(() {
      if (_focusNode.hasPrimaryFocus) {
        _showOverlay();
      } else {
        _hideOverlay();
      }
    });

    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _filteredItems = widget.items;
        });

        _showOverlay();

        return;
      }

      setState(() {
        _filteredItems =
            widget.items.where((item) => item.title.toLowerCase().contains(_controller.text.toLowerCase())).toList();

        _showOverlay();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showOverlay() {
    if (widget.hideDropdown) return;

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    if (_entry != null) {
      _entry!.markNeedsBuild();
      return;
    }

    _entry = OverlayEntry(
      builder: (context) => Positioned(
        height: _filteredItems.length > 3 ? 200 : _filteredItems.length * 60,
        width: size.width,
        child: CompositedTransformFollower(
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          link: _link,
          child: _Dropdown(
            items: _filteredItems,
            onChange: (item) {
              _controller.text = item.title;
              _focusNode.unfocus();
              widget.onItemSelect(item);
            },
          ),
        ),
      ),
    );
    overlay!.insert(_entry!);
  }

  void _hideOverlay() {
    _entry!.remove();
    _entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: MyFormField(
        labelText: widget.label,
        hintText: widget.hintText,
        controller: _controller,
        focusNode: _focusNode,
        onChanged: widget.onChange,
        suffixIcon: widget.suffixIcon,
        validator: widget.validator,
      ),
    );
  }
}

class _Dropdown extends StatelessWidget {
  const _Dropdown({Key? key, required this.items, required this.onChange}) : super(key: key);

  final List<DropdownItemModel> items;
  final void Function(DropdownItemModel) onChange;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(items[index].title),
          onTap: () => onChange(
            items[index],
          ),
        ),
      ),
    );
  }
}

class DropdownItemModel {
  const DropdownItemModel({this.title = '', this.value = ''});

  final String title;
  final String value;
}
