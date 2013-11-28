=== Infinite Scroll for Prestashop ===

Automatically append the next page of products (via AJAX) to your page when a user scrolls to the bottom. 

This module is based on the infinite-scroll jQuery plugin by Paul Irish (https://github.com/paulirish/infinite-scroll)

== Description ==

Infinite scroll has been called autopagerize, unpaginate, endless pages. But essentially it is pre-fetching content from a subsequent page and adding it directly to the user’s current page.

When a user scrolls towards the bottom of the page, the next page of products is automatically retrieved and appended. This means they never need to click "Next Page", which *dramatically increases stickiness*.  

Features:

* Works with any Prestashop 1.5.x theme
* Fully customizable to adapt to your site and theme
* Requires no (hopefully) template hacking, only a knowledge of CSS selectors.
* Countless API endpoints to modify the behavior.
* Backwards compatible: Will not break RSS readers, mobile devices, or browsers with javascript

== Changelog ==

= 1.0 =
* 2013 November 27 - 1.0 release.


== Screenshots ==

1. CSS Selector (theme) configuration options
2. Text and image options (to display as additional products load)

== Frequently Asked Questions ==

= What exactly is infinite scrolling? =

Essentially it is pre-fetching content from a subsequent page and adding it directly to the user’s current page. [More Information](http://www.infinite-scroll.com/the-interaction-design-pattern/)

= Can I change the number of products loaded? =

Yes. Go to Preferences -> Product in your Prestashop administrative dashboard.

= How do I change the alignment of the loading image? =

Add the following to your theme's css: `#infscr-loading img { text-align: ALIGNMENT; }` where "ALIGNMENT" is either `left`, `right`, or `center`.  

= How can I pass additional arguments such as behavior or callbacks to the script? =

Add a filter to `infinite_scroll_options` and adds additional options to the options array.

= Is the plugin available in my language? =

* Currently the plugin offers an English interface only.

= Is it SEO-Friendly? =
Yes all enhancements are made via javascript only, so search spiders see no difference.

= Is it accessible? =

Things won’t change for screen-readers. This technique degrades gracefully.

= Does it still keep going, even at the end of the blog? =

Infinite Scroll is configured to die when the maximum no of pages has been reached.

= Do I need to edit my theme to make this work? =

Probably not, nope.

== Installation ==

= Automatic Install =
1. Login to your Prestashop site as an Administrator
2. Navigate to Modules->Add a new module on top right
3. Upload the module zip file and click on Upload this module. 
4. Search for "Infinite Scroll" from Modules List and Click "Install"
5. Click "Configure" to access configuration