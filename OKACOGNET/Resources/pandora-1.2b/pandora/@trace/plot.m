function h = plot(t, title_str, props)

% plot - Plots a trace.
%
% Usage: 
% h = plot(t)
%
% Description:
%
%   Parameters:
%	t: A trace object.
%	title_str: (Optional) String to append to plot title.
%	props: A structure with any optional properties, passed to plot_abstract.
%
%   Returns:
%	h: Handle to figure object.
%
% See also: trace, plot_abstract
%
% $Id: plot.m 896 2007-12-17 18:48:55Z cengiz $
%
% Author: Cengiz Gunay <cgunay@emory.edu>, 2004/08/04

% Copyright (c) 2007 Cengiz Gunay <cengique@users.sf.net>.
% This work is licensed under the Academic Free License ("AFL")
% v. 3.0. To view a copy of this license, please look at the COPYING
% file distributed with this software or visit
% http://opensource.org/licenses/afl-3.0.php.

if ~ exist('title_str')
  title_str = '';
end

if ~ exist('props')
  props = struct;
end

s = size(t);
if max(s) > 1
  % Column vector
  if s(1) > s(2)
    % Make a vertical stack plot (default)
    orientation = 'y';
  else
    orientation = 'x';		% or horizontal
  end
  plotFigure(plot_stack(num2cell(plotData(t)), [], orientation, title_str, props));
  %for i=1:length(t)
  %  plot(t(i), title_str);
  %end
else
  h = plotFigure(plotData(t, title_str, props));
end