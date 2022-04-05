import 'package:flutter/material.dart';
import 'package:protect_ua_women/constants.dart';

class PositionedTagsList extends StatelessWidget {
  const PositionedTagsList({Key? key}) : super(key: key);

  static const tags = <String>[
    'Medicine',
    'Accomodation',
    'Transport',
    'Food',
    'Medicine',
    'Accomodation',
    'Transport',
    'Food'
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    ButtonStyle _buttonStyle = ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(44, 83, 218, 0.8)),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13)))),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)));

    return Positioned(
      top: 85,
      height: 32,
      width: screenWidth,
      child: ListView.separated(
        padding: const EdgeInsets.only(
            left: defaultPadding, right: defaultPadding, top: 2, bottom: 2),
        separatorBuilder: (ctx, index) => const SizedBox(width: 4),
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return ElevatedButton(
              child: Text(tags[index]), onPressed: () {}, style: _buttonStyle);
        },
      ),
    );
  }
}
