// ignore_for_file: file_names

class Task {

  final String description;
  final String frequency;
  final List<String> daysOfWeek;
  bool isChecked;

  Task(
    this.description,
    this.frequency,
    this.daysOfWeek,
    this.isChecked
  );
}