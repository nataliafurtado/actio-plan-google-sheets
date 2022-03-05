import 'package:google_action_plan/modules/list/domain/entities/project.dart';
import 'package:google_action_plan/services/cache/cache.dart';

class ProjectCache {
  final Cache cache;

  ProjectCache(this.cache);

  final String projectKey = 'projectKey';

  saveProject(Project project) {
    cache.addToCache(projectKey, project.toJson());
  }

  Project getProject() {
    return Project.fromJson(
      cache.getFromCache(projectKey),
    );
  }
}
