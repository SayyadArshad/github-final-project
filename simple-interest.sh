#!/bin/bash

# Simple Interest Calculator

echo "Simple Interest Calculator"
echo "--------------------------"

# Read user input
read -p "Enter Principal Amount: " principal
read -p "Enter Rate of Interest (% per year): " rate
read -p "Enter Time Period (in years): " time

# Validate input (basic numeric check)
if ! [[ $principal =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ $rate =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ $time =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Please enter valid numeric values."
    exit 1
fi

# Calculate Simple Interest using bc for decimal support
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "Simple Interest: $simple_interest"
echo "Total Amount: $total_amount"
