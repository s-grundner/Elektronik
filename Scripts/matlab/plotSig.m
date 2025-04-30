function plotSig(ya,figFlag)

  %display signal
  if figFlag
    figure
  end
  plotAx = 1:length(ya);
  scatter(plotAx,ya,"o","filled")
  grid on;
  hold on;
  for i = 1:length(plotAx)
      x = [i i];
      y = [0 ya(i)];
      line(x,y,'Color','blue','LineStyle','--')
  end
end

