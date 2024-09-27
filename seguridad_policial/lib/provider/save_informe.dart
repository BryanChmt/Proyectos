import 'dart:convert';
import 'package:http/http.dart' as http;

class SaveInforme {
  static final String _apiKey = '012948189298389189';
  static final String _baseURL = 'ingeclima.net';
  static final String _endpoint = '/webservice/service.php';

  Future<Map<String, dynamic>> save_informe(
    String provinciadrop,
    String cantondrop,
    String distritodrop,
    String tipolugardrop,
    String direccionsuceso,
    String fechasuceso,
    String horasuceso,
    String avenida,
  ) async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'post_reporte',
      'api_key': _apiKey,
      'provincia': provinciadrop,
      'canton': cantondrop,
      'distrito': distritodrop,
      'tipolugar': tipolugardrop,
      'direccionsuceso': direccionsuceso,
      'fechasuceso': fechasuceso,
      'horasuceso': horasuceso,
      'avenida': avenida,
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
