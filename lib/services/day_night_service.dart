class DayNightService {
  DayNightService();

  bool isDay(DateTime dateTime) {
    return dateTime.hour > 6 && dateTime.hour < 19;
  }
}
