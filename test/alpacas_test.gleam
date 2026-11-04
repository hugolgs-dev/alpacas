import gleeunit
import alpacas.{Num, Var, Add, Mul, Pow}

pub fn main() -> Nil {
  gleeunit.main()
}

fn x_squared_plus_3x() {
  // x² + 3x
  Add(Pow(Var("x"), Num(2)), Mul(Num(3), Var("x")))
}

fn x_plus_1_squared() {
  // (x+1)²
  Pow(Add(Var("x"), Num(1)), Num(2))
}

fn x_plus_1_times_x_plus_1() {
  // (x+1)(x+1)
  Mul(Add(Var("x"), Num(1)), Add(Var("x"), Num(1)))
}

pub fn build_expression_test() {
  echo x_squared_plus_3x()
  echo x_plus_1_squared()
  echo x_plus_1_times_x_plus_1()
}

pub fn to_string_test() {
  assert alpacas.to_string(x_squared_plus_3x()) == "x ^ 2 + 3 * x"
  assert alpacas.to_string(x_plus_1_squared()) == "(x + 1) ^ 2"
  assert alpacas.to_string(x_plus_1_times_x_plus_1()) == "(x + 1) * (x + 1)"
}

pub fn to_string_parentheses_test() {
  // (2x)²: Mul as a Pow base needs parentheses
  assert alpacas.to_string(Pow(Mul(Num(2), Var("x")), Num(2))) == "(2 * x) ^ 2"
  // (x²)³: Pow as a Pow base needs parentheses
  assert alpacas.to_string(Pow(Pow(Var("x"), Num(2)), Num(3))) == "(x ^ 2) ^ 3"
  // x^(2³): Pow as an exponent doesn't
  assert alpacas.to_string(Pow(Var("x"), Pow(Num(2), Num(3)))) == "x ^ 2 ^ 3"
  // x + 1*2: Mul inside Add doesn't
  assert alpacas.to_string(Add(Var("x"), Mul(Num(1), Num(2)))) == "x + 1 * 2"
}
