class Car{
  String brand;
  String model;
  int year;
  double _milesDriven = 0.0;

  static int numberOfCars = 0;

  Car({required this.brand,required this.model,required this.year}){
    numberOfCars++;
  }

  double getMilesDriven(){
    return _milesDriven;
  }

  void set drive(double miles) {  
       _milesDriven = miles;
  }

  String getBrand(){
    return brand;
  }
  
  String getModel(){
    return model;
  }

  int getYear(){
    return year;
  }

  int getAge(int year){
    return int.parse(DateTime.now().year.toString()) - year;
  }

  @override
  String toString() {
    return 'Car ${Car.numberOfCars}: ${this.getBrand()} ${this.getModel()} ${this.getYear()} Miles: ${this.getMilesDriven().toStringAsFixed(0)} Age: ${this.getAge(this.year)}';
  }
}

void main(){
  Car Toyota = Car(brand:'Toyota',model:'Camry',year:2020);
  Toyota.drive = 10000.00;
  print(Toyota);
  
  Car Honda = Car(brand:'Honda',model:'Civic',year:2018);
  Honda.drive = 8000.00;
  print(Honda);

  Car Ford = Car(brand:'Ford',model:'F-150',year:2015);
  Ford.drive = 15000.00;
  print(Ford);
  
  int totalNoOfCarsCreated = Car.numberOfCars;
  print('Total number of cars created: $totalNoOfCarsCreated');
}