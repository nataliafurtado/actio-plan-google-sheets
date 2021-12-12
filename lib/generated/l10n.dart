// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `NEW ACTION`
  String get NOVA_ACAO {
    return Intl.message(
      'NEW ACTION',
      name: 'NOVA_ACAO',
      desc: '',
      args: [],
    );
  }

  /// `category`
  String get CATEGORIA {
    return Intl.message(
      'category',
      name: 'CATEGORIA',
      desc: '',
      args: [],
    );
  }

  /// `What ?`
  String get O_QUE {
    return Intl.message(
      'What ?',
      name: 'O_QUE',
      desc: '',
      args: [],
    );
  }

  /// `How ?`
  String get COMO {
    return Intl.message(
      'How ?',
      name: 'COMO',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get PRIORIDADE {
    return Intl.message(
      'Priority',
      name: 'PRIORIDADE',
      desc: '',
      args: [],
    );
  }

  /// `due date`
  String get PRAZO {
    return Intl.message(
      'due date',
      name: 'PRAZO',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get SATUS {
    return Intl.message(
      'Status',
      name: 'SATUS',
      desc: '',
      args: [],
    );
  }

  /// `Feeb Back`
  String get FEED_BACK {
    return Intl.message(
      'Feeb Back',
      name: 'FEED_BACK',
      desc: '',
      args: [],
    );
  }

  /// `Obs`
  String get OBS {
    return Intl.message(
      'Obs',
      name: 'OBS',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get SALVAR {
    return Intl.message(
      'SAVE',
      name: 'SALVAR',
      desc: '',
      args: [],
    );
  }

  /// `START TO CONFIGURE`
  String get INICIAR_CONFIG {
    return Intl.message(
      'START TO CONFIGURE',
      name: 'INICIAR_CONFIG',
      desc: '',
      args: [],
    );
  }

  /// `To configurate is necessary:`
  String get PARA_CONFIGURAR_E_NEC {
    return Intl.message(
      'To configurate is necessary:',
      name: 'PARA_CONFIGURAR_E_NEC',
      desc: '',
      args: [],
    );
  }

  /// ` - G`
  String get E_PRECISO_UMA {
    return Intl.message(
      ' - G',
      name: 'E_PRECISO_UMA',
      desc: '',
      args: [],
    );
  }

  /// ` - Create an empty Google drive sheet`
  String get CRIAR_UMA_PLANILHA {
    return Intl.message(
      ' - Create an empty Google drive sheet',
      name: 'CRIAR_UMA_PLANILHA',
      desc: '',
      args: [],
    );
  }

  /// ` - Press on editors script`
  String get IR_NA_PARTE {
    return Intl.message(
      ' - Press on editors script',
      name: 'IR_NA_PARTE',
      desc: '',
      args: [],
    );
  }

  /// ` - Implantar o scrip`
  String get IMPALNTAR_O_SCRIP {
    return Intl.message(
      ' - Implantar o scrip',
      name: 'IMPALNTAR_O_SCRIP',
      desc: '',
      args: [],
    );
  }

  /// ` - Liberar acesso da planilhas para outros aplicativos`
  String get LIBERAR_O_ACESSO {
    return Intl.message(
      ' - Liberar acesso da planilhas para outros aplicativos',
      name: 'LIBERAR_O_ACESSO',
      desc: '',
      args: [],
    );
  }

  /// `Instalation instructions`
  String get INTRUCOES_DE_INSTALACAO {
    return Intl.message(
      'Instalation instructions',
      name: 'INTRUCOES_DE_INSTALACAO',
      desc: '',
      args: [],
    );
  }

  /// `Utilize um navegador web para realizar as configuraçães.`
  String get UTILIZE_UM_NAVEGADOR_WEB {
    return Intl.message(
      'Utilize um navegador web para realizar as configuraçães.',
      name: 'UTILIZE_UM_NAVEGADOR_WEB',
      desc: '',
      args: [],
    );
  }

  /// `It's not possible tô configurate from Google's drive app`
  String get NAO_E_POSSIVEL_FAZER {
    return Intl.message(
      'It\'s not possible tô configurate from Google\'s drive app',
      name: 'NAO_E_POSSIVEL_FAZER',
      desc: '',
      args: [],
    );
  }

  /// `1. Create an empty Google sheet in Google drive`
  String get UM {
    return Intl.message(
      '1. Create an empty Google sheet in Google drive',
      name: 'UM',
      desc: '',
      args: [],
    );
  }

  /// `2. Go to <> Editor's  Script`
  String get DOIS {
    return Intl.message(
      '2. Go to <> Editor\'s  Script',
      name: 'DOIS',
      desc: '',
      args: [],
    );
  }

  /// `3. Erase default initial script`
  String get TRES {
    return Intl.message(
      '3. Erase default initial script',
      name: 'TRES',
      desc: '',
      args: [],
    );
  }

  /// `4. Paste the script below`
  String get QUATRO {
    return Intl.message(
      '4. Paste the script below',
      name: 'QUATRO',
      desc: '',
      args: [],
    );
  }

  /// `Copy script`
  String get COPIAR_SCRIPT {
    return Intl.message(
      'Copy script',
      name: 'COPIAR_SCRIPT',
      desc: '',
      args: [],
    );
  }

  /// `* Dont forget tô save after paste the New script`
  String get NAO_ESQUECA_DE_SALVAR {
    return Intl.message(
      '* Dont forget tô save after paste the New script',
      name: 'NAO_ESQUECA_DE_SALVAR',
      desc: '',
      args: [],
    );
  }

  /// `5. Em seguida pressione em - Nova implantação`
  String get CINCO {
    return Intl.message(
      '5. Em seguida pressione em - Nova implantação',
      name: 'CINCO',
      desc: '',
      args: [],
    );
  }

  /// `6. Em seguida pressione em - App da Web`
  String get SEIS {
    return Intl.message(
      '6. Em seguida pressione em - App da Web',
      name: 'SEIS',
      desc: '',
      args: [],
    );
  }

  /// `7. Em seguida pressione em - Implantar`
  String get SETE {
    return Intl.message(
      '7. Em seguida pressione em - Implantar',
      name: 'SETE',
      desc: '',
      args: [],
    );
  }

  /// `* Selecione - Qualquer pessoa`
  String get SELECIONE_QUALQUER_PESSOA {
    return Intl.message(
      '* Selecione - Qualquer pessoa',
      name: 'SELECIONE_QUALQUER_PESSOA',
      desc: '',
      args: [],
    );
  }

  /// `8. Em seguida pressione em -Avançado`
  String get OITO {
    return Intl.message(
      '8. Em seguida pressione em -Avançado',
      name: 'OITO',
      desc: '',
      args: [],
    );
  }

  /// `* Você mesmo esta criando um APP`
  String get VOCE_MESMO_ESTA {
    return Intl.message(
      '* Você mesmo esta criando um APP',
      name: 'VOCE_MESMO_ESTA',
      desc: '',
      args: [],
    );
  }

  /// `** E está permitindo que seu recém-criado app acesse sua planilha`
  String get E_ESTA_PERMITINDO {
    return Intl.message(
      '** E está permitindo que seu recém-criado app acesse sua planilha',
      name: 'E_ESTA_PERMITINDO',
      desc: '',
      args: [],
    );
  }

  /// `9. Em seguida pressione em -Acessar projeto sem título`
  String get NOVE {
    return Intl.message(
      '9. Em seguida pressione em -Acessar projeto sem título',
      name: 'NOVE',
      desc: '',
      args: [],
    );
  }

  /// `10. Em seguida pressione em - Permitir`
  String get DEZ {
    return Intl.message(
      '10. Em seguida pressione em - Permitir',
      name: 'DEZ',
      desc: '',
      args: [],
    );
  }

  /// `11. Copy URL from web app`
  String get ONZE {
    return Intl.message(
      '11. Copy URL from web app',
      name: 'ONZE',
      desc: '',
      args: [],
    );
  }

  /// `12. Paste URL in the field below`
  String get DOZE {
    return Intl.message(
      '12. Paste URL in the field below',
      name: 'DOZE',
      desc: '',
      args: [],
    );
  }

  /// `Paste here copied URL`
  String get COLE_AQUI_A_URL {
    return Intl.message(
      'Paste here copied URL',
      name: 'COLE_AQUI_A_URL',
      desc: '',
      args: [],
    );
  }

  /// `The field is mandatory`
  String get O_CAMPO_E_OBRIGATORIO {
    return Intl.message(
      'The field is mandatory',
      name: 'O_CAMPO_E_OBRIGATORIO',
      desc: '',
      args: [],
    );
  }

  /// ` Go to action plan`
  String get IR_PARA_O_PLANO_DE_ACAO {
    return Intl.message(
      ' Go to action plan',
      name: 'IR_PARA_O_PLANO_DE_ACAO',
      desc: '',
      args: [],
    );
  }

  /// `COPIED`
  String get COPIADO {
    return Intl.message(
      'COPIED',
      name: 'COPIADO',
      desc: '',
      args: [],
    );
  }

  /// `COPY`
  String get COPIAR {
    return Intl.message(
      'COPY',
      name: 'COPIAR',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get TODAS {
    return Intl.message(
      'All',
      name: 'TODAS',
      desc: '',
      args: [],
    );
  }

  /// `Action plan`
  String get PLANO_DE_ACAO {
    return Intl.message(
      'Action plan',
      name: 'PLANO_DE_ACAO',
      desc: '',
      args: [],
    );
  }

  /// `Who ?`
  String get QUEM {
    return Intl.message(
      'Who ?',
      name: 'QUEM',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exclude This action ?`
  String get DESEJA_EXCLUIR {
    return Intl.message(
      'Are you sure you want to exclude This action ?',
      name: 'DESEJA_EXCLUIR',
      desc: '',
      args: [],
    );
  }

  /// `Exclude`
  String get EXCLUIR {
    return Intl.message(
      'Exclude',
      name: 'EXCLUIR',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get CANCELAR {
    return Intl.message(
      'Cancel',
      name: 'CANCELAR',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'ESTA_ACAO_NAO:' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
