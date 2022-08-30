#!/usr/bin/env python
# encoding: utf-8
from contextlib import contextmanager

from sqlalchemy import text
from sqlalchemy.orm import sessionmaker

from research.extensions import db


class DbUtil(object):

    def Select(self, sql, alias=None):
        if alias:
            res_list = []
            for record in db.session.execute(sql):
                res_list.append(dict((zip(alias, record))))
            return res_list
        else:
            result = db.session.execute(sql)
            return list(result) if result else []

    def Change(self, sql):
        db.session.execute(sql)
