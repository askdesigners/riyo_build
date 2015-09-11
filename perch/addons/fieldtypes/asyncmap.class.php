<?php
/* ------------ MAP ------------ */

class PerchFieldType_asyncmap extends PerchAPI_FieldType
{
    public static $mapcount = 1;
    public $processed_output_is_markup = true;

    public function add_page_resources()
    {
        $Perch = Perch::fetch();
        $Perch->add_foot_content('<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>');
        $Perch->add_javascript(PERCH_LOGINPATH.'/core/assets/js/maps.js');
    }

    public function render_inputs($details=array())
    {
        $s = $this->Form->text($this->Tag->input_id().'_adr', $this->Form->get((isset($details[$this->Tag->input_id()])? $details[$this->Tag->input_id()] : array()), 'adr', $this->Tag->default()), 'map_adr');
        $s .= '<div class="map" data-btn-label="'.PerchLang::get('Find').'" data-mapid="'.PerchUtil::html($this->Tag->input_id()).'" data-width="'.($this->Tag->width() ? $this->Tag->width() : '460').'" data-height="'.($this->Tag->height() ? $this->Tag->height() : '320').'">';
            if (isset($details[$this->Tag->input_id()]['admin_html'])) {
                $s .= $details[$this->Tag->input_id()]['admin_html'];
                $s .= $this->Form->hidden($this->Tag->input_id().'_lat',  $details[$this->Tag->input_id()]['lat']);
                $s .= $this->Form->hidden($this->Tag->input_id().'_lng',  $details[$this->Tag->input_id()]['lng']);
                $s .= $this->Form->hidden($this->Tag->input_id().'_clat', $details[$this->Tag->input_id()]['clat']);
                $s .= $this->Form->hidden($this->Tag->input_id().'_clng', $details[$this->Tag->input_id()]['clng']);
                $s .= $this->Form->hidden($this->Tag->input_id().'_type', $details[$this->Tag->input_id()]['type']);
                $s .= $this->Form->hidden($this->Tag->input_id().'_zoom', $details[$this->Tag->input_id()]['zoom']);
            }
        $s .= '</div>';
        return $s;
    }

    public function get_raw($post=false, $Item=false)
    {
        $var = '';
        if (isset($post[$this->Tag->id().'_adr']) && $post[$this->Tag->id().'_adr']!='') {
            $tmp = array();
            $tmp['adr'] = PerchUtil::safe_stripslashes(trim($post[$this->Tag->id().'_adr']));

            $map_fields = array('lat', 'lng', 'clat', 'clng', 'type', 'zoom');
            foreach($map_fields as $map_field) {
                if (isset($post[$this->Tag->id().'_'.$map_field]) && $post[$this->Tag->id().'_'.$map_field]!=''){
                    $tmp[$map_field] = $post[$this->Tag->id().'_'.$map_field];
                }
            }

            $var = $this->_process_map($this->unique_id.'-'.self::$mapcount, $this->Tag, $tmp);
            self::$mapcount++;
        }

        return $var;
    }

    public function get_processed($raw=false)
    {
        if ($raw===false) $raw = $this->get_raw();

        return $raw['html'];
    }

    public function get_search_text($raw=false)
    {
        if ($raw===false) $raw = $this->get_raw();

        if (!PerchUtil::count($raw)) return false;

        return $raw['_title'];
    }

    private function _process_map($id, $tag, $value)
    {
        $out = array();


        if (isset($value['adr'])) {

            $out['adr']     = $value['adr'];
            $out['_title']  = $value['adr'];
            $out['_default']= $value['adr'];

            if (!isset($value['lat'])) {

                $lat = false;
                $lng = false;

                $path = '/maps/api/geocode/json?address='.urlencode($value['adr']).'&sensor=false';
                $result = PerchUtil::http_get_request('http://', 'maps.googleapis.com', $path);
                if ($result) {
                    $result = PerchUtil::json_safe_decode($result, true);
                    //PerchUtil::debug($result);
                    if ($result['status']=='OK') {
                        if (isset($result['results'][0]['geometry']['location']['lat'])) {
                            $lat = $result['results'][0]['geometry']['location']['lat'];
                            $lng = $result['results'][0]['geometry']['location']['lng'];
                        }
                    }
                }
            }else{
                $lat = $value['lat'];
                $lng = $value['lng'];
            }

            $out['lat'] = $lat;
            $out['lng'] = $lng;


            if (!isset($value['clat'])) {
                $clat = $lat;
                $clng = $lng;
            }else{
                $clat = $value['clat'];
                $clng = $value['clng'];
            }

            $out['clat'] = $clat;
            $out['clng'] = $clng;

            if (!isset($value['zoom'])) {
                if ($tag->zoom()) {
                    $zoom = $tag->zoom();
                }else{
                    $zoom = 15;
                }
            }else{
                $zoom = $value['zoom'];
            }

            if (!isset($value['type'])) {
                if ($tag->type()) {
                    $type = $tag->type();
                }else{
                    $type = 'roadmap';
                }
            }else{
                $type = $value['type'];
            }


            $adr    = $value['adr'];

            if (PERCH_RWD) {
                $width  = ($tag->width() ? $tag->width() : '');
                $height = ($tag->height() ? $tag->height() : '');
            }else{
                $width  = ($tag->width() ? $tag->width() : '460');
                $height = ($tag->height() ? $tag->height() : '320');
            }

            $static_width  = ($width  == '' ? '460' : $width);
            $static_height = ($height == '' ? '320' : $height);

            $out['zoom'] = $zoom;
            $out['type'] = $type;

            $r  = '<img id="cmsmap'.PerchUtil::html($id).'" src="//maps.google.com/maps/api/staticmap';
            $r  .= '?center='.$clat.','.$clng.'&amp;sensor=false&amp;size='.$static_width.'x'.$static_height.'&amp;zoom='.$zoom.'&amp;maptype='.$type;
            if ($lat && $lng)   $r .= '&amp;markers=color:red|color:red|'.$lat.','.$lng;
            $r  .= '" ';
            if ($tag->class())  $r .= ' class="'.PerchUtil::html($tag->class()).'"';
            $r  .= ' width="'.$static_width.'" height="'.$static_height.'" alt="'.PerchUtil::html($adr).'" />';

            $out['admin_html'] = $r;

            $map_js_path = PerchUtil::html(PERCH_LOGINPATH).'/core/assets/js/public_maps.min.js';
            if (defined('PERCH_MAP_JS') && PERCH_MAP_JS) {
                $map_js_path = PerchUtil::html(PERCH_MAP_JS);
            }

            // JavaScript
            $r .= '<script type="text/javascript">/* <![CDATA[ */ ';
            $r .= "if(typeof CMSMap =='undefined'){var CMSMap={};CMSMap.maps=[];document.write('<scr'+'ipt type=\"text\/javascript\" src=\"".$map_js_path."\"><'+'\/sc'+'ript>');}";
            $r .= "CMSMap.maps.push({'mapid':'cmsmap".PerchUtil::html($id)."','width':'".$width."','height':'".$height."','type':'".$type."','zoom':'".$zoom."','adr':'".addslashes(PerchUtil::html($adr))."','lat':'".$lat."','lng':'".$lng."','clat':'".$clat."','clng':'".$clng."'});";
            $r .= '/* ]]> */';
            $r .= '</script>';


            if (defined('PERCH_XHTML_MARKUP') && PERCH_XHTML_MARKUP==false) {
                $r = str_replace('/>', '>', $r);
            }

            $out['html'] = $r;
        }

        return $out;
    }
}
