# Current Deployment
This is an informal overview of the currently-deployed configuration; update as needed.

## General
**Last deployed configuration:** `inn-elk6-single-m5large.tfvars`  
**ES cluster:** `inn-log`  

## Logstash
**Endpoint:** `inn-log-write-e899ca9486a62c7e.elb.us-east-1.amazonaws.com`  
**Listener:** TCP port 5920; JSON codec  

## HTTP Proxy
**Endpoint:** `inn-log-1356815752.us-east-1.elb.amazonaws.com`  
**Authentication:** Basic Authentication  
**User:** `log`  
**Pass:** `Vx4gl%%PopqNuLAT`  
**Links:**
 - Kibana: http://inn-log-1356815752.us-east-1.elb.amazonaws.com/
 - Elasticsearch: http://inn-log-1356815752.us-east-1.elb.amazonaws.com/es/
 - Cerebro: http://inn-log-1356815752.us-east-1.elb.amazonaws.com/cerebro/
 - Health Test: http://inn-log-1356815752.us-east-1.elb.amazonaws.com/status/

# Deployment Steps

Work from the `/terraform-aws` directory.

To create/update the cluster, use:

    terraform plan -var-file="state/inn-elk6-single-m5large.tfvars" "-out=state/inn-elk6-single-m5large"
    terraform apply "state/inn-elk6-single-m5large"

To destroy the cluster, use:

    terraform destroy -var-file="state/inn-elk6-single-m5large.tfvars"
