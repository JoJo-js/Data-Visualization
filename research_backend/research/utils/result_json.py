#!/usr/bin/env python
# encoding: utf-8

from flask import json
from research.utils.enum_status import Status
import decimal
import numpy as np


class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return float(o)
        elif isinstance(o, np.integer):
            return int(o)
        elif isinstance(o, np.floating):
            return float(o)
        elif isinstance(o, np.ndarray):
            return o.tolist()
        else:
            return super(DecimalEncoder, self).default(o)


class HttpCode(object):
    OK = 0


def result(code=HttpCode.OK, message="", data=None, **kwargs):
    json_dict = {"code": code, "message": message, "data": data}
    if kwargs and isinstance(kwargs, dict) and kwargs.keys():
        json_dict.update(kwargs)
    return json.dumps(json_dict, cls=DecimalEncoder)


def success(data=None, **kwargs):
    return result(data=data, **kwargs)


def server_error(data=None):
    return result(code=Status.SERVER_ERROR.get_code(), message=Status.SERVER_ERROR.get_msg(), data=data)


def params_error():
    return result(code=Status.PARAMS_ERROR.get_code(), message=Status.PARAMS_ERROR.get_msg())


def token_expired():
    return result(code=Status.TOKEN_EXPIRED.get_code(), message=Status.TOKEN_EXPIRED.get_msg())


def token_verify_error():
    return result(code=Status.TOKEN_VERIFY_ERROR.get_code(), message=Status.TOKEN_VERIFY_ERROR.get_msg())


def not_found_error():
    return result(code=Status.NOT_FOUND.get_code(), message=Status.NOT_FOUND.get_msg())


def business_error(status, data=None):
    return result(status.get_code(), status.get_msg(), data)

