import 'lesson.dart';

class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String instructorId;
  final String categoryId;
  final double price;
  final List<Lesson> lessons;
  final double rating;
  final int reviewCount;
  final int enrollmentCount;
  final String level;
  final List<String> requirements;
  final List<String> whatYouWillLearn;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPremium;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.instructorId,
    required this.categoryId,
    required this.price,
    required this.lessons,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.enrollmentCount = 0,
    required this.level,
    required this.requirements,
    required this.whatYouWillLearn,
    required this.createdAt,
    required this.updatedAt,
    this.isPremium = false,
  });

  Course copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? instructorId,
    String? categoryId,
    double? price,
    List<Lesson>? lessons,
    double? rating,
    int? reviewCount,
    int? enrollmentCount,
    String? level,
    List<String>? requirements,
    List<String>? whatYouWillLearn,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPremium,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      instructorId: instructorId ?? this.instructorId,
      categoryId: categoryId ?? this.categoryId,
      price: price ?? this.price,
      lessons: lessons ?? this.lessons,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      enrollmentCount: enrollmentCount ?? this.enrollmentCount,
      level: level ?? this.level,
      requirements: requirements ?? this.requirements,
      whatYouWillLearn: whatYouWillLearn ?? this.whatYouWillLearn,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    instructorId: json['instructorId'],
    categoryId: json['categoryId'].toDouble(),
    price: json['price'],
    lessons: (json['lessons'] as List<dynamic>)
        .map((lesson) => Lesson.fromJson(lesson))
        .toList(),
    rating: json['rating']?.toDouble() ?? 0.0,
    reviewCount: json['reviewCount'] ?? 0,
    enrollmentCount: json['enrollmentCount'] ?? 0,
    level: json['level'],
    requirements: List<String>.from(json['requirements']),
    whatYouWillLearn: List<String>.from(json['whatYouWillLearn']),
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    isPremium: json['isPremium'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
    'instructorId': instructorId,
    'categoryId': categoryId,
    'price': price,
    'lessons': lessons.map((lesson) => lesson.toJson()).toList(),
    'rating': rating,
    'reviewCount': reviewCount,
    'enrollmentCount': enrollmentCount,
    'level': level,
    'requirements': requirements,
    'whatYouWillLearn': whatYouWillLearn,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'isPremium': isPremium,
  };
}
