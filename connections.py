import httplib
import time

start = time.time()

conn = httplib.HTTPSConnection("codefresh.io")
counter = 0
minutes_to_test = 10
SLEEP = 2
while counter < minutes_to_test*60/SLEEP:
    conn.request("GET", "/", headers={"Connection":" keep-alive"})
    r1 = conn.getresponse()
    r1.read()
    print r1.status, r1.reason
    print conn.sock
    time.sleep(SLEEP)

end = time.time()
print(end - start)
