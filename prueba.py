import requests
import json
import argparse
url_api = "http://18.218.244.166:8080/api/v2/{method}"
api_key = "Token edaf1740e048924e2f817fb6436a803b690c6900"
 
 
    
def upload(file_report, type_scan):
    headers = {
        'accept' : 'application/json',
        #'Content-Type': 'application/json',
        'Authorization' : api_key
    }
    report = {
        'file' : open(file_report, 'rb')
    }
    body = {
        'product_name' : 'WebGoat',
        'engagement_name' : 'omar',
        'product_type_name' : 'Research and Development',
        'active' : True,
        'verified' : True,
        'scan_type' : type_scan
    }

 
    response = requests.post(url_api.format(method = 'import-scan/'), data = body, files = report, headers=headers, verify=False)
    print (response.status_code)
    if response.status_code == 201:
        print(json.dumps(response.json(), indent=4))

if __name__== '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--file', '-f', dest='file', help='Nombre del reporte', required=True)
    parser.add_argument('--type-scan', '-t', dest='type_scan', help='Nombre de escaner', required=True)
    args = parser.parse_args()
    upload(args.file, args.type_scan)