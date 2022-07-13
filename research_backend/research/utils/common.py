from enum import Enum
import pandas as  pd
import numpy as np

class BenchMark(Enum):
    偏股基金='801003.SI'
    纯债基金='CBA00101.CS'#中债-新综合财富(总值)指数
    二级债基='885007.WI'
    绝对收益='CBA00101.CS'
    港股基金='HSI.HI'
    海外基金='SPX.GI'
    其他='CBA00101.CS'


class TypeMapBenchMark(Enum):
    偏股基金='偏股混合型基金指数'
    纯债基金='中债-新综合财富(总值)指数'
    二级债基='混合债券型二级基金指数'
    绝对收益='中债-新综合财富(总值)指数'
    港股基金='恒生指数'
    海外基金='标普500'
    其他='中债-新综合财富(总值)指数'


def get_benchmark():
    #path = 'F:\\project_bd\\指数监测模板old1.xlsx'
    path  = 'D:\\data\table\\指数监测模板old.xlsx'
    df = pd.read_excel(path, skiprows=6, sheet_name='收益率')
    df = df[df.columns[4:]]
    df.set_index('TRADE_DT', inplace=True)
    df.index = df.index.strftime('%Y%m%d')
    df = df.sort_index(ascending=True)
    return df


if __name__ == '__main__':
    # BM = BenchMark()
    # print(BenchMark['偏股基金'].value)
    # print(TypeMapBenchMark['偏股基金'].value)
    bencmark_df = get_benchmark()

    bm = bencmark_df[TypeMapBenchMark['偏股基金'].value]   ####指数净值
    df = pd.DataFrame({'price_date': ['20201201','20201202','20210101']})
    bm = bm[(bm.index>=df['price_date'].values[0]) & (bm.index <= df['price_date'].values[-1])]
    bm.iloc[0] = 0
    print(bm)
    cum_bm = np.cumprod(bm + 1)  ####指数净值
    print(cum_bm)
    # df = pd.merge(df,pd.DataFrame(cum_bm),left_on='price_date',right_on=pd.DataFrame(cum_bm).index)
    # #bm = bm[bm.index <= df['price_date'].values[-1]]
    # print(df[df.columns[1]])
    # print(df)
    # bencmark_df = get_benchmark()
    # print(bencmark_df['短期纯债型基金指数'])
    # print(bencmark_df['普通股票型基金指数'])

    # a = pd.DataFrame(bencmark_df, columns=['普通股票型基金指数','短期纯债型基金指数'])
    # print(bencmark_df[(bencmark_df.index >= '20200101') & (bencmark_df.index <= '20200110')])

    # date1 = ['2021','2020','2019','2018','2017','2016','2015']
    # date2 = ['2021','2020','2019','2018','2017']
    #
    # all_pd = pd.DataFrame({"date": date1, "ttt": ["a","b","c","d","e","f","g"]})
    # nd2 = pd.DataFrame({"date": date2, "ttt": ["1","2","3","4","5"]})
    # all_pd = pd.merge(all_pd, nd2, how='right', on=['date', 'date'])
    # print(all_pd)

