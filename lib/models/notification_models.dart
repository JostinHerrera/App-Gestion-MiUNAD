import 'package:flutter/material.dart';

enum NotificationType {
  announcement,
  assignment,
  grade,
  forumReply,
  classReminder,
}

class VirtualClassroomNotification {
  final String id;
  final String subjectId;
  final String subjectName;
  final NotificationType type;
  final String title;
  final String message;
  final DateTime date;
  bool isRead;
  final String? actionUrl;

  VirtualClassroomNotification({
    required this.id,
    required this.subjectId,
    required this.subjectName,
    required this.type,
    required this.title,
    required this.message,
    required this.date,
    this.isRead = false,
    this.actionUrl,
  });

  IconData get icon {
    switch (type) {
      case NotificationType.announcement:
        return Icons.announcement;
      case NotificationType.assignment:
        return Icons.assignment;
      case NotificationType.grade:
        return Icons.grade;
      case NotificationType.forumReply:
        return Icons.comment;
      case NotificationType.classReminder:
        return Icons.event;
    }
  }

  Color get color {
    switch (type) {
      case NotificationType.announcement:
        return const Color(0xFF0E5A38);
      case NotificationType.assignment:
        return const Color(0xFFF57C00);
      case NotificationType.grade:
        return const Color(0xFF2458A6);
      case NotificationType.forumReply:
        return const Color(0xFF62716A);
      case NotificationType.classReminder:
        return const Color(0xFFC03A2B);
    }
  }
}
