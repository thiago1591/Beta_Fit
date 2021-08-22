List snapshotToList(snapshot) {
  String snapshotString = snapshot.toString();
  snapshotString = snapshotString.substring(1, snapshotString.length-1); //remove caracteres []
  List list =  snapshotString.split(', ');
  return list;
}