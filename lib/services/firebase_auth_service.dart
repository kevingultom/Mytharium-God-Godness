import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Manages Firebase Authentication.
///
/// Strategy:
/// - On first launch the user is silently signed in as **anonymous** so
///   every piece of data (favorites, reading progress …) is already backed
///   up to Firestore without friction.
/// - The user can later upgrade to a **Google account**. When they do,
///   the anonymous UID's data is merged into the Google UID so nothing
///   is lost.
class FirebaseAuthService {
  FirebaseAuthService._();
  static final instance = FirebaseAuthService._();

  final _auth = FirebaseAuth.instance;
  final _google = GoogleSignIn();

  // ── Current user ──────────────────────────────────────────────
  User? get currentUser => _auth.currentUser;
  String? get uid => _auth.currentUser?.uid;
  bool get isSignedIn => _auth.currentUser != null;
  bool get isAnonymous => _auth.currentUser?.isAnonymous ?? true;

  /// Stream that emits whenever the auth state changes.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // ── Anonymous sign-in ─────────────────────────────────────────
  /// Signs in anonymously if no user is currently signed in.
  /// Returns the [UserCredential].
  Future<UserCredential?> ensureAnonymous() async {
    // Already signed in — reuse existing session.
    if (_auth.currentUser != null) return null;
    return _auth.signInAnonymously();
  }

  // ── Google sign-in ────────────────────────────────────────────
  /// Triggers the Google Sign-In flow and links the credential to the
  /// current anonymous account so the UID (and its Firestore data) is
  /// preserved.
  ///
  /// Returns the [User] on success, or `null` if the user cancelled.
  Future<User?> signInWithGoogle() async {
    // 1. Trigger the Google Sign-In flow.
    final googleUser = await _google.signIn();
    if (googleUser == null) return null;

    // 2. Obtain the auth credential.
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 3. Link or sign in.
    final currentUser = _auth.currentUser;
    if (currentUser != null && currentUser.isAnonymous) {
      // Upgrade the anonymous account → data stays on same UID.
      try {
        await currentUser.linkWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          // Already linked — just sign in normally.
          return (await _auth.signInWithCredential(credential)).user;
        }
        rethrow;
      }
      return _auth.currentUser;
    }

    // Fresh sign-in (no anonymous session).
    final result = await _auth.signInWithCredential(credential);
    return result.user;
  }

  // ── Sign out ──────────────────────────────────────────────────
  /// Signs out the Google provider but keeps the anonymous session
  /// so the user doesn't lose local-only data.
  Future<void> signOutGoogle() async {
    await _google.signOut();
    // Re-sign in anonymously so uid stays valid for Firestore writes.
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
  }

  // ── Delete account ────────────────────────────────────────────
  Future<void> deleteAccount() async {
    await _auth.currentUser?.delete();
  }
}
