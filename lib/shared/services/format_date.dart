
formatDate(String date) {
  var parsedDate = DateTime.parse(date);
  var newDate = "${parsedDate.day}/${parsedDate.month}";
  return newDate;
}