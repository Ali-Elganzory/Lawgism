extension Utils on DateTime
{

  bool isToday()
  {
    final DateTime today = DateTime.now();
    return (this.year == today.year && this.month == today.month && this.day == today.day);
  }

}