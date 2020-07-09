import unittest
from app import app


class TestFlask(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_home(self):
        res = self.client.get("/")
        self.assertEqual(res.status_code, 202)

    def test_test(self):
        res = self.client.get("/test")
        self.assertEqual(res.status_code, 200)

    def test_404(self):
        res = self.client.get("/thisshould404")
        self.assertEqual(res.status_code, 404)
