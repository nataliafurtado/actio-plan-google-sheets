import 'dart:convert';

import 'package:google_action_plan/modules/list/domain/entities/project.dart';
import 'package:google_action_plan/services/cache/cache.dart';

class ProjectCache {
  final Cache cache;

  ProjectCache(this.cache);

  final String projectKey = 'projectKey';
  final String sheetId = 'sheetId';
  final String responsableListKey = 'responsableList';
  final String categoriesKey = 'categories';

  saveProject(Project project) {
    cache.addToCache(
      projectKey,
      json.encode(
        project.toJson(),
      ),
    );
  }

  Project getProject() {
    return Project.fromJson(
      json.decode(
        cache.getFromCache(projectKey),
      ),
    );
  }

  saveSheetId(String id) {
    cache.addToCache(
      sheetId,
      id,
    );
  }

  String getSheetId() {
    return cache.getFromCache(sheetId);
  }

  saveResponsablesList(List<String> responsablesList) {
    cache.addToCache(
      responsableListKey,
      responsablesList,
    );
  }

  List<String> getResponsablesList() {
    return cache.getFromCache(responsableListKey);
  }

  saveCategories(List<String> categoriesList) {
    cache.addToCache(
      categoriesKey,
      categoriesList,
    );
  }

  List<String> getCategories() {
    return cache.getFromCache(categoriesKey);
  }
}
