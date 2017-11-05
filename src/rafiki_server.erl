-module(rafiki_server).
-behaviour(gen_statem).

-export([start/2, stop/1]).
-export([init/1, handle_event/4, code_change/4, terminate/3]).

-spec callback_mode() -> gen_statem:callback_mode_result().
callback_mode() -> state_functions.




