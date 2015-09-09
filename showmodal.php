<?php include('perch/runtime.php'); ?>
<?php
    perch_content_custom("Shows", array(
        "page" => "*",
        "template" => "_show-modal.html",
        "filter"   => "showslug",
        "match"    => "eq",
        "value"    => perch_get('s')
    ));
?>