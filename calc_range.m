function [st, dr] = calc_range (fstart, fend, amplitude, phase)
bw = fend - fstart;
c = physconst('LightSpeed');
v = c;
dr = v / (2 * bw);
s = amplitude .* exp (1i * phase);
st = ifft(s);
st = st';
end