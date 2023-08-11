import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: unused_import
import 'package:genie_money/Model/SignUpModel.dart';

import 'package:genie_money/Model/pincode_model.dart';
import 'package:genie_money/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/DemoModel.dart';
import '../Model/bank_details_model.dart';
import '../Model/employment_details_model.dart';
import '../Model/personal_details.dart';
import '../Model/user_proof_model.dart';
import '../home.dart';

class NetworkCall {
  String gg ="cs";

  Future<bool> isNetworkConnected() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup("www.google.com");
      if (result.isNotEmpty && result[0].address.isNotEmpty) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } on SocketException catch (exception) {
      isConnected = false;
      print(exception);
    }
    return isConnected;
  }

  Future<bool> fetchRegistrationPosts(
      String email,
      String mobile_no,
      String password,
      String os,
      String model,
      String latitude,
      String longitude,
      String install_location,
       type,
      String usertype,
      String refer,
      String imei,


      BuildContext context) async {
    bool isConnected = await isNetworkConnected();
    // ignore: unused_local_variable
    String selectedTypeNew=usertype;
    if (isConnected) {
      if(usertype=="Merchant"){
        selectedTypeNew="merchant";
      }else if(usertype=="Associate Partner"){
        selectedTypeNew="associate partner";
      }else if(usertype=="Partner"){
        selectedTypeNew="partner";
      }


      final body = {
        "mobile_no": mobile_no,
        "email": email,
        "os": os,
        "phone_model": model,
        "lat": latitude,
        "long": longitude,
        "install_location": install_location,
        "instatallation_date": "",

        "code_name": "",
        "password": password,
        "user_type": usertype,
        "admin_type":type,
        "imei_no":imei,
        // ignore: equal_keys_in_map
        "code_name":"",
        "refer_by":refer
      };


      final response;

      if (type == "Customer") {
        print("Customur");

        response = await http.post(
          Uri.parse(
              'https://geniemoneyy.com/genie_money/public/index.php/appregister'
          ),
          //headers: {'content-type': 'application/json',},
          body: body,
        );


      } else {
        print("not customer");


        response = await http.post(
          Uri.parse(
                  'https://geniemoneyy.com/genie_money/public/index.php/bsregister'
//'http://165.22.219.135/geniemoney/public/index.php/appcompanyregister'
          ),
          body: body,
        );
      }

      print(response.body);
      var response_server = jsonDecode(response.body);
      // ignore: unused_local_variable
      var modell = DemoModel.fromJson(response_server);
    /*  String? stat = modell.userdetail!.userRefer.toString();

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('user',stat.toString()??'');
      _createToast(stat.toString());
      print("lalalalala"+stat.toString());
*/



      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {

        if (response_server["status"] == 201) {


          _createToast("User registered successfully, Please login");
          print("created");




          return true;

        } else {
          _createToast("Failed to register User");
          print("not created");
          return false;
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Email Or Phone number already exist");
        } else {
          _createToast("Failed to register User");
        }
        return false;
      }
    } else {
      _createToast("Please connect to internet");
      return false;
    }
    /*   var refer = SignUpModel.fromJson(json).userdetail!.userRefer.toString();
    print(refer);*/
  }

  Future<bool> fetchLoginPosts(String username, String password,
      String otp, String type, String empcode ,BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      var body = {"username": username, "password": password, "otp": otp};

      final response;

      if (type == "Customer") {
        body = {"username": username, "password": password, "otp": otp};

        response = await http.post(
          Uri.parse(
              'https://geniemoneyy.com/genie_money/public/index.php/applogin'),
          body: body,
        );
      } else if(type =="Employee"){
        body = {"username": username, "password": password, "otp": otp,"employee_code":empcode};
        print("fetech data : "+body.toString());
        response = await http.post(
          Uri.parse(
              'https://geniemoneyy.com/genie_money/public/index.php/employeelogin'
            //'http://165.22.219.135/geniemoney/public/index.php/appcompanylogin'
          ),
          body: json.encode(body),
        );
      }else{
        body = {"username": username, "password": password, "otp": otp};
        response = await http.post(
          Uri.parse(
            //'http://165.22.219.135/genie_money/public/index.php/employeelogin'
              'https://geniemoneyy.com/genie_money/public/index.php/businesslogin'
          ),
          body: json.encode(body),
        );
      }

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Constants.userid = response_server['userdetail']['id'];
          Constants.name = response_server['userdetail']['full_name']??"";
          Constants.email = response_server['userdetail']['email'];
          Constants.phone = response_server['userdetail']['phone'];
          Constants.refer = response_server['userdetail']['user_refer'];
          Constants.point = response_server['userdetail']['point'];
          Constants.admin_type = response_server['userdetail']['admin_type'];
          Constants.category = response_server['userdetail']['category'];
          Constants.type = type;

          await prefs.setBool('isLoggedIn', true);
          await prefs.setString("userid", Constants.userid);
          await prefs.setString("name", Constants.name);
          await prefs.setString("email", Constants.email);
          await prefs.setString("phone", Constants.phone);
          await prefs.setString("refer", Constants.refer);
          await prefs.setString("type", Constants.type);
          await prefs.setString("point", Constants.point);
          await prefs.setString("admin_type", Constants.admin_type);
          await prefs.setString("category", Constants.category);

          _createToast("Login Successful");

          return true;
        } else {
          if (response_server['status'] == 404) {
            _createToast(response_server["messages"]["error"]);
          } else {
            _createToast("Something wend wrong");
          }
          return false;
        }
      } else {
        if (response.statusCode == 404) {
          _createToast(response_server["messages"]["error"]);
        } else {
          _createToast("Something wend wrong");
        }
        return false;
      }
    } else {
      _createToast("Please connect to internet");
      return false;
    }
  }

  Future<bool> generateOtp(String username, String password,
      String type,String empcode,BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      var body = {"username": username, "password": password};

      final response;

      if (type == "Customer") {
        response = await http.post(
          Uri.parse('https://geniemoneyy.com/genie_money/public/index.php/appotp'),
          body: body,
        );
      } else {
        if(type == "Business Partner"){
          body = {"username": username, "password": password};

          response = await http.post(
            Uri.parse(
                'https://geniemoneyy.com/genie_money/public/index.php/botp'
            ),
            body: body,

            // body: jsonEncode(body),
          );
        }else if(type == "Employee"){
          body = {"username": username, "password": password,"employee_code":empcode};
          print("request : "+body.toString());
          response = await http.post(
            Uri.parse(
                'https://geniemoneyy.com/genie_money/public/index.php/appcompanyotp'
            ),
            body: body,
          );
        }else{
          response = await http.post(
            Uri.parse(
                'https://geniemoneyy.com/genie_money/public/index.php/appcompanyotp'
            ),
            body: body,
          );
        }

      }

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          if (username.isNotEmpty) {
            _createToast("OTP Sent to " + username);
          }
          return true;
        } else {
          _createToast("Login Failed");
          return false;
        }
      } else {
        if (response.statusCode == 404) {
          // String msg = ;
          // final message = jsonDecode(msg);
          _createToast(response_server["messages"]["error"]);
        } else {
          _createToast("Something went wrong");
        }
        return false;
      }
    } else {
      _createToast("Please connect to internet");
      return false;
    }
  }

  Future<bool> resendOtp(String username, String password,
      BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = {"username": username, "password": password};

      final response = await http.post(
        Uri.parse('https://geniemoneyy.com/genie_money/public/index.php/appotp'),
        body: body,
      );

      if (response.statusCode == 201) {
        final response_server = json.decode(response.body);
        if (kDebugMode) {
          print(response_server);
        }
        if (response_server['status'] == 201) {
          if (username.isNotEmpty) {
            _createToast("OTP Sent to " + username);
          } else {
            _createToast("OTP Sent to " + username);
          }
          return true;
        } else {
          _createToast("Login Failed");
          return false;
        }
      } else {
        _createToast("Login Failed");
        return false;
      }
    } else {
      _createToast("Please connect to internet");
      return false;
    }
  }

  Future<Pincode_model> getStateAndCity(String pincode,
      BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final response = await http.get(
        Uri.parse('http://www.postalpincode.in/api/pincode/' + pincode),
      );

      if (response.statusCode == 200) {
        final response_server = json.decode(response.body);
        if (kDebugMode) {
          print(response_server);
        }
        if (response_server['Status'] == "Success") {
          return Pincode_model.fromJson(json.decode(response.body));
        } else {
          _createToast("Something went wrong");
          throw Exception('Failed to load album');
        }
      } else {
        _createToast("Something went wrong");
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }



  Future<PersonalDetails> getPersonalDetails() async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final response = await http.get(
        Uri.parse(
            'https://geniemoneyy.com/genie_money/public/index.php/getpersonalinfo?userid=' +
                Constants.userid),
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          return PersonalDetails.fromJson(json.decode(response.body));
        } else {
          _createToast("No Data Found");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("No Data Found");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<void> update_profile(var basicInfo, var residentialinfo,
      var references, String from, BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      /*final body = {
        "userid": Constants.userid,
        "basicinfo": jsonEncode(basicInfo),
        "residentialinfo": jsonEncode(residentialinfo),
        "references": jsonEncode(references)
      };*/

      final body = {
        "userid": Constants.userid,
        "basicinfo": basicInfo,
        /*"residentialinfo": residentialinfo,
        "references": references*/
      };

      print("request : "+body.toString());

      try{
        var response = await http.post(Uri.parse('http://165.22.219.135/genie_money/public/index.php/updatepersonalinfo'),
          body: body,
        );
        print("response : "+response.body);

        final response_server = json.decode(response.body);
        if (kDebugMode) {
          print(response_server);
        }

        if (response.statusCode == 201) {
          if (response_server['status'] == 201) {
            _createToast("Details Updated Successfully");
            if (from == "3") {
              Route newRoute = MaterialPageRoute(
                  builder: (context) => const Home());
              Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
            }
          } else {
            _createToast("Failed to update Details");
            throw Exception('Failed to load album');
          }
        } else {
          if (response.statusCode == 404) {
            _createToast("Failed to update Details");
          } else {
            _createToast("Something went wrong");
          }
          throw Exception('Failed to load album');
        }

      }catch(e){
        print(e);
      }



    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<EmploymentDetailsModel> getEmploymentDetails() async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final response = await http.get(
        Uri.parse(
            'https://geniemoneyy.com/genie_money/public/index.php/getuserempdata?userid=' +
                Constants.userid),
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          return EmploymentDetailsModel.fromJson(json.decode(response.body));
        } else {
          _createToast("No Data Found");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("No Data Found");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<void> update_employment(var employmentdetail,
      BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = {
        "userid": Constants.userid,
        "employmentdetail": jsonEncode(employmentdetail)
      };

      final response = await http.post(
        Uri.parse(
            'https://geniemoneyy.com/geniemoney/public/index.php/updatemploymentdetail'),
        body: body,
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          _createToast("Details Updated Successfully");
          Route newRoute = MaterialPageRoute(
              builder: (context) => const Home());
          Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
        } else {
          _createToast("Failed to update Details");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Failed to update Details");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<void> update_bank(var bankDetails, BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = {
        "userid": Constants.userid,
        "bankdetail": jsonEncode(bankDetails)
      };

      final response = await http.post(
        Uri.parse(
            'https://geniemoneyy.com/geniemoney/public/index.php/updatbankdetail'),
        body: body,
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          _createToast("Details Updated Successfully");
          Route newRoute = MaterialPageRoute(
              builder: (context) => const Home());
          Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
        } else {
          _createToast("Failed to update Details");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Failed to update Details");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<BankDetailsModel> getbankDetails() async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final response = await http.get(
        Uri.parse(
            'https://geniemoneyy.com/geniemoney/public/index.php/getbankdetail?userid=' +
                Constants.userid),
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          return BankDetailsModel.fromJson(json.decode(response.body));
        } else {
          _createToast("No Data Found");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("No Data Found");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<void> update_proofs(String ud_id, String ud_type, String ud_doctype,
      File _file, BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      String mimeType = "";
      if (_file.existsSync()) {
        mimeType = mime(_file.path
            .split("/")
            .last) ?? "image/jpg";
      }
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "https://geniemoneyy.com/genie_money/public/index.php/updatuserdoc"));
      request.fields['ud_id'] = ud_id;
      request.fields['userid'] = Constants.userid;
      request.fields['ud_type'] = ud_type;
      request.fields['ud_doctype'] = ud_doctype;
      request.files.add(http.MultipartFile(
        'photo',
        _file.readAsBytes().asStream(),
        _file.lengthSync(),
        filename: _file.path
            .split("/")
            .last,
        contentType: MediaType("file", mimeType
            .split("/")
            .last),
      ),
      );
      var res = await request.send();

      final response_server = res.reasonPhrase!;
      if (kDebugMode) {
        print(response_server);
      }

      if (res.statusCode == 201) {
        if (ud_id.isNotEmpty) {
          _createToast("File Updated Successfully");
        } else {
          _createToast("File Uploaded Successfully");
        }
      } else {
        if (res.statusCode == 404) {
          if (ud_id.isNotEmpty) {
            _createToast("Failed to update File");
          } else {
            _createToast("Failed to upload File");
          }
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }
  Future<void> updateProfile(var basicInfo, BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      /* var data = {
        "userid": Constants.userid,
        "basicinfo": basicInfo,
        "tab1": "1",
        "tab2": '',
        "tab3": "",
       "residentialinfo": residentialinfo,
        "references": references
      };*/
      final body = jsonEncode(basicInfo);
      var response = await http.post(
        Uri.parse(
            'https://geniemoneyy.com/genie_money/public/index.php/userupdatepersonaldetails'),
        body: body,
      );
      final responseServer = jsonDecode(response.body);
      // print("response:" + response.body);

      if (response.statusCode == 201) {
        if (responseServer['status'] == 201) {
          _createToast('Details Updated Successfully');
        } else {
          _createToast("Failed to update Details");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Failed to update Details");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    }
  }


  Future<void> updateEmployment(
      var employmentdetail, BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = jsonEncode(employmentdetail);
      var response = await http.post(
        Uri.parse(
            'https://geniemoneyy.com//genie_money/public/index.php/userempdetails'),
        body: body,
      );
      final responseServer = jsonDecode(response.body);
      print("response:" + response.body);

      if (response.statusCode == 201) {
        if (responseServer['status'] == 201) {
          _createToast('Details Updated Successfully');
        } else {
          _createToast("Failed to update Details");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Failed to update Details");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    }
  }
  Future<void> updateBankDetails(var bankDetails, BuildContext context) async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = jsonEncode(bankDetails);
      var response = await http.post(
        Uri.parse(
            'https://geniemoneyy.com///genie_money/public/index.php/userempbankdetails'),
        body: body,
      );
      final responseServer = jsonDecode(response.body);
      print("response:" + response.body);

      if (response.statusCode == 201) {
        if (responseServer['status'] == 201) {
          _createToast('Details Updated Successfully');
        } else {
          _createToast("Failed to update Details");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Failed to update Details");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    }
  }
  Future<UserProofModel> getUserProofs() async {
    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final response = await http.get(
        Uri.parse('https://geniemoneyy.com/genie_money/public/index.php/getuserdoc?userid=' + Constants.userid),
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          return UserProofModel.fromJson(json.decode(response.body));
        } else {
          _createToast("No Files Uploaded");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("No Files Uploaded");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}