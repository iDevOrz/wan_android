import 'package:flutter/material.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';

class ProjectListItemView extends StatelessWidget {
  final ProjectListItem data;

  const ProjectListItemView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 160,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 9 / 16,
                child: Image(image: NetworkImage(data.envelopePic)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _textContent(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data.title,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(
          data.desc,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 4,
        ),
        const Spacer(),
        _authorAndDate(context),
      ],
    );
  }

  Widget _authorAndDate(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.labelSmall!,
      child: Row(
        children: [
          const Icon(
            Icons.person,
            size: 20,
          ),
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
