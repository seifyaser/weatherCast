import '../constants/app_constants.dart';

/// Utility class for generating time-based greetings
class GreetingHelper {
  // Private constructor to prevent instantiation
  GreetingHelper._();

  /// Returns a greeting message based on the current time of day
  static String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= AppConstants.morningStart && hour < AppConstants.morningEnd) {
      return 'Good Morning';
    } else if (hour >= AppConstants.morningEnd && hour < AppConstants.afternoonEnd) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
