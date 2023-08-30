-module(prime_server).
-export([start_server/0, init/0, handle_worker_request/1, handle_worker_response/2]).

start_server() ->
    register(prime_server, spawn(fun() -> init() end)).

init() ->
    loop(2, 0).

loop(CurrentNumber, HighestPrime) ->
    receive
        {worker_request, WorkerPid} ->
            WorkerPid ! {assign_number, CurrentNumber},
            loop(CurrentNumber + 1, HighestPrime);
        {worker_response, _WorkerPid, Prime} when Prime > HighestPrime ->
            io:format("New highest prime found: ~p~n", [Prime]),
            loop(CurrentNumber + 1, Prime);
        {worker_response, _WorkerPid, _} ->
            loop(CurrentNumber + 1, HighestPrime)
    end.


handle_worker_request(WorkerPid) ->
    prime_server ! {worker_request, WorkerPid}.


handle_worker_response(WorkerPid, Prime) ->
    prime_server ! {worker_response, WorkerPid, Prime}.

