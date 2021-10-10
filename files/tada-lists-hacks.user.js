// ==UserScript==
// @name           Tada Lists Hacks
// @namespace      http://youngpup.net/userscripts
// @description    Fix Tada Lists mangled character
// @include        http://eban.tadalists.com/*
// ==/UserScript==

function add_item(content) {
  changed_list = true;
  if (movement_controls_on) {
    toggleMovementControls();
  }
  toggle_reorder_link(false);
  toggle_delete_link(false);
  id = xml_request(add_url+'&content='+encodeURIComponent(content));
  append_child_to_table(gebid("incomplete_items"),tr_with_todo_item(id,content));
}
