from unittest import TestCase
from server import app

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
        result = self.client.post("/login",
                                  data={"email": "jane@gmail.com", "password": "123"},
                                  follow_redirects=True)
        self.assertIn("Login successful!", result.data)

