#! /bin/bash

flag=$1

# Setup
# mkdir -p ./files

# Change flag
sed -i "s/REPLACE/${flag}/g" ./key_verifier.c

# Compile
cd ../question
gcc ../generators/key_verifier.c -S

# Corrupt
sed -i 's/"GCC.*"/"LUGCC: (LUGVITC) 0.0.1"/g' ./key_verifier.s
sed -i 's/movq/movl/g' ./key_verifier.s

keywords=('globl' 'cfi_def_cfa_offset' 'leaq' 'call' 'main')
for keyword in ${keywords[*]}; do
  sed -i "s/${keyword}/$(tr -dc A-Za-z0-9 </dev/urandom | head -c 14)/g" ./key_verifier.s
done

