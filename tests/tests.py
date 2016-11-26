from unittest import TestCase
import os
import sys

current = os.getcwd()
current = current.split("/")
current = "/".join(current[:-1])
sys.path.append(current)

from server import app
from model import connect_to_db, db, example_data


class FlaskTests(TestCase):

    def setUp(self):
        """Before tests."""

        self.client = app.test_client()
        app.config['TESTING'] = True
        # Connect to test database
        connect_to_db(app, "postgresql:///testdb")

        # Create tables and add sample data
        db.create_all()
        example_data()

    def tearDown(self):
        """For after test."""

        db.session.close()
        db.drop_all()

    def test_register(self):
        """Register test user"""

        result = self.client.post("/register",
                                  data={"first_name": "Jane",
                                        "last_name": "Doe",
                                        "email": "jane@gmail.com",
                                        "password": "123"},
                                  follow_redirects=True)
        self.assertIn("Registration successful!", result.data)

    def test_login(self):
        """Test login functionality"""

        login = self.client.post("/login",
                                 data={"email": "Jane@jane.com", "password": "password"},
                                 follow_redirects=True)
        self.assertIn("Success", login.data)
        logged_in = self.client.get("/products")
        self.assertIn("Account", logged_in.data)
        self.assertIn("Log Out", logged_in.data)

        logout = self.client.get("/logout", follow_redirects=True)
        self.assertNotIn("Account", logout.data)
        self.assertIn("Login", logout.data)

    # def test_logout(self):
    #     """Test logout functionality"""

    #     result = self.client.get("/logout", follow_redirects=True)

    #     self.assertNotIn("Account", result.data)
    #     self.assertIn("Login", result.data)

    def test_frontpage(self):
        """Test static frontpage"""

        result = self.client.get("/")

        self.assertIn("Enter", result.data)

    def test_all_products(self):
        """Test products listings"""

        result = self.client.get("/products")

        self.assertIn("Add to Cart</button>", result.data)

if __name__ == "__main__":
    import unittest

    unittest.main()
