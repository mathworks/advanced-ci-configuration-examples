import unittest
import xmlrunner

class TestMathOperations(unittest.TestCase):

    def test_power(self):
        self.assertEqual(2 ** 3, 8)

    def test_modulus(self):
        self.assertEqual(10 % 3, 1)

    def test_floor_division(self):
        self.assertEqual(9 // 2, 4)

    def test_negation(self):
        self.assertEqual(-5, -5)

if __name__ == "__main__":
    with open('test-results/results_math_operations.xml', 'wb') as output:
        unittest.main(testRunner=xmlrunner.XMLTestRunner(output=output), failfast=False, buffer=False, catchbreak=False)
