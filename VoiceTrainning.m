clear all;
close all;
clc;
recorder = audiorecorder(16000,8,2);
disp('nhap vao giong noi cua ban');
drawnow();
pause(1);
recordblocking(recorder, 5);
play(recorder);
data=getaudiodata(recorder);
plot(data)
figure;
%% Feature Extraction
f=VoiceFeatures(data);
%% Save user data
uno=input('nhap vao ten nguoi dung :');
try
    load database
    F=[F;f];
    C=[C;uno];
    save database
catch
    F=f;
    C=uno;
    save database F C
end
msgbox('giong noi cua ban da duoc ghi')
