// ignore_for_file: file_names

# Logging Conventions for Astro Flux

## Overview
To ensure consistent logging across the project, we've standardized the use of a custom `Logger` class located in `lib/utils/logger.dart`. This logger provides a unified way to log messages at different levels (debug, info, warning, error).

## Usage
### Importing the Logger
```dart
import 'package:astro_flux/utils/logger.dart';
```

### Logging Messages
Use the static methods provided by the `Logger` class to log messages at different levels.

#### Debug
```dart
Logger.debug('This is a debug message');
```

#### Info
```dart
Logger.info('This is an info message');
```

#### Warning
```dart
Logger.warning('This is a warning message', error: exception, stackTrace: stackTrace);
```

#### Error
```dart
Logger.error('This is an error message', error: exception, stackTrace: stackTrace);
```

## Best Practices
- **Consistency**: Always use the `Logger` class for logging messages. Avoid using `print` statements directly.
- **Levels**: Use the appropriate log level (`debug`, `info`, `warning`, `error`) to categorize your logs.
- **Error Handling**: When logging errors, include the exception and stack trace if available.

## Example
```dart
class SomeClass {
  void someMethod() {
    try {
      // Some logic here
    } catch (e, s) {
      Logger.error('An error occurred', error: e, stackTrace: s);
    }
  }
}
```

By following these conventions, we can maintain a clear and consistent logging system that aids in debugging and monitoring the application.