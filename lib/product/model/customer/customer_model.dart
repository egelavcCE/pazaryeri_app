class CustomerModel {
  static int _nextId = 1;

  final int customerID;
  final String name;
  final String surName;
  final String birthDate;
  final String gender;
  final String email;
  final String educationStatus;
  final List<String> hobbies;

  CustomerModel({
    required this.name,
    required this.surName,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.educationStatus,
    required this.hobbies}) : customerID = _nextId++;
}