#!/usr/bin/env python
# encoding: utf-8

from enum import Enum, unique


class Sex(Enum):
    male = 'male',
    female = 'female'


@unique
class Status(Enum):
    OK = {0: "success"}
    SERVER_ERROR = {1001: "System error！"}
    NOT_FOUND = {1002: "Not found"}

    PARAMS_ERROR = {2001: "Para error"}

    TOKEN_EXPIRED = {1101: "token expires，please log in again"}
    TOKEN_VERIFY_ERROR = {1102: "token is invalid，please log in again"}

    USER_NOT_EXIST = {1201: "Username or password is wrong"}

    def get_code(self):

        return list(self.value.keys())[0]

    def get_msg(self):

        return list(self.value.values())[0]


if __name__ == '__main__':
    print(Status.PARAMS_ERROR.get_msg())