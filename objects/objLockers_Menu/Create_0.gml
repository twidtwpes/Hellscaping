var menu_layer = layer_get_id("Menu");
var menuO = [];
var menuP = []
var menuT = [];
var i = 0;
with (all) {
  if (layer == menu_layer) {
    menuO[i] = self;
	menuP[i] = [self.x, self.y];
	menuT[i] = [self.x, self.y];
	i++;
  }
}

menu_control = true;
menu_cursor = 0;
menu_items = 4;
menu_committed = false;
	
menu_move = 130;
menu_speed = 10;
menu_objects = menuO;
menu_positions = menuP;
menu_targets = menuT;

info_option = "";
info_msg = "";
info_item = "New";