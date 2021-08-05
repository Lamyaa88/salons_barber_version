import 'package:almezynbarber/utils/file_export.dart';
import 'package:almezynbarber/barbers_app/screens/account/account.dart';
import 'package:almezynbarber/barbers_app/screens/appointments/apponintment.dart';
import 'package:almezynbarber/barbers_app/screens/reviews/reviews.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class AppTabForBarber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            BarberAppointmentsScreen(),
            BarberReviewsScreen(),
            BarberAccountScreen(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
//            labelPadding: const EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 8.0 ,fontFamily: "Almarai"),
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15) , bottomRight: Radius.circular(15)),
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3.0,
                ),
              ),
            ),
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.calendar_today, size: 20), text: (translator.translate("Appointments"))),
              Tab(icon: Icon(Icons.thumbs_up_down, size: 20), text:translator.translate("Reviews") ),
              Tab(icon: Icon(Icons.person, size: 20), text: translator.translate("Account")),

            ],
          ),
        ),
      ),
    );
  }
}
