import 'package:dio/dio.dart';
const ipv4 = '192.168.32.119';
const url = 'http://$ipv4/penjualan_tempe/crud-laravel-10/public/api';
BaseOptions options = BaseOptions(
  baseUrl: url,
);
final diohttp = Dio(options);