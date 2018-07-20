import httplib
import time

start = time.time()
endpoint = "istio.io"
conn = httplib.HTTPSConnection(endpoint)
print "Connecting to", endpoint
counter = 0
minutes_to_test = 16
sleep = 5
while counter < minutes_to_test*60/sleep:
    conn.request("GET", "/", headers={"Connection":" keep-alive"})
    r1 = conn.getresponse()
    r1.read()
    print "Time elapsed:", round(((time.time()- start)/60),1), "minutes"
    counter+=1
    print r1.status, r1.reason, conn.sock
    print
    time.sleep(sleep)

end = time.time()
print ("----")
print("END_TIME:", round(((end- start)/60),1), "minutes")
