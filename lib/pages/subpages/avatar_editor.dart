import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
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

void getAvatarElements() {
  var names = ['Шляпа', 'Волосы', 'Лицо', 'Глаза', 'Рот', 'Одежда'];
  var colors = [
    Colors.red,
    Colors.amber,
    const Color.fromARGB(255, 255, 214, 208),
    Colors.white,
    Colors.white,
    Colors.white
  ];
  var ids = [0, 0, 0, 0, 0, 0];
  var avatarElements = [
    [
      AvatarElement._(
          0, Image.asset("lib/resources/images/avatar/hat/Hat0.png")),
      AvatarElement._(
          1, Image.asset("lib/resources/images/avatar/hat/Hat1.png")),
      AvatarElement._(
          2, Image.asset("lib/resources/images/avatar/hat/Hat2.png")),
    ],
    [
      AvatarElement._(
          0, Image.asset("lib/resources/images/avatar/hair/Hair0.png")),
      AvatarElement._(
          1, Image.asset("lib/resources/images/avatar/hair/Hair1.png")),
    ],
    [
      AvatarElement._(
          0, Image.asset("lib/resources/images/avatar/face/Face0.png")),
      AvatarElement._(
          1, Image.asset("lib/resources/images/avatar/face/Face1.png")),
      AvatarElement._(
          2, Image.asset("lib/resources/images/avatar/face/Face2.png")),
    ],
    [
      AvatarElement._(
          0, Image.asset("lib/resources/images/avatar/eyes/Eyes0.png")),
      AvatarElement._(
          1, Image.asset("lib/resources/images/avatar/eyes/Eyes1.png")),
    ],
    [
      AvatarElement._(
          0, Image.asset("lib/resources/images/avatar/mouth/Mouth0.png")),
      AvatarElement._(
          1, Image.asset("lib/resources/images/avatar/mouth/Mouth1.png")),
    ],
    [
      AvatarElement._(
          0, Image.asset("lib/resources/images/avatar/clothes/Clothes0.png")),
      AvatarElement._(
          1, Image.asset("lib/resources/images/avatar/clothes/Clothes1.png")),
    ],
  ];

  for (int i = 0; i < 6; i++) {
    avatarGroups.add(
        AvatarGroupElement._(names[i], colors[i], ids[i], avatarElements[i]));
  }
  avatarGroups[0].isSelect = true;
}

void openElement(AvatarGroupElement element) {}

void save() {}

class _AvatarEditorPageState extends State<AvatarEditorPage> {
  @override
  void initState() {
    getAvatarElements();
    super.initState();
  }

  String bodyImage = true
      ? "lib/resources/images/avatar/MaleBody.png"
      : "lib/resources/images/avatar/FemaleBody.png";

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
              setState(() => avatarGroups[currentElement].color = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактор'),
        actions: [
          IconButton(
              onPressed: () {
                save();
                // ignore: deprecated_member_use
                context.router.pop(const ProfileRoute());
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    //Тело
                    padding: const EdgeInsets.only(top: 70),
                    child: Image.asset(
                      bodyImage,
                      height: 30.h,
                      color: avatarGroups[2].color,
                    ),
                  ),
                  Container(
                    //Лицо
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Image(
                      image: avatarGroups[2]
                          .elements[avatarGroups[2].currentId]
                          .image
                          .image,
                      color: avatarGroups[2].color,
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Container(
                    //Волосы
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Image(
                      image: avatarGroups[1]
                          .elements[avatarGroups[1].currentId]
                          .image
                          .image,
                      color: avatarGroups[1].color,
                      height: 10.h,
                    ),
                  ),
                  Container(
                    //Глаза
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Image(
                      image: avatarGroups[3]
                          .elements[avatarGroups[3].currentId]
                          .image
                          .image,
                      color: avatarGroups[3].color,
                      height: 7.5.h,
                    ),
                  ),
                  Container(
                    //Рот
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Image(
                      image: avatarGroups[4]
                          .elements[avatarGroups[4].currentId]
                          .image
                          .image,
                      color: avatarGroups[4].color,
                      height: 7.5.h,
                    ),
                  ),
                  Container(
                    //Шляпа
                    padding: const EdgeInsets.only(bottom: 160),
                    child: Image(
                      image: avatarGroups[0]
                          .elements[avatarGroups[0].currentId]
                          .image
                          .image,
                      color: avatarGroups[0].color,
                      height: 12.h,
                    ),
                  ),
                  Container(
                    //Одежда
                    padding: const EdgeInsets.only(top: 70),
                    child: Image(
                      image: avatarGroups[5]
                          .elements[avatarGroups[5].currentId]
                          .image
                          .image,
                      color: avatarGroups[5].color,
                      height: 30.h,
                    ),
                  ),
                ],
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
                          avatarGroups[currentElement].currentId = index;
                        },
                      ),
                    },
                    child: Image(
                      image: avatarGroups[currentElement]
                          .elements[index]
                          .image
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

class AvatarElement {
  AvatarElement._(this.id, this.image);
  int id;
  Image image;
}
