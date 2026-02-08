# Simple Interest Calculator

A lightweight **Simple Interest Calculator** that computes the interest earned and the total amount after a given time period, using the classic simple interest formula.

---

## What it does

Given:

- **Principal (P)**: the initial amount of money
- **Rate (R)**: the annual interest rate (as a percentage)
- **Time (T)**: the time the money is invested/borrowed for (in years)

It calculates:

- **Simple Interest (SI)**  
- **Total Amount (A) = P + SI**

---

## Formula

\[
SI = \frac{P \times R \times T}{100}
\]

\[
A = P + SI
\]

---

## Example

**Input:**

- Principal (P): `1000`
- Rate (R): `5` (% per year)
- Time (T): `2` (years)

**Output:**

- Simple Interest: `100`
- Total Amount: `1100`

---

## Usage (Pseudo-steps)

1. Enter the **principal**
2. Enter the **interest rate** (annual %)
3. Enter the **time** (in years)
4. Compute the **simple interest** and **total amount**

---

## Sample Implementation (Python)

```python
def simple_interest(principal: float, rate: float, time: float) -> tuple[float, float]:
    """
    Returns (simple_interest, total_amount)
    """
    si = (principal * rate * time) / 100
    total = principal + si
    return si, total


if __name__ == "__main__":
    p = float(input("Principal (P): "))
    r = float(input("Rate (R) in %: "))
    t = float(input("Time (T) in years: "))

    si, total = simple_interest(p, r, t)
    print(f"Simple Interest: {si}")
    print(f"Total Amount: {total}")
