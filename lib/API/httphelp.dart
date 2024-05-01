const host = "";
Uri buildUri(String path){
  return Uri.parse('http://$host$path');
}