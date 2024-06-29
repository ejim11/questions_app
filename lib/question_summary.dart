import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questions_app/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

// list of the summary data
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(summaryData: data);
          }).toList(),
        ),
      ),
    );
  }
}
