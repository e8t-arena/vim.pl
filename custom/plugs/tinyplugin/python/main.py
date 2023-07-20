

# import urllib, urllib.request
# import json

import urllib
from urllib.request import Request
import re
import vim

def _get(url):
  # return urllib.request.urlopen(url, None, 5).read().strip().decode()
  # https://stackoverflow.com/questions/7933417/how-do-i-set-http-headers-using-pythons-urllib
  # new version: https://docs.python.org/3/library/urllib.request.html#urllib.request.Request
  req = Request(url)
  req.add_header('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36')
  resp = urllib.request.urlopen(req)
  return resp.read().strip().decode()
  
def _get_country():
  try:
    ip = _get('http://ipinfo.io/ip')
    # json_location_data = _get('http://api.ip2country.info/ip?%s' % ip)
    location_data = _get('https://www.ipshudi.com/%s.htm' % ip)
    location_data = re.search(r'<tr>[\S\s]+?归属地[\S\s]+?<span>([\S\s]+?)</span>[\S\s]+?<\/tr>', location_data, re.MULTILINE)
    # location_data = json.loads(json_location_data)
    # return location_data['countryName']
    data = location_data.group(1)
    print(ip, data)
    return data
  except Exception as e:
    print('Error in tinyplugin (%s)' % e.msg)

def print_country():
  print('User seems to be in %s' % _get_country())

# eval can evalaute any VimL expression and is certinaly not limited to accessing vars. But more often it will be more convenient to use other vim interfaces instead of eval.
# plugin_root_dir = vim.eval('s:plugin_root_dir')

# use other vim interfaces
def insert_country():
  row, col = vim.current.window.cursor
  current_line = vim.current.buffer[row-1]
  new_line = current_line[:col] + _get_country() + current_line[col:]
  vim.current.buffer[row-1] = new_line

if __name__ == '__main__':
  print('works')

