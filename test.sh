#!/bin/bash
FNAME="$1"

assert() {
  expected="$1"
  input="$2"

  ./"$FNAME" "$input" > tmp.s
  gcc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    # exit 1
  fi
}

# step1: raw integer
assert 0 0
assert 42 42
# step2: define additon
assert 21 "5+20-4"
# step3: introduce tokenizor
assert 41 " 12 + 34 - 5 "
# step5: Four arithmetic operations
assert 47 '5+6*7'
assert 15 '5*(9-6)'
assert 4 '(3+5)/2'
# step6: unary addition
assert 10 '-10+20'
# step7: Comparison operator
assert 0 '1+1==3'
assert 1 '1<1!=1<=1'
assert 1 '1>1!=1>=1'
assert 1 '1>1==1<1'
echo OK