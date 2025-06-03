String? dateFormatter({required int weekday, required int month, required int day}) {
  List<String> weekDay = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return "${weekDay[weekday - 1]}, ${months[month - 1]} $day";
}
