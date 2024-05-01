import 'package:auto_route/auto_route.dart';
import 'package:digital_wind_application/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

@RoutePage()
class RegistrationAgreementPage extends StatefulWidget {
  const RegistrationAgreementPage({super.key, required this.login, required this.password});

  final String login; final String password;

  @override
  State<StatefulWidget> createState() => _RegistrationAgreementPageState();
}

class _RegistrationAgreementPageState extends State<RegistrationAgreementPage> {
  @override
  void initState() {
    super.initState();
  }

  void registrationStepTwo(BuildContext context, String login, String password) {
    context.router.push(RegistrationContinueRoute(login: login, password: password));
  }

  String getAgreementText() {
    return "Настоящее Пользовательское соглашение для мобильного приложения «TAXSEE Driver дляAndroid» (далее по тексту - Соглашение) определяет условия предоставления ИП БелоноговойОльгой Викторовной (далее по тексту – Лицензиар) права пользования конечным пользователем(далее по тексту – Лицензиат) приложением «TAXSEE Driver для Android» (далее по тексту –Приложение) для мобильных устройств.Приложение автоматизирует просмотр Партнером информации о существующей потребностив услуге по перевозке пассажиров и багажа, услуге по перевозке грузов, доставке товаров,погрузочно-разгрузочных работах, а также иные взаимодействия посредством приложения,установленного на мобильные телефоны, коммуникаторы и прочие мобильные устройства,подключенные к сети Интернет.Соглашение содержит специальные нормы, которые регулируют отношения междуЛицензиатом и Лицензиаром по использованию Приложения.1. Термины, используемые в настоящем Соглашении1.1. Приложение - программа для ЭВМ (мобильных устройств), оперируемая Лицензиатом,распространяемая на безвозмездной основе (бесплатно) и предназначенная для работы на устройствес операционной системой Android. Оперирование и обслуживание Приложения, а такжепредоставление доступа Лицензиатам к Приложению осуществляется исключительно Лицензиаром.Использование Приложения Лицензиатом происходит в интерактивном (онлайн) режимепосредством подключения Лицензиата ко всемирной сети Интернет. Лицензиар является обладателемнеобходимого объема прав на Приложение и на все его элементы, взятые как в отдельности, так и всовокупности, за исключением Контента, права на элементы которого могут принадлежатьЛицензиату или третьим лицам. Лицензиар вправе осуществлять использование, оперирование ираспространение Приложения на соответствующих территориях, где он обеспечивает ееиспользование, оперирование и распространение.1.2. Сайт – Интернет-сайт, а также его мобильная версия, предоставляющий Лицензиатудоступ к Приложению.1.3. Лицензиар – лицо, являющееся правообладателем исключительных прав на Приложение,предоставляющее право использования Приложения на условиях неисключительной лицензииЛицензиатам, а также осуществляющее доведение до всеобщего сведения, распространение,оперирование, обслуживание, администрирование Приложения. На условиях настоящего СоглашенияЛицензиар предоставляет право использования Приложения и доступ Лицензиатам к Приложению.Лицензиар является Стороной настоящего Соглашения.1.4. Лицензиат – лицо, которому в соответствии с настоящим Соглашением предоставляетсяправо на использование Приложения на условиях неисключительной лицензии в предусмотренныхнастоящим Соглашением пределах. Лицензиат является Стороной настоящего Соглашения.1.5. Контент – размещенные в Приложении элементы дизайна, графические изображения,тексты, звуки и другие объекты, являющиеся результатом интеллектуальной деятельности или неявляющиеся таковыми, права на которые принадлежат Лицензиару, Лицензиату или иным лицам.1.6. Партнер — лицо, самостоятельно, своими силами оказывающее услуги по организацииперевозок пассажиров и (или) багажа либо по доставке товаров и (или) грузов в соответствии сзаконодательством РФ (в различных городах перечень услуг может различаться).1.7. Пользовательское соглашение — текст настоящего Соглашения и иные правила,указанные в настоящем Соглашении, содержащие все необходимые и существенные условия обиспользования Приложения, как программного обеспечения.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Image.asset(
                  "lib/resources/images/appIcon.png",
                  height: 17.5.w,
                  width: 10.h,
                ),
              ),
              SizedBox(
                width: 80.w,
                child: Text(
                  "Finigram",
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4.w),
              ),
              Container(
                width: 80.w,
                height: 50.h,
                padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 1.h),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: Theme.of(context).colorScheme.secondary),
                child: Column(
                  children: [
                    Text(
                      "Пользовательское соглашение",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(getAgreementText()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: ElevatedButton(
                  onPressed: () {
                    registrationStepTwo(context, widget.login, widget.password);
                  },
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.onPrimary),
                  ),
                  child: Text(
                    "Принять условия",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.replaceAll([const LoginRoute()]);
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.onPrimary),
                ),
                child: Text(
                  "Не принимать условия",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
