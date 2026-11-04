Questions I note down for later down the road.

### For step 1

- Numbers: Int only for now. Rationals later? Floats only for eval?
- Add/Mul are binary. Switch to n-ary when simplify gets painful?
- No functions (sin, log, exp) yet.
- Equations will be a separate type, not an Expr variant.

### For step 4:
 Decide how to represent substraction and division: 
  - Helpers constructors for substraction and division
  - Adding Substract and Divide nodes to the `Expr` tree structure

"For the second, a common CAS trick is to not give them their own variants. You represent `a - b` as `Add(a, Mul(Num(-1), b))` and `a / b` as `Mul(a, Pow(b, Num(-1)))`. Then `derive` and `simplify` have fewer cases to handle, and `to_string` can still print them as `-` and `/`. Gotta decide this, but might be worth trying both cases before landing on either.
