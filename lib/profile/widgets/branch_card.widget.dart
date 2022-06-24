import 'package:flutter/material.dart';

import '../profile.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({Key? key, required this.branch}) : super(key: key);

  final Branch branch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(27, 50, 132, 0.05),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            branch.contactPerson ?? 'No contact person specified',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color.fromRGBO(27, 50, 132, 1),
            ),
          ),
          Text(
            branch.address ?? 'No address person specified',
            style: const TextStyle(),
          ),
          Text(branch.phone ?? 'No phone person specified'),
        ],
      ),
    );
  }
}
