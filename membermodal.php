<?php include('perch/runtime.php'); ?>
<?php
    perch_content_custom("Members", array(
        "page" => "*",
        "template" => "_member-modal.html",
        "filter"   => "memberslug",
        "match"    => "eq",
        "value"    => perch_get('s')
    ));
?>