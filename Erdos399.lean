/-!
# Erdős Problem 399

Is it true that there are no solutions to n! = x^k ± y^k with x, y, n ∈ Nat, xy > 1, and k > 2?

Answer: No. The counterexample 10! + 36^4 = 48^4 disproves the conjecture.

Reference: Erdős, P. and Obláth, R. (1937)
-/

namespace Erdos399

/-- Factorial function (defined in pure Lean 4, no Mathlib dependency). -/
def factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorial n

theorem erdos_399 :
    ∃ (n x y k : Nat), 1 < x * y ∧ 2 < k ∧
      (factorial n = x ^ k + y ^ k ∨ factorial n + y ^ k = x ^ k) := by
  exact ⟨10, 48, 36, 4, by decide⟩

end Erdos399
