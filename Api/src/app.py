from flask import Flask,jsonify,request
from flask_mysqldb import MySQL

from config import config

app= Flask(__name__)

connection=MySQL(app)

@app.route('/messages', methods=['GET'])
def get_messages():
    try:
        cursor=connection.connection.cursor()
        sql= "SELECT Messages.message_id,Users.username, Messages.message_text FROM Users JOIN Messages ON Users.user_id = Messages.user_id;"
        cursor.execute(sql)
        data=cursor.fetchall()
        messages=[]
        for row in data:
            message={'message_id':row[0],'username':row[1],'message_text':row[2]}
            messages.append(message)
        return jsonify({'data':messages,"response":True})
    except Exception as ex:
        return jsonify({"response":False})




@app.route('/user/<username>/<password>', methods=['GET'])
def login_user(username, password):
    try:
        login_user = read_user(username,password)
        if login_user != None:
            return jsonify({'user': login_user, 'response': True})
        else:
            return jsonify({'messageError': "User not found", 'response': False})
    except Exception as ex:
        return jsonify({'messageError': "Error", 'response': False})


@app.route('/user', methods=['POST'])
def register_user():
    try:
        username=request.json['username']
        password=request.json['password']
        
        register_user=read_user(username,password)
        
        if register_user==None:
            cursor = connection.connection.cursor()
            sql= "INSERT INTO Users (username, password) VALUES ('{0}', '{1}');".format(username,password)
            cursor.execute(sql)
            connection.connection.commit() 
            return jsonify({'messageError': "Sucess",  'response': True})
        else:
            return jsonify({'messageError': "User not found", 'response': False})
        
    except Exception as ex:
        return jsonify({'messageError': "Error",  'response': False})








def read_user(username, password):
    try:
        cursor = connection.connection.cursor()
        sql = "SELECT username, password FROM users WHERE username = %s AND password = %s"
        parametre1=username
        parametre2=password
        cursor.execute(sql, (username,password))
        data = cursor.fetchone()
        
        if data != None:
            loginResponse = {'username': username, 'password':password}
            return loginResponse
        else:
            return None
    except Exception as ex:
        raise ex



def page_not_found(error):
    return "<h1>Page not found</h1>"

if __name__== '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404,page_not_found)
    app.run()
    
    