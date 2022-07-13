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


# wind数据库
class DbUtilWind:

    def get_session(self):
        engine = db.get_engine(app=db.get_app(), bind='wind')
        Session = sessionmaker(bind=engine)
        return Session()

    # alias 为返回的数据添加别名，例：alias=(id, name) 返回:[{id: "00625", name: "陈鹏"}, {id: "196DD6", name: "陈嵩昆"}]
    def Select(self, sql, alias=None):
        try:
            self.session = self.get_session()
            if alias:
                res_list = []
                for record in self.session.execute(sql):
                    res_list.append(dict((zip(alias, record))))
                return res_list
            else:
                return self.session.execute(sql)
        except Exception as e:
            self.session.rollback()
            raise e
        finally:
            self.session.close()


class DbUtilAdmin:

    def get_session(self, bind='admin'):
        engine = db.get_engine(app=db.get_app(), bind=bind)
        Session = sessionmaker(bind=engine)
        return Session()

    @contextmanager
    def auto_commit(self, bind='admin'):
        try:
            self.session = self.get_session(bind=bind)
            yield
            self.session.commit()
        except Exception as e:
            self.session.rollback()
            raise e
        finally:
            self.session.close()

    """
       用于执行一次查询的数据库查询操作封装
    """

    def Update(self, sql='', params={}):
        session = self.session
        if sql:
            stmt = text(sql)
            if params:
                session.execute(stmt, params)
            else:
                session.execute(stmt)
        else:
            print("SQL为空!")


    def Select(self, sql='', params={}):
        resList = []
        session = self.session
        if sql:
            stmt = text(sql)
            if params:
                for record in session.execute(stmt, params):
                    rowDict = dict((zip(record.keys(), record)))
                    resList.append(rowDict)
                print(resList)
                return resList
            else:
                for record in session.execute(stmt):
                    # print(type(record))
                    rowDict = dict((zip(record.keys(), record)))
                    resList.append(rowDict)
                print(resList)
                return resList
        else:
            print("SQL为空!")

    def __del__(self):
        self.session.close()
