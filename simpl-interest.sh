#!/usr/bin/env bash
# simple-interest.sh
# A simple interest calculator (Bash) that prompts the user for:
# - Principal (P)
# - Rate of interest (R) in percent per year
# - Time period (T) in years
# and prints Simple Interest (SI) and Total Amount (A)

set -euo pipefail

# ---- helpers ----
is_number() {
  # Accepts integers or decimals (e.g., 10, 10.5, .5)
  [[ "${1:-}" =~ ^([0-9]+([.][0-9]+)?|[.][0-9]+)$ ]]
}

read_number() {
  local prompt="$1"
  local value

  while true; do
    read -r -p "$prompt" value
    # trim spaces
    value="${value//[[:space:]]/}"

    if is_number "$value"; then
      echo "$value"
      return 0
    fi

    echo "Invalid input. Please enter a non-negative number (e.g., 1000 or 5.5)."
  done
}

# ---- input ----
principal="$(read_number "Enter principal amount (P): ")"
rate="$(read_number "Enter annual rate of interest in % (R): ")"
time="$(read_number "Enter time period in years (T): ")"

# ---- calculation ----
# SI = (P * R * T) / 100
# Total = P + SI
#
# Use awk for floating-point arithmetic + formatting
result="$(awk -v p="$principal" -v r="$rate" -v t="$time" '
  BEGIN {
    si = (p * r * t) / 100;
    total = p + si;
    printf "%.2f %.2f\n", si, total;
  }
')"

simple_interest="$(cut -d' ' -f1 <<< "$result")"
total_amount="$(cut -d' ' -f2 <<< "$result")"

# ---- output ----
echo
echo "----- Results -----"
echo "Principal (P):      $principal"
echo "Rate (R):           $rate % per year"
echo "Time (T):           $time years"
echo "Simple Interest:    $simple_interest"
echo "Total Amount (A):   $total_amount"
