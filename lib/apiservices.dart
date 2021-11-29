import 'dart:convert';
import 'dart:io';
import 'package:flutter_progmob_2021/model.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;

class ApiServices{
  final String baseUrl = "https://argouchiha.000webhostapp.com";

  Client client = Client();

  Future<DashboardSI?> getDashboard() async{
    final response = await client.get("$baseUrl/api/progmob/dashboard/721600012");
    if (response.statusCode == 200){
      return DashboardSI.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<List<Mahasiswa>?> getMahasiswa() async{
    final response = await client.get("$baseUrl/api/progmob/dashboard/721600012");
    if (response.statusCode == 200){
      return mahasiswaFromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> createMhs(Mahasiswa Data) async {
    final response = await client.post(
      "$baseUrl/api/progmob/mhs/create",
      headers: {"content-type": "application/json; multipart/form-data"},
      body: mahasiswaToJson(data),
    );
    if (response.statusCode==200){
      return true;
    } else{
      return false;
    }
  }

  Future<bool> createMhsWithFoto(Mahasiswa data, File file, String filename) async{
    var request = http.MultipartFileRequest(
      'POST',
      Uri.parse("$baseUrl/api/program/mhs/createwithfoto")
    );

    Map<String,String> headers={
      "Content-type": "multipart/form-data"
    };

    request.headers.addAll(headers);
    request.files.add(
      http.MultipartFile(
        "foto",
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename
      )
    );
    request.fields.addAll({
      "nama" : data.nama,
      "nim" : data.nim,
      "alamat" : data.alamat,
      "email" : data.email,
      "nim_progmob" : data.nim_progmob,
    });

    var response = await request.send();
    if(response.statusCode==200){
      return true;
    } else{
      return false;
    }
  }

  Future<bool> updateMhsWithFoto(Mahasiswa data, File file, String nimcari) async{
    String isfotoupdate = "0";
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/api/program/mhs/updatewithfoto")
    );
    Map<String,String> headers={
      "Context-type":"multipart/form-data"
    };
    request.headers.addAll(headers);

    if(file !=null){
      request.files.add(
        http.MultipartFile(
          "foto",
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: file.path
        )
      );
      isfotoupdate = "1";
    }
    request.fields.addAll({
      "nama":data.nama,
      "nim":data.nim,
      "alamat":data.alamat,
      "email":data.email,
      "nim_progmob":data.nim_progmob,
      "nim_cari":nimcari,
      "is_foto_update":isfotoupdate
    });
    var response = await request.send();
    if(response.statusCode==200){
      return true;
    } else{
      return false;
    }
  }
  Future<bool> deleteMhs(String nim) async{
    final response = await client.post(
      "$baseUr/api/progmob/mhs/delete",
      headers: {"context-type":"application/json"},
      body: jsonEncode(<String,String>{
        "nim":nim,
        "nim_progmob":"72190338"
        })
    );
      if(response.statusCode==200){
      return true;
      } else{
        return false;
    }
  }


}