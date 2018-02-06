part of umiuni2d_io;

abstract class Entry {
  String get name;
  String get path;
  Future<bool> isDir();
  Future<bool> isFile();
  Future<bool> exists();
}

abstract class Directory extends Entry {
}

abstract class File extends Entry {
  Future<int> writeAsBytes(List<int> buffer, int offset);
  Future<List<int>> readAsBytes(int offset, int length);
  Future<int> getLength();
  Future<int> truncate(int fileSize);
  Future<File> close();
}

abstract class FileSystem {
  Future<FileSystem> checkPermission();
  Future<FileSystem> mkdir(String path);
  Future<FileSystem> rm(String path,{bool recursive: false});
  Stream<Entry> ls(String path);
  Future<bool> isFile(String path);
  Future<bool> isDirectory(String path);
  Future<Entry> wd();
  Future<FileSystem> cd(String path);
  Future<File> open(String path);
  Future<Entry> getHomeDirectory();
}