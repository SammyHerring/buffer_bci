global sleepSec;
evalin('caller','global sleepSec;');
if ( isempty(sleepSec) && exist('WaitSecs') )
  try % check the the MEX will actually run!
    WaitSecs();
    sleepSec=@(t) WaitSecs(max(0,t));
  catch
  end
end
if ( isempty(sleepSec) )
  if ( exist('java')==2 )
    sleepSec=@(t) javaMethod('sleep','java.lang.Thread',max(0,t)*1000);      
  else
    sleepSec=@(t) pause(t);
  end
end
