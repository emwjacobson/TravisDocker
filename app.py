from flask import Flask


app = Flask(__name__)


@app.route("/")
def home():
    return "Hello World!"


@app.route("/test")
def test():
    return "This is a test page!"


@app.errorhandler(404)
def not_found(error):
    return "Page not found.", 404
