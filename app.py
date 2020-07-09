from flask import Flask


app = Flask(__name__)


@app.route("/")
def index():
    return "Hello World!"


@app.route("/test")
def test():
    return "This is a test page!"


@app.route("/home")
def home():
    return "This is the 'home' page."


@app.errorhandler(404)
def not_found(error):
    return "Page not found.", 404
