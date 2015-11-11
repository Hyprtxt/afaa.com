# Tag Magament

* New Ensighten space for AFAA tags
* Conditionally load the correct bootstrap based on a session variable.
* Need to setup a way to track if a user is AFAA or not, set a session/cookie var if a user views an AFAA specific product.
* Data layer should be identical for both brands.
* New sitefinity AFAA site will use new Ensighten space.
* NASM site will keep it's current space.
* StoreFront will read session var and determine which tag space to load.

The big one: **we need T&O to setup a session var specific to the AFAA flow**

The session var should persist all the way through order confirmation.

Need to consider the edge cases, someone who purchases from AFAA, then NASM.

...

## Original Notes

Tag Mgt:

Ensighten is the vendor sSince 2013

Use them to deploy tags and pixels on our website so it does not need to go through T&O

1 line of code on head on each page; Ensighten Bootstrap: Fire all of the pixels; where they want and how they want; Bootstrap

Marketing has a portal that they log in to control the pixels

Set up on SiteFinity and StoreFront

We will need to ensure that all the tags are firing for AFAA

Data Layer is a JSON object on the order confirmation page that contains the customer order info; Kent: Add a parameter to the order confirmation (is AFAA) field populate; *let's ask for an session var, and keep the data layer the same.*

Update the parameter on Google analytics for AFAA products = False *nope, diff analytics in diff space*

Need to understand how the tags will fire for AFAA and NASM within the order confirmation page - Kent *by reading a session var that is set when a user comes from AFAA, or views AFAA product*

The data layer on the checkout pages needs to carry over to the order confirmation.

The code is specific to T&O; Kent will be able to assist

Need to look at the URLs to ensure they route correctly

Is there a way to identify the AFAA traffic from NASM traffic? Per Kent:  We would need some indication in the URL for the AFAA product; set up a data point (end AFAA; AFAA = True) or include a window variable; need to distinguish the AFAA products

Set up a different space in Ensighten for AFAA; which would need a new Bootstrap - That is an option that is doable from Kent
