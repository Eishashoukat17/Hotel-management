import 'dart:io';

List<Hotel>roomLists = [
Hotel(
roomNumber:1,
numberOfRooms:2,
balcony:'yes',
floor:1,
reserved:false
),
Hotel(
  roomNumber:33,
  numberOfRooms:2,
 balcony:'no',
  floor:1,
  reserved:true
)
];

class Hotel{
  int? roomNumber;
  int? numberOfRooms;
  String? balcony;
  int? floor;
  bool? reserved;

  Hotel({
    this.roomNumber,
    this.numberOfRooms,
    this.balcony,
    this.floor,
    this.reserved,
  });

  void inform(List<Hotel>roomLists){
    for(var item in roomLists){
     print("Room Number : ${item.roomNumber}");
     print("Room balcony : ${item.balcony}");
     print("Room floor : ${item.floor}");
     print("Room Is Reserved : ${item.reserved}");
    }
  }
}

class Guests extends Hotel{
String? firstName;
String? lastName;
int? phoneNumber;
String? passportNumber;
int? numberOfGuests;

Guests({
  this.firstName,
  this.lastName,
  this.numberOfGuests,
  this.phoneNumber,
  this.passportNumber,
  int? roomNumber,
}) :super(roomNumber: roomNumber);

void guest(List<Guests> guestList, List<Hotel> roomLists){
print("Enter First Name");
firstName = stdin.readLineSync()!;
print("Enter Last Name");
lastName = stdin.readLineSync()!;
print("how many guest will stay with?");
numberOfGuests = int.parse(stdin.readLineSync()!);
print("Enter Phone Number");
phoneNumber = int.parse(stdin.readLineSync()!);
print("Enter Passport Number");
passportNumber = stdin.readLineSync()!;
availableRooms(roomLists);
print("Choose a room for them");
int roomNumber =int.parse(stdin.readLineSync()!);

guestList.add(Guests(
roomNumber: roomNumber,
firstName: firstName,
lastName: lastName,
phoneNumber: phoneNumber,
passportNumber: passportNumber,
numberOfGuests: numberOfGuests,
));

print("Guest Added");
print("===================");
}
void guestInform(List<Guests> guestList){
  super.inform(roomLists);
  for (var item in guestList){
    print("===============================");
    print("this room ${item.roomNumber }is reserved to this ${item.firstName} ${item.lastName}");
    print("Room Number : ${item.roomNumber}");
    print("First name : ${item.firstName}");
    print("Last name : ${item.lastName}");
    print("Phone number : ${item.phoneNumber}");
    print("number of guest : ${item.numberOfGuests}");
    print("Passport number : ${item.passportNumber}");
    print("===========================================");
  }
}
}

void availableRooms(List<Hotel> roomLists){
for(var item in roomLists){
  if(item.reserved == false){
 print("===============================");
 print("Room Number : ${item.roomNumber}");
 print("balcony : ${item.balcony}");
 print("floor : ${item.floor}");
 print("==================================");
  }
}
}

void reservedRooms(List<Hotel> roomLists){
  for(var item in roomLists){
  if(item.reserved == true){
 print("===============================");
 print("Room Number : ${item.roomNumber}");
 print("balcony : ${item.balcony}");
 print("floor : ${item.floor}");
 print("==================================");
  }
}
}

void changeStatues(List<Hotel> roomLists){
  print("Enter Room Number");
  int newID = int.parse(stdin.readLineSync()!);
  print("hange reservation");
  String b = stdin.readLineSync()!;
  bool newStatue = b.parseBool();
  for(var item in roomLists){
    if(item.roomNumber == newID){
       item.reserved == newStatue;
    }
  }
}

extension Boolparsing on String{
 bool parseBool(){
  if(toLowerCase() =="true"){
    return true;
  } else if(toLowerCase() == "false");{
    return false;
  }
 }
}

List<Guests> guestList =[];
menu(){
  print("\n\t\t\t\t** HOTEL MANAGEMENT SYSTEM **");
    print("\n\t\t\t\t************");
    print("========1. Available Rooms ===========");
    print("========2. All Reserved Rooms ===========");
    print("========3. To view Change Reserved Rooms ===========");
    print("========4. To Reserve Room ===========");
    print("======  Exit ======");
}

void main(){
int input;
Hotel myRooms = Hotel();
Guests myGuests = Guests();

input = int.parse(stdin.readLineSync()!);
if(input == 1){
availableRooms(roomLists);
} else if(input == 2){
  reservedRooms(roomLists);
  main();
} else if (input == 3){
  myRooms.inform(roomLists);
  changeStatues(roomLists);
  main();
} else if (input == 4){
  myGuests.guest(guestList, roomLists);
   myGuests.guestInform(guestList);
  main();
}
}