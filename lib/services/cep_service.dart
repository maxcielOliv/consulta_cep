import 'package:consulta_cep/data/model/cep.dart';
import 'package:dio/dio.dart';

  Future<Cep> consultar(String cep) async {
  final dio = Dio();
  final String path = "https://viacep.com.br/ws/";

  Response response;
  response = await dio.get("$path$cep/json/");
  final cepResponse = Cep.fromJson(response.data);
  return cepResponse;
}