// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

import "forge-std/Test.sol";
import "../src/Calculadora.sol";

contract CalculadoraTest is Test {
    Calculadora calculadora;
    uint256 public firstResultado = 100;
    address public admin = vm.addr(1);
    address public randomUser = vm.addr(2);

    function setUp() public {
        calculadora = new Calculadora(firstResultado, admin);
    }

    // Unit testing
    function testCheckFirstResultado() public view {
        uint256 firstResultado_ = calculadora.resultado();
        assert(firstResultado_ == firstResultado);
    }

    function testAddition() public {
        uint256 num1_ = 5;
        uint256 num2_ = 10;

        uint256 resultado_ = calculadora.addition(num1_, num2_);
        assert(resultado_ == num1_ + num2_);
    }

    function testSubstraction() public {
        uint256 num1_ = 10;
        uint256 num2_ = 5;

        uint256 resultado_ = calculadora.substraction(num1_, num2_);
        assert(resultado_ == num1_ - num2_);
    }

    function testMultiplier() public {
        uint256 num1_ = 5;
        uint256 num2_ = 10;

        uint256 resultado_ = calculadora.multipler(num1_, num2_);
        assert(resultado_ == num1_ * num2_);
    }

    function testCanNotMultiply2LargeNumbers() public {
        uint256 num1_ = 5;
        uint256 num2_ = 115792089237316195423570985008687907853269984665640564039457584007913129639934;

        vm.expectRevert();
        uint256 resultado_ = calculadora.multipler(num1_, num2_);
    }

    function testNotAdminCallDivisionReverts() public {
        vm.startPrank(randomUser);

        uint256 num1_ = 5;
        uint256 num2_ = 10;

        vm.expectRevert();
        uint256 resultado_ = calculadora.division(num1_, num2_);
        assert(resultado_ == num1_ / num2_);

        vm.stopPrank();
    }

    function testCanCallDivisionCorrectly() public {
        vm.startPrank(admin);

        uint256 num1_ = 10;
        uint256 num2_ = 2;

        uint256 resultado_ = calculadora.division(num1_, num2_);
        assert(resultado_ == num1_ / num2_);

        vm.stopPrank();
    }

    function testDefaultCanNotCallDivisionReverts() public {
        uint256 num1_ = 5;
        uint256 num2_ = 10;

        vm.expectRevert();
        uint256 resultado_ = calculadora.division(num1_, num2_);
        assert(resultado_ == num1_ / num2_);
    }

    function testDefaultExecutedCorrectly() public {
        vm.startPrank(admin);

        uint256 num1_ = 5;
        uint256 num2_ = 10;

        uint256 resultado_ = calculadora.division(num1_, num2_);
        assert(resultado_ == num1_ / num2_);

        vm.stopPrank();
    }

    function testCanNotDivideByZero() public {
        vm.startPrank(admin);

        uint256 num1_ = 10;
        uint256 num2_ = 0;

        vm.expectRevert();

        calculadora.division(num1_, num2_);

        vm.stopPrank();
    }

    // Fuzzing testing

    function testFuzzingDivision(uint256 num1_,uint256 num2_) public {
        vm.startPrank(admin);
 
        calculadora.division(num1_, num2_);

        vm.stopPrank();
    }
}
