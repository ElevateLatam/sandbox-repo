"""Unit tests for calculator module."""

import pytest
from calculator import add, subtract, multiply, divide, power


class TestAddition:
    """Tests for add function."""
    
    def test_add_positive_numbers(self):
        assert add(2, 3) == 5
    
    def test_add_negative_numbers(self):
        assert add(-2, -3) == -5
    
    def test_add_mixed_numbers(self):
        assert add(-2, 3) == 1


class TestSubtraction:
    """Tests for subtract function."""
    
    def test_subtract_positive_numbers(self):
        assert subtract(5, 3) == 2
    
    def test_subtract_negative_numbers(self):
        assert subtract(-5, -3) == -2
    
    def test_subtract_mixed_numbers(self):
        assert subtract(5, -3) == 8


class TestMultiplication:
    """Tests for multiply function."""
    
    def test_multiply_positive_numbers(self):
        assert multiply(4, 5) == 20
    
    def test_multiply_by_zero(self):
        assert multiply(5, 0) == 0
    
    def test_multiply_negative_numbers(self):
        assert multiply(-3, -4) == 12


class TestDivision:
    """Tests for divide function."""
    
    def test_divide_positive_numbers(self):
        assert divide(10, 2) == 5.0
    
    def test_divide_negative_numbers(self):
        assert divide(-10, -2) == 5.0
    
    def test_divide_by_zero_raises_error(self):
        with pytest.raises(ValueError, match="Cannot divide by zero"):
            divide(10, 0)


class TestPower:
    """Tests for power function."""
    
    def test_power_positive_exponent(self):
        assert power(2, 3) == 8
    
    def test_power_zero_exponent(self):
        assert power(5, 0) == 1
    
    def test_power_negative_exponent(self):
        assert power(2, -2) == 0.25

