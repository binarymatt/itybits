import datetime, re, os
from fabric.api import env, local, run, sudo, cd, prefix, put

def prod(shell=True, pty=True):
    with cd('/home/matt/website'):
        run('git pull --rebase')
        with prefix('source /home/matt/.virtualenvs/blogofile/bin/activate'):
            run('blogofile build')

def create_post(title):
    template = """---
categories: 
date: {timestamp}
title: {title}
---
"""
    ts = datetime.datetime.now()
    ts = ts.strftime('%Y/%m/%d %H:%M:%S')
    aslug = re.sub('[^\w\s-]', '', title).strip().lower()
    aslug = re.sub('\s+', '-', aslug)
    last=os.listdir('_posts')[-1]
    number = last.split('-')[0]
    number = int(number) +1

    file_name = '%(num)03d-%(slug)s.markdown' % {'num':number, 'slug':aslug}
    f = open('_posts/%s' % file_name, 'w')
    f.write(template.format(timestamp=ts,title=title))
    f.close()

