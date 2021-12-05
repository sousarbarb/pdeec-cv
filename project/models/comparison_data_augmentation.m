close all
clear all
clc

%% TRAIN LOSS
RN50_train = [
  csvread("ResNet50_run-01_train-loss-corr.txt");
  csvread("ResNet50_run-02_train-loss-corr.txt");
  csvread("ResNet50_run-03_train-loss-corr.txt");
  csvread("ResNet50_run-04_train-loss-corr.txt");
  csvread("ResNet50_run-05_train-loss-corr.txt");
  csvread("ResNet50_run-06_train-loss-corr.txt")  ];
RN50_da_train = [
  csvread("ResNet50_da_run-01_train-loss-corr.txt");
  csvread("ResNet50_da_run-02_train-loss-corr.txt");
  csvread("ResNet50_da_run-03_train-loss-corr.txt");
  csvread("ResNet50_da_run-04_train-loss-corr.txt");
  csvread("ResNet50_da_run-05_train-loss-corr.txt");
  csvread("ResNet50_da_run-06_train-loss-corr.txt");
  csvread("ResNet50_da_run-07_train-loss-corr.txt");
  csvread("ResNet50_da_run-08_train-loss-corr.txt")  ];
t = linspace(0,6,length(RN50_train));
t_da = linspace(0,8,length(RN50_da_train));
figure
hold on
plot(t   ,RN50_train(:,2)*100/128,'.','MarkerSize',1,'LineWidth',0.1)
plot(t_da,RN50_da_train(:,2)*100/128,'.','MarkerSize',1,'LineWidth',0.1)
grid on
xlabel('epoch \rightarrow')
ylabel('accuracy (%) \rightarrow')
title(...
  {'Impact of using data augmentation on the Herbarium 2021 dataset',...
  'Training phase - Accuracy value per batch'})
legend('ResNet-50','ResNet-50 w/ data aug.')

%% TEST MACRO F-SCORE
RN50_test = [10.87,24.28,32.32,34.59,36.04,34.75];
RN50_da_test = [8.330,27.54,33.65,39.21,45.52,47.83,49.85,49.42];

figure
hold on
plot(RN50_test,'--','Marker','square','LineWidth',0.1)
plot(RN50_da_test,'--','Marker','square','LineWidth',0.1)
grid on
xlim([0 max([length(RN50_test),length(RN50_da_test)])+1])
ylim([0 max([RN50_test,RN50_da_test])*1.1])
xlabel('epoch \rightarrow')
ylabel('Avg. Macro F-Score (30% test data) \rightarrow')
title(...
  {'Impact of using data augmentation on the Herbarium 2021 dataset',...
  'Testing phase - Avg. Macro F-Score'})
legend('ResNet-50','ResNet-50 w/ data aug.')