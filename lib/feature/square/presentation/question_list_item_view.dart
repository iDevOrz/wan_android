import 'package:flutter/material.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';

class QuestionListItemView extends StatelessWidget {
  const QuestionListItemView({super.key, required this.data});

  final ProjectListItem data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _authorAndDate(context),
            Text(
              data.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget _authorAndDate(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(color: Colors.grey[600]),
      child: Row(
        children: [
          const Icon(
            Icons.question_answer,
            size: 15,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              data.author,
            ),
          ),
          const SizedBox(width: 8),
          Text(data.niceDate),
        ],
      ),
    );
  }
}
