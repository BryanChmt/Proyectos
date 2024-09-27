import 'dart:convert';
import 'package:http/http.dart' as http;

class SaveOrden {
  static final String _apiKey = '012948189298389189';
  static final String _baseURL = 'ingeclima.net';
  static final String _endpoint = '/webservice/service.php';

  Future<Map<String, dynamic>> save_orden(
    String cliente,
    String telefono,
    String seguros,
    String valuSeguro,
    String valuTaller,
    String marca,
    String vehiculo,
    String tipoVehiculo,
    String placa,
    String vin,
    String color,
    String modelo,
    String comentario,

  ) async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'post_reporte',
      'api_key': _apiKey,
      'cliente': cliente,
      'telefono': telefono,
      'valuSeguro': valuSeguro,
      'valuTaller': valuTaller,
      'placa': placa,
      'vin': vin,
      'color': color,
      'modelo': modelo,
      'comentarios': comentario,
      'seguros': seguros,
      'marca': marca,
      'vehiculo': vehiculo,
      'tipoVehiculo': tipoVehiculo,
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
