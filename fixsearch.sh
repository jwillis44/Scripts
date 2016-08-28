#!/bin/sh
dscl /Search -delete / CSPSearchPath "/Active Directory/CORP/All Domains"
dscl /Search/Contacts -delete / CSPSearchPath "/Active Directory/CORP/corp.m-ecs.org"
dscl /Search -append / CSPSearchPath "/Active Directory/CORP/corp.m-ecs.org"
sleep 10
dscl /Search/Contacts -append / CSPSearchPath "/Active Directory/CORP/corp.m-ecs.org"
sleep 10

