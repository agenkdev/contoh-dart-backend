import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'app/kontak/kontak_app.dart';
import 'config/route_name.dart';

void main() async{
  final ip = InternetAddress.anyIPv4.address;
  final port = 3000;
  final isDebug = true;

  // menggunakan hot reload
  isDebug ? withHotreload(() => serverApp(ip: ip, port: port)) : serverApp(ip: ip, port: port);

  if(isDebug){
    // print host dan port pada console debug
    print('server run on http://$ip:$port');
  }
}

Future<HttpServer> serverApp({required String ip, required int port}) async{

  //inisialisasi router dan request router yang tidak diinginkan
  final app = Router(notFoundHandler: (req)=> Response.notFound('${req.method} ${req.requestedUri.path} request not found.'));

  // tambahkan method di sini
  /* ----------------------------------------- */
  // contoh penggunaan routename dan handle request pada method POST
  app.post(RouteName.kontak, kontak);
  /* ----------------------------------------- */

  // start http server
  return io.serve(app, ip, port);
}

