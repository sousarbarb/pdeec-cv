close all
clear all
clc

%% TRAIN LOSS
RN18_train = [
  csvread("ResNet18_run-01_train-loss-corr.txt");
  csvread("ResNet18_run-02_train-loss-corr.txt");
  csvread("ResNet18_run-03_train-loss-corr.txt");
  csvread("ResNet18_run-04_train-loss-corr.txt");
  csvread("ResNet18_run-05_train-loss-corr.txt");
  csvread("ResNet18_run-06_train-loss-corr.txt")  ];
RN34_train = [
  csvread("ResNet34_run-01_train-loss-corr.txt");
  csvread("ResNet34_run-02_train-loss-corr.txt");
  csvread("ResNet34_run-03_train-loss-corr.txt");
  csvread("ResNet34_run-04_train-loss-corr.txt");
  csvread("ResNet34_run-05_train-loss-corr.txt")  ];
RN50_train = [
  csvread("ResNet50_run-01_train-loss-corr.txt");
  csvread("ResNet50_run-02_train-loss-corr.txt");
  csvread("ResNet50_run-03_train-loss-corr.txt");
  csvread("ResNet50_run-04_train-loss-corr.txt");
  csvread("ResNet50_run-05_train-loss-corr.txt");
  csvread("ResNet50_run-06_train-loss-corr.txt")  ];
t18 = linspace(0,6,length(RN18_train));
t34 = linspace(0,5,length(RN34_train));
t50 = linspace(0,6,length(RN50_train));
figure
hold on
plot(t18,RN18_train(:,2)*100/512,'.','MarkerSize',1,'LineWidth',0.1)
plot(t34,RN34_train(:,2)*100/384,'.','MarkerSize',1,'LineWidth',0.1)
plot(t50,RN50_train(:,2)*100/128,'.','MarkerSize',1,'LineWidth',0.1)
grid on
xlabel('epoch \rightarrow')
ylabel('accuracy (%) \rightarrow')
title(...
  {'Comparison of ResNet models on the Herbarium 2021 dataset',...
  'Training phase - Accuracy value per batch'})
legend('ResNet-18','ResNet-34','ResNet-50')

%% TEST MACRO F-SCORE
RN18_test = [9.487,22.47,29.37,31.67,32.90,32.65];
RN34_test = [7.479,18.45,23.94,31.36,31.29];
RN50_test = [10.87,24.28,32.32,34.59,36.04,34.75];

figure
hold on
plot(RN18_test,'--','Marker','square','LineWidth',0.1)
plot(RN34_test,'--','Marker','square','LineWidth',0.1)
plot(RN50_test,'--','Marker','square','LineWidth',0.1)
grid on
xlim([0 max([length(RN18_test),length(RN34_test),length(RN50_test)])+1])
ylim([0 max([RN18_test,RN34_test,RN50_test])*1.1])
xlabel('epoch \rightarrow')
ylabel('Avg. Macro F-Score (30% test data) \rightarrow')
title(...
  {'Comparison of ResNet models on the Herbarium 2021 dataset',...
  'Testing phase - Avg. Macro F-Score'})
legend('ResNet-18','ResNet-34','ResNet-50')