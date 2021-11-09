import unittest
import importlib
convs = importlib.import_module("state-power-bill")

class TestStateBillMethods(unittest.TestCase):
    def test_zipcode_valid(self):
        self.assertEqual(convs.ZiptoState(35000), "Alabama")
        self.assertEqual(convs.ZiptoState(80000), "Colorado")
        self.assertEqual(convs.ZiptoState(96700), "Hawaii")
        self.assertEqual(convs.ZiptoState(66000), "Kansas")
        self.assertEqual(convs.ZiptoState(1000), "Massachusetts")
        self.assertEqual(convs.ZiptoState(59000), "Montana")
        self.assertEqual(convs.ZiptoState(3000), "New Hampshire")
        self.assertEqual(convs.ZiptoState(73000), "Oklahoma")
        self.assertEqual(convs.ZiptoState(29000), "South Carolina")
        self.assertEqual(convs.ZiptoState(5000), "Vermont")


    def test_zipcode_invalid(self):
        with self.assertRaises(KeyError):
            convs.ZiptoState(0)
        with self.assertRaises(KeyError):
            convs.ZiptoState(100)
        with self.assertRaises(TypeError):
            convs.ZiptoState("")
        with self.assertRaises(KeyError):
            convs.ZiptoState(-100) 
        with self.assertRaises(KeyError):
            convs.GetMonthlyBill(0,25)


    def test_specific_cases(self):
        self.assertEqual(convs.GetMonthlyBill(35000,625), (78.5625,143.9265))
        self.assertEqual(convs.GetMonthlyBill(5000,550), (107.47,110.79180000000001))
        self.assertEqual(convs.GetMonthlyBill(90900,690), (141.105,116.97399999999999))
        self.assertEqual(convs.GetMonthlyBill(45612,1000), (122.9,107.2917))
        self.assertEqual(convs.GetMonthlyBill(12000,100), (18.36,110.5272))



if __name__ == '__main__':
    unittest.main()
