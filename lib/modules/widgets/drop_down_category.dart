import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:google_action_plan/config/style.dart';
import 'package:google_action_plan/modules/action/action_controller.dart';

class DropDownCategory extends StatefulWidget {
  const DropDownCategory({Key? key}) : super(key: key);

  @override
  _DropDownCategoryState createState() => _DropDownCategoryState();
}

class _DropDownCategoryState extends State<DropDownCategory> {
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
                  controller: controller.controllerCategoria,
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontStyle: FontStyle.italic),
                  decoration: Style.inputDecoration()),
              suggestionsCallback: (pattern) async {
                return BackendService.getSuggestions(
                  pattern,
                  controller.categories,
                );
              },
              hideSuggestionsOnKeyboardHide: true,
              itemBuilder: (context, suggestion) {
                final dd = suggestion as Map<String, String>;
                return ListTile(
                  title: Text(dd['cat']!),
                );
              },
              onSuggestionSelected: (suggestion) {
                final dd = suggestion as Map<String, String>;
                // ignore: avoid_print
                print(suggestion.toString());
                // ignore: avoid_print
                controller.controllerCategoria.text = dd['cat']!;
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
              'cat': e,
            })
        .toList();
  }
}
