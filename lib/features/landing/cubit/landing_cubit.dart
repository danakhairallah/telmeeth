import 'landing_state.dart';

/// Minimal placeholder for future state handling on the landing page.
///
/// This is intentionally lightweight and does not depend on external
/// state-management packages yet. It can be replaced with a real Cubit
/// or Bloc in the future.
class LandingCubit {
  LandingCubit() : _state = const LandingState();

  LandingState _state;

  LandingState get state => _state;
}


