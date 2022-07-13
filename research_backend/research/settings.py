#!/usr/bin/env python
# encoding: utf-8
'''

@Author : bodong
@File : settings.py 
@Time : 2021/3/25 9:52
@desc:  
'''

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
    FUNDS_DIALECT = 'mysql'
    FUNDS_DRIVER = 'pymysql'
    FUNDS_USERNAME = 'root'
    FUNDS_PASSWORD = 'root'
    FUNDS_HOST = '127.0.0.1'
    FUNDS_PORT = '3306'
    FUNDS_DATABASE = 'mondial'

    WIND_DIALECT = 'mysql'
    WIND_DRIVER = 'pymysql'
    WIND_USERNAME = 'readuser'
    WIND_PASSWORD = 'user123'
    WIND_HOST = 'windfof2014.mysql.rds.aliyuncs.com'
    WIND_PORT = '3306'
    WIND_DATABASE = 'wind'

    SQLALCHEMY_DATABASE_URI = "{}+{}://{}:{}@{}:{}/{}?charset=utf8".format(FUNDS_DIALECT, FUNDS_DRIVER, FUNDS_USERNAME,
                                                               FUNDS_PASSWORD, FUNDS_HOST, FUNDS_PORT, FUNDS_DATABASE)

    SQLALCHEMY_BINDS = {
        'wind': "{}+{}://{}:{}@{}:{}/{}?charset=utf8".format(WIND_DIALECT,  WIND_DRIVER,  WIND_USERNAME,
                                                             WIND_PASSWORD,  WIND_HOST,  WIND_PORT,  WIND_DATABASE)
    }

    LEVEL = "INFO"


config = {
    'development': DevelopmentConfig
}
