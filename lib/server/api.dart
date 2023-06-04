import 'package:eye_diagnose/model/result_data.dart';
import 'package:gsheets/gsheets.dart';

class SheetAPI {
  static const credentialsSheet = r'''
{
  "type": "service_account",
  "project_id": "nodes-test-data",
  "private_key_id": "3300e40e186eb2354db03c1091bbcd83495bc088",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCqIxdQ7pGOxIys\nbci7fPpRjZwL9pCZXmq06ra4qLWenRmM6IUqenhbLptN54kGrr0Rsit9Kr/xCXis\nO8K5qWpe7nVBR7L7fY21eQolT/HbRmF5speEblYRW+3BDCpZFpIQdrkm4UMH6Z9P\nwj6aRQRhf3wCIJiT61C8ApdJ6/OuyEfzFyFo4ATEqErv8d8RnIfW0aJAIehIX69Y\nigRNYLHLUHSHMdYOem5Y0VmsZhp61osAQ7XYzH+OcfOOqYrocox2xGesaOtMCsG6\nERUAsfQSy3NSqMpy2LFVt50NDRRk8DoZWnepDEUEP+LUBanXgbTFylxL47YUGVk9\n95wPUjw3AgMBAAECggEASMpgpGCdZ+6RnQgPVJ/A3PlwJPIlpWhu0N6GtHSB182w\n68djiewB6EkFaww/ZNuHyrVmw9NxcWey+EVNJ2/jMaBmDDrnyY9K/LQ/cf1FJaJz\n+8Q77Q3jxuOE0g4pZBoy/dY9mvPPYOhEH7SkYg5bNHd9j89wWADadsXJAnhvtnwI\nmMzEGUryUktXMVZ5tk5W37ctbSkCi8Ylnr9yEatNAFdG8+yJYfzjHaY1Tzqf6LY9\nwjujPgoJatCPNlIH2jTDWSDgNv5nGr4d2yh5j/+hL50GqydQn/MGMdUlg+nmkVnD\nWiJG5V4VZVl/UY98PTeptOr18vqXSKnfXjo1jM5wCQKBgQDiYJLtoNFg5BA63Ruq\nfFBow6O/akmdB1+PYD6iHNGzUoBMRytqEIvjWj+tmO3JKpHYos+K4zo2m1si6YL4\nXPj5loJF9CbIQQulueOEtdf4bK6KcTsHuT/ES6U1lK7JDHTFRRds4g6nZneWI1hj\nfaKf74JqGKgosE/d7HrxvV6H4wKBgQDAZoYqio5f1AQICGnEKnAOVGnjV/IGfy32\ntjW813/zWHZlaTvr8jAfsS3TSThAC54RQBHCQfz3azSY6B43fzUeuS3lbO3WYDcZ\nXA0zKR99NA6qAkBzJO87WZCdtjijIS/l5dKRUCvVqY1ZasKRcKbp2Ncr/D75ROqm\ntoQNupxinQKBgQDZkMtlSmww3L+kcyDFx1hYd76GlxZMrutulqdbkqsP1zirFrNo\n6qInTXNp2lKeRiWJuWASMbSfCsyaTyaqoGBBMB/gL3ieebVB/9fkkggRIBLXx19e\nWvIoLDOJvW4Gl8waU/7hjJlc1aQVTb8DT5necIg8g5oKEPmRZlf6wW961QKBgAqE\nEAU3OXznW6kMvKsqHqHJ31e7sNDGFr8LSnid1rJ4PVBhphLJU/QHfRe1QsvNVsBe\nnhnd/XOQenl5Bl3GKCMbv/RwNben3psWOup27u+q7rpAEUG53RGDXbIhCYtw/usz\n2oRyu1KcR8uBWE0WuSjC30/aI58AM0sVYrZVYsLJAoGAQt/34jOlQSGlWyuDAF7s\nnSMcKkl2p2PyC/t9cOzQ9+oxq2jP3uq/mCef76lgyKr8HR7j3O0QfdL6qqnZ8jNj\nEIVPzvHU171RD5ENoAiU7R2vpwHGtoka6I/KlqYLzTxCNjx6ilMU+B9hV4SPYeYk\n46ZLqf3DdCEFOijtdlMoKgk=\n-----END PRIVATE KEY-----\n",
  "client_email": "nodes-test@nodes-test-data.iam.gserviceaccount.com",
  "client_id": "113295026692751908281",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/nodes-test%40nodes-test-data.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
  static const gSheetid = '1Su3MXPynx82WhNZy2BfYw8e-bsyUYrx8F2nrTa9ntM0';
  static final gsheets = GSheets(credentialsSheet);
  static Worksheet? dataSheet;

  static Future init() async {
    try {
      final spreadsheet = await gsheets.spreadsheet(gSheetid);
      dataSheet = await _getWorksheet(spreadsheet, title: 'Data');
      final firstRow = NodeTestData.getFields();
      dataSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('init Error: $e');
    }
  }

  static Future<Worksheet> _getWorksheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    dataSheet!.values.map.appendRows(rowList);
  }
}
