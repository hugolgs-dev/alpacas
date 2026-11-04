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
