import 'package:digital_wind_application/models/avatar_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class Avatar extends StatelessWidget{

  const Avatar({super.key, required this.elements});

  final AvatarSet elements;

  final String bodyImage = true
      ? "lib/resources/images/avatar/MaleBody.png"
      : "lib/resources/images/avatar/FemaleBody.png";

  @override
  Widget build(BuildContext context) {
    return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    //Тело
                    padding: const EdgeInsets.only(top: 70),
                    child: Image.asset(
                      bodyImage,
                      height: 30.h,
                      color: elements.face.color,
                    ),
                  ),
                  Container(
                    //Лицо
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Image(
                      image: Image.asset('lib/resources/images/avatar/face/Face${elements.face.number}.png')
                          .image,
                      color: elements.face.color,
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Container(
                    //Волосы
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Image(
                      image: Image.asset('lib/resources/images/avatar/hair/Hair${elements.hair.number}.png')
                          .image,
                      color: elements.hair.color,
                      height: 10.h,
                    ),
                  ),
                  Container(
                    //Глаза
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Image(
                      image: Image.asset('lib/resources/images/avatar/eyes/Eyes${elements.eyes.number}.png')
                          .image,
                      color: elements.eyes.color,
                      height: 7.5.h,
                    ),
                  ),
                  Container(
                    //Рот
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Image(
                      image: Image.asset('lib/resources/images/avatar/mouth/Mouth${elements.mouth.number}.png')
                          .image,
                      color: elements.mouth.color,
                      height: 7.5.h,
                    ),
                  ),
                  Container(
                    //Шляпа
                    padding: const EdgeInsets.only(bottom: 160),
                    child: Image(
                      image: Image.asset('lib/resources/images/avatar/hat/Hat${elements.hat.number}.png')
                          .image,
                      color: elements.hat.color,
                      height: 12.h,
                    ),
                  ),
                  Container(
                    //Одежда
                    padding: const EdgeInsets.only(top: 70),
                    child: Image(
                      image: Image.asset('lib/resources/images/avatar/clothes/Clothes${elements.clothes.number}.png')
                          .image,
                      color: elements.clothes.color,
                      height: 30.h,
                    ),
                  ),
                ],
              );
  }
  
}