# Bloc

Contains important Blocs of the application.

## Base Bloc

- All other Bloc must inherit the Base Bloc.

## Common Bloc

- Integrated into Base Bloc, should not be used directly.
- Features: handle loading status, errors, toast.

## App Bloc

- App Bloc is a Bloc provided in MaterialApp, all screens can be used.
- Manage basic information of the application. For example, language, theme mode,...
- Information is automatically stored locally and retrieved when the application is opened.

## Auth Bloc

- Auth Bloc is a Bloc provided in MaterialApp, all screens can be used.
- Manage authentication and authorization profiles in the application.



