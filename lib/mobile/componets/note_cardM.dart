import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zipit/mobile/style/app_styleM.dart';

Widget noteCardMobile(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppStyleMoile.cardsColorM[doc['color_id']],
          borderRadius: BorderRadius.circular(8.0)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc["note_title"],
              style: AppStyleMoile.mainTitleMobile,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              doc["creation_date"],
              style: AppStyleMoile.dateTitleMobile,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              doc["note_content"],
              overflow: TextOverflow.ellipsis,
              style: AppStyleMoile.mainContentMobile,
            ),
          ],
        ),
      ),
    ),
  );
}
