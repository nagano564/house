

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
    console.log(answer);
    answer.innerText = "$" + payment;

}

$(document).ready(function() {
  $("#btnCalculate").click(function(){
      console.log("hello");
      var cost = document.getElementById("house_cost").value;
      var interest = document.getElementById("house_interest").value;
      var term = document.getElementById("house_period").value;
      var downPayment = document.getElementById("house_down_payment").value;
      var amountBorrowed = cost - downPayment;

    var pmt = calculateMortgage(amountBorrowed, interest, term);

      postPayments(pmt);
  });
})
