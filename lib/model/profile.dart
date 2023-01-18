import 'package:flutter/material.dart';
import 'package:hear_me/style/style.dart';

class ProfileModel {
  final Icon icon1;
  final String text;
  final Icon icon2;

  ProfileModel({
    required this.icon1,
    required this.text,
    required this.icon2,
  });
}

List<ProfileModel> listOfProfile = [
  ProfileModel(
    icon1: const Icon(
      Icons.person,
      color: Style.primaryColor,
    ),
    text: 'Profile',
    icon2: const Icon(
      Icons.arrow_forward_ios,
      color: Style.primaryColor,
    ),
  ),
  ProfileModel(
    icon1: const Icon(
      Icons.notifications_active,
      color: Style.primaryColor,
    ),
    text: 'Notification',
    icon2: const Icon(
      Icons.arrow_forward_ios,
      color: Style.primaryColor,
    ),
  ),
  ProfileModel(
    icon1: const Icon(
      Icons.mic,
      color: Style.primaryColor,
    ),
    text: 'Audio & Video',
    icon2: const Icon(
      Icons.arrow_forward_ios,
      color: Style.primaryColor,
    ),
  ),
  ProfileModel(
    icon1: const Icon(
      Icons.play_circle_outline,
      color: Style.primaryColor,
    ),
    text: 'Playback',
    icon2: const Icon(
      Icons.arrow_forward_ios,
      color: Style.primaryColor,
    ),
  ),
  ProfileModel(
    icon1: const Icon(
      Icons.verified,
      color: Style.primaryColor,
    ),
    text: 'Data Saver & Storage',
    icon2: const Icon(
      Icons.arrow_forward_ios,
      color: Style.primaryColor,
    ),
  ),
  ProfileModel(
    icon1: const Icon(
      Icons.security,
      color: Style.primaryColor,
    ),
    text: 'Security',
    icon2: const Icon(
      Icons.arrow_forward_ios,
      color: Style.primaryColor,
    ),
  ),
  ProfileModel(
    icon1: const Icon(
      Icons.language,
      color: Style.primaryColor,
    ),
    text: 'Language   English (US)',
    icon2: const Icon(
      Icons.arrow_forward_ios,
      color: Style.primaryColor,
    ),
  ),
  ProfileModel(
    icon1: const Icon(
      Icons.visibility,
      color: Style.primaryColor,
    ),
    text: 'Dark Mode',
    icon2: const Icon(
      Icons.arrow_forward_ios,
      color: Style.primaryColor,
    ),
  ),
];
