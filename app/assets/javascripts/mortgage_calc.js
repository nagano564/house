

// The formula: c = (r * p)/(1 - (Math.pow((1 + r), (-n))))
// @param p float amount borrowed
// @param r interest as a percentage
// @param n term in years
function calculateMortgage(p, r, n){


  //percentToDecimal(r)
  r = percentToDecimal(r);

  //convert years to months
  n = yearsToMonths(n);

  var pmt = (r * p)/(1 - (Math.pow((1 + r), (-n))));

  return parseFloat(pmt.toFixed(2));

}

function percentToDecimal(percent){
  return (percent/12)/100;
}

function yearsToMonths(year){
  return year * 12;
}

function postPayments(payment){
    var answer = document.getElementById("outMonthly");

    answer.innerText = "$" + payment;

}

var button = document.getElementById("btnCalculate");
button.onclick = function(){

    var cost = document.getElementById("inCost").value;
    var interest = document.getElementById("inAPR").value;
    var term = document.getElementById("inPeriod").value;
    var downPayment = document.getElementById("inDown").value;
    var amountBorrowed = cost - downPayment;


  var pmt = calculateMortgage(amountBorrowed, interest, term);

    postPayments(pmt);
};
