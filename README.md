# Hookah_project

На репозитории находятся только файлы с кодом во избежание серьёзных проблем при возникновении конфликтов.

Ссылка на диск - https://drive.google.com/drive/folders/1XGFqbZwIgW4rFYCWRt_fViyfVH609pHD?usp=sharing

Для успешного запуска проекта необходимо выполнить следующие инструкции:
1. Создать проект в <b>Xcode</b>.
2. Удалить все сториборды, <b>SceneDelegate.swift</b>.
3. Понизить версию до IOS 12.0 и сделать IPhone единственной платформой для запуска, исключительно с портретной ориентацией.
4. Удалить из <b>Info.plist</b> <em>Scene Delegate Manifest</em>.
5. Подключить к проекту Firebase.
6. Скачать используемые картинки с диска.

Настройки Firebase: (работа производится в папке вашего проекта, там же где лежит файл <em>.xcodeproj</em>)
1. Установить Cocoa Pods.
2. Скачать с диска GoogleInfo.plist и добавить его в проект.
3. Создать <b>pod file</b>. (<b>pod init</b> в командной строке)
4. Добавить в него строки <b>pod 'Firebase/Core'</b>, <b>pod 'Firebase/Auth'</b>, <b>pod 'Firebase/Firestore'</b>, <b>pod 'Firebase/Storage'</b>, <b>pod 'Kingfisher', '~> 5.0'</b>.
5. Выполнить команду <b>pod install</b>
6. Изменить версию в pod файле на ios 12.0
7. Выполнить команду <b>pod install</b>
8. Если Xcode пожалуется на несовместимость версий позволить ему исправить это.
9. С этого момента проект нужно запускать из файла с расширением <em>.xcodeworkspace</em>.
