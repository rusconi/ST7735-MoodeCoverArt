#!/usr/bin/env python
import urllib2
stream_url = 'http://94.23.201.38:8040'
request = urllib2.Request(stream_url)
try:
    request.add_header('Icy-MetaData', 1)
    response = urllib2.urlopen(request)
    icy_metaint_header = response.headers.get('icy-metaint')
    if icy_metaint_header is not None:
        metaint = int(icy_metaint_header)
        read_buffer = metaint+255
        content = response.read(read_buffer)
        title = content[metaint:].split("'")[1]
        print(title)
except:
    print('Error')

