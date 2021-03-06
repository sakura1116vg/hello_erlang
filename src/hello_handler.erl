-module(hello_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
	%% cowboy_req:reply はレスポンスを生成します
	%% cowboy_req:reply( ステータスコード, ヘッダー, レスポンスボディ, 元のリクエスト変数 )
	{ok, Req2} = cowboy_req:reply(200,
		[{<<"content-type">>, <<"text/plain">>}],
		<<"Hello Erlang!">>,
		Req),
	{ok, Req2, State}.



terminate(_Reason, _Req, _State) ->
	ok.
