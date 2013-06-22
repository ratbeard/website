
Domain setup
============

1. Buy domain on iwantmyname
2. Create www.mikefrawley.com bucket in s3
    - enable for web
    - paste in bucket policy from [1]
3. Install middleman syng gem and set secret key config
    - load from un-checked in secrets.rb


Ugh, pretty painful as I tried setting up mikefrawley.com and
www.mikefrawley.com buckets in s3 and load from the naked domain.  I entered in
a redirect from mikefrawley.com => www.mikefrawley.com initialialy which I
tried to correct but s3 console wouldn't let me delete that entry.  Even
deleting and recreating the bucket kept it around.  Anyways, its a bit more
work to set that up anyways as it requires using amazon's dns system so I did a
dns level redirect.

[1] http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html


Asset hosting
=====

Setting up cloudfront was really easy.  Made assets{1-4} subdomain and enabled asset hosting in cofig.

w/o cloudfront: 62 requests  ❘  4.6 MB transferred  ❘  13.88 s (onload: 13.90 s, DOMContentLoaded: 2.11 s)
w/ cloudfront and 4 asset hosts: 62 requests  ❘  4.6 MB transferred  ❘  6.55 s (onload: 6.58 s, DOMContentLoaded: 3.01 s)
