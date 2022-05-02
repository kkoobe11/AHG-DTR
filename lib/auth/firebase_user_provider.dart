import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AHGInternsAttendanceFirebaseUser {
  AHGInternsAttendanceFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AHGInternsAttendanceFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AHGInternsAttendanceFirebaseUser>
    aHGInternsAttendanceFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AHGInternsAttendanceFirebaseUser>(
            (user) => currentUser = AHGInternsAttendanceFirebaseUser(user));
