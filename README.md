# nginx-nobots
Nginx server which self updates every day with known bad ips and blacklist them

Based on the daily/hourly updated ip lists from https://www.stopforumspam.com/ this script alow you to deploy a web server or proxy with the tranquility of not being woried about spamm bots, web crawlers or bad bots.

The builded image can be used as is, or can be re integrated in the nginx-proxy Dockerfile as base image to be used as a containers reverse-proxy https://hub.docker.com/r/jwilder/nginx-proxy/dockerfile using the FROM directive.
