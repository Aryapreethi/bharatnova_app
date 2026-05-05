import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constant/app_color.dart';
import '../../../providers/location_provider.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black),
        onPressed: () {},
      ),
      title: const Text(
        'BHARATNOVA',
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: 1.2,
          fontFamily: 'Montserrat',
        ),
      ),
      centerTitle: true,
      actions: [
        Consumer<LocationProvider>(
          builder: (context, locationProvider, _) {
            return Row(
              children: [
                const Icon(Icons.location_on, color: AppColors.primary, size: 16),
                const SizedBox(width: 2),
                Text(
                  locationProvider.city ?? 'Loading...',
                  style: const TextStyle(
                   color: AppColors.primary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}