import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/API/avatar.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:digital_wind_application/components/avatar.dart';
import 'package:digital_wind_application/main.dart';
import 'package:digital_wind_application/models/avatar_element.dart';
import 'package:digital_wind_application/models/avatar_element_type.dart';
import 'package:digital_wind_application/models/avatar_set.dart';
import 'package:digital_wind_application/resources/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

@RoutePage()
class AvatarEditorPage extends StatefulWidget {
  const AvatarEditorPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AvatarEditorPageState();
  }
}

List<AvatarGroupElement> avatarGroups = List.empty(growable: true);

int currentElement = 0;

void getAvatarElements(BuildContext context) {
  avatarGroups = List.empty(growable: true);
  currentElement = 0;

  var names = ['Шляпа', 'Волосы', 'Лицо', 'Глаза', 'Рот', 'Одежда'];
  var colors = [
    AppDataProvider.of(context)!.appData.avatar.hat.color,
    AppDataProvider.of(context)!.appData.avatar.hair.color,
    AppDataProvider.of(context)!.appData.avatar.face.color,
    AppDataProvider.of(context)!.appData.avatar.eyes.color,
    AppDataProvider.of(context)!.appData.avatar.mouth.color,
    AppDataProvider.of(context)!.appData.avatar.clothes.color,
  ];
  var ids = [0, 0, 0, 0, 0, 0];
  var avatarElements = [
    AvatarElement(type: AvatarElementType.HAT, color: colors[0], number: 0),
    AvatarElement(type: AvatarElementType.HAT, color: colors[0], number: 1),
    AvatarElement(type: AvatarElementType.HAT, color: colors[0], number: 2),
    AvatarElement(type: AvatarElementType.HAIR, color: colors[1], number: 0),
    AvatarElement(type: AvatarElementType.HAIR, color: colors[1], number: 1),
    AvatarElement(type: AvatarElementType.FACE, color: colors[2], number: 0),
    AvatarElement(type: AvatarElementType.FACE, color: colors[2], number: 1),
    AvatarElement(type: AvatarElementType.FACE, color: colors[2], number: 2),
    AvatarElement(type: AvatarElementType.EYES, color: colors[3], number: 0),
    AvatarElement(type: AvatarElementType.EYES, color: colors[3], number: 1),
    AvatarElement(type: AvatarElementType.MOUTH, color: colors[4], number: 0),
    AvatarElement(type: AvatarElementType.MOUTH, color: colors[4], number: 1),
    AvatarElement(type: AvatarElementType.CLOTHES, color: colors[5], number: 0),
    AvatarElement(type: AvatarElementType.CLOTHES, color: colors[5], number: 1),
  ];

  for (int i = 0; i < 6; i++) {
    avatarGroups.add(AvatarGroupElement._(
        names[i],
        colors[i],
        ids[i],
        avatarElements
            .where((element) => element.type == AvatarElementType.values[i])
            .toList()));
  }
  avatarGroups[0].isSelect = true;
}

void openElement(AvatarGroupElement element) {}

AvatarElement getByIndex(AvatarSet set, int index) {
  switch (index) {
    case 0:
      return set.hat;
    case 1:
      return set.hair;
    case 2:
      return set.face;
    case 3:
      return set.eyes;
    case 4:
      return set.mouth;
    case 5:
      return set.clothes;
    default:
      throw Exception("Invalid index");
  }
}

Future save(BuildContext context, AvatarSet set) {
  AppDataProvider.of(context)!.appData.avatar = set;
  AppDataProvider.of(context)!.appData.saveAvatar();
  return createAvatar([], AppDataProvider.of(context)!.appData.token ?? "");
}

class _AvatarEditorPageState extends State<AvatarEditorPage> {
  @override
  void initState() {
    //getAvatarElements(context);
    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    getAvatarElements(context);
    _set = AvatarSet.copy(AppDataProvider.of(context)!.appData.avatar);
  }

  late final AvatarSet _set;

