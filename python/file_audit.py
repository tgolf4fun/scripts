#!/usr/bin/env python
"""
Used to compare s3 file systems for differences
"""
#import os
#import sys
#from ConfigParser import SafeConfigParser
#from argparse import ArgumentParser
#import logging
#import logging.config
#import psycopg2
#import boto


print "Use this script to enter the name of 2 s3 buckets to see their delta or lack of one"
bucket1 = raw_input("Please enter name for bucket 1")
bucket2 = raw_input("Please enter name for bucket 2")
