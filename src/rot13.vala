string rot13(string toEncode)
{
    var builder = new StringBuilder();
    unichar c;

    for (int i = 0; toEncode.get_next_char(ref i, out c);) {
        var upper = c.toupper();
        if (upper >= 'A' && upper <= 'M') {
            builder.append_unichar(c + 13);
        } else if (upper >= 'N' && upper <= 'Z') {
            builder.append_unichar(c - 13);
        } else {
            builder.append_unichar(c);
        }
    }
    
    return builder.str;
}
