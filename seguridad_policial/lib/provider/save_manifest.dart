import 'dart:convert';
import 'package:http/http.dart' as http;

class SaveManifest {
  static final String _apiKey = '012948189298389189';
  static final String _baseURL = 'ingeclima.net';
  static final String _endpoint = '/webservice/service.php';

  Future<Map<String, dynamic>> save_manifest(
    String nombre,
    String cedula,
    String telefono,
    String firma,
    String manifest,
  ) async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'post_reporte',
      'api_key': _apiKey,
      'nombre': nombre,
      'cedula': cedula,
      'telefono': telefono,
      'firma': firma,
      'manifest': manifest,
    });

    print('URL: {$url}');

    final response = await http.get(
      url,
      //  headers: {
      //    'Access-Control-Allow-Origin': '*',
      //  }
    );
    print(json.decode(response.body));
    return {'error': false, 'report': json.decode(response.body)};

  }
}
