// doubleine a function.
double operate(double val1, String op, double val2) {
  if (val2 == 0) return -999999;
  double hasil = 0;

  if (op == '+') {
    hasil = val1 + val2;
  } else if (op == '-') {
    hasil = val1 - val2;
  } else if (op == '×') {
    hasil = val1 * val2;
  } else if (op == '÷') {
    hasil = val1 / val2;
  }
  return hasil;
}

double countValue1(pk, po) {
  // 1, 2, 3
  var valAB = operate(pk[0], po[0], pk[1]);
  var valABC = operate(valAB, po[1], pk[2]);
  var valABCD = operate(valABC, po[2], pk[3]);
  return valABCD;
}

double countValue2(pk, po) {
  // 1, 3, 2 dan 3, 1, 2
  var valAB = operate(pk[0], po[0], pk[1]);
  var valCD = operate(pk[2], po[2], pk[3]);
  var valABCD = operate(valAB, po[1], valCD);

  return valABCD;
}

double countValue3(pk, po) {
  // 2, 1, 3
  var valBC = operate(pk[1], po[1], pk[2]);
  var valABC = operate(pk[0], po[0], valBC);
  var valABCD = operate(valABC, po[2], pk[3]);

  return valABCD;
}

double countValue4(pk, po) {
  // 2, 3, 1
  var valBC = operate(pk[1], po[1], pk[2]);
  var valBCD = operate(valBC, po[2], pk[3]);
  var valABCD = operate(pk[0], po[0], valBCD);

  return valABCD;
}

double countValue5(pk, po) {
  // 2, 3, 1
  var valCD = operate(pk[2], po[2], pk[3]);
  var valBCD = operate(pk[1], po[1], valCD);
  var valABCD = operate(pk[0], po[0], valBCD);

  return valABCD;
}

// This is where the app starts executing.
void main() {
  var number = 42; // Declare and initialize a variable.
}
