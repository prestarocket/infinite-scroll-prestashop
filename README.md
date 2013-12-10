Infinite Scroll for Prestashop
==========================

Infinite Scroll Implementation for Prestashop. Automatically append the next page of products (via AJAX) to your page when a user scrolls to the bottom. 

This module is based on the [infinite-scroll jQuery plugin by Paul Irish](https://github.com/paulirish/infinite-scroll)

## Features ##

* Works with any Prestashop 1.5.x theme
* Fully customizable to adapt to your site and theme
* Requires no (hopefully) template hacking, only a knowledge of CSS selectors.
* Countless API endpoints to modify the behavior.
* Backwards compatible: Will not break RSS readers, mobile devices, or browsers with javascript.
* Activated in 'best-sales', 'category', 'manufacturer', 'new-products', 'search' and 'supplier' controllers.

## Installation ##

1. Login to your Prestashop site as an Administrator
2. Navigate to Modules->Add a new module on top right
3. Upload the module zip file and click on Upload this module. Please note : If you download the zip from git, you will have to rename the zip file to infinitescroll.zip before uploading.
4. Search for "Infinite Scroll" from Modules List and Click "Install"
5. Click "Configure" to access configuration

## Working with Block Layered Module ##

Block layered module uses ajax to load new products into the page after filtering. We need to create a new instance of infinite scroll everytime a the page is being refreshed. 

* You need to edit the file blocklayered.js of the block layered module. 
* Search for the function *reloadContent* (line 327 of Prestashop v1.5.6.0)
* Scroll down until you find this piece of code 
<pre>
if (result.pagination.search(/[^\s]/) >= 0) {
    if ($(result.pagination).find('ul.pagination').length){
        	$('div#pagination').show();
		    $('ul.pagination').each(function () {
		    	$(this).replaceWith($(result.pagination).find('ul.pagination'));
    		});
	}
</pre>
* Replace the above piece of code with this one (This works for default theme):
<pre>
if (result.pagination.search(/[^\s]/) >= 0) {
	if ($(result.pagination).find('ul.pagination').length){
		$('div#pagination').show();
		$('ul.pagination').each(function () {
			$(this).replaceWith($(result.pagination).find('ul.pagination'));
		});
		var noOfPages = $(result.pagination).find('ul.pagination > li').length; //Write the login to find the no of pages in your theme
		infinite_scroll.maxPage = noOfPages - 2;
		var path = 'modules/blocklayered/blocklayered-ajax.php?'+data+params_plus+n+'&p=';
		infinite_scroll.path = [ path , ""] ;
		infinite_scroll.dataType = 'json';
		infinite_scroll.template = function(data){
			var productList = '<div>' + data.productList + '</div>';
			var ht = $(productList).find(infinite_scroll.contentSelector).html();
			return ht;
		}
		$( infinite_scroll.contentSelector ).infinitescroll( infinite_scroll, function(newElements, data, url) { eval(infinite_scroll.callback); });
	}
</pre>
* And Infinite scroll should work with block layered module

## Support ##

If you need any help please let us know via Github or http://support.prestastrap.com/

## Changelog ##

### 1.0 ###
* 2013 November 27 - 1.0 release.
