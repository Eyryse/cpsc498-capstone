#! /bin/sh

cd frontend
flutter upgrade
flutter packages get
flutter run -d chrome
