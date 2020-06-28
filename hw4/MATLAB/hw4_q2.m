I = imread('../HW4-woman.tif');
[M, N] = size(I);

for zero_padding = [0, 50, 100]
    zero_padding_M = M + zero_padding * 2;
    zero_padding_N = N + zero_padding * 2;
    zero_padding_I = zeros(zero_padding_M, zero_padding_N);
    zero_padding_I(zero_padding+1:zero_padding+M, zero_padding+1:zero_padding+N) = I;
    % imshow(zero_padding_I, [])
    F = fft2(zero_padding_I);
    
    for D0 = [5, 10, 50, 100]
        H = lpfilter('gaussian', zero_padding_M, zero_padding_N, D0);
        G = H .* F;
        g = real(ifft2(G));
        % imshow(g, []);
        
        save_g = g(zero_padding+1:zero_padding+M, zero_padding+1:zero_padding+N);
        save_g = save_g - min(save_g(:));
        save_g = save_g / max(save_g(:));
        
        path = append('../q2/q2_glpf_zp=', num2str(zero_padding), '_D0=', num2str(D0), '.png');
        imwrite(save_g, path);
    end
end