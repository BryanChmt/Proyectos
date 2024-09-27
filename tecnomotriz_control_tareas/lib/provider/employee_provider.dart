import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tecnomotriz_control_tareas/models/employee_model.dart';

class EmployeeProvider {
  static final String _apiKey = 'wqE6Uf9aqRa9QPw9ZMrtvc9lkyTwFEqe';
  static final String _baseURL = 'simplesolutionscr.com';
  static final String _endpoint = 'tecnomotriz/webservice/service.php';

  Future<Map<String, dynamic>> loginQRCode(String qrCode) async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'registrar_ingreso_tiempo',
      'api_key': _apiKey,
      'qr_code': qrCode
    });

    print('URL: {$url}');

    final response = await http.get(url, headers: {
      'Access-Control-Allow-Origin': '*',
    });

    try {
      EmployeeModel employee = EmployeeModel();

      Map<String, dynamic> decodedResponse = json.decode(response.body);
      bool error = decodedResponse['error'];
      if (!error) {
        employee = EmployeeModel.fromJson(decodedResponse['respuesta'][0]);

        return {'error': false, 'employee': employee};
      } else {
        return {
          'error': true,
          'message':
              'Un error ha ocurrido, el empleado no fue encontrado.\n\nPor favor asegurese de escanear el código QR correctamente.'
        };
      }
    } catch (e) {
      print('An error has occurred: $e');
    } finally {
      print('Responce Status Code: ${response.statusCode}');
    }
  }
}
