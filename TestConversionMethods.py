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

    def test_Score_normal(self):
        self.assertEqual(numpy.around(convs.kWhtoScore(550), 2).tolist(), [80.12, 191.12, 113.3, 527.95, 130.08, 4.4, 194.94])
        self.assertEqual(numpy.around(convs.kWhtoScore(48), 3).tolist(), [6.992, 16.68, 9.888, 46.076, 11.352, .384, 17.013])
        self.assertEqual(numpy.around(convs.kWhtoScore(1825), 3).tolist(), [265.857, 634.188, 375.95, 1751.836, 431.612, 14.6, 646.847])
        self.assertEqual(numpy.around(convs.kWhtoScore(34.34), 3).tolist(), [5.002, 11.933, 7.074, 32.963, 8.121, .275, 12.171])
        self.assertEqual(numpy.around(convs.kWhtoScore(.051), 5).tolist(), [.00743, .01772, .01051, .04896, .01206, .00041, .01808])
        self.assertEqual(numpy.around(convs.kWhtoScore(957.268), 3).tolist(), [139.45, 332.651, 197.197, 918.891, 226.394, 7.658, 339.291])

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
