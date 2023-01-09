import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zipit/tablet/style/app_styleT.dart';

Widget noteCardTablet(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppStyleTablet.cardsColorT[doc['color_id']],
          borderRadius: BorderRadius.circular(8.0)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc["note_title"],
              style: AppStyleTablet.mainTitleTablet,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              doc["creation_date"],
              style: AppStyleTablet.dateTitleTablet,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              doc["note_content"],
              overflow: TextOverflow.ellipsis,
              style: AppStyleTablet.mainContentTablet,
            ),
          ],
        ),
      ),
    ),
  );
}
