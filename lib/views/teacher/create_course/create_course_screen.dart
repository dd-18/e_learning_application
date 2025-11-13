import 'package:e_learning_application/core/theme/app_colors.dart';
import 'package:e_learning_application/views/teacher/create_course/widgets/create_course_app_bar.dart';
import 'package:e_learning_application/views/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCourseScreen extends StatefulWidget {
  const CreateCourseScreen({super.key});

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedLevel = 'Beginner';
  bool isPremium = false;
  final List<String> _requirements = [''];
  final List<String> _learningPoints = [''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CreateCourseAppBar(onSubmit: _submitForm),
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _buildImagePicker(),
                    const SizedBox(height: 32),
                    CustomTextfield(
                      label: 'Course Title',
                      hint: 'Enter Course Title',
                      maxLines: 1,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter course title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextfield(
                      label: 'Course Description',
                      hint: 'Enter Course Description',
                      maxLines: 3,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter course description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield(
                            label: 'Price',
                            hint: 'Enter price',
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: _buildDropdown()),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildPremiumSwitch(),
                    const SizedBox(height: 32),
                    _buildDynamicList(
                      'Course Requirements',
                      _requirements,
                      (index) => _requirements.removeAt(index),
                      () => _requirements.add(''),
                    ),
                    const SizedBox(height: 32),
                    _buildDynamicList(
                      'What You Will Learn',
                      _learningPoints,
                      (index) => _learningPoints.removeAt(index),
                      () => _learningPoints.add(''),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDynamicList(
    String title,
    List<String> items,
    void Function(int) onRemove,
    void Function() onAdd,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      label: '',
                      hint: 'Enter $title',
                      initialValue: items[index],
                      onChanged: (value) => items[index] = value,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (items.length > 1) {
                          onRemove(index);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        TextButton.icon(
          onPressed: () {
            setState(() {
              onAdd();
            });
          },
          icon: const Icon(Icons.add),
          label: Text('Add $title'),
          style: TextButton.styleFrom(foregroundColor: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildPremiumSwitch() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Premium Course'),
          Switch(
            value: isPremium,
            onChanged: (value) {
              setState(() {
                isPremium = value;
              });
            },
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Level',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedLevel,
              isExpanded: true,
              items: ['Beginner', 'Intermediate', 'Advanced']
                  .map(
                    (level) =>
                        DropdownMenuItem(value: level, child: Text(level)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedLevel = value;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.back();
    }
  }

  Widget _buildImagePicker() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_photo_alternate, size: 48),
        ),
      ),
    );
  }
}
