%% DJC - 4-13-2018 - file to create EP testing paradigm for paired pulse protocl

% number of trials in a block
numTrials = 120;

% number of conditions to test, which will select values from TDT for
% values
numConditions = 4;

% create the conditions vector
conditionsVec = [0:numConditions-1];
conditionsTotal = repmat(conditionsVec,1,numTrials/numConditions);

% save conditions to a text file 
filename = sprintf('conditions_EP_test.txt');
fileID = fopen(filename,'w+');
fprintf(fileID,'%d\r\n',conditionsTotal);
fclose(fileID);
%%
freqStim = 2; % 2 Hz stimulation frequency 
periodStim = 1 /freqStim; % period of stimulation 
freqSystem = 24414; % frequency of RZ5D 
lengthTest = numTrials*periodStim; % how long to test for? 

stimTimes = [1:periodStim:lengthTest+1]; % stimulation times

% convert to samples
stimTimesSamps = round(stimTimes*freqSystem);

% save times to a text file 
filename = sprintf('times_EP_test.txt');
fileID = fopen(filename,'w+');
fprintf(fileID,'%d\r\n',stimTimesSamps);
fclose(fileID);


