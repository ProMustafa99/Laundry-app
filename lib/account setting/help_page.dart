

import 'package:flutter/material.dart';

class help_page extends StatefulWidget {
  const help_page({Key? key}) : super(key: key);

  @override
  State<help_page> createState() => _help_pageState();
}

class _help_pageState extends State<help_page> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),

      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [

                  Text(
                    "تم إنشاء هذه الصفحة لمساعدتكم على تجربة التطبيق بكل سهولة ويسر. إذا كنت تواجه أي مشاكل أو تحتاج إلى أي مساعدة، فنحن مستعدون لتقديم المساعدة."
                        " يرجى التواصل معنا عبر الواتس اب على الرقم التالي",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,


                  ),

                  SizedBox(height: 20,),

                  Text("0780694846",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20,),

                  Text("و سيقوم فريق الدعم الفني بالرد على جميع استفساراتكم والعمل على حل المشاكل التي تواجهونها بأسرع وقت ممكن",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            )
          ],
        ),
      ),

    );

  }
}
