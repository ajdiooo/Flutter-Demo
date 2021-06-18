Demo for the flutter presentation.

```
                    1. Create a new flutter project and enable Android, IOS, and WEB support.
(pubspec.yaml)      2. Import http package from pub.dev.
                    3. Generate API for the weather data.
                        API and the documentation can be both seen here: https://openweathermap.org/
(main.dart)         4. Create the needed variables that will handle the needed datas, require them to be non-null.
(main.dart)         5. Address the specific json data and assign them to their variables.
                    6. Create new directory for widgets under lib folder and create two (2) new .dart files for the main_ui widget and weather_tile (listview) widgets.
(main_widget.dart)  7.  Create the needed variables on the main_ui and require them to be non-null, same with what we did on the main.dart.
(main_widget.dart)  8. Construct the UI using two (2) parts, mainly the Container and the ListView. Wrap the ListView into Expanded widget.
(main_widget.dart)  9. Assign the declared variables on the ListView.
(weather_tile.dart) 10. Create and design a ListView widget that would require icon, title, and subtitle.
```