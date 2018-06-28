import app, json, unittest

class APITest(unittest.TestCase):
    def test_hello_world(self):
        self.assertEqual(app.hello_world(), 'Hello, World!')

    def test_hello_json_world(self):
        self.assertEqual(app.hello_json_world(), json.dumps({'message': 'Hello, World!'}))

    def test_square_num(self):
        self.assertEqual(app.square_num(5), json.dumps({'expression': '5 * 5', 'product': 25.0}))

    def test_sqrt_num(self):
        self.assertEqual(app.sqrt_num(25), json.dumps({'expression': 'sqrt(25)', 'product': 5.0}))

if __name__ == '__main__':
    unittest.main()
