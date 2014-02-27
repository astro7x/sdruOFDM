function testPHYReceive(offsets, nodeNum)


% Create needed objects and structs
[...
    ObjAGC,...           %Objects
    ObjSDRuReceiver,...
    ObjSDRuTransmitter,...
    ObjDetect,...
    ObjPreambleDemod,...
    ObjDataDemod,...
    estimate,...         %Structs
    tx,...
    timeoutDuration,...  %Values/Vectors
    messageBits...
    ] = CreateTXRX_2;

lookingForACK = 0;

tx.offsetTable = offsets;
tx.nodeNum = nodeNum;

% Previous Message string holder
coder.varsize('previousMessage', [1, 80], [0 1]);
previousMessage = '';

for run = 1 : 1e8
    
    %MAC
    [~, previousMessage] = MACLayerReceiver(...
        ObjAGC,...           %Objects
        ObjSDRuReceiver,...
        ObjSDRuTransmitter,...
        ObjDetect,...
        ObjPreambleDemod,...
        ObjDataDemod,...
        estimate,...         %Structs
        tx,...
        timeoutDuration,...  %Values/Vectors
        messageBits,...
        lookingForACK,...
        previousMessage...
        );
    
    
end

end