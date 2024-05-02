const host = "10.0.2.2:8080";
Uri buildUri(String path) {
  return Uri.parse('http://$host$path');
}
