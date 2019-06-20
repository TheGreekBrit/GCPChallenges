from flask import Flask, abort
import json

app = Flask(__name__)

@app.route('/')
def place_holder():
    return 'Placeholder!'

@app.route('/v1/api/hello_world')
def hello_world():
    return 'Hello, World!'

@app.route('/v1/api/hello_world/json')
def hello_json_world():
    return json.dumps({'message': hello_world()})

@app.route('/v1/api/math/square/<NUM1>', methods=['POST'])
def square_num(NUM1):
    try:
        product = float(NUM1) ** 2.0
    except ValueError:
        abort(400)
    return json.dumps({'expression': '{} * {}'.format(NUM1, NUM1), 'product': product})

@app.route('/v1/api/math/sqrt/<NUM1>', methods=['POST'])
def sqrt_num(NUM1):
    try:
        root = float(NUM1)**(1/2.0)
    except ValueError:
        abort(400)
    return json.dumps({'expression': 'sqrt({})'.format(NUM1), 'product': root})


