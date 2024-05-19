from flask import Flask,jsonify,request
from flask_mysqldb import MySQL

from config import config

app= Flask(__name__)

connection=MySQL(app)



#Records methods

@app.route('/records/<level>', methods=['GET'])
def get_records_by_level(level):
    try:
        cursor=connection.connection.cursor()
        sql= "SELECT Users.username, Records.completion_time_seconds FROM Users INNER JOIN Records ON Users.user_id = Records.user_id WHERE Records.level_id = {0} ORDER BY Records.completion_time_seconds ASC;".format(level)
        cursor.execute(sql)
        data=cursor.fetchall()
        records=[]
        for row in data:
            record={'username':row[0],'completion_time_seconds':row[1]}
            records.append(record)
        return jsonify({'data':records,"response":True})
    except Exception as ex:
        return jsonify({"response":False})


@app.route('/records', methods=['POST'])
def add_record_by_level():
    try:
        user_id=request.json['user_id']
        level_id=request.json['level_id']
        time=request.json['time']
        
        cursor=connection.connection.cursor()
        sql= "INSERT INTO Records (user_id, level_id, completion_time_seconds) VALUES ('{0}', '{1}','{2}');".format(user_id,level_id,time)
        cursor.execute(sql)
        connection.connection.commit() 
        return jsonify({'messageResponse': "Sucess",  'response': True})
        
    except Exception as ex:
        return jsonify({'messageResponse': "Error",  'response': False})

#Message methods

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

@app.route('/messages', methods=['POST'])
def add_message():
    try:
        user_id=request.json['user_id']
        message_text=request.json['message_text']
        
        cursor=connection.connection.cursor()
        sql= "INSERT INTO Messages (user_id, message_text) VALUES ('{0}', '{1}');".format(user_id,message_text)
        cursor.execute(sql)
        connection.connection.commit() 
        return jsonify({'messageResponse': "Sucess",  'response': True})
        
    except Exception as ex:
        return jsonify({'messageResponse': "Error",  'response': False})


#User methods

@app.route('/user/<username>/<password>', methods=['GET'])
def login_user(username, password):
    try:
        login_user = read_user(username,password)
        if login_user != None:
            return jsonify({'user': login_user, 'response': True})
        else:
            return jsonify({'messageResponse': "User not found", 'response': False})
    except Exception as ex:
        return jsonify({'messageResponse': "Error", 'response': False})


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
            return jsonify({'messageResponse': "Sucess",  'response': True})
        else:
            return jsonify({'messageResponse': "User not found", 'response': False})
        
    except Exception as ex:
        return jsonify({'messageResponse': "Error",  'response': False})
    

@app.route('/user/<username>/<password>', methods=['PUT'])
def update_user_name(username,password):
    user = read_user(username, password)
    if user != None:
        try:
                cursor = connection.connection.cursor()
                sql = "UPDATE users SET password = '{0}' WHERE username = '{1}';".format(request.json['password'], username)
                cursor.execute(sql)
                connection.connection.commit()  
                return jsonify({'messageResponse': "User update", 'response': True})
        except Exception as ex:
            return jsonify({'messageResponse': "Error", 'response': False})
    else:
        return jsonify({'messageResponse': "Invalid user", 'response': False})



@app.route('/user/<username>/<password>',methods=['DELETE'])
def delete_user(username, password):
    try:
        user = read_user(username, password)
        if user != None:
            cursor = connection.connection.cursor()
            sql = "DELETE FROM users WHERE username = '{0}';".format(username)
            cursor.execute(sql)
            connection.connection.commit()  # Confirma la acción de eliminación.
            return jsonify({'messageResponse': "Sucess",  'response': True})
        else:
             return jsonify({'messageResponse': "Error",  'response': False})
    except Exception as ex:
        return jsonify({'messageResponse': "Error",  'response': False})







def read_user(username, password):
    try:
        cursor = connection.connection.cursor()
        sql = "SELECT user_id,username, password FROM users WHERE username = %s AND password = %s"
        parametre1=username
        parametre2=password
        cursor.execute(sql, (username,password))
        data = cursor.fetchone()
        
        if data != None:
            loginResponse = {'user_id':data[0], 'username': data[1], 'password':data[2]}
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
    
    