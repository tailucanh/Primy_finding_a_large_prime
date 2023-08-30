-module(fermat).
-export([mpow/3, fermat/1, test/2]).

mpow(N, 1, _) ->
    N;
mpow(N, K, M) ->
    mpow(K rem 2, N, K, M).

mpow(0, N, K, M) ->
    X = mpow(N, K div 2, M),
    (X * X) rem M;
mpow(_, N, K, M) ->
    X = mpow(N, K - 1, M),
    (X * N) rem M.

fermat(1) ->
    ok;

% Ban đầu
% fermat(P) ->
%     R = rand:uniform(P-1),
%     T = mpow(R, P-1, P),
%     case T == 1 of
%         true -> ok;
%         _ -> no
%     end.

% Tối ưu
fermat(P) ->
    R = rand:uniform(P-1),
    T = mpow(R, P-1, P),
    T == 1. 

test(_, 0) ->
    ok;
test(P, N) ->
    case fermat(P) of
        ok -> test(P, N-1);
        _ -> no
    end.
