import 'package:get/get.dart';
import 'package:oepadmin/presentation/screens/admin_dashboard_screen.dart';
import 'package:oepadmin/presentation/screens/create_exam_screen.dart';
import 'package:oepadmin/presentation/screens/create_question_screen.dart';
import 'package:oepadmin/presentation/screens/login_screen.dart';
import 'package:oepadmin/presentation/screens/reports_screen.dart';
import 'package:oepadmin/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN_SCREEN, page: () => LoginScreen()),
    GetPage(name: Routes.ADMIN_DASHBOARD, page: () => AdminDashboardScreen()),
    GetPage(name: Routes.CREATE_EXAM, page: () => CreateExamScreen()),
    GetPage(name: Routes.CREATE_QUESTION, page: () => CreateQuestionScreen()),
    GetPage(name: Routes.REPORTS_SCREEN, page: () => ReportsScreen()),
  ];
}
