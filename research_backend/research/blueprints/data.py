#!/usr/bin/env python
# encoding: utf-8
'''

@Author : bodong
@contact: wanghc@thwb.com.cn
@File : data.py
@Time : 2021/4/29 15:27
@desc:  基金基础查询蓝图
'''

from flask import request, current_app, Blueprint
from research.utils.result_json import success
from research.utils.db_util import DbUtilWind, DbUtil

data_bp = Blueprint('data', __name__)


# 查询基金公司
@data_bp.route('/database', methods=['GET'])
def database():
    sql = "show databases"
    companies = DbUtil().Select(sql)
    database_list = list(map(lambda x: x[0], companies))
    # print(database_list)
    return success(data=database_list)


@data_bp.route('/table', methods=['POST'])
def table():
    params = request.form.to_dict()
    # print(params)
    database_code = params["database_code"]
    sql = '''
           select table_name from information_schema.tables where table_schema='{}'
          '''.format(database_code)
    table = DbUtil().Select(sql)
    # print(table)
    table_list = list(map(lambda x: x[0], table))
    # print(table_list)
    return success(data=table_list)


# add:2021-03-11 查询基金类型
@data_bp.route('/type', methods=['POST'])
def fund_type():
    params = request.form.to_dict()
    table_id = params['table_id']
    print(params)
    sql = '''
        select distinct f_info_type from f_mutual_table_grade_week 
        where f_info_fundtable_id = "{}" 
        group by f_info_type
        '''.format(table_id)
    fund_types = DbUtil().Select(sql)
    fund_type_list = list(map(lambda x: x[0], fund_types))
    return success(data=fund_type_list)


@data_bp.route('/list', methods=['POST'])
def fund_list():
    params = request.form.to_dict()
    table_id = params['table_id']
    sql = '''
           SELECT m.F_INFO_WINDCODE, d.F_INFO_NAME, d.top_type, m.F_INFO_table_STARTDATE, m.F_INFO_table_LEAVEDATE
            FROM 
                chinamutualfundtable m, 
                (SELECT f_info_windcode,F_INFO_NAME,top_type FROM f_mutual_fund_type GROUP BY f_info_windcode,F_INFO_NAME,top_type ) d 
            WHERE F_INFO_FUNDtable_ID = '{}' AND m.F_INFO_WINDCODE = d.F_INFO_WINDCODE
              '''.format(table_id)
    result = DbUtil().Select(sql, ("wind_code", "fund_name", "fund_type", "in_office_date", "f_info_table_leavedate"))
    return success(data=result)
