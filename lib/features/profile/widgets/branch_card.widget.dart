import 'package:flutter/material.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/core/config/constants.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({Key? key, required this.branch, required this.onTap}) : super(key: key);

  final POI branch;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(27, 50, 132, 0.05),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        clipBehavior: Clip.none,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  branch.name.isEmpty ? 'No branch name specified' : branch.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromRGBO(27, 50, 132, 1),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  branch.address.isEmpty ? 'No address specified' : branch.address,
                  softWrap: true,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  branch.contactPerson.isEmpty ? 'No contact person specified' : branch.contactPerson,
                  style: const TextStyle(fontSize: 16, color: Color.fromRGBO(27, 50, 132, 1)),
                ),
                const SizedBox(height: 4),
                Text(
                  branch.phone.isEmpty ? 'No phone specified' : branch.phone,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: -8,
                  children: branch.categories
                      .map(
                        (cat) => Chip(
                          label: Text(
                            cat,
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          backgroundColor: const Color.fromRGBO(44, 83, 218, 0.8),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          // const Spacer(),
          Positioned(
            top: -14,
            right: -8,
            child: Chip(
              label: Text(branch.approved ? 'Approved' : 'Not approved'),
              labelStyle: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(0),
              backgroundColor: branch.approved ? green : red,
            ),
          ),
        ],
      ),
    );
  }
}
