import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../providers/auth_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLogin = true;
  bool _isPasswordVisible = false;

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
      _formKey.currentState?.reset();
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final email = _formKey.currentState!.fields['email']!.value as String;
      final password = _formKey.currentState!.fields['password']!.value as String;

      if (_isLogin) {
        await ref.read(authControllerProvider.notifier).signIn(email, password);
      } else {
        await ref.read(authControllerProvider.notifier).signUp(email, password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withOpacity(0.1),
              theme.colorScheme.background,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Meal Planner',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isLogin ? 'Connectez-vous à votre compte' : 'Créez votre compte',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FormBuilderTextField(
                              name: 'email',
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email_outlined),
                                border: const OutlineInputBorder(),
                                filled: true,
                                fillColor: theme.colorScheme.surface,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(errorText: 'L\'email est requis'),
                                FormBuilderValidators.email(errorText: 'Email invalide'),
                              ]),
                            ),
                            const SizedBox(height: 16),
                            FormBuilderTextField(
                              name: 'password',
                              decoration: InputDecoration(
                                labelText: 'Mot de passe',
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                ),
                                border: const OutlineInputBorder(),
                                filled: true,
                                fillColor: theme.colorScheme.surface,
                              ),
                              obscureText: !_isPasswordVisible,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (_) => _submitForm(),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(errorText: 'Le mot de passe est requis'),
                                FormBuilderValidators.minLength(6,
                                    errorText: 'Le mot de passe doit contenir au moins 6 caractères'),
                              ]),
                            ),
                            const SizedBox(height: 24),
                            if (authState.isLoading)
                              const Center(child: CircularProgressIndicator())
                            else
                              ElevatedButton(
                                onPressed: _submitForm,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  _isLogin ? 'Se connecter' : 'S\'inscrire',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: _toggleAuthMode,
                              child: Text(
                                _isLogin
                                    ? 'Pas encore de compte ? S\'inscrire'
                                    : 'Déjà un compte ? Se connecter',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (authState.hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: theme.colorScheme.error,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                authState.error.toString(),
                                style: TextStyle(color: theme.colorScheme.error),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 