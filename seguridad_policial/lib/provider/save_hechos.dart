import 'dart:convert';
import 'package:http/http.dart' as http;

class SaveHechos {
  static final String _apiKey = '012948189298389189';
  static final String _baseURL = 'ingeclima.net';
  static final String _endpoint = '/webservice/service.php';

  Future<Map<String, dynamic>> save_hechos(
    String descripcionHechos,
    String diligenciasPoli,
    String asesor,
    String numero,
    String expediente,
    String fechadenotif,
    String fechaenquefuenotif,
    String alerta,
    String invol,
    String oficiales,
  ) async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'post_reporte',
      'api_key': _apiKey,
      'descripcionHechos': descripcionHechos,
      'diligenciasPoli': diligenciasPoli,
      'asesor': asesor,
      'numero': numero,
      'expediente': expediente,
      'fechadenotif': fechadenotif,
      'fechaenquefuenotif': fechaenquefuenotif,
      'alerta': alerta,
      'invol': invol,
      'oficiales': oficiales,
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
