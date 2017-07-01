// The formula: 
// @param p float amount borrowed
// @param r interest as a percentage
// @param n term in years
function calculateMortgage(){
  var monthlyPayments = null;

  //percentToDecimal(r)
  r = percentToDecimal(r);

  //convert years to months
  n = yearsToMonths(n);

  return monthlyPayments;
}

function percentToDecimal(percent){
  return (percent/12)/100;
}

function yearsToMonths(year){
  return year * 12;
}
