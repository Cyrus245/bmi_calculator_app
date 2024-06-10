void main() {
  Car car1 = Car(drive: driveSlowly);
  print(car1.drive);
}

class Car {
  Function? drive;
  Car({this.drive});
}

void driveSlowly() {
  print('drive slowly');
}

void driveFaster() {
  print('drive super fast');
}
