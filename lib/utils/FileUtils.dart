import 'dart:io';

class FileUtils {

  static Future scanFolder(String folderPath) async {
    Directory folder = Directory(folderPath);

    var isFile = FileSystemEntity.isFileSync(folderPath);
  }

}