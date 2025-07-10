import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexis/core/constatnts/colors.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  bool isLoading = false;

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  // Firebase REGISTRATION function (not login)
  Future<bool> signIn(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Debug: Print input values
    debugPrint('=== REGISTRATION ATTEMPT ===');
    debugPrint('Email: $email');
    debugPrint('Password length: ${password.length}');

    // Basic validation
    if (email.isEmpty) {
      debugPrint('ERROR: Email is empty');
      _showErrorSnackBar(context, 'Please enter your email address');
      return false;
    }

    if (password.isEmpty) {
      debugPrint('ERROR: Password is empty');
      _showErrorSnackBar(context, 'Please enter your password');
      return false;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      debugPrint('ERROR: Invalid email format');
      _showErrorSnackBar(context, 'Please enter a valid email address');
      return false;
    }

    if (password.length < 6) {
      debugPrint('ERROR: Password too short');
      _showErrorSnackBar(context, 'Password must be at least 6 characters long');
      return false;
    }

    // Set loading state
    isLoading = true;
    notifyListeners();

    try {
      debugPrint('Attempting Firebase registration...');
      
      // REGISTER (CREATE) new user with Firebase
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint('Registration response received');
      debugPrint('New User: ${userCredential.user}');
      debugPrint('New User UID: ${userCredential.user?.uid}');
      debugPrint('New User Email: ${userCredential.user?.email}');

      // Check if registration was successful
      if (userCredential.user != null) {
        debugPrint('✅ REGISTRATION SUCCESS');
        _showSuccessSnackBar(context, 'Account created successfully!');
        
        // Clear controllers after successful registration
        emailController.clear();
        passwordController.clear();
        
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        debugPrint('❌ REGISTRATION FAILED: User credential is null');
        _showErrorSnackBar(context, 'Registration failed: No user returned');
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ FIREBASE AUTH EXCEPTION:');
      debugPrint('Code: ${e.code}');
      debugPrint('Message: ${e.message}');
      
      String errorMessage = _getRegistrationErrorMessage(e.code);
      _showErrorSnackBar(context, errorMessage);
    } catch (e) {
      debugPrint('❌ GENERAL EXCEPTION: $e');
      _showErrorSnackBar(context, 'An unexpected error occurred: $e');
    }

    // Reset loading state
    isLoading = false;
    notifyListeners();
    return false;
  }

  // Get user-friendly error messages for REGISTRATION
  String _getRegistrationErrorMessage(String errorCode) {
    debugPrint('Getting registration error message for code: $errorCode');
    
    switch (errorCode) {
      case 'email-already-in-use':
        return 'An account with this email already exists. Please use a different email or try logging in.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'The email address format is invalid. Please enter a valid email.';
      case 'operation-not-allowed':
        return 'Email/password registration is not enabled. Please contact support.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection and try again.';
      case 'too-many-requests':
        return 'Too many requests. Please wait a moment and try again.';
      default:
        return 'Registration failed with error: $errorCode. Please try again.';
    }
  }

  // Show success message
  void _showSuccessSnackBar(BuildContext context, String message) {
    debugPrint('Showing success message: $message');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorTheme.maincolor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Show error message
  void _showErrorSnackBar(BuildContext context, String message) {
    debugPrint('Showing error message: $message');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Optional: Add actual login function if needed later
  Future<bool> loginUser(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorSnackBar(context, 'Please enter both email and password');
      return false;
    }

    isLoading = true;
    notifyListeners();

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        _showSuccessSnackBar(context, 'Login successful!');
        emailController.clear();
        passwordController.clear();
        isLoading = false;
        notifyListeners();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = _getLoginErrorMessage(e.code);
      _showErrorSnackBar(context, errorMessage);
    } catch (e) {
      _showErrorSnackBar(context, 'Login failed: $e');
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  // Login error messages
  String _getLoginErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No account found with this email. Please register first.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-credential':
        return 'Invalid email or password. Please check your credentials.';
      default:
        return 'Login failed. Please try again.';
    }
  }

  // Sign out function
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      emailController.clear();
      passwordController.clear();
      debugPrint('User signed out successfully');
    } catch (e) {
      debugPrint('Sign out error: $e');
    }
  }

  // Check if user is currently signed in
  User? get currentUser => _auth.currentUser;

  // Check authentication state
  bool get isUserSignedIn => _auth.currentUser != null;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}