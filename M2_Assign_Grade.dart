void main(){
 
  List<int> numbers = [85,92,78,65,88,72];
  
  int total = 0;

  for(int i=0; i<=numbers.length-1; i++){
    total = total + numbers[i];
  }
  
  double avg = total / (numbers.length);

  String average = avg.toStringAsFixed(1);
  print("Student's average grade : $average");

  String rndint = avg.toStringAsFixed(0);
  print('Rounded average : $rndint');
  
  int avg_grade = int.parse(rndint);

  if(avg_grade>=70){
    print('Passed');
  }
  else{
    print('Failed');
  }
}