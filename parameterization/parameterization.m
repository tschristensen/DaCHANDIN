clc;clear;close all;

ra_data_enc_motor = csvread('ra_data_enc_motor.csv',1,0);

V = ra_data_enc_motor(:,1);
I = ra_data_enc_motor(:,2);

Ra = sum(V)/sum(I)

ra_data_motor = csvread('ra_data_motor.csv',1,0);

V = ra_data_motor(:,1);
I = ra_data_motor(:,2);

Ra = sum(V)/sum(I)