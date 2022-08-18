#!/usr/bin/env python
# encoding: utf-8
'''
@File : performance.py 
@Time : 2021/5/18 17:59
@desc:  业绩概论
'''
# from WindPy import w
import time
from decimal import Decimal
from flask import request, Blueprint
from research.utils.result_json import success
from research.utils.db_util import DbUtil
import re
import pandas as pd
from research.utils import constant

performance_bp = Blueprint('performance', __name__)


@performance_bp.route('/sql', methods=['POST'])
def sql():
    params = request.form.to_dict()
    table = params['table']
    dict_return = {}
    fund_sql = '''
                  select * from {} limit 10 
               '''.format(table)
    result = DbUtil().Select(fund_sql)
    rr = list(result)
    sql = '''
            show columns from {}
    '''.format(table)
    result = DbUtil().Select(sql)
    header = list(map(lambda x: x[0], result))
    print(header)
    # dict_return.append(table)
    for i in range(len(header)):
        dict_return[header[i]] = list(map(lambda x: x[i], rr))
    print(dict_return)
    return success(data=dict_return)


@performance_bp.route('/er', methods=['POST'])
def er():
    params = request.form.to_dict()
    table = params['database']
    dict_return = []
    sql = '''
               select table_name from information_schema.tables where table_schema='{}'
              '''.format(table)
    result = DbUtil().Select(sql)
    table_list = list(map(lambda x: x[0], result))
    if 'fund_user_table' in table_list:
        table_list.remove('fund_user_table')
        table_list.remove('located')
    link = []
    # print(table_list)
    for i in range(len(table_list)):
        table_attri = {}
        sql = '''
                desc {}
        '''.format(table_list[i])
        result = DbUtil().Select(sql)
        item = list(map(lambda x: [x[0], x[3]], result))
        primary_key = []
        for j in range(len(item)):
            if item[j][1] == 'PRI':
                item[j][1] = True
                primary_key.append(item[j][0])
            else:
                item[j][1] = False
        table_attri['key'] = table_list[i]
        # table_attri['item'] = item
        # dict_return.append(table_attri)
        sql = '''
                        show create table {}
                '''.format(table_list[i])
        result = DbUtil().Select(sql)
        foreignkey = result[0][1]
        # print(foreignkey)
        foreignkey = re.findall(r"^(.+?)FOREIGN KEY \(`(.+?)`\) REFERENCES `(.+?)` \(`(.+?)`\)", foreignkey, re.M)
        # print(foreignkey, len(foreignkey))
        foreign_key = []
        isrelation = []
        for j in range(len(foreignkey)):
            # print(foreignkey, [foreignkey[j][1], foreignkey[j][2], foreignkey[j][3]])
            foreign = foreignkey[j][1].replace('`', '')
            foreign = foreign.replace(' ', '')
            foreign = foreign.split(',')
            if [foreignkey[j][1], foreignkey[j][2], foreignkey[j][3]] not in isrelation:
                isrelation.append([foreignkey[j][1], foreignkey[j][2], foreignkey[j][3]])
            # print(foreign)
            if len(foreign) > 0:
                for k in range(len(foreign)):
                    foreign_key.append(foreign[k])
        foreign_key = set(foreign_key)
        primary_key = set(primary_key)
        # print(foreign_key, primary_key)
        intersection = list(foreign_key & primary_key)
        if len(isrelation) > 1 and len(intersection) > 0:
            if foreign_key.issuperset(primary_key):
                nodetype = 'mtom'
            else:
                nodetype = '1to1'
        else:
            if foreign_key == primary_key:
                nodetype = 'subset'
            elif primary_key.issuperset(foreign_key) and len(foreign_key) > 0:
                nodetype = 'weak'
            else:
                nodetype = 'basic'
        if nodetype != 'basic':
            for j in range(len(item) - 1, -1, -1):
                if item[j][0] in foreign_key:
                    item.pop(j)
        # print(table_list[i], primary_key, foreign_key, nodetype, item)
        table_attri['item'] = item
        # print(item)
        table_attri['type'] = nodetype
        # print(table_attri)
        dict_return.append(table_attri)
        for j in range(len(isrelation)):
            if nodetype == 'mtom':
                link.append([table_list[i], isrelation[j][1], '1tom'])
            else:
                link.append([table_list[i], isrelation[j][1], '1to1'])
        # foreignkey = list(map(lambda x: x[2], foreignkey))
        # foreignkey = list(map(lambda x: [table_list[i], x], foreignkey))
        # for j in range(len(foreignkey)):
        #     s = (foreignkey[j][0], foreignkey[j][1])
        #     print(s)
        #     link.add(s)
        # print(foreignkey)
    # print(link)
    # print(dict_return)


    entity_table = []
    for i in range(len(dict_return)):
        if dict_return[i]['type'] == 'basic' or dict_return[i]['type'] == 'weak':
            entity_table.append(dict_return[i]['key'])
    # link = list(set(link))
    for i in range(len(link)-1, -1, -1):
        if (link[i][0] in entity_table) and (link[i][1] in entity_table):
            # print(link[i])
            table_attri = {'key': link[i][1] + '_' + link[i][0], 'type': 'mtom', 'item': []}
            dict_return.append(table_attri)
            # print(table_attri, [table_attri['key'], link[i][0], 'mtom'], [table_attri['key'], link[i][1], '1to1'])
            link.append([table_attri['key'], link[i][0], '1tom'])
            link.append([table_attri['key'], link[i][1], '1to1'])
            link.pop(i)
            # print(table_attri)
    # print(link)
    dic = {}
    dic['link'] = link
    dic['entity'] = dict_return
    # print(dict_return)
    return success(data=dic)

# {key: "Products",
#                     items: [{ name: "ProductID", iskey: true, figure: "Decision", color: colors.red },
#                     { name: "ProductName", iskey: false, figure: "Hexagon", color: colors.blue },
#                     { name: "SupplierID", iskey: false, figure: "Decision", color: "purple" },
#                     { name: "CategoryID", iskey: false, figure: "Decision", color: "purple" }]}
