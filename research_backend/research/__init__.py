#!/usr/bin/env python
# encoding: utf-8
'''
@Author : wanghongchao
@File : __init__.py 
@Time : 2021/3/25 9:44
@desc:  
'''


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
    register_logging(app)        # 注册日志
    register_extensions(app)     # 注册扩展功能
    register_blueprints(app)     # 注册蓝图
    register_errors(app)
    # register_request_handlers(app)
    register_cors(app)
    return app


def register_cors(app):
    CORS(app, supports_credentials=True)


# 日志配置
def register_logging(app):
    logging.basicConfig(level=app.config['LEVEL'])  # 设置日志级别
    formatter = logging.Formatter('%(asctime)s - %(module)s - %(funcName)s - %(lineno)d - %(levelname)s - %(message)s')
    file_handler = RotatingFileHandler(os.path.join(basedir, 'logs/flaskDemo.log'),
                                       maxBytes=10 * 1024 * 1024, backupCount=10)
    file_handler.setFormatter(formatter)
    app.logger.addHandler(file_handler)


# 扩展功能
def register_extensions(app):
    db.init_app(app)


# 蓝图
def register_blueprints(app):
    app.register_blueprint(basicAuth_bp, url_prefix='/basicAuth')  # system
    app.register_blueprint(data_bp, url_prefix='/data')  # api
    app.register_blueprint(performance_bp, url_prefix='/data/performance')


def register_errors(app):

    @app.errorhandler(500)
    def system_err(e):
        current_app.logger.error("【system_err】：{}".format(str(e)))
        return result_json.server_error(), 200

    @app.errorhandler(404)
    def not_found(e):
        current_app.logger.error("【not_found】：{}".format(str(e)))
        return result_json.not_found_error(), 200

    @app.errorhandler(400)
    def params_err(e):
        current_app.logger.error("【params_err】：{}".format(str(e)))
        return result_json.params_error(), 200


# 请求前 校验token
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
        current_app.logger.info("【请求地址：{}，参数：{}】".format(request.path, form_data))
        if request.path == "/basicAuth/login":
            return None
        # else:
        #     try:
        #         token = request.headers.get('Authorization')
        #         if token:
        #             token_dict = string_util.verify_auth_token(token)
        #             g.user_id = token_dict['user_id']
        #         else:
        #             current_app.logger.error("【token不存在】接口：{}".format(str(request.path)))
        #             return result_json.params_error()
        #     except SignatureExpired:
        #         current_app.logger.error("【token过期】接口：{}".format(str(request.path)))
        #         return result_json.token_expired()
        #     except BadSignature:
        #         current_app.logger.error("【token解析失败】接口：{}".format(str(request.path)))
        #         return result_json.token_verify_error()
        #     return None
        return None

