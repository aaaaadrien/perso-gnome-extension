const GLib = imports.gi.GLib;
const ShellToolkit = imports.gi.St;
const Util = imports.misc.util;
const Gio   = imports.gi.Gio;


const Main = imports.ui.main;

let timer;

var default_opt = "uname"
var opt = default_opt;

let out;
let output = {};

let main_container_properties = { style_class: 'panel-button', reactive: true };
let main_container = new ShellToolkit.Bin(main_container_properties);

let main_container_content = new ShellToolkit.Label({ text: _get_info() });
let main_container_content_updater = function() { main_container_content.set_text(_get_info()); };

function _get_info()
{
	var command_output_string = "";
	var command_output_bytes = "";

	switch (opt) {
		case "title" :
			command_output_string = 'Test Adrien GNOME Extension';
			opt = "uname";
			break;
		case "uname" :
			command_output_string = 'Noyau : ';
			out = GLib.spawn_sync(null, ["bash","./.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/scripts/uname.sh","/"], null, GLib.SpawnFlags.SEARCH_PATH,null,null,null,output);
			command_output_bytes = new String(out[1]);
			opt = "disk";
			break;
		case "disk" :
			command_output_string = 'Disques : ';
			out = GLib.spawn_sync(null, ["bash","./.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/scripts/disk.sh","/"], null, GLib.SpawnFlags.SEARCH_PATH,null,null,null,output);
			command_output_bytes = new String(out[1]);
			opt = "sys";
			break;
		case "sys" :
			command_output_string = 'Système : ';
			out = GLib.spawn_sync(null, ["bash","./.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/scripts/sys.sh"], null, GLib.SpawnFlags.SEARCH_PATH,null,null,null,output);
			command_output_bytes = new String(out[1]);
			opt = "cpu";
			break;
		case "cpu" :
			command_output_string = 'CPU : ';
			out = GLib.spawn_sync(null, ["bash","./.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/scripts/cpu.sh"], null, GLib.SpawnFlags.SEARCH_PATH,null,null,null,output);
			command_output_bytes = new String(out[1]);
			opt = "memory";
			break;
		case "memory" :
			command_output_string = 'Mémoire : ';
			out = GLib.spawn_sync(null, ["bash","./.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/scripts/memory.sh"], null, GLib.SpawnFlags.SEARCH_PATH,null,null,null,output);
			command_output_bytes = new String(out[1]);
			opt = "net";
			break;
		case "net" :
			command_output_string = 'Adresse IP : ';
			out = GLib.spawn_sync(null, ["bash","./.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/scripts/net.sh"], null, GLib.SpawnFlags.SEARCH_PATH,null,null,null,output);
			command_output_bytes = new String(out[1]);
			opt = "sensor";
			break;
		case "sensor" :
			command_output_string = 'Temp : ';
			out = GLib.spawn_sync(null, ["bash","./.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/scripts/sensor.sh"], null, GLib.SpawnFlags.SEARCH_PATH,null,null,null,output);
			command_output_bytes = new String(out[1]);
			opt = default_opt;
			break;
		default:
			opt = "title";
	}

	/*for (var current_character_index = 0; current_character_index < command_output_bytes.length; ++current_character_index)
	{
		var current_character = String.fromCharCode(command_output_bytes[current_character_index]);
		command_output_string += current_character;
	}
	

	// UTF8 conversion
	command_output_string = decodeURIComponent(escape(command_output_string));

	return command_output_string.substring(0, command_output_string.length);*/
	return command_output_string+command_output_bytes;
}

function init()
{
	main_container.set_child(main_container_content);
	main_container.connect('button-press-event', main_container_content_updater);
}

function enable()
{
	Main.panel._rightBox.insert_child_at_index(main_container, 0);
	timer = GLib.timeout_add(GLib.PRIORITY_DEFAULT, 5000, () => {
        	main_container_content.set_text(_get_info());
        	return true; // Repeat
	});

}

function disable()
{
	Main.panel._rightBox.remove_child(main_container);
}

