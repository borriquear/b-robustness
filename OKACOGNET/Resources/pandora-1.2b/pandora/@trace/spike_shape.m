function obj = spike_shape(t, s, props)

% spike_shape - Convert averaged spikes in the trace to a spike_shape object.
%
% Usage:
% obj = spike_shape(trace, spikes, props)
%
%   Parameters:
%	trace: A trace object.
%	spikes: A spikes object on trace.
%
% Description:
%   Creates a spike_shape object.
%		
% See also: spike_shape
%
% $Id: spike_shape.m 896 2007-12-17 18:48:55Z cengiz $
%
% Author: 
%   Cengiz Gunay <cgunay@emory.edu>, 2004/08/04

% Copyright (c) 2007 Cengiz Gunay <cengique@users.sf.net>.
% This work is licensed under the Academic Free License ("AFL")
% v. 3.0. To view a copy of this license, please look at the COPYING
% file distributed with this software or visit
% http://opensource.org/licenses/afl-3.0.php.

if nargin < 2 % Called with insufficient params
  error('Need parameters.');
end

if ~ exist('props')
  props = struct([]);
end

% Find minimal ISI value for maximal range that can be acquired with
% single spikes
min_isi = min(getISIs(s));

% Points from left side of peak, depends on the half minimal isi
left = floor(min(5e-3 / t.dt, min_isi/2));

% Calculate right side accordingly
% Add some more on the right side
right = min_isi - left + floor(min(3e-3 / t.dt, left /2));

if length(s.times) > 0
  [allspikes, avgspikes] = collectspikes(t.data, s.times, left, right, 0);
  
  obj = spike_shape(avgspikes', t.dt, t.dy, t.id, props);
else
  %error('spike_shape:no_spikes', 'No spikes exist!');
  % Create empty object instead of error
  obj = spike_shape([], t.dt, t.dy, t.id, props);
end


