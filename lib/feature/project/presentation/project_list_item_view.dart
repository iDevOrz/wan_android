import 'package:flutter/material.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';

class ProjectListItemView extends StatelessWidget {
  final ProjectListItem data;

  const ProjectListItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            data.desc,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(data.toString())
        ],
      ),
    );
  }
}
