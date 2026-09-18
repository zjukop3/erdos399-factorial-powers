# Erdős Problem 399 — Factorial as Sum of Two Powers

## Problem

Is it true that there are no solutions to n! = x^k ± y^k with x, y, n ∈ ℕ, xy > 1, and k > 2?

## Answer

No. The counterexample **10! + 36⁴ = 48⁴** disproves the conjecture:
- 10! = 3,628,800
- 36⁴ = 1,679,616
- 48⁴ = 5,308,416
- 10! + 36⁴ = 3,628,800 + 1,679,616 = 5,308,416 = 48⁴

## Formalization

Pure Lean 4 (no Mathlib dependency). The proof is a single `decide` on the explicit counterexample.

```lean
theorem erdos_399 :
    ∃ (n x y k : Nat), 1 < x * y ∧ 2 < k ∧
      (factorial n = x ^ k + y ^ k ∨ factorial n + y ^ k = x ^ k) := by
  exact ⟨10, 48, 36, 4, by decide⟩
```

## Verification

- Build: `lake build`
- Axiom audit: `lake env lean Audit.lean`
- Result: **0 axioms** (not even propext)
- 0 sorry, 0 admit

## References

- [erdosproblems.com/399](https://www.erdosproblems.com/399)
- Erdős, P. and Obláth, R., "Über diophantische Gleichungen der Form n!=x^p±y^p", 1937
- [formal-conjectures statement](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/399.lean)

## License

MIT

## Attribution

Independent formalization by zjukop3. The mathematical counterexample is a known result (Erdős–Obláth 1937). This formalization uses pure Lean 4 without Mathlib, achieving 0 axiom dependence.
