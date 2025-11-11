import 'package:flutter/material.dart';

class PaymentFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final TextStyle errorStyle;

  const PaymentFields({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvvController,
    required this.errorStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildCardNumberField(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildExpiryField()),
              const SizedBox(width: 16),
              Expanded(child: _buildCVVField()),
            ],
          ),
          const SizedBox(height: 16),
          _buildNameField(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildExpiryField() {
    return TextFormField(
      controller: expiryDateController,
      keyboardType: TextInputType.datetime,
      decoration: _buildInputDecoration(
        label: 'Expiry Date',
        hint: 'MM/YY',
        icon: Icons.calendar_today,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an expiry date';
        }
        if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
          return 'Use the format MM/YY';
        }
        return null;
      },
      maxLength: 5,
      buildCounter:
          (
            context, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
          }) => null,
      onChanged: (value) {
        if (value.length == 2 && !value.contains('/')) {
          expiryDateController.text = '$value/';
          expiryDateController.selection = TextSelection.fromPosition(
            TextPosition(offset: expiryDateController.text.length),
          );
        }
      },
    );
  }

  Widget _buildCardNumberField() {
    return TextFormField(
      controller: cardNumberController,
      keyboardType: TextInputType.number,
      decoration: _buildInputDecoration(
        label: 'Card Number',
        hint: '1234 5678 9012 3456',
        icon: Icons.credit_card,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a card number';
        }
        if (value.length < 16) {
          return 'Invalid card number';
        }
        return null;
      },
      maxLength: 16,
      buildCounter:
          (
            context, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
          }) {
            return null;
          },
    );
  }

  InputDecoration _buildInputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      errorStyle: errorStyle,
    );
  }

  Widget _buildCVVField() {
    return TextFormField(
      controller: cvvController,
      keyboardType: TextInputType.number,
      obscureText: true,
      decoration: _buildInputDecoration(
        label: 'CVV',
        hint: '123',
        icon: Icons.security,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a CVV';
        }
        if (value.length < 3) {
          return 'Invalid CVV';
        }
        return null;
      },
      maxLength: 3,
      buildCounter:
          (
            context, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
          }) => null,
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: nameController,
      textCapitalization: TextCapitalization.words,
      decoration: _buildInputDecoration(
        label: 'Cardholder Name',
        hint: 'John Doe',
        icon: Icons.person,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter cardholder name';
        }
        if (value.split('').length < 2) {
          return 'Please enter full name';
        }
        return null;
      },
    );
  }
}
