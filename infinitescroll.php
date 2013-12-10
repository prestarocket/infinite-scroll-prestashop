<?php

if (!defined('_PS_VERSION_'))
  exit;

require_once dirname( __FILE__ ) . '/includes/options.php';

class InfiniteScroll extends Module{

    static $instance;
    public $options;
    public $admin;
    public $submit;
    public $slug      = 'infinitescroll'; //plugin slug, generally base filename and in url on wordpress.org
    public $slug_     = 'infinitescroll'; //slug with underscores (PHP/JS safe)
    public $prefix    = 'infinitescroll_'; //prefix to append to all options, API calls, etc. w/ trailing underscore
    public $file      = null;
    public $behaviors = array(  //array of behaviors as key => array( label => js file ) (without extension)
                          'twitter' => array( 'label' => 'Manual Trigger', 'src'  => 'manual-trigger' ),
                          'local'   => array( 'label' => 'Local', 'src' => 'local' ),
                          'cufon'   => array( 'label' => 'Cufon', 'src' => 'cufon' ),
                          'masonry' => array( 'label' => 'Masonry/Isotope', 'src' => 'masonry-isotope')
                       );
    
    public function __construct(){

        $this->name = 'infinitescroll';
        $this->tab = 'front_office_features';
        $this->version = '1.0';
        $this->author = 'Prestastrap';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.5', 'max' => '1.6');

        parent::__construct();

        $this->displayName = $this->l('Infinite Scroll');
        $this->description = $this->l('Automatically loads the next page of products into the bottom of the initial page.');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');

        $this->options = new Infinite_Scroll_Options( $this );
        $this->init_defaults();
    }

    public function install(){
        if (!parent::install() OR !$this->registerHook('footer') OR !$this->registerHook('header'))
            return false;

        return true;
    }

    public function uninstall(){
        if (!Configuration::deleteByName($this->slug_) || !parent::uninstall())
            return false;
        return true;
    }

    /**
     * Init default options
     */
    private function init_defaults() {
        //option keys map to javascript options and are passed directly via wp_localize_script
        $this->options->defaults = array(
            'loading' => array(
                'msgText'         => '<em>' . $this->l( 'Loading...' ) . '</em>',
                'finishedMsg'     => '<em>' . $this->l( 'No additional posts.' ) . '</em>',
                'img'             => $this->_path.'img/ajax-loader.gif'
            ),
            'nextSelector'    => '#pagination_next > a',
            'navSelector'     => '.content_sortPagiBar',
            'itemSelector'    => '#product_list > li',
            'contentSelector' => '#product_list',
            'debug'           => false,
            'behavior'        => '',
            'callback'        => ''
        );
    }

    /**
     * Enqueue front-end JS and pass options to json_encoded array
     */
    public function hookHeader($params) {
        
        if (!$this->shouldLoadJavascript()) {
            return;
        }

        $options = $this->options->get_options();

        $suffix = $options['debug'] ? '.dev' : '' ;
        $file = "js/jquery.infinitescroll{$suffix}.js";

        $this->context->controller->addJS(($this->_path).$file);

        // If no behavior, we're done, kick
        if ( !$options['behavior'] )
          return;

        //sanity check
        if ( !array_key_exists( $options['behavior'], $this->behaviors ) )
          return false;
        
        $src = 'behaviors/' . $this->behaviors[ $options['behavior'] ]['src'] . '.js';
        $this->context->controller->addJS(($this->_path).$src);
    }

    /**
     * Load footer template to pass options array to JS
     */
    public function hookFooter($params){
        
        if (!$this->shouldLoadJavascript()) {
            return;
        }

        $options = $this->options->get_options();
        $options = $this->options->db_version_filter( $options );

        $options = json_encode($options);

        $this->smarty->assign(array('options' => $options));

        return $this->display(__FILE__, 'views/templates/hook/footer.tpl');
    }

    /**
     * Determines if the jQuery plugin and corresponding options should
     * be output onto the page.
     *
     * @return bool
     */
    function shouldLoadJavascript() {
        $enabledControllers = array( 'best-sales', 'category', 'manufacturer', 'new-products', 
            'search', 'supplier');
        if(isset($this->context->controller->php_self)){
            if(in_array($this->context->controller->php_self, $enabledControllers)){
                return true;
            }
        }
        return false;
    }

    public function getContent(){
        
        if (!empty($_POST)){
            $this->postProcess();
        }

        $this->smarty->assign(array('options' => $this->options->get_options(), 'behaviors' => $this->behaviors, 'version' => $this->version ));

        return $this->display(__FILE__, 'views/templates/admin/options.tpl');
    }

    public function postProcess(){
        
        $errors = array();
        
        if (Tools::isSubmit('btnSaveInfiniteScrollOptions')){
            $this->options->set_options(Tools::getValue('infinite_scroll'));
        }
        
    }

}
?>