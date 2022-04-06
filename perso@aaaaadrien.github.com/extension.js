
const GLib = imports.gi.GLib;
const ShellToolkit = imports.gi.St;
const Util = imports.misc.util;
const Gio   = imports.gi.Gio;


const Main = imports.ui.main;

let timer;

let main_container_properties = { style_class: 'panel-button', reactive: true };
let main_container = new ShellToolkit.Bin(main_container_properties);

let main_container_content = new ShellToolkit.Label({ text: _get_info() });
let main_container_content_updater = function() { main_container_content.set_text(_get_info()); };

function _get_info()
{
	out = GLib.spawn_sync(null, ["bash","/home/adrien/.adrien/info-systeme.sh","/"], null, GLib.SpawnFlags.SEARCH_PATH,null,null,null,null);
	return out.toString();
}

function init()
{
	main_container.set_child(main_container_content);
	main_container.connect('button-press-event', main_container_content_updater);
}

function enable()
{
	Main.panel._rightBox.insert_child_at_index(main_container, 0);
	timer = GLib.timeout_add(GLib.PRIORITY_DEFAULT, 1000, () => {
        	main_container_content.set_text(_get_info());
        	return true; // Repeat
	});

}

function disable()
{
	Main.panel._rightBox.remove_child(main_container);
}

