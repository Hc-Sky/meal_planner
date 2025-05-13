import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/auth_service.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges;
});

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  return AuthController(ref.watch(authServiceProvider));
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthService _authService;

  AuthController(this._authService) : super(const AsyncValue.data(null));

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authService.signOut();
    });
  }
} 