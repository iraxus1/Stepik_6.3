import json

from flask import Flask

app = Flask(__name__)

import os
db_host = os.environ['localhost']
db_user = os.environ['postgres']
db_password = os.environ['postgres']
db_name = os.environ['cars']

#connect to database
import mysql.connector
db = mysql.connector.connect(
    host=db_host,
    user=db_user,
    passwd=db_password,
    database=db_name
)
cursor = db.cursor()

@app.route('/cars', methods=['GET'])
def cars():
    cursor.execute("SELECT * FROM cars")
    cars = cursor.fetchall()
    return json.dumps(cars)

@app.route('/cars/<year>', methods=['GET'])
def cars_by_year(year):
    cursor.execute("SELECT * FROM cars WHERE year = %s", (year,))
    cars = cursor.fetchall()
    return json.dumps(cars)

# Uncomment the following 2 lines to have the app listen on 0.0.0.0:5000
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)