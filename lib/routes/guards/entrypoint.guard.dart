import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/redux/store.dart';

// class EntrypointGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     // the navigation is paused until resolver.next() is called with either
//     // true to resume/continue navigation or false to abort navigation
//     if (!appStore.state.isLoading) {
//       // if user is authenticated we continue
//       resolver.next(true);
//     } else {
//       // we redirect the user to our login page
//       router.push(LoginRoute(onResult: (success) {
//         // if success == true the navigation will be resumed
//         // else it will be aborted
//         resolver.next(success);
//       }));
//     }
//   }
// }
