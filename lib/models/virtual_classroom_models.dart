import 'package:flutter/material.dart';

class Subject {
  final String id;
  final String name;
  final String professor;
  final String day;
  final String time;
  final String classroomUrl;
  final String meetUrl;
  final bool isLive;
  final String code;
  final int credits;
  final String description;
  final String? nextPendingActivity;
  final Color? color;
  final String? imageUrl;

  Subject({
    required this.id,
    required this.name,
    required this.professor,
    required this.day,
    required this.time,
    required this.classroomUrl,
    required this.meetUrl,
    required this.isLive,
    required this.code,
    required this.credits,
    required this.description,
    this.nextPendingActivity,
    this.color,
    this.imageUrl,
  });
}

class Announcement {
  final String id;
  final String subjectId;
  final String title;
  final String content;
  final DateTime date;
  final String professorName;
  final List<String> attachments;
  final bool isPinned;
  final List<String> imageUrls;
  final List<String> videoUrls;
  final List<String> links;
  final bool allowComments;
  final List<PostComment> comments;

  Announcement({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.content,
    required this.date,
    required this.professorName,
    required this.attachments,
    this.isPinned = false,
    this.imageUrls = const [],
    this.videoUrls = const [],
    this.links = const [],
    this.allowComments = true,
    this.comments = const [],
  });
}

class Assignment {
  final String id;
  final String subjectId;
  final String title;
  final String description;
  final String? instructions;
  final DateTime dueDate;
  final String? dueTime;
  final DateTime? postedDate;
  final double maxScore;
  final double? obtainedScore;
  final String? feedback;
  String status; // 'pending', 'submitted', 'graded', 'late'
  final List<String> attachments;
  final bool allowModifications;
  AssignmentSubmission? submission;
  final DateTime? gradedDate;

  Assignment({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.description,
    this.instructions,
    required this.dueDate,
    this.dueTime,
    this.postedDate,
    required this.maxScore,
    this.obtainedScore,
    this.feedback,
    required this.status,
    required this.attachments,
    this.allowModifications = false,
    this.submission,
    this.gradedDate,
  });

  bool get isOverdue => DateTime.now().isAfter(dueDate);
}

class Grade {
  final String id;
  final String subjectId;
  final String assignmentId;
  final String assignmentName;
  final double score;
  final double maxScore;
  final String? feedback;
  final DateTime gradedDate;
  final String professorName;

  Grade({
    required this.id,
    required this.subjectId,
    required this.assignmentId,
    required this.assignmentName,
    required this.score,
    required this.maxScore,
    this.feedback,
    required this.gradedDate,
    required this.professorName,
  });

  double get percentage => (score / maxScore) * 100;
}

class ForumPost {
  final String id;
  final String subjectId;
  final String authorName;
  final String authorRole; // 'student' or 'professor'
  final String content;
  final DateTime date;
  final List<ForumReply> replies;
  int likes;
  final bool isPinned;

  ForumPost({
    required this.id,
    required this.subjectId,
    required this.authorName,
    required this.authorRole,
    required this.content,
    required this.date,
    required this.replies,
    this.likes = 0,
    this.isPinned = false,
  });
}

class ForumReply {
  final String id;
  final String postId;
  final String authorName;
  final String authorRole;
  final String content;
  final DateTime date;

  ForumReply({
    required this.id,
    required this.postId,
    required this.authorName,
    required this.authorRole,
    required this.content,
    required this.date,
  });
}

class CourseMaterial {
  final String id;
  final String subjectId;
  final String title;
  final String description;
  final String type; // 'pdf', 'video', 'link', 'document'
  final String url;
  final DateTime uploadedDate;
  final String professorName;
  final int size; // in KB
  final String? unit;
  final String? topic;

  CourseMaterial({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.description,
    required this.type,
    required this.url,
    required this.uploadedDate,
    required this.professorName,
    required this.size,
    this.unit,
    this.topic,
  });
}

class RecordedClass {
  final String id;
  final String subjectId;
  final String title;
  final String description;
  final DateTime recordedDate;
  final String url;
  final int duration; // in minutes
  final String professorName;

  RecordedClass({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.description,
    required this.recordedDate,
    required this.url,
    required this.duration,
    required this.professorName,
  });
}

class CalendarEvent {
  final String id;
  final String subjectId;
  final String title;
  final String description;
  final DateTime date;
  final String type; // 'assignment', 'exam', 'class', 'meeting'
  final String? location;

  CalendarEvent({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    this.location,
  });
}

class PostComment {
  final String id;
  final String postId;
  final String authorName;
  final String authorRole; // 'student' or 'professor'
  final String content;
  final DateTime date;
  final List<PostComment> replies;

  PostComment({
    required this.id,
    required this.postId,
    required this.authorName,
    required this.authorRole,
    required this.content,
    required this.date,
    this.replies = const [],
  });
}

class AssignmentSubmission {
  final String id;
  final String assignmentId;
  final List<String> files;
  final String? privateComment;
  final DateTime submittedAt;
  final DateTime? modifiedAt;

  AssignmentSubmission({
    required this.id,
    required this.assignmentId,
    required this.files,
    this.privateComment,
    required this.submittedAt,
    this.modifiedAt,
  });
}

class MaterialUnit {
  final String id;
  final String subjectId;
  final String name;
  final int order;
  final List<CourseMaterial> materials;

  MaterialUnit({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.order,
    required this.materials,
  });
}
