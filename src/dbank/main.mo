import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";



actor DBank {
  stable var currentValue = 300.00;
  // currentValue := 100;
  stable var startTime = Time.now();
  // let id = 1234567;

  Debug.print(debug_show(startTime));

  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let tempValue: Float = currentValue - amount;
    
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("insufficient funds");
    };
  };
  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let elapsedTimeNS = currentTime - startTime;
    let elapsedTimeS = elapsedTimeNS/1000000000;
    currentValue:= currentValue* (1.01 ** Float.fromInt(elapsedTimeS));
    startTime := currentTime;
  };

};

