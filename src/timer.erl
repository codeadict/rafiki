-module(timer).

%# API
-export([
         make/2, 
         cancel/1
]).

make(Time, Msg) ->
    erlang:start_timer(Time, self(), {'$gen_cast', Msg}).

cancel(Reference) ->
    case erlang:cancel_timer(Reference) of
        false ->
            receive 
                {timeout, Reference, _} -> ok
            after
                0 -> false
            end;
        RemainingTime ->
            RemainingTime
    end.

