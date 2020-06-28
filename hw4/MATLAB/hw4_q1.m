I = imread('../HW4-woman.tif');

fft_result = fft2(double(I));
shifted_fft = fftshift(fft_result);
magnitude = abs(shifted_FFT);
log_magnitude = log(abs(shifted_FFT));
phase = angle(shifted_fft);
% imshow(magnitude, []);
% imshow(log_magnitude, []);
% imshow(phase, []);

save_magnitude = magnitude - min(magnitude(:));
save_magnitude = save_magnitude / max(save_magnitude(:));
save_log_magnitude = log_magnitude - min(log_magnitude(:));
save_log_magnitude = save_log_magnitude / max(save_log_magnitude(:));
save_phase = phase - min(phase(:));
save_phase = save_phase / max(save_phase(:));
imwrite(save_magnitude, '../q1/q1_magnitude.png');
imwrite(save_log_magnitude, '../q1/q1_log_magnitude.png');
imwrite(save_phase, '../q1/q1_phase.png');
