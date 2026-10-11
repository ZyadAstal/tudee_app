import 'package:flutter/material.dart';
import '../database/todo.dart';

class TaskItemCard extends StatelessWidget {
  final Todo task;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const TaskItemCard({
    super.key,
    required this.task,
    required this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onEdit ?? onTap,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: task.isDone
                                ? Color(0xFF6CBF84)
                                : Color(0xFF8A7CF7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            task.isDone ? 'Done' : 'TODO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        task.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: task.isDone ? Colors.grey : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit_outlined, color: Color(0xFF38B4EE)),
                  tooltip: 'Edit Task',
                  onPressed: onEdit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
