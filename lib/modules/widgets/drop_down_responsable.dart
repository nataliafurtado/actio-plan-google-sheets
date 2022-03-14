import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/action/action_controller.dart';

class DropDownResponsable extends StatefulWidget {
  const DropDownResponsable({Key? key}) : super(key: key);

  @override
  _DropDownResponsableState createState() => _DropDownResponsableState();
}

class _DropDownResponsableState extends State<DropDownResponsable> {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ActionController>();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: controller.controllerQuem,
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontStyle: FontStyle.italic),
                  decoration: Style.inputDecoration()),
              suggestionsCallback: (pattern) async {
                return BackendService.getSuggestions(
                  pattern,
                  controller.responsablesList,
                );
              },
              itemBuilder: (context, suggestion) {
                final dd = suggestion as Map<String, String>;
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(dd['name']!),
                );
              },
              onSuggestionSelected: (suggestion) {
                final dd = suggestion as Map<String, String>;
                // ignore: avoid_print
                print(suggestion.toString());
                // ignore: avoid_print
                controller.controllerQuem.text = dd['name']!;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BackendService {
  static List<Map<String, String>> getSuggestions(
    String query,
    List<String> suggestion,
  ) {
    final filteredListy = suggestion.where((sug) => sug.startsWith(query));

    return filteredListy
        .map((e) => {
              'name': e,
            })
        .toList();
  }
}
