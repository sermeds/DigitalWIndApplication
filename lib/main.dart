import 'package:digital_wind_application/API/file_storage.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:digital_wind_application/models/avatar_set.dart';
import 'package:digital_wind_application/models/player.dart';
import 'package:digital_wind_application/models/settings.dart';
import 'package:digital_wind_application/models/test.dart';
import 'package:digital_wind_application/models/tokens.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends InheritedWidget {
  const AppDataProvider(
      {required this.appData, required super.child, super.key});

  final AppData appData;

  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class AppData {
  AppData(
      {required this.settingsStorage,
      required this.avatarStorage,
      required this.playerStorage,
      required this.tokenStorage}) {
    tokenStorage.readValue().then((value) {
      if (value != null) {
        tokens = TokenTuple.fromJson(value);
      } else {}
    });

    settingsStorage.readValue().then((value) {
      if (value != null) {
        settings = Settings.fromJson(value);
      } else {
        settings = Settings();
        settingsStorage.writeValue(settings);
      }
    });

    avatarStorage.readValue().then((value) {
      if (value != null) {
        avatar = AvatarSet.fromJson(value);
      } else {
        avatar = AvatarSet();
        avatarStorage.writeValue(avatar);
      }
    });

    playerStorage.readValue().then((value) {
      if (value != null) {
        player = Player.fromJson(value);
      } else {}
    });
  }

  final SingleValueFileStorage<Settings> settingsStorage;

  final SingleValueFileStorage<AvatarSet> avatarStorage;

  final SingleValueFileStorage<Player> playerStorage;

  final SingleValueFileStorage<TokenTuple> tokenStorage;

  late Settings settings;

  TokenTuple? tokens;

  late AvatarSet avatar;

  Player? player;

  Future saveSettings() async {
    await settingsStorage.writeValue(settings);
  }

  Future saveAvatar() async {
    await avatarStorage.writeValue(avatar);
  }

  Future savePlayer() async {
    await playerStorage.writeValue(player!);
  }

  Future saveTokens() async {
    await tokenStorage.writeValue(tokens!);
  }

  List<Test> tests = [];
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppDataProvider(
      appData: AppData(
          settingsStorage: SingleValueFileStorage("settings"),
          avatarStorage: SingleValueFileStorage('avatar'),
          playerStorage: SingleValueFileStorage('player'),
          tokenStorage: SingleValueFileStorage('token')),
      child: const AppAutoRouter()));
}
