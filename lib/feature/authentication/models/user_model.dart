import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper Function to get full name
  String get fullName => '$firstName $lastName';


  /// Helper Function to Format Phone Number
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static Function to Split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName (fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix = "cwt_$camelCaseUserName";
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '');

  /// Convert to jason
  Map<String, dynamic> toJson(){
    return{
      'FirstName': firstName,
      'LastName':lastName,
      'UserName':userName,
      'Email':email,
      'PhoneNumber':phoneNumber,
      'ProfilePicture':profilePicture
    };
  }


  /// Factory methode to create a userModel from a firebase document snapshot
  /*factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,double>>document){
    if(document.data() != null){
      final data = document.data()!;
      return UserModel(id: document.id, firstName: data['FirstName'] ?? '', lastName: data['LastName'] ?? '', userName: data['UserName'] ?? '', email: data['Email'] ?? '', phoneNumber: data['PhoneNumber'] ?? '', profilePicture: data['ProfilePicture'] ?? '');
    }
  }*/

}

