#!/usr/bin/env python
# encoding: utf-8
'''

@Author : bodong
@contact: bod@glsc.com.cn
@File : enum_status.py
@Time : 2021/3/31 15:03
@desc:  
'''
from enum import Enum, unique


class Sex(Enum):
    male = '男',
    female = '女'


@unique
class Status(Enum):
    OK = {0: "成功"}
    # 系统级别错误10 开头
    SERVER_ERROR = {1001: "系统异常，请稍后再试！"}
    NOT_FOUND = {1002: "查不到该数据"}
    # 客户端错误 20开头
    PARAMS_ERROR = {2001: "入参有误"}
    # auth token 11开头模块
    TOKEN_EXPIRED = {1101: "token过期，请重新登录"}
    TOKEN_VERIFY_ERROR = {1102: "token验证失败，请重新登录"}
    # auto user 12开头
    USER_NOT_EXIST = {1201: "用户名或密码错误"}

    def get_code(self):
        """
        根据枚举名称取状态码code
        :return: 状态码code
        """
        return list(self.value.keys())[0]

    def get_msg(self):
        """
        根据枚举名称取状态说明message
        :return: 状态说明message
        """
        return list(self.value.values())[0]


if __name__ == '__main__':
    print(Status.PARAMS_ERROR.get_msg())