#!/usr/bin/env python
# encoding: utf-8

import os
import sys

basedir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))

# SQLite URI compatible
WIN = sys.platform.startswith('win')
if WIN:
    prefix = 'sqlite:///'
else:
    prefix = 'sqlite:////'


class BaseConfig(object):
    SECRET_KEY = os.getenv('SECRET_KEY', 'dev key')
    DEBUG_TB_INTERCEPT_REDIRECTS = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_RECORD_QUERIES = True

    MAIL_SERVER = os.getenv('MAIL_SERVER')
    MAIL_PORT = 465
    MAIL_USE_SSL = True
    MAIL_USERNAME = os.getenv('MAIL_USERNAME')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
    MAIL_DEFAULT_SENDER = ('flaskDemo Admin', MAIL_USERNAME)


class DevelopmentConfig(BaseConfig):
    DB_DIALECT = 'mysql'
    DB_DRIVER = 'pymysql'
    DB_USERNAME = 'root'
    DB_PASSWORD = 'root'
    DB_HOST = '127.0.0.1'
    DB_PORT = '3306'
    DB_DATABASE = 'website'

    SQLALCHEMY_DATABASE_URI = "{}+{}://{}:{}@{}:{}/{}?charset=utf8".format(DB_DIALECT, DB_DRIVER, DB_USERNAME,
                                                               DB_PASSWORD, DB_HOST, DB_PORT, DB_DATABASE)

    LEVEL = "INFO"


config = {
    'development': DevelopmentConfig
}
