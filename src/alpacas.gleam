//// Module-level documentation for the `alpacas` module.

// |-_-_-_-|- IMPORTS -|_-_-_-_-_-_-_-_-_-_-_-_-_|

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
