using Gtk;

extern void exit(int exit_code);

class Rot13Window : GLib.Object {

    private Gtk.Window window;
    private Gtk.Button button_encode;
    private Gtk.TextView textview;

    public Rot13Window(string ui_file) {
        var builder = new Gtk.Builder();
        builder.add_from_file(ui_file);
        window = builder.get_object("window1") as Gtk.Window;
        button_encode = builder.get_object("button1") as Gtk.Button;
        textview = builder.get_object("textview1") as Gtk.TextView;

        window.destroy.connect(Gtk.main_quit);
        button_encode.clicked.connect(on_button_encode_clicked);
    }

    public void run() {
        window.show_all();
    }

    public void on_button_encode_clicked() {
        var buffer = textview.get_buffer();
        Gtk.TextIter start;
        Gtk.TextIter end;
        buffer.get_start_iter(out start);
        buffer.get_end_iter(out end);
        textview.set_buffer(buffer);
        var text = buffer.get_text(start, end, false);
        var encoded_text = rot13(text);
        buffer.set_text(encoded_text);
    }
}

private string find_ui_file() {
    var path = "rot13.ui";
    var file = File.new_for_path(path);
    
    if (!file.query_exists()) {
    
        path = "/usr/share/rot13-gtk/rot13.ui";
        file = File.new_for_path(path);
        
        if (!file.query_exists()) {
        
            stderr.printf("FATAL: Couldn't load UI file!");
            exit(1);
        }
    } 

    return path;
}

public void main(string[] args) {
    Gtk.init(ref args);
    var rot13window = new Rot13Window(find_ui_file());
    rot13window.run();
    Gtk.main();
}
