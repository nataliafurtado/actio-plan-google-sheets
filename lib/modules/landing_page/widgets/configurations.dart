import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/generated/l10n.dart';
import 'package:google_action_plan/id_sheet_singleton.dart';
import 'package:google_action_plan/modules/widgets/button.dart';
import '../landing_page_controller.dart';
import 'image_text_widget.dart';

class Configurations2 extends StatelessWidget {
  final double totalSizeOfAllWidgets = 650;

  const Configurations2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LandingPageController landingPageController =
        GetIt.I.get<LandingPageController>();
    IdSheetSingleton idSheetSingleton = GetIt.I.get<IdSheetSingleton>();
    final _formKey = GlobalKey<FormState>();
    TextEditingController controllerIdSheet = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 120),
            Text(
              S.of(context).INTRUCOES_DE_INSTALACAO,
              style: Style.bold.copyWith(fontSize: 18),
            ),
            Container(height: 20),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).UTILIZE_UM_NAVEGADOR_WEB,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).NAO_E_POSSIVEL_FAZER,
              ),
            ),
            ImageTextWidget(
              text: S.of(context).UM,
              image: 'lib/assets/images/page1.png',
            ),

            ImageTextWidget(
              text: S.of(context).DOIS,
              image: 'lib/assets/images/page2.png',
            ),

            ImageTextWidget(
              text: S.of(context).TRES,
              image: 'lib/assets/images/page3.png',
            ),

            //
            ImageTextWidget(
              text: S.of(context).QUATRO,
              image: 'lib/assets/images/page4.png',
            ),

            Container(height: 10),
            Container(
              padding: const EdgeInsets.all(24),
              child: Button(S.of(context).COPIAR_SCRIPT, () {}),
            ),
            Text(
              S.of(context).NAO_ESQUECA_DE_SALVAR,
              style: Style.bold.copyWith(fontSize: 18),
            ),
            ImageTextWidget(
              text: S.of(context).CINCO,
              image: 'lib/assets/images/page5.png',
            ),
            ImageTextWidget(
              text: S.of(context).SEIS,
              image: 'lib/assets/images/page6.png',
            ),

            ImageTextWidget(
              text: S.of(context).SETE,
              image: 'lib/assets/images/page7.png',
            ),

            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).SELECIONE_QUALQUER_PESSOA,
              ),
            ),

            ImageTextWidget(
              text: S.of(context).OITO,
              image: 'lib/assets/images/page8.png',
            ),

            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).VOCE_MESMO_ESTA,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).E_ESTA_PERMITINDO,
              ),
            ),

            ImageTextWidget(
              text: S.of(context).NOVE,
              image: 'lib/assets/images/page9.png',
            ),

            ImageTextWidget(
              text: S.of(context).DEZ,
              image: 'lib/assets/images/page10.png',
            ),

            ImageTextWidget(
              text: S.of(context).ONZE,
              image: 'lib/assets/images/page11.png',
            ),
            Container(height: 30),

            Text(
              S.of(context).DOZE,
              style: Style.bold.copyWith(fontSize: 18),
            ),
            Container(height: 30),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: controllerIdSheet,
                decoration:
                    Style.inputDecoration(hint: S.of(context).COLE_AQUI_A_URL),
                validator: (String? text) {
                  if (text!.isEmpty) {
                    return S.of(context).O_CAMPO_E_OBRIGATORIO;
                  }
                  return null;
                },
              ),
            ),
            Container(height: 50),
            Button(
              S.of(context).IR_PARA_O_PLANO_DE_ACAO,
              () {
                if (_formKey.currentState!.validate()) {
                  idSheetSingleton.controllerIdSheet = controllerIdSheet.text;
                  landingPageController.configureAndGoToList();
                }
              },
            ),
            Container(height: 50),
          ],
        ),
      ),
    );
  }

  // Future<void> sendw() async {
  //   final Email email = Email(
  //     body: script,
  //     subject: "",
  //     recipients: [],
  //     attachmentPaths: [],
  //     isHTML: false,
  //   );

  //   try {
  //     await FlutterEmailSender.send(email);
  //   } catch (error) {}
  // }

  final String script = "function doGet(e){\n"
      "try{\n"
      "var sheet = SpreadsheetApp.getActiveSheet()\n"
      "var lastRow = sheet.getLastRow()\n"
      "var lastColum = sheet.getLastColumn()\n"
      "var originalData = sheet.getRange(2,1,lastRow-1,lastColum).getValues()\n"
      "}catch(exc){\n"
      " console.log(\"Somenthing went wrong\")\n"
      "}\n"
      "var JSONString = JSON.stringify(originalData)\n"
      "var JSONOutput = ContentService.createTextOutput(JSONString)\n"
      "JSONOutput.setMimeType(ContentService.MimeType.JSON)\n"
      "return JSONOutput\n"
      "}\n"
      "function doPost(request)\n"
      "  var result\n"
      "  if(request.parameter.action==\"save\"){\n"
      "    result= save(request)\n"
      "}\n"
      "  else if(request.parameter.action==\"edit\"){\n"
      "   result= edit(request)\n"
      "}\n"
      "  else if(request.parameter.action==\"config\"){\n"
      "   result= createInitialConfig(request)\n"
      "}\n"
      "  else if(request.parameter.action==\"delete\"){\n"
      "   result= deleteRow(request)\n"
      "}\n"
      "  return ContentService"
      "  .createTextOutput(JSON.stringify({\"status\": \"SUCCESS\"}))"
      "  .setMimeType(ContentService.MimeType.JSON);\n"
      "}\n"
      "function save(request)\n"
      "  var sheet = SpreadsheetApp.getActiveSheet();\n"
      "  var result = {\"status\": \"SUCCESS\"};\n"
      "  sheet.setConditionalFormatRules;\n"
      "  try{   \n"
      "    var data = request.parameter.data;\n"
      "    var categoria = request.parameter.categoria;\n"
      "    var oQue = request.parameter.oQue;\n"
      "    var como = request.parameter.como;\n"
      "    var quem = request.parameter.quem;\n"
      "    var prazo = request.parameter.prazo;\n"
      "    var status = request.parameter.status;\n"
      "    var feedBack = request.parameter.feedBack;\n"
      "    var obs = request.parameter.obs;\n"
      "  sheet.appendRow([data, categoria, oQue, como,quem,prazo,status,feedBack,obs]);\n"
      "  }catch(exc){\n"
      "    result = {\"status\": \"FAILED\", \"message\": exc};\n"
      "  }\n"
      "  return result;\n"
      "}\n"
      "function edit(request){\n"
      "    var sheet = SpreadsheetApp.getActiveSheet();\n"
      "    var result = {\"status\": \"SUCCESS\"};\n"
      "  try{   \n"
      "    var row = request.parameter.rowToEdit;\n"
      "    var data = request.parameter.data;\n"
      "    var categoria = request.parameter.categoria;\n"
      "    var oQue = request.parameter.oQue;\n"
      "    var como = request.parameter.como;\n"
      "    var quem = request.parameter.quem;\n"
      "    var prazo = request.parameter.prazo;\n"
      "    var status = request.parameter.status;\n"
      "    var feeBack = request.parameter.feeBack;\n"
      "    var obs = request.parameter.obs;\n"
      "    sheet.getRange(row,1,1,9).setValues([[data, categoria,oQue,como,quem,prazo,status,feeBack,obs]]);\n"
      "  }catch(exc){\n"
      "    result = {\"status\": \"FAILED\", \"message\": exc};\n"
      "  }\n"
      "  return result;\n"
      "}\n"
      "function createInitialConfig(request){\n"
      "  var result = {\"status\": \"SUCCESS\"};\n"
      "  var sheet = SpreadsheetApp.getActiveSheet();\n"
      "if(sheet.getRange(\"A1\").getValue()==\"CRIAÇÂO\"){"
      "return result;"
      "}"
      "  sheet.insertRowBefore(1).getRange(1, 1, 1, 9).setValues([[\"CRIAÇÂO\", \"CATEGORIA\", \"O QUE ?\", \"COMO ?\",\"QUEM ?\",\"PRAZO\",\"STATUS\",\"FEED BACK\",\"OBS\"]]);\n"
      "  sheet.appendRow([\"28/12/2020\", \"EMPREGO\", \"Curriculo\", \"Fazer curriculo com ajuda de pedro e com manual do email de pedro\",\"NATALIA\",\"06/10/2021\",\"EM PROGRESSO\",\"TESTE\",\"TESTE\"]); "
      "  sheet.getRange(\"A1:I1\").setFontWeight(\"bold\").setBackground(\"#4a86e8\").setFontColor(\"#ffffff\").setHorizontalAlignment(\"center\");\n"
      "  sheet.setColumnWidth(4,320);\n"
      "  sheet.setColumnWidth(7,120);\n"
      "  sheet.getRange(\"A1:I100\").setBorder(true, true, true, true, true, true).setVerticalAlignment(\"middle\");\n"
      "  sheet.getRange(\"A:A\").setHorizontalAlignment(\"center\");\n"
      "  sheet.getRange(\"B:B\").setHorizontalAlignment(\"center\");\n"
      "  sheet.getRange(\"C:C\").setHorizontalAlignment(\"center\");\n"
      "  sheet.getRange(\"E:E\").setHorizontalAlignment(\"center\");\n"
      "  sheet.getRange(\"F:F\").setHorizontalAlignment(\"center\");\n"
      "  sheet.getRange(\"G:G\").setHorizontalAlignment(\"center\");\n"
      "  sheet.setRowHeights(1, 100, 40);\n"
      "  var rule = SpreadsheetApp.newConditionalFormatRule()\n"
      "    .whenTextContains(\"EM PROGRESSO\")\n"
      "    .setBackground(\"#ffff00\") \n"
      "    .setBold(true)\n"
      "    .setFontColor(\"#434343\")   \n"
      "    .setRanges([sheet.getRange(\"G:G\")])\n"
      "    .build()\n"
      "  var rule1 = SpreadsheetApp.newConditionalFormatRule()\n"
      "    .whenTextContains(\"ATRASADA\")\n"
      "    .setBackground(\"#fb1744\")   \n"
      "    .setBold(true)\n"
      "    .setFontColor(\"#ffffff\")  \n"
      "    .setRanges([sheet.getRange(\"G:G\")])\n"
      "    .build()\n"
      "  var rule2 = SpreadsheetApp.newConditionalFormatRule()\n"
      "    .whenTextContains(\"CANCELADA\")\n"
      "    .setBackground(\"#efefef\") \n"
      "    .setBold(true)   \n"
      "    .setRanges([sheet.getRange(\"G:G\")])\n"
      "    .build()\n"
      "  var rule3 = SpreadsheetApp.newConditionalFormatRule()\n"
      "    .whenTextContains(\"COMPLETA\")\n"
      "    .setBackground(\"#69f0ae\")\n"
      "    .setBold(true)\n"
      "    .setFontColor(\"#666666\")  \n"
      "    .setRanges([sheet.getRange(\"G:G\")])\n"
      "    .build()\n"
      "  var rule4 = SpreadsheetApp.newConditionalFormatRule()\n"
      "    .whenTextContains(\"EM ESPERA\")\n"
      "    .setBackground(\"#d9d9d9\") \n"
      "    .setBold(true)   \n"
      "    .setRanges([sheet.getRange(\"G:G\")])\n"
      "    .build()\n"
      "  var rule5 = SpreadsheetApp.newConditionalFormatRule()\n"
      "    .whenDateAfter(SpreadsheetApp.RelativeDate.TODAY)\n"
      "    .setBackground(\"#69f0ae\")\n"
      "    .setBold(true)   \n"
      "    .setRanges([sheet.getRange(\"F:F\")])\n"
      "    .build()\n"
      "  var rule6 = SpreadsheetApp.newConditionalFormatRule()\n"
      "    .whenDateBefore(SpreadsheetApp.RelativeDate.TODAY)\n"
      "    .setBackground(\"#fb1744\")\n"
      "    .setBold(true)\n"
      "    .setFontColor(\"#ffffff\") \n"
      "    .setRanges([sheet.getRange(\"F:F\")])\n"
      "    .build(); \n"
      "  var rule7 = SpreadsheetApp.newConditionalFormatRule()\n"
      "    .whenDateEqualTo(SpreadsheetApp.RelativeDate.TODAY)\n"
      "    .setBackground(\"#ffff00\")\n"
      "    .setBold(true) \n"
      "    .setRanges([sheet.getRange(\"F:F\")])\n"
      "    .build();\n"
      "  var rules = sheet.getConditionalFormatRules()\n"
      "    rules.push(rule);\n"
      "    rules.push(rule1);\n"
      "    rules.push(rule2);\n"
      "    rules.push(rule3);\n"
      "    rules.push(rule4);\n"
      "    rules.push(rule5);\n"
      "    rules.push(rule6);\n"
      "    rules.push(rule7);\n"
      "  sheet.setConditionalFormatRules(rules);\n"
      "  return result;\n"
      "}\n";
}
