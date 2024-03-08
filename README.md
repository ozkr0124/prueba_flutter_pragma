# prueba_flutter_pragma

Para iniciar el proyecto debe de tener en cuenta las siguientes recomendaciones

### Versiones
- Flutter 3.19.2
- Dart 3.3.0 • DevTools 2.31.1

### Ejecución
1. Se debe de ejecutar el comando en la termial o cmd para descargar las dependecias necesarias para el proyecto
```sh
flutter pub get
```

2. Si se va a ejecutar(*run*) el proyecto desde la terminal o cmd debe considerar pasar un parametro adicional que son las variables de entorno, este se ejecuta con siguiente comando

```sh
flutter run --dart-define-from-file="config.json"
```

> *Nota: Recurde que debe de tener un emulador iOS o Android inicializado, para poder ejecutar desde linea de comando*

3. Si se va a ejecutar desde el IDE **VSCODE**, dentro del proyecto se encuentra una carpeta ***.vscode*** que contiene el archivo ***launch.json***, este archivo contiene dos configuraciones para iniciar el proyecto desde el Dubug de VSCODE ya sea para emulador iOS o Android, debe de tener en cuenta que se de asignar el ID del device para ejecurtarlo.
- Para obtner el id del disposivo se debe de ejecutar el siguiente comando en la terminal o cmd
```sh
flutter devices
```
- Una vez se finalice de ejecutar el comando recibira un resultado similar a este
```sh
Found 2 connected devices:
  iPhone SE (3rd generation) (mobile) • XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX • ios            • com.apple.CoreSimulator.SimRuntime.iOS-17-4 (simulator)
  Chrome (web)                        • chrome                               • web-javascript • Google Chrome 122.0.6261.112

No wireless devices were found.

Run "flutter emulators" to list and start any available device emulators.

If you expected another device to be detected, please run "flutter doctor" to diagnose potential issues. You may also try increasing the time to wait for connected devices with the "--device-timeout" flag. Visit https://flutter.dev/setup/ for
troubleshooting tips.
```
- El id es la cadena de caracteres seguida del nombre del dispositivo, una vez obtenga este dato debera reemplazar los siguientes datos en el archivo ***launch.json***
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Android",
            "request": "launch",
            "type": "dart",
            "deviceId": "xxxxxxxx-xxxx", <-- ID Dispositivo Android
            "program": "lib/main.dart",
            "showMemoryUsage": true,
            "args": [
                "--dart-define-from-file",
                "config.json"
            ]
        },
        {
            "name": "iPhone",
            "request": "launch",
            "type": "dart",
            "deviceId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX", <-- ID Dispositivo iOS
            "program": "lib/main.dart",
            "showMemoryUsage": true,
            "args": [
                "--dart-define-from-file",
                "config.json"
            ]
        },
    ]
}
```
- Despues de realizar este cambio ahora si puede acceder a la pestaña de Run And Debug de VSCODE y en la parte superior encontrara un selector en donde puede escoger entre el dispositivo de Android o iPhone para ejecutar la app

### Notas
> - Se limitó la petición en la API para que solo se obtengan 20 registros, ya que la API se encuentra restringida para poder realizar peticiones a cantidas mas grande.
> - Como la API principal no obtiene la imagen dentro de la petición general, hubo que realizar una petición única por cada regsitro para poder capturar la imagen correspondiente al gato.