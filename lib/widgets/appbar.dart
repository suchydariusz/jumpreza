import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/constants.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(JUMPREZA),
      actions: <Widget>[
        TextButton(
          style: style,
          onPressed: () => context.go('/'),
          child: const Text('Strona główna'),
        ),
        TextButton(
          style: style,
          onPressed: () {},
          child: const Text('Mój profil'),
        ),
        TextButton(
          style: style,
          onPressed: () {},
          child: const Text('Zarządzaj ogłoszeniami'),
        ),
        TextButton(
          style: style,
          onPressed: () {},
          child: const Text('Strona pomocy FAQ'),
        ),
        TextButton(
          style: style,
          onPressed: () => context.go('/policy'),
          child: const Text('Regulamin i Polityka Prywatności'),
        ),
        TextButton(
          style: style,
          onPressed: () => context.go('/login'),
          child: const Text('Logowanie'),
        ),
        TextButton(
          style: style,
          onPressed: () => context.go('/register'),
          child: const Text('Rejestracja'),
        ),
      ],
    );
  }
}
