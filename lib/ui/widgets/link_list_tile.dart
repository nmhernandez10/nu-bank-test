import 'package:flutter/material.dart';
import 'package:nu_bank_test/core/models/link.dart';
import 'package:nu_bank_test/ui/constants/values.dart';
import 'package:nu_bank_test/ui/utils/format.dart';

class LinkListTile extends StatelessWidget {
  final Link link;
  const LinkListTile({required this.link, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            link.shortenUrl,
          ),
          const SizedBox(
            height: Value.defaultSpacing,
          ),
          Text(
            link.originalUrl,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: Value.defaultSpacing,
          ),
          Text(formatDate(link.createdAt)),
        ],
      ),
    );
  }
}
