  

  
// function calculate numbers enter from the screen to produce tip information
document.getElementById('calculate').onclick = function calculateTip(){
  var billAmt = Number(document.getElementById("billAmt").value);
  var tipPer1 = Number(document.getElementById("tipPer").value);
  var peopleAmt = Number(document.getElementById("peopleAmt").value);
  var drinkCost = Number(document.getElementById("drinkCost").value);
  var drinkRd = Number(document.getElementById("drinkRd").value);
  var bill = billAmt;
// calculation for tip
    tipPer = tipPer1/100;
    billBeforeTip = billAmt/peopleAmt;
    tipAmt = bill * tipPer;
    totalBill = bill + tipAmt;
    billPPAmt = bill/peopleAmt;
    tipAmtPPerson = tipAmt/peopleAmt;
    totalbbTip = (drinkCost * drinkRd)/2
    splitBuyBack = totalbbTip/peopleAmt;
    totalBillAmt = billPPAmt + tipAmtPPerson + totalbbTip;
    totalbillTP = (totalBill + totalbbTip)/peopleAmt;

// display tip inform to the screen
  document.getElementById("tBill").innerHTML= "$"+Number(totalBill).toFixed(2);
      console.log(Number(totalBill).toFixed(2));
   document.getElementById("tAmt").innerHTML= "$"+Number(tipAmt).toFixed(2);
      console.log(Number(tipAmt).toFixed(2));
  document.getElementById("bPP").innerHTML= "$"+Number(billPPAmt).toFixed(2);
      console.log(Number(billPPAmt).toFixed(2));
    document.getElementById("bbPP").innerHTML= "$"+Number(totalbillTP).toFixed(2);
      console.log(Number(totalbillTP).toFixed(2));   
  document.getElementById("tPP").innerHTML= "$"+Number(tipAmtPPerson).toFixed(2);
      console.log(Number(tipAmtPPerson).toFixed(2));  
  document.getElementById("bbC").innerHTML= "$"+Number(totalbbTip).toFixed(2);
      console.log(Number(totalbbTip).toFixed(2));  
  document.getElementById("splitBBack").innerHTML= "$"+Number(splitBuyBack).toFixed(2);
      console.log(Number(splitBuyBack).toFixed(2));
}



// Clear screen inputs
  document.getElementById('clear').onclick = function clear() {
    var elementsToClear = document.getElementsByClassName("clear-me");
    var inputsToClear  = document.getElementsByClassName("clear-value");

    // console.log(elementsToClear);
    // console.log(inputsToClear);

    for (var i = 0; i < elementsToClear.length; i++){
      elementsToClear[i].innerHTML = '';  
    }
    for (var k = 0; k < inputsToClear.length; k++){
      inputsToClear[k].value = '';
    }

}
