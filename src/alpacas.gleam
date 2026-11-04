//// Module-level documentation for the `alpacas` module.

// |-_-_-_-|- IMPORTS -|_-_-_-_-_-_-_-_-_-_-_-_-_|
import gleam/int
/// A mathematical expression, represented as a tree.
pub type Expr {
  /// An integer constant, e.g `3`
  Num(Int)
  /// A variable, e.g `x`
  Var(String)
  /// The sum of two expressions
  Add(Expr, Expr)
  /// The product of two expressions
  Mul(Expr, Expr)
  /// An expression raised to a power
  Pow(Expr, Expr)
}

/// function to
pub fn to_string(expr: Expr) -> String {
  case expr {
    Num(number) -> int.to_string(number)
    Var(name) -> name
    Add(left, right) -> wrap(left, 1) <> " + " <> wrap(right, 1)
    Mul(left, right) -> wrap(left, 2) <> " * " <> wrap(right, 2)
    Pow(base, exponent) -> wrap(base, 4) <> " ^ " <> wrap(exponent, 3)
  }
}

// |-_-_-_-|- HELPERS -|_-_-_-_-_-_-_-_-_-_-_-_-_|

//
fn precedence(expr: Expr) -> Int {
  case expr {
    Num(_) | Var(_)->4
    Pow(_, _) -> 3
    Mul(_, _) -> 2
    Add(_, _) -> 1
  }
}

//
fn wrap(child: Expr, min_precedence: Int) -> String {
  case precedence(child) < min_precedence {
    True -> "(" <> to_string(child) <> ")"
    False -> to_string(child)
  }
}
