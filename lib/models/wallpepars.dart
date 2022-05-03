class Wallpaper {
  final String id;
  final String name;
  final String ingUrl;
  final List<String> subCategoryes;
  final String discription;
  bool like=false;
  DateTime? viewTime;
  DateTime? downloadTime;
  var img;




    Wallpaper({
    required this.subCategoryes,
    required this.id,
    required this.name,
    required this.ingUrl,
    required this.discription,
  });
  Like()
  {
    if(like)
    {
      like=false;
    }
    else
    {
      like=true;
    }
  }
}
