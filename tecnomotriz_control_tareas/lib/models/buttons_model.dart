class CarModel {
  String modelo;
  String id;
  String placa;
  String marca;
  String annio;
  String idCliente;
  String nombre;
  String apellidos;

  CarModel(
    this.id,
    this.placa,
    this.marca,
    this.modelo,
    this.annio,
    this.idCliente,
    this.nombre,
    this.apellidos,
  );

  CarModel.fromJson(Map<String, dynamic> json) {
    modelo = json['Modelo'];
    id = json['IdVehiculo'];
    placa = json['Placa'];
    marca = json['Marca'];
    annio = json['Annio'];
    idCliente = json['IdCliente'];
    nombre = json['NombreCliente'];
    apellidos = json['ApellidosCliente'];
  }
}
