for file = 1:5
    workspace_path = '/Users/samuelyu/Files/NCTU/3-2影像處理概論/Homework/hw1/';

    path = append(workspace_path, 'original_img/hw1_img', num2str(file), '.JPG');
    original = imread(path);
    resize = imresize(original, 0.2);
    crop = imcrop(resize, [0, 0, 640, 480]);
    gray = rgb2gray(crop);

    path = append(workspace_path, 'q1/hw1_img', num2str(file), '_q1.JPG');
    imwrite(gray, path)

    noise1 = imnoise(gray, 'gaussian');
    path = append(workspace_path, 'q2/hw1_img', num2str(file), '_q2_1.JPG');
    imwrite(noise1, path)
    noise2 = imnoise(gray, 'poisson');
    path = append(workspace_path, 'q2/hw1_img', num2str(file), '_q2_2.JPG');
    imwrite(noise2, path)
    noise3 = imnoise(gray, 'speckle');
    path = append(workspace_path, 'q2/hw1_img', num2str(file), '_q2_3.JPG');
    imwrite(noise3, path)

    rm_noise1 = medfilt2(noise1);
    path = append(workspace_path, 'q3/hw1_img', num2str(file), '_q3_1.JPG');
    imwrite(rm_noise1, path)
    rm_noise2 = medfilt2(noise2);
    path = append(workspace_path, 'q3/hw1_img', num2str(file), '_q3_2.JPG');
    imwrite(rm_noise2, path)
    rm_noise3 = medfilt2(noise3);
    path = append(workspace_path, 'q3/hw1_img', num2str(file), '_q3_3.JPG');
    imwrite(rm_noise3, path);

    hist_eql = histeq(gray);
    path = append(workspace_path, 'q4/hw1_img', num2str(file), '_q4.JPG');
    imwrite(hist_eql, path);
end