  Future<void> _selectColor(BuildContext context) async {
    Color pickerColor = Color(avatarGroups[currentElement].color.value);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: SlidePicker(
            pickerColor: pickerColor,
            onColorChanged: (color) => {pickerColor = color},
            colorModel: ColorModel.rgb,
            enableAlpha: false,
            displayThumbColor: true,
            showParams: true,
            showIndicator: true,
            indicatorBorderRadius:
                const BorderRadius.vertical(top: Radius.circular(25)),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Выбрать'),
            onPressed: () {
              setState(() {
                avatarGroups[currentElement].color = pickerColor;
                for (var element in avatarGroups[currentElement].elements) {
                  element.color = pickerColor;
                }
                getByIndex(_set, currentElement).color = pickerColor;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pathPrefixes = [
      "hat/Hat",
      "hair/Hair",
      "face/Face",
      "eyes/Eyes",
      "mouth/Mouth",
      "clothes/Clothes"
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактор'),
        actions: [
          IconButton(
              onPressed: () {
                save(context, _set).then((value) {
                  context.router.pop(const ProfileRoute());
                }).catchError((error) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Ошибка'),
                      content: const Text('Нет соединения с сервером, попробуй сохранить еще раз'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(); // dismisses only the dialog and returns nothing
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                });
                // ignore: deprecated_member_use
                //context.router.pop(const ProfileRoute());
              },
              icon: const Icon(Icons.save)),
          IconButton(
              onPressed: () {
                // ignore: deprecated_member_use
                context.router.pop(const ProfileRoute());
              },
              icon: const Icon(Icons.cancel))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
            height: 45.h,
            child: Container(
              width: 80.w,
              decoration: BoxDecoration(
                color: CustomColor.primaryLight,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: Avatar(
                elements: _set,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ToggleButtons(
                selectedBorderColor: Theme.of(context).colorScheme.onPrimary,
                selectedColor: Theme.of(context).colorScheme.background,
                fillColor: Theme.of(context).colorScheme.tertiary,
                color: Theme.of(context).colorScheme.tertiary,
                borderColor: Theme.of(context).colorScheme.onSecondary,
                isSelected:
                    avatarGroups.map((element) => element.isSelect).toList(),
                borderWidth: 3,
                borderRadius: BorderRadius.circular(25),
                onPressed: (int index) {
                  setState(
                    () {
                      for (int i = 0; i < avatarGroups.length; i++) {
                        avatarGroups[i].isSelect = false;
                      }
                      avatarGroups[index].isSelect = true;
                      currentElement = index;
                      openElement(avatarGroups[index]);
                    },
                  );
                },
                constraints: BoxConstraints(
                  minHeight: 4.h,
                  maxHeight: 4.h,
                  minWidth: 27.w,
                  maxWidth: 27.w,
                ),
                children: avatarGroups.map(
                  (element) {
                    return Text(element.name);
                  },
                ).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: avatarGroups[currentElement].color,
              ),
              width: 80.w,
              child: TextButton(
                style: const ButtonStyle(
                  alignment: Alignment.center,
                ),
                onPressed: () {
                  _selectColor(context);
                },
                child: Text(
                  "Изменить цвет",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(25),
              ),
              width: 80.w,
              height: 33.h,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemCount: avatarGroups[currentElement].elements.length,
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    onPressed: () => {
                      setState(
                        () {
                          switch(currentElement){
                            case 0:
                              _set.hat = avatarGroups[currentElement].elements[index];
                              break;
                            case 1:
                              _set.hair = avatarGroups[currentElement].elements[index];
                              break;
                            case 2:
                              _set.face = avatarGroups[currentElement].elements[index];
                              break;
                            case 3:
                              _set.eyes = avatarGroups[currentElement].elements[index];
                              break;
                            case 4:
                              _set.mouth = avatarGroups[currentElement].elements[index];
                              break;
                            case 5:
                              _set.clothes = avatarGroups[currentElement].elements[index];
                              break;
                          }
                        },
                      ),
                    },
                    child: Image(
                      image: Image.asset(
                              'lib/resources/images/avatar/${pathPrefixes[currentElement]}$index.png')
                          .image,
                      color: avatarGroups[currentElement].color,
                      height: 75,
                      width: 75,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarGroupElement {
  AvatarGroupElement._(this.name, this.color, this.currentId, this.elements);

  bool isSelect = false;
  String name = "";
  Color color = Colors.white;
  int currentId = 0;
  List<AvatarElement> elements;
  void setColor(Color color) {
    this.color = color;
  }

  void setId(int currentId) {
    this.currentId = currentId;
  }

  void setIsSelect(bool isSelect) {
    this.isSelect = isSelect;
  }
}
