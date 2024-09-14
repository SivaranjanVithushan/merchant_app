import 'package:flutter/material.dart';
import '../../../core/theme_data/colour_scheme.dart';
import '../../../core/theme_data/text_theme.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
      backgroundColor: background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage:
                          AssetImage('assets/images/profile_2.jpeg'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ashfak Sayem',
                        style: textTheme.headlineMedium!.copyWith(
                          color: textTitle,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          color: secondaryLighter,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Premium',
                          style: textTheme.labelSmall!.copyWith(
                            fontSize: 14,
                            color: secondaryTextLabel,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // icon
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child:
                          Icon(Icons.menu, color: secondaryDefault, size: 24)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildMenuItem(
                        context,
                        'Profile Details',
                        'View & Edit details',
                        'assets/icons/profile/person.svg',
                        () {}),
                    _buildMenuItem(context, 'Appearance', 'Theme & Font',
                        'assets/icons/profile/Appearance.svg', () {}),
                    _buildMenuItem(context, 'Help', 'Support & Help',
                        'assets/icons/profile/Help.svg', () {}),
                    _buildMenuItem(
                        context,
                        'Refer Friends',
                        'Share with friends',
                        'assets/icons/profile/ReferFriends.svg',
                        () {}),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Version 1.0.0',
                  style: textTheme.labelMedium!.copyWith(color: textSubtitle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String subtitle,
      String iconPath, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          title: Text(
            title,
            style: textTheme.bodyLarge!.copyWith(
              color: textTitle,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(subtitle,
              style: textTheme.labelMedium!.copyWith(color: textSubtitle)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          // onTap: () => onTap(),
        ),
      ),
    );
  }
}
