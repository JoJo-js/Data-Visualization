#!/usr/bin/env python
# encoding: utf-8


from uuid import uuid4
import time, base64, hmac
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from passlib.apps import custom_app_context as pwd_context


def hash_password(password):  # 给密码加密方法
    return pwd_context.hash(password)


def verify_password(login_password, mine_password):  # 验证密码方法
    return pwd_context.verify(login_password, mine_password)


SECRET_KEY = 'abcdefghijklmm'

def sync():
    return ""


def generate_auth_token(user_id, expiration=3600*10):
    s = Serializer(SECRET_KEY, expires_in=expiration)
    return str(s.dumps({"user_id": user_id}), 'utf-8')


def verify_auth_token(token):
    s = Serializer(SECRET_KEY)
    data = s.loads(token)
    return data



def generate_token(key, expire=3600):
    ts_str = str(time.time() + expire)
    ts_byte = ts_str.encode("utf-8")
    sha1_ts_hex_str = hmac.new(key.encode("utf-8"), ts_byte, 'sha1').hexdigest()
    token = ts_str+':'+sha1_ts_hex_str
    b64_token = base64.urlsafe_b64encode(token.encode("utf-8"))
    return b64_token.decode("utf-8")


def certify_token(key, token):
    token_str = base64.urlsafe_b64decode(token).decode('utf-8')
    token_list = token_str.split(':')
    if len(token_list) != 2:
        return False
    ts_str = token_list[0]
    if float(ts_str) < time.time():
        return False
    known_sha1_ts_str = token_list[1]
    sha1 = hmac.new(key.encode("utf-8"), ts_str.encode('utf-8'), 'sha1')
    calc_sha1_ts_str = sha1.hexdigest()
    if calc_sha1_ts_str != known_sha1_ts_str:
        return False
    return True


def get_uuid():
    return str(uuid4()).replace('-', '')


if __name__ == '__main__':
    print(verify_password("123456","$6$rounds=656000$5vSgOB8ppqMZgl/N$qI0Dqc/l3Bnk8r4GAPtW5WuaqkO6jkHJmADevUdIFmWyY6ASNQWcyq/ljFGZYcfH2vY92DMASfVBgAwdOSW/A1"))
