using Gtk;

extern void exit(int exit_code);

[GtkTemplate (ui = "/org/mnewland/rot13_gtk/rot13.ui")]
class Rot13AppWindow : Gtk.ApplicationWindow {

    [GtkChild]
    private Gtk.Button button_encode;
    [GtkChild]
    private Gtk.TextView textview;

    public Rot13AppWindow(Gtk.Application app) {
        Object(application: app);
    }


    [GtkCallback]
    public void on_button_encode_clicked() {
        var buffer = textview.get_buffer();
        Gtk.TextIter start;
        Gtk.TextIter end;
        buffer.get_start_iter(out start);
        buffer.get_end_iter(out end);
        var text = buffer.get_text(start, end, false);
        var encoded_text = rot13(text);
        buffer.set_text(encoded_text);
    }
}

public class Rot13App : Gtk.Application {

    protected override void activate() {

        base.activate();
        var window = new Rot13AppWindow(this);
        window.show_all();
    }
}

public void main(string[] args) {
    new Rot13App().run();
}
