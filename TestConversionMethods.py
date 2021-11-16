import unittest
import importlib
import numpy
convs = importlib.import_module("basic-formula-func")

class TestConversionMethods(unittest.TestCase):
    def test_bill_normal(self):
        self.assertEqual(round(convs.kWhtoBill(550), 3), 61.985)
        self.assertEqual(round(convs.kWhtoBill(1000), 1), 112.7)
        self.assertEqual(round(convs.kWhtoBill(23), 4), 2.5921)
        self.assertEqual(round(convs.kWhtoBill(123.45), 6), 13.912815)
        self.assertEqual(round(convs.kWhtoBill(.0001), 8), .00001127)
        self.assertEqual(round(convs.kWhtoBill(624.2546), 8), 70.35349342)

    def test_bill_edge(self):
        self.assertEqual(convs.kWhtoBill(0), 0)

    def test_bill_invalid(self):
        with self.assertRaises(TypeError):
            convs.kWhtoBill("Yes")
            convs.kWhtoBill("")
            convs.kWhtoBill('r')
            convs.kWhtoBill("    ")
            convs.kWhtoBill("Ye2323s")

    def test_CO2_normal(self):
        self.assertEqual(numpy.around(convs.kWhtoCO2(550), 2).tolist(), [139.78, 24.75, 6.6, 568.05, 13.2, 6.05, 224.88])
        self.assertEqual(numpy.around(convs.kWhtoCO2(25), 3).tolist(), [6.354, 1.125, 0.3, 25.820, 0.6, 0.275, 10.222])
        self.assertEqual(numpy.around(convs.kWhtoCO2(1234), 3).tolist(), [313.621, 55.53, 14.808, 1274.5, 29.616, 13.574, 504.549])
        self.assertEqual(numpy.around(convs.kWhtoCO2(12.67), 3).tolist(), [3.22, .57, .152, 13.086, .304, .139, 5.18])
        self.assertEqual(numpy.around(convs.kWhtoCO2(.005), 5).tolist(), [.00127, .00022, .00006, .00516, .00012, .00005, .00204])
        self.assertEqual(numpy.around(convs.kWhtoCO2(378.23), 3).tolist(), [96.127, 17.020, 4.539, 390.644, 9.078, 4.161, 154.648])

    def test_CO2_edge(self):
        self.assertEqual(numpy.around(convs.kWhtoCO2(0), 3).tolist(), [0, 0, 0, 0, 0, 0, 0])

    def test_CO2_invalid(self):
        with self.assertRaises(TypeError):
            convs.kWhtoCO2("Yes")
            convs.kWhtoCO2("")
            convs.kWhtoCO2("NAN888")
            convs.kWhtoCO2("This is not a proper input.")
            convs.kWhtoCO2("                            ")

    def test_Water_normal(self):
        self.assertEqual(numpy.around(convs.kWhtoWater(550), 2).tolist(), [20.46, 357.5, 220, 487.85, 246.95, 2.75, 165])
        self.assertEqual(numpy.around(convs.kWhtoWater(36), 3).tolist(), [1.339, 23.4, 14.4, 31.932, 16.164, .18, 10.8])
        self.assertEqual(numpy.around(convs.kWhtoWater(2396), 3).tolist(), [89.131, 1557.4, 958.4, 2125.252, 1075.804, 11.98, 718.8])
        self.assertEqual(numpy.around(convs.kWhtoWater(29.75), 3).tolist(), [1.107, 19.338, 11.9, 26.388,  13.358, .149, 8.925])
        self.assertEqual(numpy.around(convs.kWhtoWater(.02), 5).tolist(), [.00074, .013, .008, .01774, .00898, .0001, .006])
        self.assertEqual(numpy.around(convs.kWhtoWater(724.434), 3).tolist(), [26.949, 470.882, 289.774, 642.573, 325.271, 3.622, 217.33])

    def test_Water_edge(self):
        self.assertEqual(numpy.around(convs.kWhtoWater(0), 3).tolist(), [0, 0, 0, 0, 0, 0, 0])

    def test_Water_invalid(self):
        with self.assertRaises(TypeError):
            convs.kWhtoWater("Yes")
            convs.kWhtoWater("")
            convs.kWhtoWater("Some more text...")
            convs.kWhtoWater("    ")
            convs.kWhtoWater("yippee456")

    def test_SO2_normal(self):
        self.assertEqual(numpy.around(convs.kWhtoSO2(550), 4).tolist(), [2.7934, 0, 0, 3.3424, 0, 0, .0017])
        self.assertEqual(numpy.around(convs.kWhtoSO2(33), 4).tolist(), [.1676, 0, 0, .2005, 0, 0, .0001])
        self.assertEqual(numpy.around(convs.kWhtoSO2(1759), 4).tolist(), [8.934, 0, 0, 10.6894, 0, 0, .0056])
        self.assertEqual(numpy.around(convs.kWhtoSO2(87.67), 4).tolist(), [.4453, 0, 0, .5328, 0, 0, .0003])
        self.assertEqual(numpy.around(convs.kWhtoSO2(.08), 4).tolist(), [.0004, 0, 0, .0005, 0, 0, 0])
        self.assertEqual(numpy.around(convs.kWhtoSO2(862.475), 4).tolist(), [4.3805, 0, 0, 5.2413, 0, 0, .0027])

    def test_SO2_edge(self):
        self.assertEqual(numpy.around(convs.kWhtoSO2(0), 3).tolist(), [0, 0, 0, 0, 0, 0, 0])

    def test_SO2_invalid(self):
        with self.assertRaises(TypeError):
            convs.kWhtoSO2("Yes")
            convs.kWhtoSO2("")
            convs.kWhtoSO2("Garbage text here")
            convs.kWhtoSO2("       ")
            convs.kWhtoSO2("Etcetera4569873245@$")

    def test_Land_normal(self):
        self.assertEqual(numpy.around(convs.kWhtoAcres(550), 2).tolist(), [8.8, 19.25, 1.1, 12.32, 0, 82.5, 19.8])
        self.assertEqual(numpy.around(convs.kWhtoAcres(46), 2).tolist(), [.74, 1.61, .09, 1.03, 0, 6.9, 1.66])
        self.assertEqual(numpy.around(convs.kWhtoAcres(1467), 2).tolist(), [23.47, 51.35, 2.93, 32.86, .01, 220.05, 52.81])
        self.assertEqual(numpy.around(convs.kWhtoAcres(62.47), 2).tolist(), [1, 2.19, .12, 1.4, 0, 9.37, 2.25])
        self.assertEqual(numpy.around(convs.kWhtoAcres(.063), 4).tolist(), [.001, .0022, .0001, .0014, 0, .0094, .0023])
        self.assertEqual(numpy.around(convs.kWhtoAcres(769.28), 2).tolist(), [12.31, 26.92, 1.54, 17.23, .01, 115.39, 27.69])

    def test_Land_edge(self):
        self.assertEqual(numpy.around(convs.kWhtoAcres(0), 3).tolist(), [0, 0, 0, 0, 0, 0, 0])

    def test_Land_invalid(self):
        with self.assertRaises(TypeError):
            convs.kWhtoAcres("Yes")
            convs.kWhtoAcres("")
            convs.kWhtoAcres("Text is not a valid input.")
            convs.kWhtoAcres("         ")
            convs.kWhtoAcres("&$*%(*^) and so on")

    def test_Score_normal(self):
        self.assertEqual(numpy.around(convs.kWhtoScore(550), 2).tolist(), [42.96, 100.38, 56.92, 267.89, 65.04, 22.82, 102.42])
        self.assertEqual(numpy.around(convs.kWhtoScore(48), 2).tolist(), [3.75, 8.76, 4.97, 23.38, 5.68, 1.99, 8.94])
        self.assertEqual(numpy.around(convs.kWhtoScore(1825), 2).tolist(), [142.55, 333.06, 188.89, 888.91, 215.81, 75.74, 339.85])
        self.assertEqual(numpy.around(convs.kWhtoScore(34.34), 2).tolist(), [2.68, 6.27, 3.55, 16.73, 4.06, 1.43, 6.39])
        self.assertEqual(numpy.around(convs.kWhtoScore(.051), 5).tolist(), [.00398, .00931, .00528, .02484, .00603, .00212, .0095])
        self.assertEqual(numpy.around(convs.kWhtoScore(957.268), 3).tolist(), [74.77, 174.701, 99.077, 466.261, 113.199, 39.727, 178.262])

    def test_Score_edge(self):
        self.assertEqual(numpy.around(convs.kWhtoScore(0), 3).tolist(), [0, 0, 0, 0, 0, 0, 0])

    def test_Score_invalid(self):
        with self.assertRaises(TypeError):
            convs.kWhtoScore("Yes")
            convs.kWhtoScore("")
            convs.kWhtoScore("This should not work")
            convs.kWhtoScore("  ")
            convs.kWhtoScore("Nothing12345")

if __name__ == '__main__':
    unittest.main()
