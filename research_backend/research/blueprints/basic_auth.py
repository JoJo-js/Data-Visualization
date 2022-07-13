#!/usr/bin/env python
# encoding: utf-8
'''

@Author : bodong
@contact: wanghc@thwb.com.cn
@File : basic_auth.py
@Time : 2021/3/31 15:09
@desc:  
'''
from research.utils.db_util import DbUtil
from flask import request, Blueprint, jsonify
from research.utils.string_util import generate_auth_token, verify_password
from passlib.exc import UnknownHashError


basicAuth_bp = Blueprint('basicAuth', __name__)


@basicAuth_bp.route('/login', methods=['POST'])
def login():
    params = request.form.to_dict()
    userName = params['userName']
    password = params['password']
    try:
        sql = "select  password ,id from fund_user_table where user_name = '{}'".format(userName)
        result = DbUtil().Select(sql, ("password", "id"))
        user_info = result[0]
        if result:
            p = user_info['password']
            if verify_password(password, p):
                token = generate_auth_token(user_info['id'])
                return jsonify({"code": 0, "msg": "", "token": token, "username": userName})
            else:
                return jsonify({"code": -1, "msg": "用户名或密码错误"})
        else:
            return jsonify({"code": 1, "msg": "用户名或密码错误"})
    except UnknownHashError as e:
        return jsonify({"code": -1, "msg": "用户名或密码错误"})
    except Exception as e:
        return jsonify({"code": 1, "msg": "用户名或密码错误"})


