import 'package:shelf/shelf.dart';

kontak(Request request) async{
  // mengambil data yang dikirim oleh client
  final payload = await request.readAsString();
  // mengirim kembali pada client
  return Response.ok(payload);
}
