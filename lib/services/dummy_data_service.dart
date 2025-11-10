import 'package:e_learning_application/models/chat_message.dart';
import 'package:e_learning_application/models/course.dart';
import 'package:e_learning_application/models/lesson.dart';
import 'package:e_learning_application/models/question.dart';
import 'package:e_learning_application/models/quiz.dart';
import 'package:e_learning_application/models/quiz_attempt.dart';

class DummyDataService {
  static List<Course> course = [
    Course(
      id: '1',
      title: 'Flutter Development Bootcamp',
      description:
          'Master Flutter and Dart from scratch,Build real-world cross-platform apps.',
      imageUrl:
          'https://imgs.search.brave.com/Ldv7-QdZgTozJQPsN3BUDj2Njufp8uIIn_5hzbHIr8M/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9idWls/ZHdpdGhhbmdnYS5j/b20vc3RvcmFnZS9h/c3NldHMvaW1hZ2Vf/Y291cnNlX3NjcmVl/bnNob290cy9zWmtt/OTFHT0dER0E1Tkd0/N1VnRjRCRHJRQnV0/a1VEd0xqRVQ3Y0Yy/LndlYnA',
      instructorId: 'inst_1',
      categoryId: '1',
      price: 99.99,
      lessons: _createFlutterLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic programming knowledge',
        'Computer with internet connection',
        'Dedication to learn',
      ],
      whatYouWillLearn: [
        'Build beautiful native apps',
        'Master Dart programming',
        'State management with GetX',
        'REST API integration',
        'Local data storage',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 30)),
      updatedAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 245,
      enrollmentCount: 1200,
    ),
    Course(
      id: '2',
      title: 'UI/UX Design Masterclass',
      description:
          'Learn professional UI/UX design from scratch using Figma and Adobe XD.',
      imageUrl:
          'https://imgs.search.brave.com/m001EGos6bLOhErEUGdmg8s0-l4gBv_7kljFZsiJnkg/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4u/cHJvZC53ZWJzaXRl/LWZpbGVzLmNvbS82/NWMxYWUyMWZiMjE5/MTQ2NmRkNmNlNzIv/NjYxOGQyMzcwMDAz/ZGUzZTg3ZjE2NDll/X1VJJTIwRGVzaWdu/JTIwTWFzdGVyY2xh/c3MuanBn',
      instructorId: 'inst_2',
      categoryId: '2',
      price: 79.99,
      lessons: _createDesignLessons(),
      level: 'Beginner',
      requirements: [
        'No prior experience required',
        'Figma (free account)',
        'Creative mindset',
      ],
      whatYouWillLearn: [
        'Design principles and theory',
        'User research methods',
        'Wire-framing and prototyping',
        'Design system development',
        'Portfolio building',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 45)),
      updatedAt: DateTime.now(),
      rating: 4.6,
      reviewCount: 189,
      enrollmentCount: 890,
      isPremium: true,
    ),
    Course(
      id: '3',
      title: 'Digital Marketing Essentials',
      description:
          'Master digital marketing techniques and strategies to boost your online presence.',
      imageUrl:
          'https://imgs.search.brave.com/tpM4Ph85JmPpA-lubt57UNKOHE8C3Au1nXfs4Ssl0Xs/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NDFmQTdGbUJNM0wu/anBn',
      instructorId: 'inst_3',
      categoryId: '3',
      price: 89.99,
      lessons: _createMarketingLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic marketing knowledge',
        'Social Media familiarity',
        'Google Analytics account',
      ],
      whatYouWillLearn: [
        'Search Engine Optimization (SEO)',
        'Social Media Management',
        'Content Creation',
        'Digital Marketing Strategies',
        'Google Analytics',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 15)),
      updatedAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 156,
      enrollmentCount: 750,
    ),
    Course(
      id: '4',
      title: 'Advanced Mobile App Architecture',
      description:
          'Learn advanced mobile app architecture principles and best practices.',
      imageUrl:
          'https://imgs.search.brave.com/gbMWCKuBl9T_o7o8UWNwqu4J0rMc4s38OPLhJOSqqHI/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9kaWdp/bW9ua3NvbHV0aW9u/cy5jb20vd3AtY29u/dGVudC91cGxvYWRz/LzIwMjQvMDIvTW9i/aWxlLUFwcC1BcmNo/aXRlY3R1cmUtRGV0/YWlsZWQtR3VpZGUt/MS0xMDI0eDU3Ni53/ZWJw',
      instructorId: 'inst_4',
      categoryId: '1',
      price: 129.99,
      lessons: _createArchitectureLessons(),
      level: 'Advanced',
      requirements: [
        'Intermediate programming knowledge',
        'Basic mobile development experience',
        'Understanding of design patterns',
      ],
      whatYouWillLearn: [
        'Clean Architecture principles',
        'SOLID principles in mobile development',
        'State management patterns',
        'Dependency injection',
        'Performance optimization',
        'Unit testing and TDO',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 10)),
      updatedAt: DateTime.now(),
      rating: 4.9,
      reviewCount: 178,
      enrollmentCount: 560,
    ),
    Course(
      id: '5',
      title: 'Motion Design with After Effects',
      description:
          'Create stunning motion graphics and visual effects using After Effects.',
      imageUrl:
          'https://imgs.search.brave.com/yhyejyZYNW4kOR6E8jahyTNj5G3RjIlT8MEDyl15iX0/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4u/ZWR1Y2JhLmNvbS9h/Y2FkZW15L3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDIwLzAzL01v/dGlvbi1HcmFwaGlj/cy1pbi1BZnRlci1F/ZmZlY3RzLmpwZw',
      instructorId: 'inst_5',
      categoryId: '2',
      price: 89.99,
      lessons: _createMotionDesignLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic Adobe After Effects knowledge',
        'Creative mindset',
        'Understanding of design principles',
      ],
      whatYouWillLearn: [
        'Advanced animation techniques',
        'Character animation',
        'Visual effects creation',
        'Motion graphics principles',
        'Project workflow optimization',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 20)),
      updatedAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 145,
      enrollmentCount: 420,
      isPremium: true,
    ),
    Course(
      id: '6',
      title: 'Financial Management Fundamentals',
      description:
          'Master the basic of financial management and business economics.',
      imageUrl:
          'https://imgs.search.brave.com/RpMtbpo6hS5KysxE31ICByorHTD9mXyzGrvyTZE0XUE/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NDFnUGlDOCtKaUwu/anBn',
      instructorId: 'inst_6',
      categoryId: '3',
      price: 74.99,
      lessons: _createFinanceLessons(),
      level: 'Beginner',
      requirements: [
        'Basic math knowledge',
        'Interest in finance',
        'No prior experience required',
      ],
      whatYouWillLearn: [
        'Financial statement analysis',
        'Investment basics',
        'Risk Management',
        'Budgeting Techniques',
        'Business valuation',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 25)),
      updatedAt: DateTime.now(),
      rating: 4.6,
      reviewCount: 98,
      enrollmentCount: 340,
    ),
    Course(
      id: '7',
      title: 'Professional Photography Masterclass',
      description:
          'Learn professional photography techniques from composition to post-processing.',
      imageUrl:
          'https://imgs.search.brave.com/bM-N8fl4guwU3n6s4w1u_cHcKXeVA-ARga4TTdncE2s/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly93d3cu/cGhvdG9ncmFwaHlt/YXN0ZXJjbGFzcy5j/b20vaW1hZ2VzL3Bo/b3RvZ3JhcGh5bWFz/dGVyY2xhc3MtcHJv/ZHVjdC5qcGc',
      instructorId: 'inst_7',
      categoryId: '5',
      price: 84.99,
      lessons: _createPhotographyLessons(),
      level: 'Beginner',
      requirements: [
        'Digital camera (DSLR or Mirrorless)',
        'Basic photography knowledge',
        'Basic computer skills',
        'Adobe Lightroom(optional)',
      ],
      whatYouWillLearn: [
        'Camera basics and settings',
        'Composition techniques',
        'Lighting fundamentals',
        'Post-processing skills',
        'Building a portfolio',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 25)),
      updatedAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 132,
      enrollmentCount: 450,
      isPremium: true,
    ),
    Course(
      id: '8',
      title: 'English Business Communication',
      description: 'Master business English for professional success.',
      imageUrl:
          'https://imgs.search.brave.com/N3zafaDcoGMG7-Yn7orbNwmPreb2SCqUCaQI3qYM9KE/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9jZG4w/MS5hbGlzb24tc3Rh/dGljLm5ldC9jb3Vy/c2VzLzYwODEvYWxp/c29uX2NvdXJzZXdh/cmVfaW50cm9fNjA4/MS5qcGc',
      instructorId: 'inst_8',
      categoryId: '6',
      price: 69.99,
      lessons: _createLanguageLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic English knowledge',
        'Dedication to practice',
        'Internet connection',
      ],
      whatYouWillLearn: [
        'Business vocabulary',
        'Email writing',
        'Presentation skills',
        'Negotiation techniques',
        'Professional communication',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 18)),
      updatedAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 167,
      enrollmentCount: 580,
    ),
  ];
  static final List<Quiz> quizzes = [
    Quiz(
      id: '1',
      title: 'Flutter Basics Quiz',
      description: 'Test your knowledge of Flutter fundamentals.',
      timeLimit: 30,
      questions: _createFlutterQuizQuestions(),
      createdAt: DateTime.now().subtract(Duration(days: 5)),
      isActive: true,
    ),
    Quiz(
      id: '2',
      title: 'Dart Programming Quiz',
      description: 'Check your knowledge of Dart programming concepts.',
      timeLimit: 25,
      questions: _createDartQuizQuestions(),
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      isActive: true,
    ),
    Quiz(
      id: '3',
      title: 'State Management Quiz',
      description: 'Test your knowledge of Flutter state management.',
      timeLimit: 20,
      questions: _createFlutterQuizQuestions(),
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      isActive: true,
    ),
  ];

  static final List<QuizAttempt> quizAttempts = [];

  static List<Lesson> _createFlutterLessons() {
    return [
      Lesson(
        id: '1',
        title: 'Introduction to Flutter',
        description:
            'This is a detailed description for Introduction to flutter',
        videoUrl: 'https://www.youtube.com/watch?v=1ukSR1GRtMU',
        duration: 30,
        resources: _createDummyResources(),
        isPreview: true,
        isLocked: false,
      ),
      _createLesson('2', 'Dart Programming Basics', false, false),
      _createLesson('3', 'Building UI with Widgets', false, false),
      _createLesson('4', 'State Management', false, false),
      _createLesson('5', 'Working with APIs', false, false),
      _createLesson('6', 'Local Data Storage', false, false),
    ];
  }

  static List<Lesson> _createDesignLessons() {
    return [
      _createLesson('1', 'Design Fundamentals', true, false),
      _createLesson('2', 'Color Theory', false, false),
      _createLesson('3', 'Typography Basics', false, false),
      _createLesson('4', 'Layout Design', false, false),
      _createLesson('5', 'Prototyping', false, false),
    ];
  }

  static List<Lesson> _createMarketingLessons() {
    return [
      _createLesson('1', 'Digital Marketing Overview', true, true),
      _createLesson('2', 'SEO Fundamentals', false, false),
      _createLesson('3', 'Social Media Strategy', false, false),
      _createLesson('4', 'Email Marketing', false, false),
      _createLesson('5', 'Analytics and Reporting', false, false),
    ];
  }

  static List<Lesson> _createArchitectureLessons() {
    return [
      _createLesson('1', 'Clean Architecture Overview', true, true),
      _createLesson('2', 'SOLID Principles', false, false),
      _createLesson('3', 'Repository Pattern', false, false),
      _createLesson('4', 'Dependency Injection', false, false),
      _createLesson('5', 'Unit Testing', false, false),
    ];
  }

  static List<Lesson> _createMotionDesignLessons() {
    return [
      _createLesson('1', 'Animation Basics', true, false),
      _createLesson('2', 'Keyframe Animation', false, false),
      _createLesson('3', 'Character Rigging', false, false),
      _createLesson('4', 'Visual Effects', false, false),
      _createLesson('5', 'Project Workflow', false, false),
    ];
  }

  static List<Lesson> _createFinanceLessons() {
    return [
      _createLesson('1', 'Introduction to Finance', true, false),
      _createLesson('2', 'Financial Statements', false, false),
      _createLesson('3', 'Investment Basics', false, false),
      _createLesson('4', 'Risk Management', false, false),
      _createLesson('5', 'Budgeting Valuation', false, false),
    ];
  }

  static List<Lesson> _createPhotographyLessons() {
    return [
      _createLesson('1', 'Understanding Your Camera', true, false),
      _createLesson('2', 'Composition Basics', false, false),
      _createLesson('3', 'Lighting Techniques', false, false),
      _createLesson('4', 'Portrait Photography', false, false),
      _createLesson('5', 'Post-Processing', false, false),
    ];
  }

  static List<Lesson> _createLanguageLessons() {
    return [
      _createLesson('1', 'Business Vocabulary', true, false),
      _createLesson('2', 'Email Writing', false, false),
      _createLesson('3', 'Presentation Skills', false, false),
      _createLesson('4', 'Negotiation Language', false, false),
      _createLesson('5', 'Professional Communication', false, false),
    ];
  }

  static Lesson _createLesson(
    String id,
    String title,
    bool isPreview,
    bool isCompleted,
  ) {
    return Lesson(
      id: 'lesson_$id',
      title: title,
      description: 'This is a detailed description for $title',
      videoUrl: '',
      duration: 30,
      resources: _createDummyResources(),
      isPreview: isPreview,
      isLocked: !isPreview,
      isCompleted: isCompleted,
    );
  }

  static List<Resource> _createDummyResources() {
    return [
      Resource(id: 'res_1', title: 'Lesson Slides', type: 'pdf', url: ''),
      Resource(id: 'res_2', title: 'Exercise Files', type: 'zip', url: ''),
    ];
  }

  static Course getCourseById(String id) {
    return course.firstWhere(
      (course) => course.id == id,
      orElse: () => course.first,
    );
  }

  static List<Course> getCoursesByCategory(String categoryId) {
    return course.where((course) => course.categoryId == categoryId).toList();
  }

  static List<Course> getInstructorCourses(String instructorId) {
    return course
        .where((course) => course.instructorId == instructorId)
        .toList();
  }

  static bool isCourseCompleted(String courseId) {
    final course = getCourseById(courseId);
    return course.lessons.every((lesson) => lesson.isCompleted);
  }

  static List<Question> _createFlutterQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'What is Flutter?',
        options: [
          Option(id: 'a', text: 'A UI framework for building native apps'),
          Option(id: 'b', text: 'A Programming language'),
          Option(id: 'c', text: 'A Database management system'),
          Option(id: 'd', text: 'A Design tool'),
        ],
        correctOptionId: 'a',
        points: 1,
      ),
      Question(
        id: '2',
        text: 'Which Programming language is used in Flutter?',
        options: [
          Option(id: 'a', text: 'Java'),
          Option(id: 'b', text: 'Kotlin'),
          Option(id: 'c', text: 'Dart'),
          Option(id: 'd', text: 'Swift'),
        ],
        correctOptionId: 'c',
        points: 1,
      ),
    ];
  }

  static List<Question> _createDartQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'What is Dart?',
        options: [
          Option(id: 'a', text: 'A markup language'),
          Option(id: 'b', text: 'An object-oriented programming language'),
          Option(id: 'c', text: 'A database'),
          Option(id: 'd', text: 'A web browser'),
        ],
        correctOptionId: 'b',
        points: 1,
      ),
    ];
  }

  static List<Question> _createStateManagementQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'What is state management in Flutter?',
        options: [
          Option(id: 'a', text: 'Managing app data and UI updates'),
          Option(id: 'b', text: 'Managing device storage'),
          Option(id: 'c', text: 'Managing user authentication'),
          Option(id: 'd', text: 'Managing network requests'),
        ],
        correctOptionId: 'a',
        points: 1,
      ),
    ];
  }

  static Quiz getQuizById(String id) {
    return quizzes.firstWhere(
      (quiz) => quiz.id == id,
      orElse: () => quizzes.first,
    );
  }

  static void saveQuizAttempt(QuizAttempt quizAttempt) {
    quizAttempts.add(quizAttempt);
  }

  static List<QuizAttempt> getQuizAttempts(String userId) {
    return quizAttempts.where((attempt) => attempt.userId == userId).toList();
  }

  static final Set<String> _purchaseCourseIds = {};

  static bool isCourseUnlocked(String courseId) {
    final course = getCourseById(courseId);
    return !course.isPremium || _purchaseCourseIds.contains(courseId);
  }

  static void addPurchasedCourse(String courseId) {
    _purchaseCourseIds.add(courseId);
  }

  static final Map<String, TeacherStats> teacherStats = {
    'inst_1': TeacherStats(
      totalStudents: 1234,
      activeCourses: 8,
      totalRevenue: 12345.67,
      averageRating: 4.8,
      monthlyEnrollments: [156, 189, 234, 278, 312, 289],
      monthlyRevenue: [1234, 1567, 1890, 2100, 2345, 2189],
      studentEngagement: StudentEngagement(
        averageCompletionRate: 0.78,
        averageTimePerLesson: 45,
        activeStudentsThisWeek: 156,
        courseCompletionRates: {
          'Flutter Development Bootcamp': 0.85,
          'Advanced Flutter': 0.72,
          'Flutter State Management': 0.68,
        },
      ),
    ),
  };

  static final Map<String, List<StudentProgress>> studentProgress = {
    'inst_1': [
      StudentProgress(
        studentId: 'student_1',
        studentName: 'John Doe',
        courseId: '1',
        courseTitle: 'Flutter Development Bootcamp',
        progress: 0.75,
        lastActive: DateTime.now().subtract(Duration(days: 2)),
        quizScores: [85, 92, 78, 88],
        completedLessons: 12,
        totalLessons: 16,
        averageTimePerLesson: 45,
      ),
      StudentProgress(
        studentId: 'student_2',
        studentName: 'Emma Wilson',
        courseId: '1',
        courseTitle: 'Flutter Development Bootcamp',
        progress: 0.60,
        lastActive: DateTime.now().subtract(Duration(days: 1)),
        quizScores: [95, 88, 82],
        completedLessons: 9,
        totalLessons: 16,
        averageTimePerLesson: 38,
      ),
    ],
  };

  static TeacherStats getTeacherStats(String instructorId) {
    final instructorCourses = getInstructorCourses(instructorId);
    final stats = teacherStats[instructorId] ?? TeacherStats.empty();

    return TeacherStats(
      totalStudents: instructorCourses.fold(
        0,
        (sum, course) => sum + course.enrollmentCount,
      ),
      activeCourses: instructorCourses.length,
      totalRevenue: instructorCourses.fold(
        0.0,
        (sum, course) => sum + (course.price * course.enrollmentCount),
      ),
      averageRating: instructorCourses.isEmpty
          ? 0.0
          : instructorCourses.fold(0.0, (sum, course) => sum + course.rating) /
                instructorCourses.length,
      monthlyEnrollments: stats.monthlyEnrollments,
      monthlyRevenue: stats.monthlyRevenue,
      studentEngagement: stats.studentEngagement,
    );
  }

  static List<StudentProgress> getStudentProgress(String instructorId) {
    final instructorCourses = getInstructorCourses(instructorId);
    final courseIds = instructorCourses.map((c) => c.id).toSet();
    return studentProgress[instructorId]!
        .where((progress) => courseIds.contains(progress.courseId))
        .toList();
  }

  static Stream<List<ChatMessage>> getChatMessages(String courseId) {
    return Stream.value(
      _dummyChats.values
          .expand((message) => message)
          .where((message) => message.courseId == courseId)
          .toList(),
    );
  }

  static Stream<List<ChatMessage>> getTeacherChats(String instructorId) {
    return Stream.value(_dummyChats[instructorId] ?? []);
  }

  static Map<String, List<ChatMessage>> getTeacherChatsByCourse(
    String instructorId,
  ) {
    final Map<String, List<ChatMessage>> chatsByCourse = {};
    final messages = _dummyChats[instructorId] ?? [];

    for (var message in messages) {
      if (!chatsByCourse.containsKey(message.courseId)) {
        chatsByCourse[message.courseId] = [];
      }
      chatsByCourse[message.courseId]!.add(message);
    }
    return chatsByCourse;
  }

  static final Map<String, List<ChatMessage>> _dummyChats = {
    'inst_1': [
      ChatMessage(
        id: '1',
        senderId: 'student_1',
        receiverId: 'inst_1',
        courseId: '1', // Flutter Development Bootcamp
        message: 'Hi, I have a question about state management',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatMessage(
        id: '2',
        senderId: 'student_2',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'When is the next live session?',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      ChatMessage(
        id: '3',
        senderId: 'student_3',
        receiverId: 'inst_1',
        courseId: '2', // UI/UX Design Masterclass
        message: 'Could you review my latest design project?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
    ],
  };

  static void updateLessonStatus(
    String courseId,
    String lessonId, {
    bool? isCompleted,
    bool? isLocked,
  }) {
    final courseIndex = course.indexWhere((c) => c.id == courseId);
    if (courseIndex != -1) {
      final courseToUpdate = course[courseIndex];
      final lessonIndex = courseToUpdate.lessons.indexWhere(
        (l) => l.id == lessonId,
      );

      if (lessonIndex != -1) {
        final updatedLesson = courseToUpdate.lessons[lessonIndex].copyWith(
          isCompleted:
              isCompleted ?? courseToUpdate.lessons[lessonIndex].isCompleted,
          isLocked: isLocked ?? courseToUpdate.lessons[lessonIndex].isLocked,
        );

        final newLessons = List<Lesson>.from(courseToUpdate.lessons);
        newLessons[lessonIndex] = updatedLesson;

        course[courseIndex] = courseToUpdate.copyWith(lessons: newLessons);
      }
    }
  }

  static bool isLessonCompleted(String courseId, String lessonId) {
    final course = getCourseById(courseId);
    return course.lessons
        .firstWhere(
          (l) => l.id == lessonId,
          orElse: () => Lesson(
            id: '',
            title: '',
            description: '',
            videoUrl: '',
            duration: 0,
            resources: [],
          ),
        )
        .isCompleted;
  }
}

// New classes to support teacher-specific data
class TeacherStats {
  final int totalStudents;
  final int activeCourses;
  final double totalRevenue;
  final double averageRating;
  final List<int> monthlyEnrollments;
  final List<double> monthlyRevenue;
  final StudentEngagement studentEngagement;
  TeacherStats({
    required this.totalStudents,
    required this.activeCourses,
    required this.totalRevenue,
    required this.averageRating,
    required this.monthlyEnrollments,
    required this.monthlyRevenue,
    required this.studentEngagement,
  });

  factory TeacherStats.empty() => TeacherStats(
    totalStudents: 0,
    activeCourses: 0,
    totalRevenue: 0,
    averageRating: 0,
    monthlyEnrollments: [],
    monthlyRevenue: [],
    studentEngagement: StudentEngagement.empty(),
  );
}

class StudentEngagement {
  final double averageCompletionRate;
  final int averageTimePerLesson;
  final int activeStudentsThisWeek;
  final Map<String, double> courseCompletionRates;
  StudentEngagement({
    required this.averageCompletionRate,
    required this.averageTimePerLesson,
    required this.activeStudentsThisWeek,
    required this.courseCompletionRates,
  });
  factory StudentEngagement.empty() => StudentEngagement(
    averageCompletionRate: 0,
    averageTimePerLesson: 0,
    activeStudentsThisWeek: 0,
    courseCompletionRates: {},
  );
}

class StudentProgress {
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseTitle;
  final double progress;
  final DateTime lastActive;
  final List<int> quizScores;
  final int completedLessons;
  final int totalLessons;
  final int averageTimePerLesson;
  double get averageScore {
    if (quizScores.isEmpty) return 0.0;
    return quizScores.reduce((a, b) => a + b) / quizScores.length / 100;
  }

  StudentProgress({
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseTitle,
    required this.progress,
    required this.lastActive,
    required this.quizScores,
    required this.completedLessons,
    required this.totalLessons,
    required this.averageTimePerLesson,
  });
}
