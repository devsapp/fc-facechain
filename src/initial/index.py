# coding=utf-8
import os

def handler(event, context):
    if os.system("./entrypoint.sh") != 0:
        raise Exception("download error")
    return "ok"
