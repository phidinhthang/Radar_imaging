function I = kirchhoff_migration_2D(B, h, er, t, xA, xQ, zQ)

c = 3e8;
Nt = numel(t);
NxQ = numel(xQ);
NzQ = numel(zQ);
NxA = numel(xA);

kernel = zeros(NxA, NxQ, NzQ);
Fs = 1/(t(2)-t(1));
f = linspace(-Fs/2, Fs/2, Nt);

B_f = fftshift(fft(B, [], 1), 1);
D12 = 

end