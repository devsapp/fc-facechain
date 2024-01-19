import subprocess
import sys
from flask import Flask

app = Flask(__name__)

@app.post('/invoke')
def invoke():
    try:
        subprocess.run('bash /initial/initial.sh', shell=True, stdout=sys.stdout, stderr=sys.stderr)
    except Exception as e:
        print(e)
        return "got error %s" % e
        
    return 'initial done'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000)