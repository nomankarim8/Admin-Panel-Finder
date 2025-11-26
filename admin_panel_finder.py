#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
#Dont share without permission and credit me (nomankarim8)
import urllib.request
from urllib.error import URLError, HTTPError
   
def find_admin():
    try:
        with open("link.txt", "r") as f:
            link = input("Enter Site Name (ex: example.com or www.example.com): ")
            print("\nAvailable links:")
            
            for sub_link in f:
                sub_link = sub_link.strip()
                if not sub_link:
                    continue
                
                req_link = f"http://{link}/{sub_link}" 
                req = urllib.request.Request(req_link)
                
                try:
                    urllib.request.urlopen(req)
                except HTTPError as e:
                    continue
                except URLError as e:
                    continue
                else:
                    print("[OK] =>", req_link)
    except FileNotFoundError:
        print("Error: 'link.txt' not found!")
      
def credit():
    banner = """
🛡️=======================================🛡️
|        Admin Panel Finder Tool          |
|       Developed by: nomankarim8         |
|      For Legal & Ethical Use Only       |
🛡️=======================================🛡️
"""
    print(banner)


credit()
find_admin()