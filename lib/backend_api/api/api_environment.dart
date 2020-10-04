enum Environment { INT, VAL, PP, PROD }

extension EnvironmentExtension on Environment {
  String get rawValue => toString().split('.').last;
}

const environmentsBaseUrl = <Environment, String>{
  Environment.INT: 'https://int5-api.tixngo.io/v3/organizer',
  Environment.VAL: 'https://val5-api.tixngo.io/v3/organizer',
  Environment.PP: 'https://pp5-api.tixngo.io/v3/organizer',
  Environment.PROD: 'https://api.tixngo.io/v3/organizer'
};
