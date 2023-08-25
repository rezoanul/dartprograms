abstract class Account{
  int accountNumber = 0;
  double _balance = 0.0; //private 

  double deposit(double amount){
    _balance = _balance + amount;
    return _balance;
  }

  double withdraw(double amount); //abstract method 
}

class SavingsAccount extends Account{
  double _interestRate = 0.0; //private

  SavingsAccount(int accNo){
    accountNumber = accNo; //property of Account class
  }

  double get getCurrentBalance => _balance;  

  void set setNewBalance(double newBalance) {  
      _balance = newBalance;
  }

  double get getCurrentIntRate => _interestRate;  
  
  void set setNewIntRate(double newIntRate) {  
      _interestRate = newIntRate;
  }
  
  @override
  double withdraw(double amount){
    if((_balance-amount) > 0){
      _balance = _balance - amount;
      double totalIntr = _balance * _interestRate; 
      double curBalance = _balance + totalIntr;
      print('After applying the interest rate to the remaining balance BDT: $_balance + $totalIntr = ${curBalance.toStringAsFixed(2)}');
      return curBalance;
    }else{
      print('Balance can not be zero.');
      return 0;
    }
  }  
}

class CurrentAccount extends Account{
  double overdraftLimit = 0.0;

  CurrentAccount(int accNo, double odLimit){
    accountNumber = accNo; //property of Account class
    this.overdraftLimit = odLimit;
  }

  double get getCurrentBalance => _balance;  
  
  void set setNewBalance(double newBalance) {  
      _balance = newBalance;
  }

  @override
  double withdraw(double amount){
      if(((_balance-amount) >= 0) || ((_balance-amount).abs()) <=  overdraftLimit){
        _balance = _balance - amount;
        print('Balance after withdrawing money BDT: ${_balance.toStringAsFixed(2)}');
        return _balance;
      }else{
        print('Insufficient funds');
        return 0;
      }
  }  
}

void main(){
  SavingsAccount savAcc = SavingsAccount(1031120000866);
  savAcc.setNewBalance = 80000.00; 
  savAcc.setNewIntRate = 0.09;

  savAcc.deposit(500.00);
  print('Balance after depositing money BDT: ${savAcc.getCurrentBalance.toStringAsFixed(2)}');

  savAcc.withdraw(80000.00);

  CurrentAccount curAcc = CurrentAccount(1031020000867,5000.00);

  curAcc.setNewBalance = 70000.00; 
  
  curAcc.deposit(6000.00);
  print('Balance after depositing money BDT: ${curAcc.getCurrentBalance.toStringAsFixed(2)}');

  curAcc.withdraw(81001.00); 
}