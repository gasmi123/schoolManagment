// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
// ignore: library_prefixes
import 'package:http/http.dart' as Http;
// ignore: library_prefixes
import 'package:path/path.dart' as Path;

import '../funcion/chooc_internat.dart';
import 'state_raqust.dart';

class ReadUpdateDeleteInsertView {
  Future<Either<StateRaqust, Map>> postData(String link, Map data) async {
    try {
      if (await choocInternat()) {
        var respones = await Http.post(Uri.parse(link), body: data);

        if (respones.statusCode == 200 || respones.statusCode == 201) {
          var responesbody = jsonDecode(respones.body);

          return Right(responesbody);
        } else {
          return const Left(StateRaqust.fulerServer);
        }
      } else {
        return const Left(StateRaqust.ofLineInternat);
      }
    } catch (e) {
      print(e.toString());
      return const Left(StateRaqust.fuler);
    }
  }

  Future<Either<StateRaqust, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    namerequest ??= "file";

    var uri = Uri.parse(url);

    var request = Http.MultipartRequest("POST", uri);
    //request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();

      var stream = Http.ByteStream(image.openRead());

      stream.cast();
      var multipartFile = Http.MultipartFile(namerequest, stream, length,
          filename: Path.basename(image.path));

      request.files.add(multipartFile);
    }

    // add Data to request

    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await Http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StateRaqust.fuler);
    }
  }

  Future<Either<StateRaqust, Map>> addRequestWithImageMulte(
      url, data, List<File?> images,
      [String? namerequest]) async {
    namerequest ??= "file";

    var uri = Uri.parse(url);

    var request = Http.MultipartRequest("POST", uri);
    //request.headers.addAll(_myheaders);
    for (int i = 0; i < images.length; i++) {
      if (images[i] != null) {
        var length = await images[i]!.length();

        var stream = Http.ByteStream(images[i]!.openRead());
        stream.cast();
        var multipartFile = Http.MultipartFile(
            "$namerequest${i + 1}", stream, length,
            filename: Path.basename(images[i]!.path));

        request.files.add(multipartFile);
      }
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request

    var myrequest = await request.send();
    // For get Response Body
    var response = await Http.Response.fromStream(myrequest);

    if (response.statusCode == 200 || response.statusCode == 201) {
      //  print(response.statusCode);

      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StateRaqust.fuler);
    }
  }
}
