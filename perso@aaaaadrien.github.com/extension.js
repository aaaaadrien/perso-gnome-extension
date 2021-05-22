const {Gio, GLib, St} = imports.gi;
const Util = imports.misc.util;
const Main = imports.ui.main;
// const ByteArray = imports.byteArray;

// let msg = "Adrien GNOME Extension";
let msg = "";
let timer;
let nb = 0;
let files = [];
let directory;

let main_container_properties = { style_class: 'panel-button', reactive: true };
let main_container = new St.Bin(main_container_properties);

let main_container_content = new St.Label({ text: run_scripts() });
let main_container_content_updater = function() { main_container_content.set_text(run_scripts()); };

function run_scripts()
{
    if (files.length === 0) {
		return msg;
    } else {
        let [res, out] =GLib.spawn_sync(null, ["bash", "./.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/scripts/" + files[nb],"/"], null, GLib.SpawnFlags.SEARCH_PATH,null);

    	if (nb == files.length - 1) {
		    nb = 0;
        } else {
            nb += 1;
        }
		return ""+out;
    }
}

function init()
{
	let directoryPath = GLib.build_filenamev([GLib.get_current_dir() + "/.local/share/gnome-shell/extensions/perso@aaaaadrien.github.com/", "scripts"]);
	directory = Gio.File.new_for_path(directoryPath);

	let enumerator = directory.enumerate_children(Gio.FILE_ATTRIBUTE_STANDARD_NAME, Gio.FileQueryInfoFlags.NONE, null);
	let fileInfo = null;
	while ((fileInfo = enumerator.next_file(null)) !== null) {
		let file = enumerator.get_child(fileInfo);

		if (GLib.file_test(file.get_path(), GLib.FileTest.IS_EXECUTABLE) &&
		  !GLib.file_test(file.get_path(), GLib.FileTest.IS_DIR) &&
		  !file.get_basename().startsWith(".")) {
          files.push(file.get_basename());
		}
	}

	main_container.set_child(main_container_content);
	main_container.connect('button-press-event', main_container_content_updater);
}

function enable()
{
	Main.panel._rightBox.insert_child_at_index(main_container, 0);
	timer = GLib.timeout_add(GLib.PRIORITY_DEFAULT, 5000, () => {
			main_container_content.set_text(run_scripts());
        	return true;
	});
}

function disable()
{
	Main.panel._rightBox.remove_child(main_container);
}
