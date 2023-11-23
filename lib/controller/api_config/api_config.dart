enum Environment {
  DEV,
  BETA,
  PRODUCTION,
}

class ApiConfig {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.developConstants;
        break;
      case Environment.BETA:
        _config = _Config.betaConstants;
        break;
      case Environment.PRODUCTION:
        _config = _Config.productionConstants;
        break;
    }
  }

  static get serverUrl {
    return _config[_Config.SERVER_URL];
  }

  static get serverKey {
    return _config[_Config.SERVER_API_KEY];
  }

  static get name {
    return _config[_Config.APP_NAME];
  }

  static get environment {
    return _config[_Config.ENVIRONMENT];
  }

  static bool get isDebug {
    return _config[_Config.IS_DEBUG];
  }

  static bool get isCrashlyticsEnabled {
    return _config[_Config.IS_CRASHLYTICS_ENABLED];
  }
}

class _Config {
  static const SERVER_URL = "SERVER_URL";
  static const SERVER_API_KEY = "SERVER_API_KEY";
  static const IS_DEBUG = "IS_DEBUG";
  static const IS_CRASHLYTICS_ENABLED = "IS_CRASHLYTICS_ENABLED";
  static const APP_NAME = "APP_NAME";
  static const ENVIRONMENT = "ENVIRONMENT";


  static Map<String, dynamic> developConstants = {
    SERVER_URL: "http://universities.hipolabs.com",
    SERVER_API_KEY: "",
    IS_DEBUG: true,
    IS_CRASHLYTICS_ENABLED: true,
    APP_NAME: 'Test App',
    ENVIRONMENT : 'Dev'
  };

  static Map<String, dynamic> betaConstants = {
    SERVER_URL: "http://universities.hipolabs.com",
    SERVER_API_KEY: "",
    IS_DEBUG: true,
    IS_CRASHLYTICS_ENABLED: true,
    APP_NAME: 'Test App',
    ENVIRONMENT : 'Beta'
  };

  static Map<String, dynamic> productionConstants = {
    SERVER_URL: "http://universities.hipolabs.com",
    SERVER_API_KEY: "",
    IS_DEBUG: true,
    IS_CRASHLYTICS_ENABLED: true,
    APP_NAME: 'Test App',
    ENVIRONMENT: 'Production'
  };
}
