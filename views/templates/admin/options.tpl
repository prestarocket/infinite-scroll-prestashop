{*
* Template to display options page
* @package Infinite_Scroll
*
*}
<div class="wrap">
	<h2>{l s='Infinite Scroll Settings' mod='infinite-scroll'} <small>v{$version}</small></h2>
	<p>{l s='Infinite scroll uses CSS selectors to identify various parts of your site\'s unique theme. In most cases, identifying each of your theme\'s elements below simply requires entering either the element\'s ID indicated with a hashmark, (<em>e.g.,</em><code>#content</code>), or the element\'s class indicated by a period, (<em>e.g.,</em><code>.product</code>). For more information, please see jQuery\'s CSS Selector documentation from here : http://docs.jquery.com/Selectors.' mod='infinite-scroll'}</p>
	<form method="post" action="{$smarty.server.REQUEST_URI|escape:'htmlall':'UTF-8'}" id="infinite_scroll_form">
		<fieldset>
			<legend>Settings</legend>
			
			<label>{l s='Content Selector' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<input type="text" name="infinite_scroll[contentSelector]" id="infinite_scroll[contentSelector]" value="{$options['contentSelector']}" class="regular-text" />
				<p class="clear">{l s='Div containing your theme\'s content' mod='infinite-scroll'}</p>
			</div>			
			
			<label>{l s='Navigation Selector' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<input type="text" name="infinite_scroll[navSelector]" id="infinite_scroll[navSelector]" value="{$options['navSelector']}" class="regular-text" /><br />
				<p class="clear">{l s='Div containing your theme\'s navigation' mod='infinite-scroll'}</p>		
			</div>
			
			<label>{l s='Next Selector' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<input type="text" name="infinite_scroll[nextSelector]" id="infinite_scroll[nextSelector]" value="{$options['nextSelector']}" class="regular-text"  /><br />
				<p class="clear">{l s='Link to next page of content' mod='infinite-scroll'}</p>		
			</div>
				
			<label>{l s='Item Selector' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<input type="text" name="infinite_scroll[itemSelector]" id="infinite_scroll[itemSelector]" value="{$options['itemSelector']}" class="regular-text" /><br />
				<p class="clear">{l s='Div containing an individual post' mod='infinite-scroll'}</p>
			</div>

			<label>{l s='Callback' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<textarea name="infinite_scroll[callback]" id="infinite_scroll[callback]" rows="6" cols="80">{$options['callback']}</textarea>
				<p class="clear">{l s='Code that is called after each new page is loaded' mod='infinite-scroll'}</p>
			</div>

			<label>{l s='Loading Message' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<textarea name="infinite_scroll[loading][msgText]" id="infinite_scroll[loading][msgText]" rows="6" cols="80">{$options['loading']['msgText']}</textarea>
				<p class="clear">{l s='Text to display as new posts are retrieved' mod='infinite-scroll'}</p>	
			</div>

			<label>{l s='Finished Message' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<textarea name="infinite_scroll[loading][finishedMsg]" id="infinite_scroll[loading][finishedMsg]" rows="6" cols="80">{$options['loading']['finishedMsg']}</textarea>
				<p class="clear">{l s='Text to display when no additional posts are available' mod='infinite-scroll'}</p>	
			</div>

			<label>{l s='Loading Image' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<p>{l s='Current Image:' mod='infinite-scroll'} <img src="{$options['loading']['img']}" alt="{l s='Current Loading Image' mod='infinite-scroll'}" /></p>
				<p>{l s='New Image URL:' mod='infinite-scroll'} <input id="infinite-scroll-upload-image" type="text" size="36" name="infinite_scroll[loading][img]" value="" /></p>
				<p><input id="infinite-scroll-reset-default-image" type="checkbox" name="reset_default_image" /> <label for="infinite-scroll-reset-default-image" style="float:none;">{l s='Check if you want to use default loading image.'}</label></p>
				<p class="clear">{l s='URL of existing image to display as new posts are retrieved.' mod='infinite-scroll'}</p>
			</div>
				
			<label>{l s='Behavior' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<select id="infinite_scroll[behavior]" name="infinite_scroll[behavior]">
	  			<option {if $options['behavior'] == ""}selected="selected"{/if} value="">Default</option>
	  			{foreach from=$behaviors key=k item=behavior}
					  <option value="{$k}" {if $k == $options['behavior']}selected="selected"{/if}>{$behavior['label']}</option>
				{/foreach}
				</select>
			</div>
				
			<label>{l s='Debug' mod='infinite-scroll'}</label>
			<div class="margin-form">
				<input name="infinite_scroll[debug]" id="infinite_scroll_debug_true" value="true" {if $options['debug']}checked="checked"{/if} type="radio">
				<label class="t" for="infinite_scroll_debug_true"> <img src="../img/admin/enabled.gif" alt="True" title="True"></label>
				<input name="infinite_scroll[debug]" id="infinite_scroll_debug_false" value="false" {if !$options['debug']}checked="checked"{/if} type="radio">
				<label class="t" for="infinite_scroll_debug_false"> <img src="../img/admin/disabled.gif" alt="False" title="False"></label>
			</div>
			
			<div class="margin-form">
				<br/>
				<input type="submit" name="btnSaveInfiniteScrollOptions" class="button button-primary" value="{l s='Save Options' mod='infinite-scroll'}" />
			</div>
		</fieldset>
	</form>
</div>