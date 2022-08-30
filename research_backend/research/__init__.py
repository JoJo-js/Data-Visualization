#!/usr/bin/env python
# encoding: utf-8


from research.utils import string_util, result_json
from itsdangerous import BadSignature, SignatureExpired
import logging
import os
from logging.handlers import SMTPHandler, RotatingFileHandler
from flask_cors import CORS
from flask import Flask, render_template, request, jsonify, current_app, g
from research.blueprints.basic_auth import basicAuth_bp
from research.blueprints.data import data_bp
from research.blueprints.performance import performance_bp
from research.extensions import db
from research.settings import config

basedir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))


def create_app(config_name=None):
    if config_name is None:
        config_name = os.getenv('FLASK_CONFIG', 'development')
    app = Flask('flaskDemo')
    app.config.from_object(config[config_name])
    register_logging(app)        
    register_extensions(app)     
    register_blueprints(app)     
    register_errors(app)
    # register_request_handlers(app)
    register_cors(app)
    return app


def register_cors(app):
    CORS(app, supports_credentials=True)


def register_logging(app):
    logging.basicConfig(level=app.config['LEVEL'])  
    formatter = logging.Formatter('%(asctime)s - %(module)s - %(funcName)s - %(lineno)d - %(levelname)s - %(message)s')
    file_handler = RotatingFileHandler(os.path.join(basedir, 'logs/flaskDemo.log'),
                                       maxBytes=10 * 1024 * 1024, backupCount=10)
    file_handler.setFormatter(formatter)
    app.logger.addHandler(file_handler)


def register_extensions(app):
    db.init_app(app)


def register_blueprints(app):
    app.register_blueprint(basicAuth_bp, url_prefix='/basicAuth')  # system
    app.register_blueprint(data_bp, url_prefix='/data')  # api
    app.register_blueprint(performance_bp, url_prefix='/data/performance')


def register_errors(app):

    @app.errorhandler(500)
    def system_err(e):
        current_app.logger.error("[system_err]：{}".format(str(e)))
        return result_json.server_error(), 200

    @app.errorhandler(404)
    def not_found(e):
        current_app.logger.error("[not_found]：{}".format(str(e)))
        return result_json.not_found_error(), 200

    @app.errorhandler(400)
    def params_err(e):
        current_app.logger.error("[params_err]：{}".format(str(e)))
        return result_json.params_error(), 200


def register_request_handlers(app):
    @app.before_request
    def query_profiler():
        if request.method == 'GET':
            form_data = request.args
        else:
            if request.json:
                form_data = request.json
            else:
                form_data = request.form
        current_app.logger.info("[address：{}，para：{}]".format(request.path, form_data))
        if request.path == "/basicAuth/login":
            return None

        return None

