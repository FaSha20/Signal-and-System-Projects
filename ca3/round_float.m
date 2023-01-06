function out = round_float(in, float_s, float_e)
    if float_e - in <= in - float_s
        out = float_e;
    else
        out = float_s;
    end
end