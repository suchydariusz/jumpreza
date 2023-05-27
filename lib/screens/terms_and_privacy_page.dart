import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class TermsAndPrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), child: CustomAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('''
Regulamin:

1. Postanowienia ogólne
   1.1. Niniejszy regulamin określa zasady korzystania z aplikacji "Nazwa Aplikacji".
   1.2. Aplikacja "Nazwa Aplikacji" jest oferowana przez "Twoja Firma".

... (dalszy tekst regulaminu) ...

Polityka prywatności:

Niniejsza Polityka prywatności wyjaśnia, jakie dane gromadzimy, jak je wykorzystujemy i jak je chronimy. Ta Polityka prywatności obowiązuje dla wszystkich użytkowników aplikacji "Nazwa Aplikacji".

1. Gromadzenie danych
   1.1. Gromadzimy dane, które dostarczasz nam bezpośrednio, np. podczas tworzenia konta, korzystania z naszych usług lub komunikowania się z nami.
   1.2. Możemy również gromadzić dane za pomocą technologii śledzenia, takich jak ciasteczka.

... (dalszy tekst polityki prywatności) ...
          '''),
        ),
      ),
    );
  }
}