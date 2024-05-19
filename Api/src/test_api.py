import unittest
import json
from app import app

class APITestCase(unittest.TestCase):

    def setUp(self):
        app.config['TESTING']=True
        self.app = app.test_client()

    def tearDown(self):
        pass

    def test_get_records_by_level(self):
        response = self.app.get('/records/1')
        data = json.loads(response.data)
        self.assertTrue(data['response'])
        self.assertEqual(len(data['data']), 2)

    def test_add_record_by_level(self):
        data = {
            'user_id': 3,
            'level_id': 3,
            'time': 500
        }
        response = self.app.post('/records', json=data)
        data = json.loads(response.data)
        self.assertTrue(data['response'])

    def test_get_messages(self):
        response = self.app.get('/messages')
        data = json.loads(response.data)
        self.assertTrue(data['response'])
        self.assertEqual(len(data['data']), 3)

    def test_add_message(self):
        data = {
            'user_id': 3,
            'message_text': 'Nuevo mensaje'
        }
        response = self.app.post('/messages', json=data)
        data = json.loads(response.data)
        self.assertTrue(data['response'])

    def test_login_user(self):
        response = self.app.get('/user/usuario1/contraseña1')
        data = json.loads(response.data)
        self.assertTrue(data['response'])
        self.assertEqual(data['user']['username'], 'usuario1')

    def test_register_user(self):
        data = {
            'username': 'usuario4',
            'password': 'contraseña4'
        }
        response = self.app.post('/user', json=data)
        data = json.loads(response.data)
        self.assertTrue(data['response'])

    def test_update_user_name(self):
        data = {
            'password': 'nueva_contraseña'
        }
        response = self.app.put('/user/usuario1/contraseña1', json=data)
        data = json.loads(response.data)
        self.assertTrue(data['response'])

    def test_delete_user(self):
        response = self.app.delete('/user/usuario1/nueva_contraseña')
        data = json.loads(response.data)
        self.assertTrue(data['response'])

if __name__ == '__main__':
    unittest.main()