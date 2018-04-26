ä
NC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str (
)( )
]) *
[ 
assembly 	
:	 

AssemblyDescription 
( 
$str !
)! "
]" #
[ 
assembly 	
:	 
!
AssemblyConfiguration  
(  !
$str! #
)# $
]$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str +
)+ ,
], -
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str *
)* +
]+ ,
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str /
)/ 0
]0 1
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 

InternalsVisibleTo 
( 
$str 3
)3 4
]4 5
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
["" 
assembly"" 	
:""	 

Guid"" 
("" 
$str"" 6
)""6 7
]""7 8
[++ 
assembly++ 	
:++	 

AssemblyVersion++ 
(++ 
$str++ "
)++" #
]++# $
[,, 
assembly,, 	
:,,	 

AssemblyFileVersion,, 
(,, 
$str,, &
),,& '
],,' (·
UC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\ExecutionParameters.cs
	namespace 	
NStateManager
 
{ 
public 

class 
ExecutionParameters $
<$ %
T% &
,& '
TTrigger( 0
>0 1
{ 
public 
TTrigger 
Trigger 
{  !
get" %
;% &
}' (
public 
T 
Context 
{ 
get 
; 
}  !
public 
object 
Request 
{ 
get  #
;# $
}% &
public 
CancellationToken  
CancellationToken! 2
{3 4
get5 8
;8 9
}: ;
public 
ExecutionParameters "
(" #
TTrigger# +
trigger, 3
,
 
T 
context 
,
 
CancellationToken 
cancellationToken /
=0 1
default2 9
(9 :
CancellationToken: K
)K L
,
 
object 
request 
= 
null !
)! "
{ 	
Trigger 
= 
trigger 
; 
Context 
= 
context 
; 
Request 
= 
request 
; 
CancellationToken 
= 
cancellationToken  1
;1 2
} 	
}   
}!! µ
LC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\Extensions.cs
	namespace 	
NStateManager
 
{ 
public 

static 
class 

Extensions "
{ 
public 
static 
bool 
IsEqual "
<" #
TState# )
>) *
(* +
this+ /
TState0 6
first7 <
,< =
TState> D
secondE K
)K L
whereM R
TStateS Y
:Z [
IComparable\ g
{ 	
return 
first 
. 
	CompareTo "
(" #
second# )
)) *
==+ -
$num. /
;/ 0
} 	
} 
} ´
PC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\FunctionAction.cs
	namespace 	
NStateManager
 
{ 
internal 
class 
FunctionAction !
<! "
T" #
># $
:% &
FunctionActionBase' 9
<9 :
T: ;
>; <
{ 
internal 
Func 
< 
T 
, 
CancellationToken *
,* +
Task, 0
>0 1
Action2 8
{9 :
get; >
;> ?
}@ A
internal 
FunctionAction 
(  
Func  $
<$ %
T% &
,& '
CancellationToken( 9
,9 :
Task; ?
>? @
actionA G
)G H
{ 	
Action 
= 
action 
?? 
throw $
new% (!
ArgumentNullException) >
(> ?
nameof? E
(E F
actionF L
)L M
)M N
;N O
} 	
internal 
override 
async 
Task  $
ExecuteAsync% 1
(1 2
T2 3
context4 ;
,; <
CancellationToken= N
cancellationTokenO `
,` a
objectb h
requesti p
)p q
{ 	
await 
Action 
. 
Invoke 
(  
context  '
,' (
cancellationToken) :
): ;
.; <
ConfigureAwait< J
(J K%
continueOnCapturedContextK d
:d e
falsef k
)k l
;l m
} 	
} 
} ˆ
TC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\FunctionActionBase.cs
	namespace 	
NStateManager
 
{ 
public 

abstract 
class 
FunctionActionBase ,
<, -
T- .
>. /
{ 
internal 
abstract 
Task 
ExecuteAsync +
(+ ,
T, -
context. 5
,5 6
CancellationToken7 H
cancellationTokenI Z
,Z [
object\ b
requestc j
)j k
;k l
} 
} È
]C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\FunctionActionParameterized.cs
	namespace 	
NStateManager
 
{ 
internal 
class '
FunctionActionParameterized .
<. /
T/ 0
,0 1
TRequest2 :
>: ;
:< =
FunctionActionBase> P
<P Q
TQ R
>R S
{ 
internal 
Func 
< 
T 
, 
TRequest !
,! "
CancellationToken# 4
,4 5
Task6 :
>: ;
Action< B
{C D
getE H
;H I
}J K
internal '
FunctionActionParameterized ,
(, -
Func- 1
<1 2
T2 3
,3 4
TRequest5 =
,= >
CancellationToken? P
,P Q
TaskR V
>V W
actionX ^
)^ _
{ 	
Action 
= 
action 
?? 
throw $
new% (!
ArgumentNullException) >
(> ?
nameof? E
(E F
actionF L
)L M
)M N
;N O
} 	
internal 
override 
async 
Task  $
ExecuteAsync% 1
(1 2
T2 3
context4 ;
,; <
CancellationToken= N
cancellationTokenO `
,` a
objectb h
requesti p
)p q
{ 	
if 
( 
! 
( 
request 
is 
TRequest %
typedRequestType& 6
)6 7
)7 8
{ 
throw 
new 
ArgumentException )
() *
$"* ,
{, -
nameof- 3
(3 4
request4 ;
); <
}< =
 must be of type = N
{N O
typeofO U
(U V
TRequestV ^
)^ _
._ `
Name` d
}d e
.e f
"f g
)g h
;h i
}i j
await 
Action 
. 
Invoke 
(  
context  '
,' (
typedRequestType) 9
,9 :
cancellationToken; L
)L M
.M N
ConfigureAwaitN \
(\ ]%
continueOnCapturedContext] v
:v w
falsex }
)} ~
;~ 
}   	
}!! 
}"" ãV
UC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\IStateConfiguration.cs
	namespace 	
NStateManager
 
{ 
public 

	interface 
IStateConfiguration (
<( )
T) *
,* +
TState, 2
,2 3
TTrigger4 <
>< =
{ 
IStateConfiguration 
< 
T 
, 
TState %
,% &
TTrigger' /
>/ 0$
AddAutoDynamicTransition1 I
(I J
TTriggerJ R
triggerS Z
,Z [
Func\ `
<` a
Ta b
,b c
TStated j
>j k
functionl t
,t u
stringv |
name	} Å
=
Ç É
null
Ñ à
,
à â
uint
ä é
priority
è ó
=
ò ô
$num
ö õ
)
õ ú
;
ú ù
IStateConfiguration$$ 
<$$ 
T$$ 
,$$ 
TState$$ %
,$$% &
TTrigger$$' /
>$$/ 0$
AddAutoDynamicTransition$$1 I
<$$I J
TRequest$$J R
>$$R S
($$S T
TTrigger$$T \
trigger$$] d
,$$d e
Func$$f j
<$$j k
T$$k l
,$$l m
TRequest$$n v
,$$v w
TState$$x ~
>$$~ 
function
$$Ä à
,
$$à â
string
$$ä ê
name
$$ë ï
=
$$ñ ó
null
$$ò ú
,
$$ú ù
uint
$$û ¢
priority
$$£ ´
=
$$¨ ≠
$num
$$Æ Ø
)
$$Ø ∞
where%% 
TRequest%% 
:%% 
class%% "
;%%" #
IStateConfiguration00 
<00 
T00 
,00 
TState00 %
,00% &
TTrigger00' /
>00/ 0%
AddAutoFallbackTransition001 J
(00J K
TTrigger00K S
trigger00T [
,00[ \
TState00] c
	tempState00d m
,00m n
Func00o s
<00s t
T00t u
,00u v
bool00w {
>00{ |
	condition	00} Ü
,
00Ü á
string
00à é
name
00è ì
=
00î ï
null
00ñ ö
,
00ö õ
uint
00ú †
priority
00° ©
=
00™ ´
$num
00¨ ≠
)
00≠ Æ
;
00Æ Ø
IStateConfiguration<< 
<<< 
T<< 
,<< 
TState<< %
,<<% &
TTrigger<<' /
><</ 0%
AddAutoFallbackTransition<<1 J
<<<J K
TRequest<<K S
><<S T
(<<T U
TTrigger<<U ]
trigger<<^ e
,<<e f
TState<<g m
	tempState<<n w
,<<w x
Func<<y }
<<<} ~
T<<~ 
,	<< Ä
TRequest
<<Å â
,
<<â ä
bool
<<ã è
>
<<è ê
	condition
<<ë ö
,
<<ö õ
string
<<ú ¢
name
<<£ ß
=
<<® ©
null
<<™ Æ
,
<<Æ Ø
uint
<<∞ ¥
priority
<<µ Ω
=
<<æ ø
$num
<<¿ ¡
)
<<¡ ¬
where== 
TRequest== 
:== 
class== "
;==" #
IStateConfigurationHH 
<HH 
THH 
,HH 
TStateHH %
,HH% &
TTriggerHH' /
>HH/ 0$
AddAutoForwardTransitionHH1 I
(HHI J
TTriggerHHJ R
triggerHHS Z
,HHZ [
TStateHH\ b
toStateHHc j
,HHj k
FuncHHl p
<HHp q
THHq r
,HHr s
boolHHt x
>HHx y
	condition	HHz É
=
HHÑ Ö
null
HHÜ ä
,
HHä ã
string
HHå í
name
HHì ó
=
HHò ô
null
HHö û
,
HHû ü
uint
HH† §
priority
HH• ≠
=
HHÆ Ø
$num
HH∞ ±
)
HH± ≤
;
HH≤ ≥
IStateConfigurationTT 
<TT 
TTT 
,TT 
TStateTT %
,TT% &
TTriggerTT' /
>TT/ 0$
AddAutoForwardTransitionTT1 I
<TTI J
TRequestTTJ R
>TTR S
(TTS T
TTriggerTTT \
triggerTT] d
,TTd e
TStateTTf l
toStateTTm t
,TTt u
FuncTTv z
<TTz {
TTT{ |
,TT| }
TRequest	TT~ Ü
,
TTÜ á
bool
TTà å
>
TTå ç
	condition
TTé ó
=
TTò ô
null
TTö û
,
TTû ü
string
TT† ¶
name
TTß ´
=
TT¨ ≠
null
TTÆ ≤
,
TT≤ ≥
uint
TT¥ ∏
priority
TTπ ¡
=
TT¬ √
$num
TTƒ ≈
)
TT≈ ∆
whereUU 
TRequestUU 
:UU 
classUU "
;UU" #
IStateConfiguration__ 
<__ 
T__ 
,__ 
TState__ %
,__% &
TTrigger__' /
>__/ 0 
AddDynamicTransition__1 E
(__E F
TTrigger__F N
trigger__O V
,__V W
Func__X \
<__\ ]
T__] ^
,__^ _
TState__` f
>__f g
function__h p
,__p q
string__r x
name__y }
=__~ 
null
__Ä Ñ
,
__Ñ Ö
uint
__Ü ä
priority
__ã ì
=
__î ï
$num
__ñ ó
)
__ó ò
;
__ò ô
IStateConfigurationjj 
<jj 
Tjj 
,jj 
TStatejj %
,jj% &
TTriggerjj' /
>jj/ 0 
AddDynamicTransitionjj1 E
<jjE F
TRequestjjF N
>jjN O
(jjO P
TTriggerjjP X
triggerjjY `
,jj` a
Funcjjb f
<jjf g
Tjjg h
,jjh i
TRequestjjj r
,jjr s
TStatejjt z
>jjz {
function	jj| Ñ
,
jjÑ Ö
string
jjÜ å
name
jjç ë
=
jjí ì
null
jjî ò
,
jjò ô
uint
jjö û
priority
jjü ß
=
jj® ©
$num
jj™ ´
)
jj´ ¨
wherekk 
TRequestkk 
:kk 
classkk "
;kk" #
IStateConfigurationrr 
<rr 
Trr 
,rr 
TStaterr %
,rr% &
TTriggerrr' /
>rr/ 0
AddEntryActionrr1 ?
(rr? @
Actionrr@ F
<rrF G
TrrG H
>rrH I
actionrrJ P
)rrP Q
;rrQ R
IStateConfigurationzz 
<zz 
Tzz 
,zz 
TStatezz %
,zz% &
TTriggerzz' /
>zz/ 0
AddEntryActionzz1 ?
(zz? @
Actionzz@ F
<zzF G
TzzG H
>zzH I
actionzzJ P
,zzP Q
TStatezzR X
previousStatezzY f
)zzf g
;zzg h!
IStateConfiguration
ÅÅ 
<
ÅÅ 
T
ÅÅ 
,
ÅÅ 
TState
ÅÅ %
,
ÅÅ% &
TTrigger
ÅÅ' /
>
ÅÅ/ 0
AddExitAction
ÅÅ1 >
(
ÅÅ> ?
Action
ÅÅ? E
<
ÅÅE F
T
ÅÅF G
>
ÅÅG H
action
ÅÅI O
)
ÅÅO P
;
ÅÅP Q!
IStateConfiguration
ââ 
<
ââ 
T
ââ 
,
ââ 
TState
ââ %
,
ââ% &
TTrigger
ââ' /
>
ââ/ 0
AddExitAction
ââ1 >
(
ââ> ?
Action
ââ? E
<
ââE F
T
ââF G
>
ââG H
action
ââI O
,
ââO P
TState
ââQ W
	nextState
ââX a
)
ââa b
;
ââb c!
IStateConfiguration
êê 
<
êê 
T
êê 
,
êê 
TState
êê %
,
êê% &
TTrigger
êê' /
>
êê/ 0
AddReentryAction
êê1 A
(
êêA B
Action
êêB H
<
êêH I
T
êêI J
>
êêJ K
action
êêL R
)
êêR S
;
êêS T!
IStateConfiguration
õõ 
<
õõ 
T
õõ 
,
õõ 
TState
õõ %
,
õõ% &
TTrigger
õõ' /
>
õõ/ 0
AddTransition
õõ1 >
(
õõ> ?
TTrigger
õõ? G
trigger
õõH O
,
õõO P
TState
õõQ W
toState
õõX _
,
õõ_ `
Func
õõa e
<
õõe f
T
õõf g
,
õõg h
bool
õõi m
>
õõm n
	condition
õõo x
=
õõy z
null
õõ{ 
,õõ Ä
stringõõÅ á
nameõõà å
=õõç é
nullõõè ì
,õõì î
uintõõï ô
priorityõõö ¢
=õõ£ §
$numõõ• ¶
)õõ¶ ß
;õõß ®!
IStateConfiguration
ßß 
<
ßß 
T
ßß 
,
ßß 
TState
ßß %
,
ßß% &
TTrigger
ßß' /
>
ßß/ 0
AddTransition
ßß1 >
<
ßß> ?
TRequest
ßß? G
>
ßßG H
(
ßßH I
TTrigger
ßßI Q
trigger
ßßR Y
,
ßßY Z
TState
ßß[ a
toState
ßßb i
,
ßßi j
Func
ßßk o
<
ßßo p
T
ßßp q
,
ßßq r
TRequest
ßßs {
,
ßß{ |
boolßß} Å
>ßßÅ Ç
	conditionßßÉ å
,ßßå ç
stringßßé î
nameßßï ô
=ßßö õ
nullßßú †
,ßß† °
uintßß¢ ¶
priorityßßß Ø
=ßß∞ ±
$numßß≤ ≥
)ßß≥ ¥
where
®® 
TRequest
®® 
:
®® 
class
®® "
;
®®" #!
IStateConfiguration
∞∞ 
<
∞∞ 
T
∞∞ 
,
∞∞ 
TState
∞∞ %
,
∞∞% &
TTrigger
∞∞' /
>
∞∞/ 0
AddTriggerAction
∞∞1 A
(
∞∞A B
TTrigger
∞∞B J
trigger
∞∞K R
,
∞∞R S
Action
∞∞T Z
<
∞∞Z [
T
∞∞[ \
>
∞∞\ ]
action
∞∞^ d
)
∞∞d e
;
∞∞e f!
IStateConfiguration
ππ 
<
ππ 
T
ππ 
,
ππ 
TState
ππ %
,
ππ% &
TTrigger
ππ' /
>
ππ/ 0
AddTriggerAction
ππ1 A
<
ππA B
TRequest
ππB J
>
ππJ K
(
ππK L
TTrigger
ππL T
trigger
ππU \
,
ππ\ ]
Action
ππ^ d
<
ππd e
T
ππe f
,
ππf g
TRequest
ππh p
>
ππp q
action
ππr x
)
ππx y
;
ππy z!
IStateConfiguration
¿¿ 
<
¿¿ 
T
¿¿ 
,
¿¿ 
TState
¿¿ %
,
¿¿% &
TTrigger
¿¿' /
>
¿¿/ 0
MakeSubStateOf
¿¿1 ?
(
¿¿? @!
IStateConfiguration
¿¿@ S
<
¿¿S T
T
¿¿T U
,
¿¿U V
TState
¿¿W ]
,
¿¿] ^
TTrigger
¿¿_ g
>
¿¿g h&
superStateConfiguration¿¿i Ä
)¿¿Ä Å
;¿¿Å Ç
}
¡¡ 
}¬¬ Èa
ZC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\IStateConfigurationAsync.cs
	namespace 	
NStateManager
 
{ 
public 

	interface $
IStateConfigurationAsync -
<- .
T. /
,/ 0
TState1 7
,7 8
TTrigger9 A
>A B
{ $
IStateConfigurationAsync  
<  !
T! "
," #
TState$ *
,* +
TTrigger, 4
>4 5+
AddAutoForwardDynamicTransition6 U
(U V
TTriggerV ^
trigger_ f
,f g
Funch l
<l m
Tm n
,n o
TStatep v
>v w
function	x Ä
,
Ä Å
string
Ç à
name
â ç
=
é è
null
ê î
,
î ï
uint
ñ ö
priority
õ £
=
§ •
$num
¶ ß
)
ß ®
;
® ©$
IStateConfigurationAsync&&  
<&&  !
T&&! "
,&&" #
TState&&$ *
,&&* +
TTrigger&&, 4
>&&4 5+
AddAutoForwardDynamicTransition&&6 U
<&&U V
TRequest&&V ^
>&&^ _
(&&_ `
TTrigger&&` h
trigger&&i p
,&&p q
Func&&r v
<&&v w
T&&w x
,&&x y
TRequest	&&z Ç
,
&&Ç É
TState
&&Ñ ä
>
&&ä ã
function
&&å î
,
&&î ï
string
&&ñ ú
name
&&ù °
=
&&¢ £
null
&&§ ®
,
&&® ©
uint
&&™ Æ
priority
&&Ø ∑
=
&&∏ π
$num
&&∫ ª
)
&&ª º
where'' 
TRequest'' 
:'' 
class'' "
;''" #$
IStateConfigurationAsync22  
<22  !
T22! "
,22" #
TState22$ *
,22* +
TTrigger22, 4
>224 5%
AddAutoFallbackTransition226 O
(22O P
TTrigger22P X
trigger22Y `
,22` a
TState22b h
	tempState22i r
,22r s
Func22t x
<22x y
T22y z
,22z {
CancellationToken	22| ç
,
22ç é
Task
22è ì
<
22ì î
bool
22î ò
>
22ò ô
>
22ô ö
	condition
22õ §
,
22§ •
string
22¶ ¨
name
22≠ ±
=
22≤ ≥
null
22¥ ∏
,
22∏ π
uint
22∫ æ
priority
22ø «
=
22» …
$num
22  À
)
22À Ã
;
22Ã Õ$
IStateConfigurationAsync>>  
<>>  !
T>>! "
,>>" #
TState>>$ *
,>>* +
TTrigger>>, 4
>>>4 5%
AddAutoFallbackTransition>>6 O
<>>O P
TRequest>>P X
>>>X Y
(>>Y Z
TTrigger>>Z b
trigger>>c j
,>>j k
TState>>l r
	tempState>>s |
,>>| }
Func	>>~ Ç
<
>>Ç É
T
>>É Ñ
,
>>Ñ Ö
TRequest
>>Ü é
,
>>é è
CancellationToken
>>ê °
,
>>° ¢
Task
>>£ ß
<
>>ß ®
bool
>>® ¨
>
>>¨ ≠
>
>>≠ Æ
	condition
>>Ø ∏
,
>>∏ π
string
>>∫ ¿
name
>>¡ ≈
=
>>∆ «
null
>>» Ã
,
>>Ã Õ
uint
>>Œ “
priority
>>” €
=
>>‹ ›
$num
>>ﬁ ﬂ
)
>>ﬂ ‡
where?? 
TRequest?? 
:?? 
class?? "
;??" #$
IStateConfigurationAsyncKK  
<KK  !
TKK! "
,KK" #
TStateKK$ *
,KK* +
TTriggerKK, 4
>KK4 5$
AddAutoForwardTransitionKK6 N
<KKN O
TRequestKKO W
>KKW X
(KKX Y
TTriggerKKY a
triggerKKb i
,KKi j
TStateKKk q
toStateKKr y
,KKy z
FuncKK{ 
<	KK Ä
T
KKÄ Å
,
KKÅ Ç
TRequest
KKÉ ã
,
KKã å
CancellationToken
KKç û
,
KKû ü
Task
KK† §
<
KK§ •
bool
KK• ©
>
KK© ™
>
KK™ ´
	condition
KK¨ µ
,
KKµ ∂
string
KK∑ Ω
name
KKæ ¬
=
KK√ ƒ
null
KK≈ …
,
KK…  
uint
KKÀ œ
priority
KK– ÿ
=
KKŸ ⁄
$num
KK€ ‹
)
KK‹ ›
whereLL 
TRequestLL 
:LL 
classLL "
;LL" #$
IStateConfigurationAsyncWW  
<WW  !
TWW! "
,WW" #
TStateWW$ *
,WW* +
TTriggerWW, 4
>WW4 5$
AddAutoForwardTransitionWW6 N
(WWN O
TTriggerWWO W
triggerWWX _
,WW_ `
TStateWWa g
toStateWWh o
,WWo p
FuncWWq u
<WWu v
TWWv w
,WWw x
CancellationToken	WWy ä
,
WWä ã
Task
WWå ê
<
WWê ë
bool
WWë ï
>
WWï ñ
>
WWñ ó
	condition
WWò °
,
WW° ¢
string
WW£ ©
name
WW™ Æ
=
WWØ ∞
null
WW± µ
,
WWµ ∂
uint
WW∑ ª
priority
WWº ƒ
=
WW≈ ∆
$num
WW« »
)
WW» …
;
WW…  $
IStateConfigurationAsyncaa  
<aa  !
Taa! "
,aa" #
TStateaa$ *
,aa* +
TTriggeraa, 4
>aa4 5 
AddDynamicTransitionaa6 J
(aaJ K
TTriggeraaK S
triggeraaT [
,aa[ \
Funcaa] a
<aaa b
Taab c
,aac d
TStateaae k
>aak l
stateFunctionaam z
,aaz {
string	aa| Ç
name
aaÉ á
=
aaà â
null
aaä é
,
aaé è
uint
aaê î
priority
aaï ù
=
aaû ü
$num
aa† °
)
aa° ¢
;
aa¢ £$
IStateConfigurationAsyncll  
<ll  !
Tll! "
,ll" #
TStatell$ *
,ll* +
TTriggerll, 4
>ll4 5 
AddDynamicTransitionll6 J
<llJ K
TRequestllK S
>llS T
(llT U
TTriggerllU ]
triggerll^ e
,lle f
Funcllg k
<llk l
Tlll m
,llm n
TRequestllo w
,llw x
TStatelly 
>	ll Ä
stateFunction
llÅ é
,
llé è
string
llê ñ
name
lló õ
=
llú ù
null
llû ¢
,
ll¢ £
uint
ll§ ®
priority
ll© ±
=
ll≤ ≥
$num
ll¥ µ
)
llµ ∂
wheremm 
TRequestmm 
:mm 
classmm "
;mm" #$
IStateConfigurationAsynctt  
<tt  !
Ttt! "
,tt" #
TStatett$ *
,tt* +
TTriggertt, 4
>tt4 5
AddEntryActiontt6 D
(ttD E
FuncttE I
<ttI J
TttJ K
,ttK L
CancellationTokenttM ^
,tt^ _
Tasktt` d
>ttd e
actionttf l
)ttl m
;ttm n$
IStateConfigurationAsync||  
<||  !
T||! "
,||" #
TState||$ *
,||* +
TTrigger||, 4
>||4 5
AddEntryAction||6 D
(||D E
Func||E I
<||I J
T||J K
,||K L
CancellationToken||M ^
,||^ _
Task||` d
>||d e
action||f l
,||l m
TState||n t
previousState	||u Ç
)
||Ç É
;
||É Ñ&
IStateConfigurationAsync
ÉÉ  
<
ÉÉ  !
T
ÉÉ! "
,
ÉÉ" #
TState
ÉÉ$ *
,
ÉÉ* +
TTrigger
ÉÉ, 4
>
ÉÉ4 5
AddExitAction
ÉÉ6 C
(
ÉÉC D
Func
ÉÉD H
<
ÉÉH I
T
ÉÉI J
,
ÉÉJ K
CancellationToken
ÉÉL ]
,
ÉÉ] ^
Task
ÉÉ_ c
>
ÉÉc d
action
ÉÉe k
)
ÉÉk l
;
ÉÉl m&
IStateConfigurationAsync
ãã  
<
ãã  !
T
ãã! "
,
ãã" #
TState
ãã$ *
,
ãã* +
TTrigger
ãã, 4
>
ãã4 5
AddExitAction
ãã6 C
(
ããC D
Func
ããD H
<
ããH I
T
ããI J
,
ããJ K
CancellationToken
ããL ]
,
ãã] ^
Task
ãã_ c
>
ããc d
action
ããe k
,
ããk l
TState
ããm s
	nextState
ããt }
)
ãã} ~
;
ãã~ &
IStateConfigurationAsync
íí  
<
íí  !
T
íí! "
,
íí" #
TState
íí$ *
,
íí* +
TTrigger
íí, 4
>
íí4 5
AddReentryAction
íí6 F
(
ííF G
Func
ííG K
<
ííK L
T
ííL M
,
ííM N
CancellationToken
ííO `
,
íí` a
Task
ííb f
>
ííf g
action
ííh n
)
íín o
;
íío p&
IStateConfigurationAsync
ùù  
<
ùù  !
T
ùù! "
,
ùù" #
TState
ùù$ *
,
ùù* +
TTrigger
ùù, 4
>
ùù4 5
AddTransition
ùù6 C
(
ùùC D
TTrigger
ùùD L
trigger
ùùM T
,
ùùT U
TState
ùùV \
toState
ùù] d
,
ùùd e
Func
ùùf j
<
ùùj k
T
ùùk l
,
ùùl m
CancellationToken
ùùn 
,ùù Ä
TaskùùÅ Ö
<ùùÖ Ü
boolùùÜ ä
>ùùä ã
>ùùã å
conditionAsyncùùç õ
=ùùú ù
nullùùû ¢
,ùù¢ £
stringùù§ ™
nameùù´ Ø
=ùù∞ ±
nullùù≤ ∂
,ùù∂ ∑
uintùù∏ º
priorityùùΩ ≈
=ùù∆ «
$numùù» …
)ùù…  
;ùù  À&
IStateConfigurationAsync
©©  
<
©©  !
T
©©! "
,
©©" #
TState
©©$ *
,
©©* +
TTrigger
©©, 4
>
©©4 5
AddTransition
©©6 C
<
©©C D
TRequest
©©D L
>
©©L M
(
©©M N
TTrigger
©©N V
trigger
©©W ^
,
©©^ _
TState
©©` f
toState
©©g n
,
©©n o
Func
©©p t
<
©©t u
T
©©u v
,
©©v w
TRequest©©x Ä
,©©Ä Å!
CancellationToken©©Ç ì
,©©ì î
Task©©ï ô
<©©ô ö
bool©©ö û
>©©û ü
>©©ü †
conditionAsync©©° Ø
,©©Ø ∞
string©©± ∑
name©©∏ º
=©©Ω æ
null©©ø √
,©©√ ƒ
uint©©≈ …
priority©©  “
=©©” ‘
$num©©’ ÷
)©©÷ ◊
where
™™ 
TRequest
™™ 
:
™™ 
class
™™ "
;
™™" #&
IStateConfigurationAsync
≤≤  
<
≤≤  !
T
≤≤! "
,
≤≤" #
TState
≤≤$ *
,
≤≤* +
TTrigger
≤≤, 4
>
≤≤4 5
AddTriggerAction
≤≤6 F
(
≤≤F G
TTrigger
≤≤G O
trigger
≤≤P W
,
≤≤W X
Func
≤≤Y ]
<
≤≤] ^
T
≤≤^ _
,
≤≤_ `
CancellationToken
≤≤a r
,
≤≤r s
Task
≤≤t x
>
≤≤x y
action≤≤z Ä
)≤≤Ä Å
;≤≤Å Ç&
IStateConfigurationAsync
ªª  
<
ªª  !
T
ªª! "
,
ªª" #
TState
ªª$ *
,
ªª* +
TTrigger
ªª, 4
>
ªª4 5
AddTriggerAction
ªª6 F
<
ªªF G
TRequest
ªªG O
>
ªªO P
(
ªªP Q
TTrigger
ªªQ Y
trigger
ªªZ a
,
ªªa b
Func
ªªc g
<
ªªg h
T
ªªh i
,
ªªi j
TRequest
ªªk s
,
ªªs t 
CancellationTokenªªu Ü
,ªªÜ á
Taskªªà å
>ªªå ç
actionªªé î
)ªªî ï
;ªªï ñ
bool
¬¬ 
	IsInState
¬¬ 
(
¬¬ 
TState
¬¬ 
state
¬¬ #
)
¬¬# $
;
¬¬$ %&
IStateConfigurationAsync
……  
<
……  !
T
……! "
,
……" #
TState
……$ *
,
……* +
TTrigger
……, 4
>
……4 5
MakeSubStateOf
……6 D
(
……D E&
IStateConfigurationAsync
……E ]
<
……] ^
T
……^ _
,
……_ `
TState
……a g
,
……g h
TTrigger
……i q
>
……q r&
superStateConfiguration……s ä
)……ä ã
;……ã å
}
   
}ÀÀ  
bC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\IStateConfigurationAsyncInternal.cs
	namespace 	
NStateManager
 
{ 
public 

	interface ,
 IStateConfigurationAsyncInternal 5
<5 6
T6 7
,7 8
TState9 ?
,? @
TTriggerA I
>I J
:K L$
IStateConfigurationAsyncM e
<e f
Tf g
,g h
TStatei o
,o p
TTriggerq y
>y z
{ 
void 
AddAutoTransition 
( 
TTrigger '
trigger( /
,/ 0
StateTransitionBase1 D
<D E
TE F
,F G
TStateH N
,N O
TTriggerP X
>X Y

transitionZ d
)d e
;e f
void 
AddSuperState 
( ,
 IStateConfigurationAsyncInternal ;
<; <
T< =
,= >
TState? E
,E F
TTriggerG O
>O P#
superStateConfigurationQ h
)h i
;i j
void 
AddTransition 
( 
TTrigger #
trigger$ +
,+ ,
StateTransitionBase- @
<@ A
TA B
,B C
TStateD J
,J K
TTriggerL T
>T U

transitionV `
)` a
;a b
Task 
< !
StateTransitionResult "
<" #
TState# )
,) *
TTrigger+ 3
>3 4
>4 5&
ExecuteAutoTransitionAsync6 P
(P Q
ExecutionParametersQ d
<d e
Te f
,f g
TTriggerh p
>p q

parametersr |
,
 !
StateTransitionResult !
<! "
TState" (
,( )
TTrigger* 2
>2 3
currentResult4 A
)A B
;B C
Task #
ExecuteEntryActionAsync $
($ %
ExecutionParameters% 8
<8 9
T9 :
,: ;
TTrigger< D
>D E

parametersF P
,P Q!
StateTransitionResultR g
<g h
TStateh n
,n o
TTriggerp x
>x y
currentResult	z á
)
á à
;
à â
Task "
ExecuteExitActionAsync #
(# $
ExecutionParameters$ 7
<7 8
T8 9
,9 :
TTrigger; C
>C D

parametersE O
,O P!
StateTransitionResultQ f
<f g
TStateg m
,m n
TTriggero w
>w x
currentResult	y Ü
)
Ü á
;
á à
Task %
ExecuteReentryActionAsync &
(& '
ExecutionParameters' :
<: ;
T; <
,< =
TTrigger> F
>F G

parametersH R
,R S!
StateTransitionResultT i
<i j
TStatej p
,p q
TTriggerr z
>z {
currentResult	| â
)
â ä
;
ä ã
Task 
< !
StateTransitionResult "
<" #
TState# )
,) *
TTrigger+ 3
>3 4
>4 5
FireTriggerAsync6 F
(F G
ExecutionParametersG Z
<Z [
T[ \
,\ ]
TTrigger^ f
>f g

parametersh r
)r s
;s t
TState 
State 
{ 
get 
; 
} 
} 
} á
]C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\IStateConfigurationInternal.cs
	namespace 	
NStateManager
 
{ 
public 

	interface '
IStateConfigurationInternal 0
<0 1
T1 2
,2 3
TState4 :
,: ;
TTrigger< D
>D E
:F G
IStateConfigurationH [
<[ \
T\ ]
,] ^
TState_ e
,e f
TTriggerg o
>o p
{ 
void 
AddAutoTransition 
( 
TTrigger '
trigger( /
,/ 0
StateTransitionBase1 D
<D E
TE F
,F G
TStateH N
,N O
TTriggerP X
>X Y

transitionZ d
)d e
;e f
void 
AddSuperState 
( '
IStateConfigurationInternal 6
<6 7
T7 8
,8 9
TState: @
,@ A
TTriggerB J
>J K#
superStateConfigurationL c
)c d
;d e
void 
AddTransition 
( 
TTrigger #
trigger$ +
,+ ,
StateTransitionBase- @
<@ A
TA B
,B C
TStateD J
,J K
TTriggerL T
>T U

transitionV `
)` a
;a b!
StateTransitionResult 
< 
TState $
,$ %
TTrigger& .
>. /!
ExecuteAutoTransition0 E
(E F
ExecutionParametersF Y
<Y Z
TZ [
,[ \
TTrigger] e
>e f

parametersg q
,q r"
StateTransitionResult	s à
<
à â
TState
â è
,
è ê
TTrigger
ë ô
>
ô ö
currentResult
õ ®
)
® ©
;
© ™
void 
ExecuteEntryAction 
(  
T  !
context" )
,) *!
StateTransitionResult+ @
<@ A
TStateA G
,G H
TTriggerI Q
>Q R
currentResultS `
)` a
;a b
void 
ExecuteExitAction 
( 
T  
context! (
,( )!
StateTransitionResult* ?
<? @
TState@ F
,F G
TTriggerH P
>P Q
currentResultR _
)_ `
;` a
void  
ExecuteReentryAction !
(! "
T" #
context$ +
,+ ,!
StateTransitionResult- B
<B C
TStateC I
,I J
TTriggerK S
>S T
currentResultU b
)b c
;c d!
StateTransitionResult 
< 
TState $
,$ %
TTrigger& .
>. /
FireTrigger0 ;
(; <
ExecutionParameters< O
<O P
TP Q
,Q R
TTriggerS [
>[ \

parameters] g
)g h
;h i
bool 
	IsInState 
( 
TState 
state #
)# $
;$ %
TState 
State 
{ 
get 
; 
} 
} 
} î
OC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\IStateMachine.cs
	namespace 	
NStateManager
 
{ 
public 

	interface 
IStateMachine "
<" #
T# $
,$ %
TState& ,
,, -
TTrigger. 6
>6 7
{ 
IStateMachine 
< 
T 
, 
TState 
,  
TTrigger! )
>) *
AddTriggerAction+ ;
(; <
TTrigger< D
triggerE L
,L M
ActionN T
<T U
TU V
>V W
actionX ^
)^ _
;_ `
IStateMachine 
< 
T 
, 
TState 
,  
TTrigger! )
>) *
AddTriggerAction+ ;
<; <
TRequest< D
>D E
(E F
TTriggerF N
triggerO V
,V W
ActionX ^
<^ _
T_ `
,` a
TRequestb j
>j k
actionl r
)r s
;s t
IStateConfiguration 
< 
T 
, 
TState %
,% &
TTrigger' /
>/ 0
ConfigureState1 ?
(? @
TState@ F
stateG L
)L M
;M N!
StateTransitionResult 
< 
TState $
,$ %
TTrigger& .
>. /
FireTrigger0 ;
(; <
T< =
context> E
,E F
TTriggerG O
triggerP W
)W X
;X Y!
StateTransitionResult 
< 
TState $
,$ %
TTrigger& .
>. /
FireTrigger0 ;
<; <
TRequest< D
>D E
(E F
TF G
contextH O
,O P
TTriggerQ Y
triggerZ a
,a b
TRequestc k
requestl s
)s t
whereu z
TRequest	{ É
:
Ñ Ö
class
Ü ã
;
ã å
bool 
	IsInState 
( 
T 
context  
,  !
TState" (
state) .
). /
;/ 0
IStateMachine 
< 
T 
, 
TState 
,  
TTrigger! )
>) *(
RegisterOnTransitionedAction+ G
(G H
ActionH N
<N O
TO P
,P Q!
StateTransitionResultR g
<g h
TStateh n
,n o
TTriggerp x
>x y
>y z
action	{ Å
)
Å Ç
;
Ç É
Func 
< 
T 
, 
TState 
> 
StateAccessor %
{& '
get( +
;+ ,
}- .
Action 
< 
T 
, 
TState 
> 
StateMutator &
{' (
get) ,
;, -
}. /
} 
} î
TC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\IStateMachineAsync.cs
	namespace 	
NStateManager
 
{ 
public 

	interface 
IStateMachineAsync '
<' (
T( )
,) *
TState+ 1
,1 2
TTrigger3 ;
>; <
where 
TState 
: 
IComparable "
{ 
IStateMachineAsync 
< 
T 
, 
TState $
,$ %
TTrigger& .
>. /
AddTriggerAction0 @
(@ A
TTriggerA I
triggerJ Q
,Q R
FuncS W
<W X
TX Y
,Y Z
CancellationToken[ l
,l m
Taskn r
>r s
actiont z
)z {
;{ |
IStateMachineAsync%% 
<%% 
T%% 
,%% 
TState%% $
,%%$ %
TTrigger%%& .
>%%. /
AddTriggerAction%%0 @
<%%@ A
TRequest%%A I
>%%I J
(%%J K
TTrigger%%K S
trigger%%T [
,%%[ \
Func%%] a
<%%a b
T%%b c
,%%c d
TRequest%%e m
,%%m n
CancellationToken	%%o Ä
,
%%Ä Å
Task
%%Ç Ü
>
%%Ü á
action
%%à é
)
%%é è
;
%%è ê$
IStateConfigurationAsync,,  
<,,  !
T,,! "
,,," #
TState,,$ *
,,,* +
TTrigger,,, 4
>,,4 5
ConfigureState,,6 D
(,,D E
TState,,E K
state,,L Q
),,Q R
;,,R S
Task66 
<66 !
StateTransitionResult66 "
<66" #
TState66# )
,66) *
TTrigger66+ 3
>663 4
>664 5
FireTriggerAsync666 F
<66F G
TRequest66G O
>66O P
(66P Q
T66Q R
context66S Z
,66Z [
TTrigger66\ d
trigger66e l
,66l m
TRequest66n v
request66w ~
,66~ 
CancellationToken
66Ä ë
cancellationToken
66í £
=
66§ •
default
66¶ ≠
(
66≠ Æ
CancellationToken
66Æ ø
)
66ø ¿
)
66¿ ¡
where77 
TRequest77 
:77 
class77 "
;77" #
Task@@ 
<@@ !
StateTransitionResult@@ "
<@@" #
TState@@# )
,@@) *
TTrigger@@+ 3
>@@3 4
>@@4 5
FireTriggerAsync@@6 F
(@@F G
T@@G H
context@@I P
,@@P Q
TTrigger@@R Z
trigger@@[ b
,@@b c
CancellationToken@@d u
cancellationToken	@@v á
=
@@à â
default
@@ä ë
(
@@ë í
CancellationToken
@@í £
)
@@£ §
)
@@§ •
;
@@• ¶
boolBB 
	IsInStateBB 
(BB 
TBB 
contextBB  
,BB  !
TStateBB" (
stateBB) .
)BB. /
;BB/ 0
IStateMachineAsyncDD 
<DD 
TDD 
,DD 
TStateDD $
,DD$ %
TTriggerDD& .
>DD. /(
RegisterOnTransitionedActionDD0 L
(DDL M
ActionDDM S
<DDS T
TDDT U
,DDU V!
StateTransitionResultDDW l
<DDl m
TStateDDm s
,DDs t
TTriggerDDu }
>DD} ~
>DD~ !
onTransitionedEvent
DDÄ ì
)
DDì î
;
DDî ï
FuncFF 
<FF 
TFF 
,FF 
TStateFF 
>FF 
StateAccessorFF %
{FF& '
getFF( +
;FF+ ,
}FF- .
ActionGG 
<GG 
TGG 
,GG 
TStateGG 
>GG 
StateMutatorGG &
{GG' (
getGG) ,
;GG, -
}GG. /
}HH 
}II ≤à
TC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateConfiguration.cs
	namespace 	
NStateManager
 
{ 
public 

class 
StateConfiguration #
<# $
T$ %
,% &
TState' -
,- .
TTrigger/ 7
>7 8
:9 :"
StateConfigurationBase; Q
<Q R
TR S
,S T
TStateU [
,[ \
TTrigger] e
>e f
,f g(
IStateConfigurationInternal	h É
<
É Ñ
T
Ñ Ö
,
Ö Ü
TState
á ç
,
ç é
TTrigger
è ó
>
ó ò
where 
TState 
: 
IComparable "
{ 
private 
readonly 

Dictionary #
<# $
TState$ *
,* +
Action, 2
<2 3
T3 4
>4 5
>5 6&
_previousStateEntryActions7 Q
=R S
newT W

DictionaryX b
<b c
TStatec i
,i j
Actionk q
<q r
Tr s
>s t
>t u
(u v
)v w
;w x
private 
readonly 

Dictionary #
<# $
TState$ *
,* +
Action, 2
<2 3
T3 4
>4 5
>5 6!
_nextStateExitActions7 L
=M N
newO R

DictionaryS ]
<] ^
TState^ d
,d e
Actionf l
<l m
Tm n
>n o
>o p
(p q
)q r
;r s
private 
readonly 

Dictionary #
<# $
TTrigger$ ,
,, -
TriggerActionBase. ?
<? @
T@ A
,A B
TTriggerC K
>K L
>L M
_triggerActionsN ]
=^ _
new` c

Dictionaryd n
<n o
TTriggero w
,w x
TriggerActionBase	y ä
<
ä ã
T
ã å
,
å ç
TTrigger
é ñ
>
ñ ó
>
ó ò
(
ò ô
)
ô ö
;
ö õ
private 
readonly 
IStateMachine &
<& '
T' (
,( )
TState* 0
,0 1
TTrigger2 :
>: ;
_stateMachine< I
;I J
private 
Action 
< 
T 
> 
_defaultEntryAction -
;- .
private   
Action   
<   
T   
>   
_defaultExitAction   ,
;  , -
private!! 
Action!! 
<!! 
T!! 
>!! 
_reentryAction!! (
;!!( )
private"" '
IStateConfigurationInternal"" +
<""+ ,
T"", -
,""- .
TState""/ 5
,""5 6
TTrigger""7 ?
>""? @
_superState""A L
;""L M
internal)) 
StateConfiguration)) #
())# $
TState))$ *
state))+ 0
,))0 1
IStateMachine))2 ?
<))? @
T))@ A
,))A B
TState))C I
,))I J
TTrigger))K S
>))S T
stateMachine))U a
)))a b
:** 
base** 
(** 
state** 
,** 
stateMachine** &
.**& '
StateAccessor**' 4
,**4 5
stateMachine**6 B
.**B C
StateMutator**C O
)**O P
{++ 	
_stateMachine,, 
=,, 
stateMachine,, (
;,,( )
}-- 	
public77 
IStateConfiguration77 "
<77" #
T77# $
,77$ %
TState77& ,
,77, -
TTrigger77. 6
>776 7$
AddAutoDynamicTransition778 P
(77P Q
TTrigger77Q Y
trigger77Z a
,77a b
Func77c g
<77g h
T77h i
,77i j
TState77k q
>77q r
function77s {
,77{ |
string	77} É
name
77Ñ à
=
77â ä
null
77ã è
,
77è ê
uint
77ë ï
priority
77ñ û
=
77ü †
$num
77° ¢
)
77¢ £
{88 	
var99 
initialTransition99 !
=99" #"
StateTransitionFactory99$ :
<99: ;
T99; <
,99< =
TState99> D
,99D E
TTrigger99F N
>99N O
.99O P
GetStateTransition99P b
(99b c
_stateMachine99c p
,:: 
State:: 
,;; 
function;; 
,<< 
State<< 
,== 
name== 
,>> 
priority>> 
)>> 
;>> 
AddAutoTransition?? 
(?? 
trigger?? %
,??% &
initialTransition??' 8
)??8 9
;??9 :
returnAA 
thisAA 
;AA 
}BB 	
publicLL 
IStateConfigurationLL "
<LL" #
TLL# $
,LL$ %
TStateLL& ,
,LL, -
TTriggerLL. 6
>LL6 7$
AddAutoDynamicTransitionLL8 P
<LLP Q
TRequestLLQ Y
>LLY Z
(LLZ [
TTriggerLL[ c
triggerLLd k
,MM
 
FuncMM 
<MM 
TMM 
,MM 
TRequestMM 
,MM 
TStateMM $
>MM$ %
functionMM& .
,NN
 
stringNN 
nameNN 
=NN 
nullNN 
,OO
 
uintOO 
priorityOO 
=OO 
$numOO 
)OO 
wherePP 
TRequestPP 
:PP 
classPP "
{QQ 	
varRR 
initialTransitionRR !
=RR" #"
StateTransitionFactoryRR$ :
<RR: ;
TRR; <
,RR< =
TStateRR> D
,RRD E
TTriggerRRF N
>RRN O
.RRO P
GetStateTransitionRRP b
(RRb c
_stateMachineRRc p
,SS 
StateSS 
,TT 
functionTT 
,UU 
StateUU 
,VV 
nameVV 
,WW 
priorityWW 
)WW 
;WW 
AddAutoTransitionXX 
(XX 
triggerXX %
,XX% &
initialTransitionXX' 8
)XX8 9
;XX9 :
returnZZ 
thisZZ 
;ZZ 
}[[ 	
publicff 
IStateConfigurationff "
<ff" #
Tff# $
,ff$ %
TStateff& ,
,ff, -
TTriggerff. 6
>ff6 7%
AddAutoFallbackTransitionff8 Q
(ffQ R
TTriggerffR Z
triggerff[ b
,ffb c
TStateffd j
	tempStateffk t
,fft u
Funcffv z
<ffz {
Tff{ |
,ff| }
bool	ff~ Ç
>
ffÇ É
	condition
ffÑ ç
,
ffç é
string
ffè ï
name
ffñ ö
=
ffõ ú
null
ffù °
,
ff° ¢
uint
ff£ ß
priority
ff® ∞
=
ff± ≤
$num
ff≥ ¥
)
ff¥ µ
{gg 	
ifhh 
(hh 
	conditionhh 
==hh 
nullhh !
)hh! "
{ii 
throwii 
newii !
ArgumentNullExceptionii -
(ii- .
nameofii. 4
(ii4 5
	conditionii5 >
)ii> ?
)ii? @
;ii@ A
}iiB C
varkk 
initialTransitionkk !
=kk" #"
StateTransitionFactorykk$ :
<kk: ;
Tkk; <
,kk< =
TStatekk> D
,kkD E
TTriggerkkF N
>kkN O
.kkO P
GetStateTransitionkkP b
(kkb c
_stateMachinekkc p
,ll 
	tempStatell 
,mm 
	conditionmm 
,nn 
namenn 
,oo 
priorityoo 
)oo 
;oo 
AddTransitionpp 
(pp 
triggerpp !
,pp! "
initialTransitionpp# 4
)pp4 5
;pp5 6
varrr #
tempStateAutoTransitionrr '
=rr( )"
StateTransitionFactoryrr* @
<rr@ A
TrrA B
,rrB C
TStaterrD J
,rrJ K
TTriggerrrL T
>rrT U
.rrU V
GetStateTransitionrrV h
(rrh i
_stateMachinerri v
,ss 

startStatess 
:ss 
Statess !
,tt 
triggerStatett 
:tt 
	tempStatett '
,uu 
toStateuu 
:uu 
Stateuu 
,vv 
	conditionvv 
:vv 
	conditionvv $
,ww 
nameww 
:ww 
nameww 
,xx 
priorityxx 
:xx 
priorityxx "
)xx" #
;xx# $'
AddOtherStateAutoTransitionyy '
(yy' (
	tempStateyy( 1
,yy1 2
triggeryy3 :
,yy: ;#
tempStateAutoTransitionyy< S
)yyS T
;yyT U
return{{ 
this{{ 
;{{ 
}|| 	
public
áá !
IStateConfiguration
áá "
<
áá" #
T
áá# $
,
áá$ %
TState
áá& ,
,
áá, -
TTrigger
áá. 6
>
áá6 7'
AddAutoFallbackTransition
áá8 Q
<
ááQ R
TRequest
ááR Z
>
ááZ [
(
áá[ \
TTrigger
áá\ d
trigger
ááe l
,
àà
 
TState
àà 
	tempState
àà 
,
ââ
 
Func
ââ 
<
ââ 
T
ââ 
,
ââ 
TRequest
ââ 
,
ââ 
bool
ââ "
>
ââ" #
	condition
ââ$ -
,
ää
 
string
ää 
name
ää 
=
ää 
null
ää 
,
ãã
 
uint
ãã 
priority
ãã 
=
ãã 
$num
ãã 
)
ãã 
where
åå 
TRequest
åå 
:
åå 
class
åå "
{
çç 	
if
éé 
(
éé 
	condition
éé 
==
éé 
null
éé !
)
éé! "
{
èè 
throw
èè 
new
èè #
ArgumentNullException
èè -
(
èè- .
nameof
èè. 4
(
èè4 5
	condition
èè5 >
)
èè> ?
)
èè? @
;
èè@ A
}
èèB C
var
ëë 
initialTransition
ëë !
=
ëë" #$
StateTransitionFactory
ëë$ :
<
ëë: ;
T
ëë; <
,
ëë< =
TState
ëë> D
,
ëëD E
TTrigger
ëëF N
>
ëëN O
.
ëëO P 
GetStateTransition
ëëP b
(
ëëb c
_stateMachine
ëëc p
,
íí 
	tempState
íí 
,
ìì 
	condition
ìì 
,
îî 
name
îî 
,
ïï 
priority
ïï 
)
ïï 
;
ïï 
AddTransition
ññ 
(
ññ 
trigger
ññ !
,
ññ! "
initialTransition
ññ# 4
)
ññ4 5
;
ññ5 6
var
òò "
otherStateTransition
òò $
=
òò% &$
StateTransitionFactory
òò' =
<
òò= >
T
òò> ?
,
òò? @
TState
òòA G
,
òòG H
TTrigger
òòI Q
>
òòQ R
.
òòR S 
GetStateTransition
òòS e
(
òòe f
_stateMachine
òòf s
,
ôô 
State
ôô 
,
öö 
	tempState
öö 
,
õõ 
	condition
õõ 
,
úú 
State
úú 
,
ùù 
name
ùù 
,
ûû 
priority
ûû 
)
ûû 
;
ûû )
AddOtherStateAutoTransition
üü '
(
üü' (
	tempState
üü( 1
,
üü1 2
trigger
üü3 :
,
üü: ;"
otherStateTransition
üü< P
)
üüP Q
;
üüQ R
return
°° 
this
°° 
;
°° 
}
¢¢ 	
public
ÆÆ !
IStateConfiguration
ÆÆ "
<
ÆÆ" #
T
ÆÆ# $
,
ÆÆ$ %
TState
ÆÆ& ,
,
ÆÆ, -
TTrigger
ÆÆ. 6
>
ÆÆ6 7'
AddAutoFallbackTransition
ÆÆ8 Q
(
ÆÆQ R
TTrigger
ÆÆR Z
trigger
ÆÆ[ b
,
ØØ
 
TState
ØØ 
	tempState
ØØ 
,
∞∞
 
TState
∞∞ 
previousState
∞∞  
,
±±
 
Func
±± 
<
±± 
T
±± 
,
±± 
bool
±± 
>
±± 
	condition
±± #
,
≤≤
 
string
≤≤ 
name
≤≤ 
=
≤≤ 
null
≤≤ 
,
≥≥
 
uint
≥≥ 
priority
≥≥ 
=
≥≥ 
$num
≥≥ 
)
≥≥ 
{
¥¥ 	
if
µµ 
(
µµ 
	condition
µµ 
==
µµ 
null
µµ !
)
µµ! "
{
∂∂ 
throw
∂∂ 
new
∂∂ #
ArgumentNullException
∂∂ -
(
∂∂- .
nameof
∂∂. 4
(
∂∂4 5
	condition
∂∂5 >
)
∂∂> ?
)
∂∂? @
;
∂∂@ A
}
∂∂B C
var
∏∏ 
initialTransition
∏∏ !
=
∏∏" #$
StateTransitionFactory
∏∏$ :
<
∏∏: ;
T
∏∏; <
,
∏∏< =
TState
∏∏> D
,
∏∏D E
TTrigger
∏∏F N
>
∏∏N O
.
∏∏O P 
GetStateTransition
∏∏P b
(
∏∏b c
_stateMachine
∏∏c p
,
ππ 

startState
ππ 
:
ππ 
previousState
ππ )
,
∫∫ 
triggerState
∫∫ 
:
∫∫ 
State
∫∫ #
,
ªª 
toState
ªª 
:
ªª 
	tempState
ªª "
,
ºº 
	condition
ºº 
:
ºº 
	condition
ºº $
,
ΩΩ 
name
ΩΩ 
:
ΩΩ 
name
ΩΩ 
,
ææ 
priority
ææ 
:
ææ 
priority
ææ "
)
ææ" #
;
ææ# $
AddTransition
øø 
(
øø 
trigger
øø !
,
øø! "
initialTransition
øø# 4
)
øø4 5
;
øø5 6
var
¡¡ &
otherStateAutoTransition
¡¡ (
=
¡¡) *$
StateTransitionFactory
¡¡+ A
<
¡¡A B
T
¡¡B C
,
¡¡C D
TState
¡¡E K
,
¡¡K L
TTrigger
¡¡M U
>
¡¡U V
.
¡¡V W 
GetStateTransition
¡¡W i
(
¡¡i j
_stateMachine
¡¡j w
,
¬¬ 

startState
¬¬ 
:
¬¬ 
State
¬¬ !
,
√√ 
triggerState
√√ 
:
√√ 
	tempState
√√ '
,
ƒƒ 
toState
ƒƒ 
:
ƒƒ 
State
ƒƒ 
,
≈≈ 
	condition
≈≈ 
:
≈≈ 
	condition
≈≈ $
,
∆∆ 
name
∆∆ 
:
∆∆ 
name
∆∆ 
,
«« 
priority
«« 
:
«« 
priority
«« "
)
««" #
;
««# $)
AddOtherStateAutoTransition
»» '
(
»»' (
	tempState
»»( 1
,
»»1 2
trigger
»»3 :
,
»»: ;&
otherStateAutoTransition
»»< T
)
»»T U
;
»»U V
return
   
this
   
;
   
}
ÀÀ 	
public
÷÷ !
IStateConfiguration
÷÷ "
<
÷÷" #
T
÷÷# $
,
÷÷$ %
TState
÷÷& ,
,
÷÷, -
TTrigger
÷÷. 6
>
÷÷6 7&
AddAutoForwardTransition
÷÷8 P
(
÷÷P Q
TTrigger
÷÷Q Y
trigger
÷÷Z a
,
◊◊
 
TState
◊◊ 
toState
◊◊ 
,
ÿÿ
 
Func
ÿÿ 
<
ÿÿ 
T
ÿÿ 
,
ÿÿ 
bool
ÿÿ 
>
ÿÿ 
	condition
ÿÿ #
,
ŸŸ
 
string
ŸŸ 
name
ŸŸ 
=
ŸŸ 
null
ŸŸ 
,
⁄⁄
 
uint
⁄⁄ 
priority
⁄⁄ 
=
⁄⁄ 
$num
⁄⁄ 
)
⁄⁄ 
{
€€ 	
if
‹‹ 
(
‹‹ 
	condition
‹‹ 
==
‹‹ 
null
‹‹ !
)
‹‹! "
{
›› 
throw
›› 
new
›› #
ArgumentNullException
›› -
(
››- .
nameof
››. 4
(
››4 5
	condition
››5 >
)
››> ?
)
››? @
;
››@ A
}
››B C
var
ﬂﬂ 

transition
ﬂﬂ 
=
ﬂﬂ $
StateTransitionFactory
ﬂﬂ 3
<
ﬂﬂ3 4
T
ﬂﬂ4 5
,
ﬂﬂ5 6
TState
ﬂﬂ7 =
,
ﬂﬂ= >
TTrigger
ﬂﬂ? G
>
ﬂﬂG H
.
ﬂﬂH I 
GetStateTransition
ﬂﬂI [
(
ﬂﬂ[ \
_stateMachine
ﬂﬂ\ i
,
‡‡ 
triggerState
‡‡ 
:
‡‡ 
State
‡‡ #
,
·· 
toState
·· 
:
·· 
toState
··  
,
‚‚ 
	condition
‚‚ 
:
‚‚ 
	condition
‚‚ $
,
„„ 
name
„„ 
:
„„ 
name
„„ 
,
‰‰ 
priority
‰‰ 
:
‰‰ 
priority
‰‰ "
)
‰‰" #
;
‰‰# $
AddAutoTransition
ÂÂ 
(
ÂÂ 
trigger
ÂÂ %
,
ÂÂ% &

transition
ÂÂ' 1
)
ÂÂ1 2
;
ÂÂ2 3
return
ÁÁ 
this
ÁÁ 
;
ÁÁ 
}
ËË 	
public
ÙÙ !
IStateConfiguration
ÙÙ "
<
ÙÙ" #
T
ÙÙ# $
,
ÙÙ$ %
TState
ÙÙ& ,
,
ÙÙ, -
TTrigger
ÙÙ. 6
>
ÙÙ6 7&
AddAutoForwardTransition
ÙÙ8 P
<
ÙÙP Q
TRequest
ÙÙQ Y
>
ÙÙY Z
(
ÙÙZ [
TTrigger
ÙÙ[ c
trigger
ÙÙd k
,
ıı 
TState
ıı 
toState
ıı 
,
ˆˆ 
Func
ˆˆ 
<
ˆˆ 
T
ˆˆ 
,
ˆˆ 
TRequest
ˆˆ 
,
ˆˆ 
bool
ˆˆ  $
>
ˆˆ$ %
	condition
ˆˆ& /
,
˜˜ 
string
˜˜ 
name
˜˜ 
=
˜˜ 
null
˜˜  
,
¯¯ 
uint
¯¯ 
priority
¯¯ 
=
¯¯ 
$num
¯¯ 
)
¯¯  
where
˘˘ 
TRequest
˘˘ 
:
˘˘ 
class
˘˘ "
{
˙˙ 	
if
˚˚ 
(
˚˚ 
	condition
˚˚ 
==
˚˚ 
null
˚˚ !
)
˚˚! "
{
¸¸ 
throw
¸¸ 
new
¸¸ #
ArgumentNullException
¸¸ -
(
¸¸- .
nameof
¸¸. 4
(
¸¸4 5
	condition
¸¸5 >
)
¸¸> ?
)
¸¸? @
;
¸¸@ A
}
¸¸B C
var
˛˛ 

transition
˛˛ 
=
˛˛ $
StateTransitionFactory
˛˛ 3
<
˛˛3 4
T
˛˛4 5
,
˛˛5 6
TState
˛˛7 =
,
˛˛= >
TTrigger
˛˛? G
>
˛˛G H
.
˛˛H I 
GetStateTransition
˛˛I [
(
˛˛[ \
_stateMachine
˛˛\ i
,
ˇˇ 
toState
ˇˇ 
,
ÄÄ 
	condition
ÄÄ 
,
ÅÅ 
State
ÅÅ 
,
ÇÇ 
name
ÇÇ 
,
ÉÉ 
priority
ÉÉ 
)
ÉÉ 
;
ÉÉ 
AddAutoTransition
ÑÑ 
(
ÑÑ 
trigger
ÑÑ %
,
ÑÑ% &

transition
ÑÑ' 1
)
ÑÑ1 2
;
ÑÑ2 3
return
ÜÜ 
this
ÜÜ 
;
ÜÜ 
}
áá 	
public
ëë !
IStateConfiguration
ëë "
<
ëë" #
T
ëë# $
,
ëë$ %
TState
ëë& ,
,
ëë, -
TTrigger
ëë. 6
>
ëë6 7"
AddDynamicTransition
ëë8 L
(
ëëL M
TTrigger
ëëM U
trigger
ëëV ]
,
íí 
Func
íí 
<
íí 
T
íí 
,
íí 
TState
íí 
>
íí 
function
íí &
,
ìì 
string
ìì 
name
ìì 
=
ìì 
null
ìì  
,
îî 
uint
îî 
priority
îî 
=
îî 
$num
îî 
)
îî  
{
ïï 	
if
ññ 
(
ññ 
function
ññ 
==
ññ 
null
ññ  
)
ññ  !
{
óó 
throw
óó 
new
óó #
ArgumentNullException
óó -
(
óó- .
nameof
óó. 4
(
óó4 5
function
óó5 =
)
óó= >
)
óó> ?
;
óó? @
}
óóA B
var
ôô 

transition
ôô 
=
ôô $
StateTransitionFactory
ôô 3
<
ôô3 4
T
ôô4 5
,
ôô5 6
TState
ôô7 =
,
ôô= >
TTrigger
ôô? G
>
ôôG H
.
ôôH I 
GetStateTransition
ôôI [
(
ôô[ \
_stateMachine
ôô\ i
,
öö 
function
öö 
,
õõ 
name
õõ 
,
úú 
priority
úú 
)
úú 
;
úú 
AddTransition
ùù 
(
ùù 
trigger
ùù !
,
ùù! "

transition
ùù# -
)
ùù- .
;
ùù. /
return
üü 
this
üü 
;
üü 
}
†† 	
public
´´ !
IStateConfiguration
´´ "
<
´´" #
T
´´# $
,
´´$ %
TState
´´& ,
,
´´, -
TTrigger
´´. 6
>
´´6 7"
AddDynamicTransition
´´8 L
<
´´L M
TRequest
´´M U
>
´´U V
(
´´V W
TTrigger
´´W _
trigger
´´` g
,
¨¨ 
Func
¨¨ 
<
¨¨ 
T
¨¨ 
,
¨¨ 
TRequest
¨¨ 
,
¨¨ 
TState
¨¨  &
>
¨¨& '
function
¨¨( 0
,
≠≠ 
string
≠≠ 
name
≠≠ 
=
≠≠ 
null
≠≠  
,
ÆÆ 
uint
ÆÆ 
priority
ÆÆ 
=
ÆÆ 
$num
ÆÆ 
)
ÆÆ  
where
ØØ 
TRequest
ØØ 
:
ØØ 
class
ØØ "
{
∞∞ 	
if
±± 
(
±± 
function
±± 
==
±± 
null
±±  
)
±±  !
{
≤≤ 
throw
≤≤ 
new
≤≤ #
ArgumentNullException
≤≤ -
(
≤≤- .
nameof
≤≤. 4
(
≤≤4 5
function
≤≤5 =
)
≤≤= >
)
≤≤> ?
;
≤≤? @
}
≤≤A B
var
¥¥ 

transition
¥¥ 
=
¥¥ $
StateTransitionFactory
¥¥ 3
<
¥¥3 4
T
¥¥4 5
,
¥¥5 6
TState
¥¥7 =
,
¥¥= >
TTrigger
¥¥? G
>
¥¥G H
.
¥¥H I 
GetStateTransition
¥¥I [
(
¥¥[ \
_stateMachine
¥¥\ i
,
µµ 
function
µµ 
,
∂∂ 
name
∂∂ 
,
∑∑ 
priority
∑∑ 
)
∑∑ 
;
∑∑ 
AddTransition
∏∏ 
(
∏∏ 
trigger
∏∏ !
,
∏∏! "

transition
∏∏# -
)
∏∏- .
;
∏∏. /
return
∫∫ 
this
∫∫ 
;
∫∫ 
}
ªª 	
public
∆∆ !
IStateConfiguration
∆∆ "
<
∆∆" #
T
∆∆# $
,
∆∆$ %
TState
∆∆& ,
,
∆∆, -
TTrigger
∆∆. 6
>
∆∆6 7
AddTransition
∆∆8 E
(
∆∆E F
TTrigger
∆∆F N
trigger
∆∆O V
,
«« 
TState
«« 
toState
«« 
,
»» 
Func
»» 
<
»» 
T
»» 
,
»» 
bool
»» 
>
»» 
	condition
»» %
=
»»& '
null
»»( ,
,
…… 
string
…… 
name
…… 
=
…… 
null
……  
,
   
uint
   
priority
   
=
   
$num
   
)
    
{
ÀÀ 	
if
ÃÃ 
(
ÃÃ 
	condition
ÃÃ 
==
ÃÃ 
null
ÃÃ !
)
ÃÃ! "
{
ÕÕ 
	condition
ÕÕ 
=
ÕÕ 
_
ÕÕ 
=>
ÕÕ 
true
ÕÕ #
;
ÕÕ# $
}
ÕÕ% &
var
œœ 

transition
œœ 
=
œœ $
StateTransitionFactory
œœ 3
<
œœ3 4
T
œœ4 5
,
œœ5 6
TState
œœ7 =
,
œœ= >
TTrigger
œœ? G
>
œœG H
.
œœH I 
GetStateTransition
œœI [
(
œœ[ \
_stateMachine
œœ\ i
,
–– 
toState
–– 
,
—— 
	condition
—— 
,
““ 
name
““ 
,
”” 
priority
”” 
)
”” 
;
”” 
AddTransition
‘‘ 
(
‘‘ 
trigger
‘‘ !
,
‘‘! "

transition
‘‘# -
)
‘‘- .
;
‘‘. /
return
÷÷ 
this
÷÷ 
;
÷÷ 
}
◊◊ 	
public
„„ !
IStateConfiguration
„„ "
<
„„" #
T
„„# $
,
„„$ %
TState
„„& ,
,
„„, -
TTrigger
„„. 6
>
„„6 7
AddTransition
„„8 E
<
„„E F
TRequest
„„F N
>
„„N O
(
„„O P
TTrigger
„„P X
trigger
„„Y `
,
‰‰ 
TState
‰‰ 
toState
‰‰ 
,
ÂÂ 
Func
ÂÂ 
<
ÂÂ 
T
ÂÂ 
,
ÂÂ 
TRequest
ÂÂ 
,
ÂÂ 
bool
ÂÂ  $
>
ÂÂ$ %
	condition
ÂÂ& /
,
ÊÊ 
string
ÊÊ 
name
ÊÊ 
=
ÊÊ 
null
ÊÊ  
,
ÁÁ 
uint
ÁÁ 
priority
ÁÁ 
=
ÁÁ 
$num
ÁÁ 
)
ÁÁ  
where
ËË 
TRequest
ËË 
:
ËË 
class
ËË "
{
ÈÈ 	
if
ÍÍ 
(
ÍÍ 
	condition
ÍÍ 
==
ÍÍ 
null
ÍÍ !
)
ÍÍ! "
{
ÎÎ 
throw
ÎÎ 
new
ÎÎ #
ArgumentNullException
ÎÎ -
(
ÎÎ- .
nameof
ÎÎ. 4
(
ÎÎ4 5
	condition
ÎÎ5 >
)
ÎÎ> ?
)
ÎÎ? @
;
ÎÎ@ A
}
ÎÎB C
var
ÌÌ 

transition
ÌÌ 
=
ÌÌ $
StateTransitionFactory
ÌÌ 3
<
ÌÌ3 4
T
ÌÌ4 5
,
ÌÌ5 6
TState
ÌÌ7 =
,
ÌÌ= >
TTrigger
ÌÌ? G
>
ÌÌG H
.
ÌÌH I 
GetStateTransition
ÌÌI [
(
ÌÌ[ \
_stateMachine
ÌÌ\ i
,
ÓÓ 
toState
ÓÓ 
,
ÔÔ 
	condition
ÔÔ 
,
 
name
 
,
ÒÒ 
priority
ÒÒ 
)
ÒÒ 
;
ÒÒ 
AddTransition
ÚÚ 
(
ÚÚ 
trigger
ÚÚ !
,
ÚÚ! "

transition
ÚÚ# -
)
ÚÚ- .
;
ÚÚ. /
return
ÙÙ 
this
ÙÙ 
;
ÙÙ 
}
ıı 	
public
¸¸ !
IStateConfiguration
¸¸ "
<
¸¸" #
T
¸¸# $
,
¸¸$ %
TState
¸¸& ,
,
¸¸, -
TTrigger
¸¸. 6
>
¸¸6 7
AddEntryAction
¸¸8 F
(
¸¸F G
Action
¸¸G M
<
¸¸M N
T
¸¸N O
>
¸¸O P
action
¸¸Q W
)
¸¸W X
{
˝˝ 	
if
˛˛ 
(
˛˛ !
_defaultEntryAction
˛˛ #
!=
˛˛$ &
null
˛˛' +
)
˛˛+ ,
{
ˇˇ 
throw
ˇˇ 
new
ˇˇ '
InvalidOperationException
ˇˇ 1
(
ˇˇ1 2
$str
ˇˇ2 a
)
ˇˇa b
;
ˇˇb c
}
ˇˇd e!
_defaultEntryAction
ÅÅ 
=
ÅÅ  !
action
ÅÅ" (
??
ÅÅ) +
throw
ÅÅ, 1
new
ÅÅ2 5#
ArgumentNullException
ÅÅ6 K
(
ÅÅK L
nameof
ÅÅL R
(
ÅÅR S
action
ÅÅS Y
)
ÅÅY Z
)
ÅÅZ [
;
ÅÅ[ \
return
ÉÉ 
this
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
åå !
IStateConfiguration
åå "
<
åå" #
T
åå# $
,
åå$ %
TState
åå& ,
,
åå, -
TTrigger
åå. 6
>
åå6 7
AddReentryAction
åå8 H
(
ååH I
Action
ååI O
<
ååO P
T
ååP Q
>
ååQ R
action
ååS Y
)
ååY Z
{
çç 	
if
éé 
(
éé 
_reentryAction
éé 
!=
éé !
null
éé" &
)
éé& '
{
èè 
throw
èè 
new
èè '
InvalidOperationException
èè 1
(
èè1 2
$str
èè2 Y
)
èèY Z
;
èèZ [
}
èè\ ]
_reentryAction
ëë 
=
ëë 
action
ëë #
??
ëë$ &
throw
ëë' ,
new
ëë- 0#
ArgumentNullException
ëë1 F
(
ëëF G
nameof
ëëG M
(
ëëM N
action
ëëN T
)
ëëT U
)
ëëU V
;
ëëV W
return
ìì 
this
ìì 
;
ìì 
}
îî 	
public
úú !
IStateConfiguration
úú "
<
úú" #
T
úú# $
,
úú$ %
TState
úú& ,
,
úú, -
TTrigger
úú. 6
>
úú6 7
AddEntryAction
úú8 F
(
úúF G
Action
úúG M
<
úúM N
T
úúN O
>
úúO P
action
úúQ W
,
úúW X
TState
úúY _
previousState
úú` m
)
úúm n
{
ùù 	
if
ûû 
(
ûû 
action
ûû 
==
ûû 
null
ûû 
)
ûû 
{
üü 
throw
üü 
new
üü #
ArgumentNullException
üü -
(
üü- .
nameof
üü. 4
(
üü4 5
action
üü5 ;
)
üü; <
)
üü< =
;
üü= >
}
üü? @
if
°° 
(
°° (
_previousStateEntryActions
°° *
.
°°* +
ContainsKey
°°+ 6
(
°°6 7
previousState
°°7 D
)
°°D E
)
°°E F
{
¢¢ 
throw
¢¢ 
new
¢¢ '
InvalidOperationException
¢¢ 1
(
¢¢1 2
$str
¢¢2 g
)
¢¢g h
;
¢¢h i
}
¢¢j k(
_previousStateEntryActions
§§ &
.
§§& '
Add
§§' *
(
§§* +
previousState
§§+ 8
,
§§8 9
action
§§: @
)
§§@ A
;
§§A B
return
¶¶ 
this
¶¶ 
;
¶¶ 
}
ßß 	
public
ÆÆ !
IStateConfiguration
ÆÆ "
<
ÆÆ" #
T
ÆÆ# $
,
ÆÆ$ %
TState
ÆÆ& ,
,
ÆÆ, -
TTrigger
ÆÆ. 6
>
ÆÆ6 7
AddExitAction
ÆÆ8 E
(
ÆÆE F
Action
ÆÆF L
<
ÆÆL M
T
ÆÆM N
>
ÆÆN O
action
ÆÆP V
)
ÆÆV W
{
ØØ 	
if
∞∞ 
(
∞∞  
_defaultExitAction
∞∞ "
!=
∞∞# %
null
∞∞& *
)
∞∞* +
{
±± 
throw
±± 
new
±± '
InvalidOperationException
±± 1
(
±±1 2
$str
±±2 T
)
±±T U
;
±±U V
}
±±W X 
_defaultExitAction
≥≥ 
=
≥≥  
action
≥≥! '
??
≥≥( *
throw
≥≥+ 0
new
≥≥1 4#
ArgumentNullException
≥≥5 J
(
≥≥J K
nameof
≥≥K Q
(
≥≥Q R
action
≥≥R X
)
≥≥X Y
)
≥≥Y Z
;
≥≥Z [
return
µµ 
this
µµ 
;
µµ 
}
∂∂ 	
public
ææ !
IStateConfiguration
ææ "
<
ææ" #
T
ææ# $
,
ææ$ %
TState
ææ& ,
,
ææ, -
TTrigger
ææ. 6
>
ææ6 7
AddExitAction
ææ8 E
(
ææE F
Action
ææF L
<
ææL M
T
ææM N
>
ææN O
action
ææP V
,
ææV W
TState
ææX ^
	nextState
ææ_ h
)
ææh i
{
øø 	
if
¿¿ 
(
¿¿ 
action
¿¿ 
==
¿¿ 
null
¿¿ 
)
¿¿ 
{
¡¡ 
throw
¡¡ 
new
¡¡ #
ArgumentNullException
¡¡ -
(
¡¡- .
nameof
¡¡. 4
(
¡¡4 5
action
¡¡5 ;
)
¡¡; <
)
¡¡< =
;
¡¡= >
}
¡¡> ?
if
√√ 
(
√√ #
_nextStateExitActions
√√ %
.
√√% &
ContainsKey
√√& 1
(
√√1 2
	nextState
√√2 ;
)
√√; <
)
√√< =
{
ƒƒ 
throw
ƒƒ 
new
ƒƒ '
InvalidOperationException
ƒƒ 1
(
ƒƒ1 2
$"
ƒƒ2 4)
Exit action for next state 
ƒƒ4 O
{
ƒƒO P
	nextState
ƒƒP Y
}
ƒƒY Z
 already set.
ƒƒZ g
"
ƒƒg h
)
ƒƒh i
;
ƒƒi j
}
ƒƒk l#
_nextStateExitActions
∆∆ !
.
∆∆! "
Add
∆∆" %
(
∆∆% &
	nextState
∆∆& /
,
∆∆/ 0
action
∆∆1 7
)
∆∆7 8
;
∆∆8 9
return
»» 
this
»» 
;
»» 
}
…… 	
public
œœ 
void
œœ 
AddSuperState
œœ !
(
œœ! ")
IStateConfigurationInternal
œœ" =
<
œœ= >
T
œœ> ?
,
œœ? @
TState
œœA G
,
œœG H
TTrigger
œœI Q
>
œœQ R%
superStateConfiguration
œœS j
)
œœj k
{
–– 	
if
—— 
(
—— 
	IsInState
—— 
(
—— %
superStateConfiguration
—— 1
.
——1 2
State
——2 7
)
——7 8
)
——8 9
{
““ 
throw
““ 
new
““ )
ArgumentOutOfRangeException
““ 3
(
““3 4
$"
““4 6
{
““6 7
State
““7 <
}
““< =)
 is already a sub-state of 
““= X
{
““X Y%
superStateConfiguration
““Y p
.
““p q
State
““q v
}
““v w
.
““w x
"
““x y
)
““y z
;
““z {
}
““| }
if
‘‘ 
(
‘‘ %
superStateConfiguration
‘‘ '
.
‘‘' (
	IsInState
‘‘( 1
(
‘‘1 2
State
‘‘2 7
)
‘‘7 8
)
‘‘8 9
{
’’ 
throw
’’ 
new
’’ '
InvalidOperationException
’’ 1
(
’’1 2
$"
’’2 4
{
’’4 5%
superStateConfiguration
’’5 L
.
’’L M
State
’’M R
}
’’R S)
 is already a sub-state of 
’’S n
{
’’n o
State
’’o t
}
’’t u
.
’’u v
"
’’v w
)
’’w x
;
’’x y
}
’’z {
_superState
◊◊ 
=
◊◊ %
superStateConfiguration
◊◊ 1
;
◊◊1 2
}
ÿÿ 	
public
‡‡ !
IStateConfiguration
‡‡ "
<
‡‡" #
T
‡‡# $
,
‡‡$ %
TState
‡‡& ,
,
‡‡, -
TTrigger
‡‡. 6
>
‡‡6 7
AddTriggerAction
‡‡8 H
(
‡‡H I
TTrigger
‡‡I Q
trigger
‡‡R Y
,
‡‡Y Z
Action
‡‡[ a
<
‡‡a b
T
‡‡b c
>
‡‡c d
action
‡‡e k
)
‡‡k l
{
·· 	
if
‚‚ 
(
‚‚ 
_triggerActions
‚‚ 
.
‚‚  
ContainsKey
‚‚  +
(
‚‚+ ,
trigger
‚‚, 3
)
‚‚3 4
)
‚‚4 5
{
„„ 
throw
„„ 
new
„„ '
InvalidOperationException
„„ 1
(
„„1 2
$"
„„2 41
#Only one action is allowed for the 
„„4 W
{
„„W X
trigger
„„X _
}
„„_ `
	 trigger.
„„` i
"
„„i j
)
„„j k
;
„„k l
}
„„m n
_triggerActions
ÂÂ 
.
ÂÂ 
Add
ÂÂ 
(
ÂÂ  
trigger
ÂÂ  '
,
ÂÂ' ("
TriggerActionFactory
ÂÂ) =
<
ÂÂ= >
T
ÂÂ> ?
,
ÂÂ? @
TTrigger
ÂÂA I
>
ÂÂI J
.
ÂÂJ K
GetTriggerAction
ÂÂK [
(
ÂÂ[ \
action
ÂÂ\ b
)
ÂÂb c
)
ÂÂc d
;
ÂÂd e
return
ÁÁ 
this
ÁÁ 
;
ÁÁ 
}
ËË 	
public
ÒÒ !
IStateConfiguration
ÒÒ "
<
ÒÒ" #
T
ÒÒ# $
,
ÒÒ$ %
TState
ÒÒ& ,
,
ÒÒ, -
TTrigger
ÒÒ. 6
>
ÒÒ6 7
AddTriggerAction
ÒÒ8 H
<
ÒÒH I
TRequest
ÒÒI Q
>
ÒÒQ R
(
ÒÒR S
TTrigger
ÒÒS [
trigger
ÒÒ\ c
,
ÒÒc d
Action
ÚÚ 
<
ÚÚ 
T
ÚÚ 
,
ÚÚ 
TRequest
ÚÚ 
>
ÚÚ 
action
ÚÚ  &
)
ÚÚ& '
{
ÛÛ 	
if
ÙÙ 
(
ÙÙ 
_triggerActions
ÙÙ 
.
ÙÙ  
ContainsKey
ÙÙ  +
(
ÙÙ+ ,
trigger
ÙÙ, 3
)
ÙÙ3 4
)
ÙÙ4 5
{
ıı 
throw
ıı 
new
ıı '
InvalidOperationException
ıı 1
(
ıı1 2
$"
ıı2 4-
Only one action is allowed for 
ıı4 S
{
ııS T
trigger
ııT [
}
ıı[ \
	 trigger.
ıı\ e
"
ııe f
)
ııf g
;
ııg h
}
ııi j
_triggerActions
˜˜ 
.
˜˜ 
Add
˜˜ 
(
˜˜  
trigger
˜˜  '
,
˜˜' ("
TriggerActionFactory
˜˜) =
<
˜˜= >
T
˜˜> ?
,
˜˜? @
TTrigger
˜˜A I
>
˜˜I J
.
˜˜J K
GetTriggerAction
˜˜K [
(
˜˜[ \
action
˜˜\ b
)
˜˜b c
)
˜˜c d
;
˜˜d e
return
˘˘ 
this
˘˘ 
;
˘˘ 
}
˙˙ 	
public
¸¸ #
StateTransitionResult
¸¸ $
<
¸¸$ %
TState
¸¸% +
,
¸¸+ ,
TTrigger
¸¸- 5
>
¸¸5 6#
ExecuteAutoTransition
¸¸7 L
(
¸¸L M!
ExecutionParameters
¸¸M `
<
¸¸` a
T
¸¸a b
,
¸¸b c
TTrigger
¸¸d l
>
¸¸l m

parameters
¸¸n x
,
˝˝ #
StateTransitionResult
˝˝ #
<
˝˝# $
TState
˝˝$ *
,
˝˝* +
TTrigger
˝˝, 4
>
˝˝4 5
currentResult
˝˝6 C
)
˝˝C D
{
˛˛ 	
if
ˇˇ 
(
ˇˇ 
AutoTransitions
ˇˇ 
.
ˇˇ  
TryGetValue
ˇˇ  +
(
ˇˇ+ ,

parameters
ˇˇ, 6
.
ˇˇ6 7
Trigger
ˇˇ7 >
,
ˇˇ> ?
out
ˇˇ@ C
var
ˇˇD G
autoTransitions
ˇˇH W
)
ˇˇW X
)
ˇˇX Y
{
ÄÄ 
foreach
ÅÅ 
(
ÅÅ 
var
ÅÅ 

transition
ÅÅ '
in
ÅÅ( *
autoTransitions
ÅÅ+ :
.
ÅÅ: ;
OrderBy
ÅÅ; B
(
ÅÅB C
t
ÅÅC D
=>
ÅÅE G
t
ÅÅH I
.
ÅÅI J
Priority
ÅÅJ R
)
ÅÅR S
)
ÅÅS T
{
ÇÇ 
var
ÉÉ 
localResult
ÉÉ #
=
ÉÉ$ %

transition
ÉÉ& 0
.
ÉÉ0 1
Execute
ÉÉ1 8
(
ÉÉ8 9

parameters
ÉÉ9 C
,
ÉÉC D
currentResult
ÉÉE R
)
ÉÉR S
;
ÉÉS T
if
ÑÑ 
(
ÑÑ 
localResult
ÑÑ #
.
ÑÑ# $
WasTransitioned
ÑÑ$ 3
)
ÑÑ3 4
{
ÖÖ 
return
ÖÖ 
localResult
ÖÖ (
;
ÖÖ( )
}
ÖÖ* +
}
ÜÜ 
}
áá 
return
ää 
_superState
ää 
!=
ää !
null
ää" &
?
ãã 
_superState
ãã 
.
ãã #
ExecuteAutoTransition
ãã 3
(
ãã3 4

parameters
ãã4 >
,
ãã> ?
currentResult
ãã@ M
)
ããM N
:
åå 
new
åå #
StateTransitionResult
åå +
<
åå+ ,
TState
åå, 2
,
åå2 3
TTrigger
åå4 <
>
åå< =
(
åå= >

parameters
åå> H
.
ååH I
Trigger
ååI P
,
çç 
currentResult
çç !
.
çç! "
CurrentState
çç" .
,
éé 
currentResult
éé !
.
éé! "
CurrentState
éé" .
,
èè 
currentResult
èè !
.
èè! "
CurrentState
èè" .
,
êê 
string
êê 
.
êê 
Empty
êê  
,
ëë 
transitionDefined
ëë %
:
ëë% &
false
ëë' ,
,
íí 
conditionMet
íí  
:
íí  !
false
íí" '
)
íí' (
;
íí( )
}
ìì 	
public
ïï 
void
ïï  
ExecuteEntryAction
ïï &
(
ïï& '
T
ïï' (
context
ïï) 0
,
ïï0 1#
StateTransitionResult
ïï2 G
<
ïïG H
TState
ïïH N
,
ïïN O
TTrigger
ïïP X
>
ïïX Y
currentResult
ïïZ g
)
ïïg h
{
ññ 	
if
òò 
(
òò 
_superState
òò 
!=
òò 
null
òò #
&&
òò$ &
!
òò' (
	IsInState
òò( 1
(
òò1 2
currentResult
òò2 ?
.
òò? @
CurrentState
òò@ L
)
òòL M
)
òòM N
{
ôô 
_superState
ôô 
.
ôô  
ExecuteEntryAction
ôô ,
(
ôô, -
context
ôô- 4
,
ôô4 5
currentResult
ôô6 C
)
ôôC D
;
ôôD E
}
ôôF G
if
úú 
(
úú (
_previousStateEntryActions
úú *
.
úú* +
TryGetValue
úú+ 6
(
úú6 7
currentResult
úú7 D
.
úúD E
PreviousState
úúE R
,
úúR S
out
úúT W
var
úúX [
action
úú\ b
)
úúb c
)
úúc d
{
ùù 
action
ùù 
.
ùù 
Invoke
ùù 
(
ùù 
context
ùù #
)
ùù# $
;
ùù$ %
}
ùù& '!
_defaultEntryAction
†† 
?
††  
.
††  !
Invoke
††! '
(
††' (
context
††( /
)
††/ 0
;
††0 1
}
°° 	
public
££ 
void
££ 
ExecuteExitAction
££ %
(
££% &
T
££& '
context
££( /
,
££/ 0#
StateTransitionResult
££1 F
<
££F G
TState
££G M
,
££M N
TTrigger
££O W
>
££W X
currentResult
££Y f
)
££f g
{
§§ 	
if
¶¶ 
(
¶¶ #
_nextStateExitActions
¶¶ %
.
¶¶% &
TryGetValue
¶¶& 1
(
¶¶1 2
currentResult
¶¶2 ?
.
¶¶? @
CurrentState
¶¶@ L
,
¶¶L M
out
¶¶N Q
var
¶¶R U
action
¶¶V \
)
¶¶\ ]
)
¶¶] ^
{
ßß 
action
ßß 
.
ßß 
Invoke
ßß 
(
ßß 
context
ßß #
)
ßß# $
;
ßß$ %
}
ßß& ' 
_defaultExitAction
™™ 
?
™™ 
.
™™  
Invoke
™™  &
(
™™& '
context
™™' .
)
™™. /
;
™™/ 0
if
¨¨ 
(
¨¨ 
_superState
¨¨ 
!=
¨¨ 
null
¨¨ #
&&
¨¨$ &
!
¨¨' (
	IsInState
¨¨( 1
(
¨¨1 2
currentResult
¨¨2 ?
.
¨¨? @
CurrentState
¨¨@ L
)
¨¨L M
)
¨¨M N
{
≠≠ 
_superState
≠≠ 
.
≠≠ 
ExecuteExitAction
≠≠ +
(
≠≠+ ,
context
≠≠, 3
,
≠≠3 4
currentResult
≠≠5 B
)
≠≠B C
;
≠≠C D
}
≠≠E F
}
ÆÆ 	
public
∞∞ 
void
∞∞ "
ExecuteReentryAction
∞∞ (
(
∞∞( )
T
∞∞) *
context
∞∞+ 2
,
∞∞2 3#
StateTransitionResult
∞∞4 I
<
∞∞I J
TState
∞∞J P
,
∞∞P Q
TTrigger
∞∞R Z
>
∞∞Z [
currentResult
∞∞\ i
)
∞∞i j
{
±± 	
_superState
≤≤ 
?
≤≤ 
.
≤≤ "
ExecuteReentryAction
≤≤ -
(
≤≤- .
context
≤≤. 5
,
≤≤5 6
currentResult
≤≤7 D
)
≤≤D E
;
≤≤E F
_reentryAction
≥≥ 
?
≥≥ 
.
≥≥ 
Invoke
≥≥ "
(
≥≥" #
context
≥≥# *
)
≥≥* +
;
≥≥+ ,
}
¥¥ 	
private
∂∂ 
void
∂∂ )
AddOtherStateAutoTransition
∂∂ 0
(
∂∂0 1
TState
∂∂1 7

otherState
∂∂8 B
,
∑∑
 
TTrigger
∑∑ 
trigger
∑∑ 
,
∏∏
 !
StateTransitionBase
∏∏ 
<
∏∏  
T
∏∏  !
,
∏∏! "
TState
∏∏# )
,
∏∏) *
TTrigger
∏∏+ 3
>
∏∏3 4

transition
∏∏5 ?
)
∏∏? @
{
ππ 	
var
∫∫ 
otherStateConfig
∫∫  
=
∫∫! ")
GetTargetStateConfiguration
∫∫# >
(
∫∫> ?

otherState
∫∫? I
)
∫∫I J
;
∫∫J K
otherStateConfig
ªª 
.
ªª 
AddAutoTransition
ªª .
(
ªª. /
trigger
ªª/ 6
,
ªª6 7

transition
ªª8 B
)
ªªB C
;
ªªC D
}
ºº 	
private
ææ )
IStateConfigurationInternal
ææ +
<
ææ+ ,
T
ææ, -
,
ææ- .
TState
ææ/ 5
,
ææ5 6
TTrigger
ææ7 ?
>
ææ? @)
GetTargetStateConfiguration
ææA \
(
ææ\ ]
TState
ææ] c
targetState
ææd o
)
ææo p
{
øø 	
return
¿¿ 
_stateMachine
¿¿  
.
¿¿  !
ConfigureState
¿¿! /
(
¿¿/ 0
targetState
¿¿0 ;
)
¿¿; <
as
¿¿= ?)
IStateConfigurationInternal
¿¿@ [
<
¿¿[ \
T
¿¿\ ]
,
¿¿] ^
TState
¿¿_ e
,
¿¿e f
TTrigger
¿¿g o
>
¿¿o p
;
¿¿p q
}
¡¡ 	
public
√√ #
StateTransitionResult
√√ $
<
√√$ %
TState
√√% +
,
√√+ ,
TTrigger
√√- 5
>
√√5 6
FireTrigger
√√7 B
(
√√B C!
ExecutionParameters
√√C V
<
√√V W
T
√√W X
,
√√X Y
TTrigger
√√Z b
>
√√b c

parameters
√√d n
)
√√n o
{
ƒƒ 	
if
≈≈ 
(
≈≈ 
_triggerActions
≈≈ 
.
≈≈  
TryGetValue
≈≈  +
(
≈≈+ ,

parameters
≈≈, 6
.
≈≈6 7
Trigger
≈≈7 >
,
≈≈> ?
out
≈≈@ C
var
≈≈D G
triggerAction
≈≈H U
)
≈≈U V
)
≈≈V W
{
∆∆ 
triggerAction
∆∆ 
.
∆∆ 
Execute
∆∆ #
(
∆∆# $

parameters
∆∆$ .
)
∆∆. /
;
∆∆/ 0
}
∆∆1 2
var
»» 
result
»» 
=
»» 
FireTriggerPrim
»» (
(
»»( )

parameters
»») 3
)
»»3 4
;
»»4 5
if
   
(
   
!
   
(
   
result
   
?
   
.
   
WasTransitioned
   )
??
  * ,
false
  - 2
)
  2 3
&&
  4 6
_superState
  7 B
!=
  C E
null
  F J
)
  J K
{
ÀÀ 
result
ÀÀ 
=
ÀÀ 
_superState
ÀÀ "
.
ÀÀ" #
FireTrigger
ÀÀ# .
(
ÀÀ. /

parameters
ÀÀ/ 9
)
ÀÀ9 :
;
ÀÀ: ;
}
ÀÀ< =
else
ÃÃ 
{
ÕÕ 
var
ŒŒ 

startState
ŒŒ 
=
ŒŒ  
StateAccessor
ŒŒ! .
(
ŒŒ. /

parameters
ŒŒ/ 9
.
ŒŒ9 :
Context
ŒŒ: A
)
ŒŒA B
;
ŒŒB C
result
œœ 
=
œœ 
result
œœ 
??
œœ  "
new
–– #
StateTransitionResult
–– -
<
––- .
TState
––. 4
,
––4 5
TTrigger
––6 >
>
––> ?
(
––? @

parameters
––@ J
.
––J K
Trigger
––K R
,
—— 

startState
—— $
,
““ 

startState
““ $
,
”” 

startState
”” $
,
‘‘ 
string
‘‘  
.
‘‘  !
Empty
‘‘! &
,
’’ 
transitionDefined
’’ +
:
’’+ ,
false
’’- 2
)
’’2 3
;
’’3 4
}
÷÷ 
return
ÿÿ 
result
ÿÿ 
;
ÿÿ 
}
ŸŸ 	
public
€€ 
bool
€€ 
	IsInState
€€ 
(
€€ 
TState
€€ $
state
€€% *
)
€€* +
{
‹‹ 	
if
›› 
(
›› 
state
›› 
.
›› 
	CompareTo
›› 
(
››  
State
››  %
)
››% &
==
››' )
$num
››* +
)
››+ ,
{
ﬁﬁ 
return
ﬁﬁ 
true
ﬁﬁ 
;
ﬁﬁ 
}
ﬁﬁ 
return
‡‡ 
_superState
‡‡ 
?
‡‡ 
.
‡‡  
	IsInState
‡‡  )
(
‡‡) *
state
‡‡* /
)
‡‡/ 0
??
‡‡1 3
false
‡‡4 9
;
‡‡9 :
}
·· 	
public
„„ !
IStateConfiguration
„„ "
<
„„" #
T
„„# $
,
„„$ %
TState
„„& ,
,
„„, -
TTrigger
„„. 6
>
„„6 7
MakeSubStateOf
„„8 F
(
„„F G!
IStateConfiguration
„„G Z
<
„„Z [
T
„„[ \
,
„„\ ]
TState
„„^ d
,
„„d e
TTrigger
„„f n
>
„„n o&
superStateConfiguration„„p á
)„„á à
{
‰‰ 	
AddSuperState
ÂÂ 
(
ÂÂ %
superStateConfiguration
ÂÂ 1
as
ÂÂ2 4)
IStateConfigurationInternal
ÂÂ5 P
<
ÂÂP Q
T
ÂÂQ R
,
ÂÂR S
TState
ÂÂT Z
,
ÂÂZ [
TTrigger
ÂÂ\ d
>
ÂÂd e
)
ÂÂe f
;
ÂÂf g
return
ÁÁ 
this
ÁÁ 
;
ÁÁ 
}
ËË 	
}
ÈÈ 
}ÍÍ ÚÃ
YC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateConfigurationAsync.cs
	namespace 	
NStateManager
 
{ 
public 

class #
StateConfigurationAsync (
<( )
T) *
,* +
TState, 2
,2 3
TTrigger4 <
>< =
: 	"
StateConfigurationBase
  
<  !
T! "
," #
TState$ *
,* +
TTrigger, 4
>4 5
,5 6,
 IStateConfigurationAsyncInternal7 W
<W X
TX Y
,Y Z
TState[ a
,a b
TTriggerc k
>k l
where 
TState 
: 
IComparable "
{ 
private 
readonly 

Dictionary #
<# $
TState$ *
,* +
Func, 0
<0 1
T1 2
,2 3
CancellationToken4 E
,E F
TaskG K
>K L
>L M&
_previousStateEntryActionsN h
=i j
newk n

Dictionaryo y
<y z
TState	z Ä
,
Ä Å
Func
Ç Ü
<
Ü á
T
á à
,
à â
CancellationToken
ä õ
,
õ ú
Task
ù °
>
° ¢
>
¢ £
(
£ §
)
§ •
;
• ¶
private 
readonly 

Dictionary #
<# $
TState$ *
,* +
Func, 0
<0 1
T1 2
,2 3
CancellationToken4 E
,E F
TaskG K
>K L
>L M!
_nextStateExitActionsN c
=d e
newf i

Dictionaryj t
<t u
TStateu {
,{ |
Func	} Å
<
Å Ç
T
Ç É
,
É Ñ
CancellationToken
Ö ñ
,
ñ ó
Task
ò ú
>
ú ù
>
ù û
(
û ü
)
ü †
;
† °
private 
readonly 
IStateMachineAsync +
<+ ,
T, -
,- .
TState/ 5
,5 6
TTrigger7 ?
>? @
_stateMachineA N
;N O
private   
readonly   

Dictionary   #
<  # $
TTrigger  $ ,
,  , -
FunctionActionBase  . @
<  @ A
T  A B
>  B C
>  C D
_triggerActions  E T
=  U V
new  W Z

Dictionary  [ e
<  e f
TTrigger  f n
,  n o
FunctionActionBase	  p Ç
<
  Ç É
T
  É Ñ
>
  Ñ Ö
>
  Ö Ü
(
  Ü á
)
  á à
;
  à â
private!! 
Func!! 
<!! 
T!! 
,!! 
CancellationToken!! )
,!!) *
Task!!+ /
>!!/ 0
_defaultEntryAction!!1 D
;!!D E
private"" 
Func"" 
<"" 
T"" 
,"" 
CancellationToken"" )
,"") *
Task""+ /
>""/ 0
_defaultExitAction""1 C
;""C D
private## 
Func## 
<## 
T## 
,## 
CancellationToken## )
,##) *
Task##+ /
>##/ 0
_reentryAction##1 ?
;##? @
private$$ ,
 IStateConfigurationAsyncInternal$$ 0
<$$0 1
T$$1 2
,$$2 3
TState$$4 :
,$$: ;
TTrigger$$< D
>$$D E
_superState$$F Q
;$$Q R
internal++ #
StateConfigurationAsync++ (
(++( )
TState++) /
state++0 5
,++5 6
IStateMachineAsync++7 I
<++I J
T++J K
,++K L
TState++M S
,++S T
TTrigger++U ]
>++] ^
stateMachine++_ k
)++k l
:,, 
base,, 
(,, 
state,, 
,,, 
stateMachine,, &
.,,& '
StateAccessor,,' 4
,,,4 5
stateMachine,,6 B
.,,B C
StateMutator,,C O
),,O P
{-- 	
_stateMachine.. 
=.. 
stateMachine.. (
;..( )
}// 	
public99 $
IStateConfigurationAsync99 '
<99' (
T99( )
,99) *
TState99+ 1
,991 2
TTrigger993 ;
>99; <$
AddAutoDynamicTransition99= U
(99U V
TTrigger99V ^
trigger99_ f
,99f g
Func99h l
<99l m
T99m n
,99n o
TState99p v
>99v w
function	99x Ä
,
99Ä Å
string
99Ç à
name
99â ç
=
99é è
null
99ê î
,
99î ï
uint
99ñ ö
priority
99õ £
=
99§ •
$num
99¶ ß
)
99ß ®
{:: 	
var;; 
initialTransition;; !
=;;" #"
StateTransitionFactory;;$ :
<;;: ;
T;;; <
,;;< =
TState;;> D
,;;D E
TTrigger;;F N
>;;N O
.;;O P
GetStateTransition;;P b
(;;b c
_stateMachine;;c p
,<< 
State<< 
,== 
function== 
,>> 
State>> 
,?? 
name?? 
,@@ 
priority@@ 
)@@ 
;@@ 
AddAutoTransitionAA 
(AA 
triggerAA %
,AA% &
initialTransitionAA' 8
)AA8 9
;AA9 :
returnCC 
thisCC 
;CC 
}DD 	
publicFF $
IStateConfigurationAsyncFF '
<FF' (
TFF( )
,FF) *
TStateFF+ 1
,FF1 2
TTriggerFF3 ;
>FF; <$
AddAutoDynamicTransitionFF= U
<FFU V
TRequestFFV ^
>FF^ _
(FF_ `
TTriggerFF` h
triggerFFi p
,GG
 
FuncGG 
<GG 
TGG 
,GG 
TRequestGG 
,GG 
TStateGG $
>GG$ %
functionGG& .
,HH
 
stringHH 
nameHH 
=HH 
nullHH 
,II
 
uintII 
priorityII 
=II 
$numII 
)II 
whereJJ 
TRequestJJ 
:JJ 
classJJ "
{KK 	
varLL 
initialTransitionLL !
=LL" #"
StateTransitionFactoryLL$ :
<LL: ;
TLL; <
,LL< =
TStateLL> D
,LLD E
TTriggerLLF N
>LLN O
.LLO P
GetStateTransitionLLP b
(LLb c
_stateMachineLLc p
,MM 
StateMM 
,NN 
functionNN 
,OO 
StateOO 
,PP 
namePP 
,QQ 
priorityQQ 
)QQ 
;QQ 
AddAutoTransitionRR 
(RR 
triggerRR %
,RR% &
initialTransitionRR' 8
)RR8 9
;RR9 :
returnTT 
thisTT 
;TT 
}UU 	
public`` $
IStateConfigurationAsync`` '
<``' (
T``( )
,``) *
TState``+ 1
,``1 2
TTrigger``3 ;
>``; <$
AddAutoForwardTransition``= U
(``U V
TTrigger``V ^
trigger``_ f
,aa
 
TStateaa 
toStateaa 
,bb
 
Funcbb 
<bb 
Tbb 
,bb 
CancellationTokenbb %
,bb% &
Taskbb' +
<bb+ ,
boolbb, 0
>bb0 1
>bb1 2
	conditionbb3 <
,cc
 
stringcc 
namecc 
=cc 
nullcc 
,dd
 
uintdd 
prioritydd 
=dd 
$numdd 
)dd 
{ee 	
ifff 
(ff 
	conditionff 
==ff 
nullff !
)ff! "
{gg 
throwgg 
newgg !
ArgumentNullExceptiongg -
(gg- .
nameofgg. 4
(gg4 5
	conditiongg5 >
)gg> ?
)gg? @
;gg@ A
}ggB C
varii 

transitionii 
=ii "
StateTransitionFactoryii 3
<ii3 4
Tii4 5
,ii5 6
TStateii7 =
,ii= >
TTriggerii? G
>iiG H
.iiH I
GetStateTransitioniiI [
(ii[ \
_stateMachineii\ i
,jj 
triggerStatejj 
:jj 
Statejj #
,kk 
toStatekk 
:kk 
toStatekk  
,ll 
conditionAsyncll 
:ll 
	conditionll  )
,mm 
namemm 
:mm 
namemm 
,nn 
prioritynn 
:nn 
prioritynn "
)nn" #
;nn# $
AddAutoTransitionoo 
(oo 
triggeroo %
,oo% &

transitionoo' 1
)oo1 2
;oo2 3
returnqq 
thisqq 
;qq 
}rr 	
public~~ $
IStateConfigurationAsync~~ '
<~~' (
T~~( )
,~~) *
TState~~+ 1
,~~1 2
TTrigger~~3 ;
>~~; <$
AddAutoForwardTransition~~= U
<~~U V
TRequest~~V ^
>~~^ _
(~~_ `
TTrigger~~` h
trigger~~i p
,
 
TState 
toState 
,
ÄÄ
 
Func
ÄÄ 
<
ÄÄ 
T
ÄÄ 
,
ÄÄ 
TRequest
ÄÄ 
,
ÄÄ 
CancellationToken
ÄÄ /
,
ÄÄ/ 0
Task
ÄÄ1 5
<
ÄÄ5 6
bool
ÄÄ6 :
>
ÄÄ: ;
>
ÄÄ; <
	condition
ÄÄ= F
,
ÅÅ
 
string
ÅÅ 
name
ÅÅ 
=
ÅÅ 
null
ÅÅ 
,
ÇÇ
 
uint
ÇÇ 
priority
ÇÇ 
=
ÇÇ 
$num
ÇÇ 
)
ÇÇ 
where
ÉÉ 
TRequest
ÉÉ 
:
ÉÉ 
class
ÉÉ "
{
ÑÑ 	
if
ÖÖ 
(
ÖÖ 
	condition
ÖÖ 
==
ÖÖ 
null
ÖÖ !
)
ÖÖ! "
{
ÜÜ 
throw
ÜÜ 
new
ÜÜ #
ArgumentNullException
ÜÜ -
(
ÜÜ- .
nameof
ÜÜ. 4
(
ÜÜ4 5
	condition
ÜÜ5 >
)
ÜÜ> ?
)
ÜÜ? @
;
ÜÜ@ A
}
ÜÜB C
var
àà 

transition
àà 
=
àà $
StateTransitionFactory
àà 3
<
àà3 4
T
àà4 5
,
àà5 6
TState
àà7 =
,
àà= >
TTrigger
àà? G
>
ààG H
.
ààH I 
GetStateTransition
ààI [
(
àà[ \
_stateMachine
àà\ i
,
ââ 
State
ââ 
,
ää 
toState
ää 
,
ãã 
	condition
ãã 
,
åå 
State
åå 
,
çç 
name
çç 
,
éé 
priority
éé 
)
éé 
;
éé 
AddAutoTransition
èè 
(
èè 
trigger
èè %
,
èè% &

transition
èè' 1
)
èè1 2
;
èè2 3
return
ëë 
this
ëë 
;
ëë 
}
íí 	
public
úú &
IStateConfigurationAsync
úú '
<
úú' (
T
úú( )
,
úú) *
TState
úú+ 1
,
úú1 2
TTrigger
úú3 ;
>
úú; <"
AddDynamicTransition
úú= Q
(
úúQ R
TTrigger
úúR Z
trigger
úú[ b
,
ùù 
Func
ùù 
<
ùù 
T
ùù 
,
ùù 
TState
ùù 
>
ùù 
stateFunction
ùù +
,
ûû 
string
ûû 
name
ûû 
=
ûû 
null
ûû  
,
üü 
uint
üü 
priority
üü 
=
üü 
$num
üü 
)
üü  
{
†† 	
if
°° 
(
°° 
stateFunction
°° 
==
°°  
null
°°! %
)
°°% &
{
¢¢ 
throw
¢¢ 
new
¢¢ #
ArgumentNullException
¢¢ -
(
¢¢- .
nameof
¢¢. 4
(
¢¢4 5
stateFunction
¢¢5 B
)
¢¢B C
)
¢¢C D
;
¢¢D E
}
¢¢F G
var
§§ 

transition
§§ 
=
§§ $
StateTransitionFactory
§§ 3
<
§§3 4
T
§§4 5
,
§§5 6
TState
§§7 =
,
§§= >
TTrigger
§§? G
>
§§G H
.
§§H I 
GetStateTransition
§§I [
(
§§[ \
_stateMachine
§§\ i
,
•• 
stateFunction
•• 
,
¶¶ 
name
¶¶ 
,
ßß 
priority
ßß 
)
ßß 
;
ßß 
AddTransition
®® 
(
®® 
trigger
®® !
,
®®! "

transition
®®# -
)
®®- .
;
®®. /
return
™™ 
this
™™ 
;
™™ 
}
´´ 	
public
∂∂ &
IStateConfigurationAsync
∂∂ '
<
∂∂' (
T
∂∂( )
,
∂∂) *
TState
∂∂+ 1
,
∂∂1 2
TTrigger
∂∂3 ;
>
∂∂; <"
AddDynamicTransition
∂∂= Q
<
∂∂Q R
TRequest
∂∂R Z
>
∂∂Z [
(
∂∂[ \
TTrigger
∂∂\ d
trigger
∂∂e l
,
∑∑ 
Func
∑∑ 
<
∑∑ 
T
∑∑ 
,
∑∑ 
TRequest
∑∑ 
,
∑∑ 
TState
∑∑  &
>
∑∑& '
stateFunction
∑∑( 5
,
∏∏ 
string
∏∏ 
name
∏∏ 
=
∏∏ 
null
∏∏  
,
ππ 
uint
ππ 
priority
ππ 
=
ππ 
$num
ππ 
)
ππ  
where
∫∫ 
TRequest
∫∫ 
:
∫∫ 
class
∫∫ "
{
ªª 	
if
ºº 
(
ºº 
stateFunction
ºº 
==
ºº  
null
ºº! %
)
ºº% &
{
ΩΩ 
throw
ΩΩ 
new
ΩΩ #
ArgumentNullException
ΩΩ -
(
ΩΩ- .
nameof
ΩΩ. 4
(
ΩΩ4 5
stateFunction
ΩΩ5 B
)
ΩΩB C
)
ΩΩC D
;
ΩΩD E
}
ΩΩF G
var
øø 

transition
øø 
=
øø $
StateTransitionFactory
øø 3
<
øø3 4
T
øø4 5
,
øø5 6
TState
øø7 =
,
øø= >
TTrigger
øø? G
>
øøG H
.
øøH I 
GetStateTransition
øøI [
(
øø[ \
_stateMachine
øø\ i
,
¿¿ 
stateFunction
¿¿ 
,
¡¡ 
name
¡¡ 
,
¬¬ 
priority
¬¬ 
)
¬¬ 
;
¬¬ 
AddTransition
√√ 
(
√√ 
trigger
√√ !
,
√√! "

transition
√√# -
)
√√- .
;
√√. /
return
≈≈ 
this
≈≈ 
;
≈≈ 
}
∆∆ 	
public
ÕÕ &
IStateConfigurationAsync
ÕÕ '
<
ÕÕ' (
T
ÕÕ( )
,
ÕÕ) *
TState
ÕÕ+ 1
,
ÕÕ1 2
TTrigger
ÕÕ3 ;
>
ÕÕ; <
AddEntryAction
ÕÕ= K
(
ÕÕK L
Func
ÕÕL P
<
ÕÕP Q
T
ÕÕQ R
,
ÕÕR S
CancellationToken
ÕÕT e
,
ÕÕe f
Task
ÕÕg k
>
ÕÕk l
action
ÕÕm s
)
ÕÕs t
{
ŒŒ 	
if
œœ 
(
œœ !
_defaultEntryAction
œœ #
!=
œœ$ &
null
œœ' +
)
œœ+ ,
{
–– 
throw
–– 
new
–– '
InvalidOperationException
–– 1
(
––1 2
$str
––2 a
)
––a b
;
––b c
}
––d e!
_defaultEntryAction
““ 
=
““  !
action
““" (
??
““) +
throw
““, 1
new
““2 5#
ArgumentNullException
““6 K
(
““K L
nameof
““L R
(
““R S
action
““S Y
)
““Y Z
)
““Z [
;
““[ \
return
‘‘ 
this
‘‘ 
;
‘‘ 
}
’’ 	
public
›› &
IStateConfigurationAsync
›› '
<
››' (
T
››( )
,
››) *
TState
››+ 1
,
››1 2
TTrigger
››3 ;
>
››; <
AddEntryAction
››= K
(
››K L
Func
››L P
<
››P Q
T
››Q R
,
››R S
CancellationToken
››T e
,
››e f
Task
››g k
>
››k l
action
››m s
,
››s t
TState
››u {
previousState››| â
)››â ä
{
ﬁﬁ 	
if
ﬂﬂ 
(
ﬂﬂ 
action
ﬂﬂ 
==
ﬂﬂ 
null
ﬂﬂ 
)
ﬂﬂ 
{
‡‡ 
throw
‡‡ 
new
‡‡ #
ArgumentNullException
‡‡ -
(
‡‡- .
nameof
‡‡. 4
(
‡‡4 5
action
‡‡5 ;
)
‡‡; <
)
‡‡< =
;
‡‡= >
}
‡‡? @
if
‚‚ 
(
‚‚ (
_previousStateEntryActions
‚‚ *
.
‚‚* +
ContainsKey
‚‚+ 6
(
‚‚6 7
previousState
‚‚7 D
)
‚‚D E
)
‚‚E F
{
„„ 
throw
„„ 
new
„„ '
InvalidOperationException
„„ 1
(
„„1 2
$str
„„2 g
)
„„g h
;
„„h i
}
„„j k(
_previousStateEntryActions
ÂÂ &
.
ÂÂ& '
Add
ÂÂ' *
(
ÂÂ* +
previousState
ÂÂ+ 8
,
ÂÂ8 9
action
ÂÂ: @
)
ÂÂ@ A
;
ÂÂA B
return
ÁÁ 
this
ÁÁ 
;
ÁÁ 
}
ËË 	
public
ÔÔ &
IStateConfigurationAsync
ÔÔ '
<
ÔÔ' (
T
ÔÔ( )
,
ÔÔ) *
TState
ÔÔ+ 1
,
ÔÔ1 2
TTrigger
ÔÔ3 ;
>
ÔÔ; <
AddExitAction
ÔÔ= J
(
ÔÔJ K
Func
ÔÔK O
<
ÔÔO P
T
ÔÔP Q
,
ÔÔQ R
CancellationToken
ÔÔS d
,
ÔÔd e
Task
ÔÔf j
>
ÔÔj k
action
ÔÔl r
)
ÔÔr s
{
 	
if
ÒÒ 
(
ÒÒ  
_defaultExitAction
ÒÒ "
!=
ÒÒ# %
null
ÒÒ& *
)
ÒÒ* +
{
ÚÚ 
throw
ÚÚ 
new
ÚÚ '
InvalidOperationException
ÚÚ 1
(
ÚÚ1 2
$str
ÚÚ2 T
)
ÚÚT U
;
ÚÚU V
}
ÚÚW X 
_defaultExitAction
ÙÙ 
=
ÙÙ  
action
ÙÙ! '
??
ÙÙ( *
throw
ÙÙ+ 0
new
ÙÙ1 4#
ArgumentNullException
ÙÙ5 J
(
ÙÙJ K
nameof
ÙÙK Q
(
ÙÙQ R
action
ÙÙR X
)
ÙÙX Y
)
ÙÙY Z
;
ÙÙZ [
return
ˆˆ 
this
ˆˆ 
;
ˆˆ 
}
˜˜ 	
public
ˇˇ &
IStateConfigurationAsync
ˇˇ '
<
ˇˇ' (
T
ˇˇ( )
,
ˇˇ) *
TState
ˇˇ+ 1
,
ˇˇ1 2
TTrigger
ˇˇ3 ;
>
ˇˇ; <
AddExitAction
ˇˇ= J
(
ˇˇJ K
Func
ˇˇK O
<
ˇˇO P
T
ˇˇP Q
,
ˇˇQ R
CancellationToken
ˇˇS d
,
ˇˇd e
Task
ˇˇf j
>
ˇˇj k
action
ˇˇl r
,
ˇˇr s
TState
ˇˇt z
	nextStateˇˇ{ Ñ
)ˇˇÑ Ö
{
ÄÄ 	
if
ÅÅ 
(
ÅÅ 
action
ÅÅ 
==
ÅÅ 
null
ÅÅ 
)
ÅÅ 
{
ÇÇ 
throw
ÇÇ 
new
ÇÇ #
ArgumentNullException
ÇÇ -
(
ÇÇ- .
nameof
ÇÇ. 4
(
ÇÇ4 5
	nextState
ÇÇ5 >
)
ÇÇ> ?
)
ÇÇ? @
;
ÇÇ@ A
}
ÇÇB C
if
ÑÑ 
(
ÑÑ #
_nextStateExitActions
ÑÑ %
.
ÑÑ% &
ContainsKey
ÑÑ& 1
(
ÑÑ1 2
	nextState
ÑÑ2 ;
)
ÑÑ; <
)
ÑÑ< =
{
ÖÖ 
throw
ÖÖ 
new
ÖÖ '
InvalidOperationException
ÖÖ 1
(
ÖÖ1 2
$"
ÖÖ2 4)
Exit action with nextState 
ÖÖ4 O
{
ÖÖO P
	nextState
ÖÖP Y
}
ÖÖY Z
 already set.
ÖÖZ g
"
ÖÖg h
)
ÖÖh i
;
ÖÖi j
}
ÖÖk l#
_nextStateExitActions
áá !
.
áá! "
Add
áá" %
(
áá% &
	nextState
áá& /
,
áá/ 0
action
áá1 7
)
áá7 8
;
áá8 9
return
ââ 
this
ââ 
;
ââ 
}
ää 	
public
åå &
IStateConfigurationAsync
åå '
<
åå' (
T
åå( )
,
åå) *
TState
åå+ 1
,
åå1 2
TTrigger
åå3 ;
>
åå; <-
AddAutoForwardDynamicTransition
åå= \
(
åå\ ]
TTrigger
åå] e
trigger
ååf m
,
çç
 
Func
çç 
<
çç 
T
çç 
,
çç 
TState
çç 
>
çç 
function
çç $
,
éé
 
string
éé 
name
éé 
=
éé 
null
éé 
,
èè
 
uint
èè 
priority
èè 
=
èè 
$num
èè 
)
èè 
{
êê 	
var
ëë 
initialTransition
ëë !
=
ëë" #$
StateTransitionFactory
ëë$ :
<
ëë: ;
T
ëë; <
,
ëë< =
TState
ëë> D
,
ëëD E
TTrigger
ëëF N
>
ëëN O
.
ëëO P 
GetStateTransition
ëëP b
(
ëëb c
_stateMachine
ëëc p
,
íí 
State
íí 
,
ìì 
function
ìì 
,
îî 
State
îî 
,
ïï 
name
ïï 
,
ññ 
priority
ññ 
)
ññ 
;
ññ 
AddAutoTransition
óó 
(
óó 
trigger
óó %
,
óó% &
initialTransition
óó' 8
)
óó8 9
;
óó9 :
return
ôô 
this
ôô 
;
ôô 
}
öö 	
public
úú &
IStateConfigurationAsync
úú '
<
úú' (
T
úú( )
,
úú) *
TState
úú+ 1
,
úú1 2
TTrigger
úú3 ;
>
úú; <-
AddAutoForwardDynamicTransition
úú= \
<
úú\ ]
TRequest
úú] e
>
úúe f
(
úúf g
TTrigger
úúg o
trigger
úúp w
,
ùù
 
Func
ùù 
<
ùù 
T
ùù 
,
ùù 
TRequest
ùù 
,
ùù 
TState
ùù $
>
ùù$ %
function
ùù& .
,
ûû
 
string
ûû 
name
ûû 
=
ûû 
null
ûû 
,
üü
 
uint
üü 
priority
üü 
=
üü 
$num
üü 
)
üü 
where
†† 
TRequest
†† 
:
†† 
class
†† "
{
°° 	
var
¢¢ 
initialTransition
¢¢ !
=
¢¢" #$
StateTransitionFactory
¢¢$ :
<
¢¢: ;
T
¢¢; <
,
¢¢< =
TState
¢¢> D
,
¢¢D E
TTrigger
¢¢F N
>
¢¢N O
.
¢¢O P 
GetStateTransition
¢¢P b
(
¢¢b c
_stateMachine
¢¢c p
,
££ 
State
££ 
,
§§ 
function
§§ 
,
•• 
State
•• 
,
¶¶ 
name
¶¶ 
,
ßß 
priority
ßß 
)
ßß 
;
ßß 
AddAutoTransition
®® 
(
®® 
trigger
®® %
,
®®% &
initialTransition
®®' 8
)
®®8 9
;
®®9 :
return
™™ 
this
™™ 
;
™™ 
}
´´ 	
public
≠≠ &
IStateConfigurationAsync
≠≠ '
<
≠≠' (
T
≠≠( )
,
≠≠) *
TState
≠≠+ 1
,
≠≠1 2
TTrigger
≠≠3 ;
>
≠≠; <'
AddAutoFallbackTransition
≠≠= V
(
≠≠V W
TTrigger
≠≠W _
trigger
≠≠` g
,
ÆÆ
 
TState
ÆÆ 
	tempState
ÆÆ 
,
ØØ
 
Func
ØØ 
<
ØØ 
T
ØØ 
,
ØØ 
CancellationToken
ØØ %
,
ØØ% &
Task
ØØ' +
<
ØØ+ ,
bool
ØØ, 0
>
ØØ0 1
>
ØØ1 2
	condition
ØØ3 <
,
∞∞
 
string
∞∞ 
name
∞∞ 
=
∞∞ 
null
∞∞ 
,
±±
 
uint
±± 
priority
±± 
=
±± 
$num
±± 
)
±± 
{
≤≤ 	
if
≥≥ 
(
≥≥ 
	condition
≥≥ 
==
≥≥ 
null
≥≥ !
)
≥≥! "
{
¥¥ 
throw
¥¥ 
new
¥¥ #
ArgumentNullException
¥¥ -
(
¥¥- .
nameof
¥¥. 4
(
¥¥4 5
	condition
¥¥5 >
)
¥¥> ?
)
¥¥? @
;
¥¥@ A
}
¥¥B C
var
∂∂ 
initialTransition
∂∂ !
=
∂∂" #$
StateTransitionFactory
∂∂$ :
<
∂∂: ;
T
∂∂; <
,
∂∂< =
TState
∂∂> D
,
∂∂D E
TTrigger
∂∂F N
>
∂∂N O
.
∂∂O P 
GetStateTransition
∂∂P b
(
∂∂b c
_stateMachine
∂∂c p
,
∑∑ 
	tempState
∑∑ 
,
∏∏ 
	condition
∏∏ 
,
ππ 
name
ππ 
,
∫∫ 
priority
∫∫ 
)
∫∫ 
;
∫∫ 
AddTransition
ªª 
(
ªª 
trigger
ªª !
,
ªª! "
initialTransition
ªª# 4
)
ªª4 5
;
ªª5 6
var
ΩΩ "
otherStateTransition
ΩΩ $
=
ΩΩ% &$
StateTransitionFactory
ΩΩ' =
<
ΩΩ= >
T
ΩΩ> ?
,
ΩΩ? @
TState
ΩΩA G
,
ΩΩG H
TTrigger
ΩΩI Q
>
ΩΩQ R
.
ΩΩR S 
GetStateTransition
ΩΩS e
(
ΩΩe f
_stateMachine
ΩΩf s
,
ææ 
State
ææ 
,
øø 
	tempState
øø 
,
¿¿ 
	condition
¿¿ 
,
¡¡ 
State
¡¡ 
,
¬¬ 
name
¬¬ 
,
√√ 
priority
√√ 
)
√√ 
;
√√ )
AddOtherStateAutoTransition
ƒƒ '
(
ƒƒ' (
	tempState
ƒƒ( 1
,
ƒƒ1 2
trigger
ƒƒ3 :
,
ƒƒ: ;"
otherStateTransition
ƒƒ< P
)
ƒƒP Q
;
ƒƒQ R
return
∆∆ 
this
∆∆ 
;
∆∆ 
}
«« 	
public
…… &
IStateConfigurationAsync
…… '
<
……' (
T
……( )
,
……) *
TState
……+ 1
,
……1 2
TTrigger
……3 ;
>
……; <'
AddAutoFallbackTransition
……= V
<
……V W
TRequest
……W _
>
……_ `
(
……` a
TTrigger
……a i
trigger
……j q
,
  
 
TState
   
	tempState
   
,
ÀÀ
 
Func
ÀÀ 
<
ÀÀ 
T
ÀÀ 
,
ÀÀ 
TRequest
ÀÀ 
,
ÀÀ 
CancellationToken
ÀÀ /
,
ÀÀ/ 0
Task
ÀÀ1 5
<
ÀÀ5 6
bool
ÀÀ6 :
>
ÀÀ: ;
>
ÀÀ; <
	condition
ÀÀ= F
,
ÃÃ
 
string
ÃÃ 
name
ÃÃ 
=
ÃÃ 
null
ÃÃ 
,
ÕÕ
 
uint
ÕÕ 
priority
ÕÕ 
=
ÕÕ 
$num
ÕÕ 
)
ÕÕ 
where
ŒŒ 
TRequest
ŒŒ 
:
ŒŒ 
class
ŒŒ "
{
œœ 	
if
–– 
(
–– 
	condition
–– 
==
–– 
null
–– !
)
––! "
{
—— 
throw
—— 
new
—— #
ArgumentNullException
—— -
(
——- .
nameof
——. 4
(
——4 5
	condition
——5 >
)
——> ?
)
——? @
;
——@ A
}
——B C
var
”” 
initialTransition
”” !
=
””" #$
StateTransitionFactory
””$ :
<
””: ;
T
””; <
,
””< =
TState
””> D
,
””D E
TTrigger
””F N
>
””N O
.
””O P 
GetStateTransition
””P b
(
””b c
_stateMachine
””c p
,
‘‘ 
	tempState
‘‘ 
,
’’ 
	condition
’’ 
,
÷÷ 
name
÷÷ 
,
◊◊ 
priority
◊◊ 
)
◊◊ 
;
◊◊ 
AddTransition
ÿÿ 
(
ÿÿ 
trigger
ÿÿ !
,
ÿÿ! "
initialTransition
ÿÿ# 4
)
ÿÿ4 5
;
ÿÿ5 6
var
⁄⁄ "
otherStateTransition
⁄⁄ $
=
⁄⁄% &$
StateTransitionFactory
⁄⁄' =
<
⁄⁄= >
T
⁄⁄> ?
,
⁄⁄? @
TState
⁄⁄A G
,
⁄⁄G H
TTrigger
⁄⁄I Q
>
⁄⁄Q R
.
⁄⁄R S 
GetStateTransition
⁄⁄S e
(
⁄⁄e f
_stateMachine
⁄⁄f s
,
€€ 
State
€€ 
,
‹‹ 
	tempState
‹‹ 
,
›› 
	condition
›› 
,
ﬁﬁ 
State
ﬁﬁ 
,
ﬂﬂ 
name
ﬂﬂ 
,
‡‡ 
priority
‡‡ 
)
‡‡ 
;
‡‡ )
AddOtherStateAutoTransition
·· '
(
··' (
	tempState
··( 1
,
··1 2
trigger
··3 :
,
··: ;"
otherStateTransition
··< P
)
··P Q
;
··Q R
return
„„ 
this
„„ 
;
„„ 
}
‰‰ 	
public
ÏÏ &
IStateConfigurationAsync
ÏÏ '
<
ÏÏ' (
T
ÏÏ( )
,
ÏÏ) *
TState
ÏÏ+ 1
,
ÏÏ1 2
TTrigger
ÏÏ3 ;
>
ÏÏ; <
AddReentryAction
ÏÏ= M
(
ÏÏM N
Func
ÏÏN R
<
ÏÏR S
T
ÏÏS T
,
ÏÏT U
CancellationToken
ÏÏV g
,
ÏÏg h
Task
ÏÏi m
>
ÏÏm n
action
ÏÏo u
)
ÏÏu v
{
ÌÌ 	
if
ÓÓ 
(
ÓÓ 
_reentryAction
ÓÓ 
!=
ÓÓ !
null
ÓÓ" &
)
ÓÓ& '
{
ÔÔ 
throw
ÔÔ 
new
ÔÔ '
InvalidOperationException
ÔÔ 1
(
ÔÔ1 2
$str
ÔÔ2 Y
)
ÔÔY Z
;
ÔÔZ [
}
ÔÔ\ ]
_reentryAction
ÒÒ 
=
ÒÒ 
action
ÒÒ #
??
ÒÒ$ &
throw
ÒÒ' ,
new
ÒÒ- 0#
ArgumentNullException
ÒÒ1 F
(
ÒÒF G
nameof
ÒÒG M
(
ÒÒM N
action
ÒÒN T
)
ÒÒT U
)
ÒÒU V
;
ÒÒV W
return
ÛÛ 
this
ÛÛ 
;
ÛÛ 
}
ÙÙ 	
public
ˆˆ 
void
ˆˆ 
AddSuperState
ˆˆ !
(
ˆˆ! ".
 IStateConfigurationAsyncInternal
ˆˆ" B
<
ˆˆB C
T
ˆˆC D
,
ˆˆD E
TState
ˆˆF L
,
ˆˆL M
TTrigger
ˆˆN V
>
ˆˆV W%
superStateConfiguration
ˆˆX o
)
ˆˆo p
{
˜˜ 	
if
¯¯ 
(
¯¯ 
	IsInState
¯¯ 
(
¯¯ %
superStateConfiguration
¯¯ 1
.
¯¯1 2
State
¯¯2 7
)
¯¯7 8
)
¯¯8 9
{
˘˘ 
throw
˘˘ 
new
˘˘ )
ArgumentOutOfRangeException
˘˘ 3
(
˘˘3 4
$"
˘˘4 6
{
˘˘6 7
State
˘˘7 <
}
˘˘< =)
 is already a sub-state of 
˘˘= X
{
˘˘X Y%
superStateConfiguration
˘˘Y p
.
˘˘p q
State
˘˘q v
}
˘˘v w
.
˘˘w x
"
˘˘x y
)
˘˘y z
;
˘˘z {
}
˘˘| }
if
˚˚ 
(
˚˚ %
superStateConfiguration
˚˚ '
.
˚˚' (
	IsInState
˚˚( 1
(
˚˚1 2
State
˚˚2 7
)
˚˚7 8
)
˚˚8 9
{
¸¸ 
throw
¸¸ 
new
¸¸ )
ArgumentOutOfRangeException
¸¸ 3
(
¸¸3 4
$"
¸¸4 6
{
¸¸6 7%
superStateConfiguration
¸¸7 N
.
¸¸N O
State
¸¸O T
}
¸¸T U)
 is already a sub-state of 
¸¸U p
{
¸¸p q
State
¸¸q v
}
¸¸v w
.
¸¸w x
"
¸¸x y
)
¸¸y z
;
¸¸z {
}
¸¸| }
_superState
˛˛ 
=
˛˛ %
superStateConfiguration
˛˛ 1
;
˛˛1 2
}
ˇˇ 	
public
ää &
IStateConfigurationAsync
ää '
<
ää' (
T
ää( )
,
ää) *
TState
ää+ 1
,
ää1 2
TTrigger
ää3 ;
>
ää; <
AddTransition
ää= J
(
ääJ K
TTrigger
ääK S
trigger
ääT [
,
ãã 
TState
ãã 
toState
ãã 
,
åå 
Func
åå 
<
åå 
T
åå 
,
åå 
CancellationToken
åå '
,
åå' (
Task
åå) -
<
åå- .
bool
åå. 2
>
åå2 3
>
åå3 4
conditionAsync
åå5 C
=
ååD E
null
ååF J
,
çç 
string
çç 
name
çç 
=
çç 
null
çç  
,
éé 
uint
éé 
priority
éé 
=
éé 
$num
éé 
)
éé  
{
èè 	
if
êê 
(
êê 
conditionAsync
êê 
==
êê !
null
êê" &
)
êê& '
{
ëë 
conditionAsync
ëë 
=
ëë 
(
ëë  
_
ëë  !
,
ëë! "
ct
ëë# %
)
ëë% &
=>
ëë' )
Task
ëë* .
.
ëë. /

FromResult
ëë/ 9
(
ëë9 :
result
ëë: @
:
ëë@ A
true
ëëB F
)
ëëF G
;
ëëG H
}
ëëI J
var
ìì 

transition
ìì 
=
ìì $
StateTransitionFactory
ìì 3
<
ìì3 4
T
ìì4 5
,
ìì5 6
TState
ìì7 =
,
ìì= >
TTrigger
ìì? G
>
ììG H
.
ììH I 
GetStateTransition
ììI [
(
ìì[ \
_stateMachine
ìì\ i
,
îî 
toState
îî 
,
ïï 
conditionAsync
ïï  
,
ññ 
name
ññ 
,
óó 
priority
óó 
)
óó 
;
óó 
AddTransition
òò 
(
òò 
trigger
òò !
,
òò! "

transition
òò# -
)
òò- .
;
òò. /
return
öö 
this
öö 
;
öö 
}
õõ 	
public
ßß &
IStateConfigurationAsync
ßß '
<
ßß' (
T
ßß( )
,
ßß) *
TState
ßß+ 1
,
ßß1 2
TTrigger
ßß3 ;
>
ßß; <
AddTransition
ßß= J
<
ßßJ K
TRequest
ßßK S
>
ßßS T
(
ßßT U
TTrigger
ßßU ]
trigger
ßß^ e
,
®® 
TState
®® 
toState
®® 
,
©© 
Func
©© 
<
©© 
T
©© 
,
©© 
TRequest
©© 
,
©© 
CancellationToken
©©  1
,
©©1 2
Task
©©3 7
<
©©7 8
bool
©©8 <
>
©©< =
>
©©= >
conditionAsync
©©? M
,
™™ 
string
™™ 
name
™™ 
=
™™ 
null
™™  
,
´´ 
uint
´´ 
priority
´´ 
=
´´ 
$num
´´ 
)
´´  
where
¨¨ 
TRequest
¨¨ 
:
¨¨ 
class
¨¨ "
{
≠≠ 	
if
ÆÆ 
(
ÆÆ 
conditionAsync
ÆÆ 
==
ÆÆ !
null
ÆÆ" &
)
ÆÆ& '
{
ØØ 
throw
ØØ 
new
ØØ #
ArgumentNullException
ØØ -
(
ØØ- .
nameof
ØØ. 4
(
ØØ4 5
conditionAsync
ØØ5 C
)
ØØC D
)
ØØD E
;
ØØE F
}
ØØG H
var
±± 

transition
±± 
=
±± $
StateTransitionFactory
±± 3
<
±±3 4
T
±±4 5
,
±±5 6
TState
±±7 =
,
±±= >
TTrigger
±±? G
>
±±G H
.
±±H I 
GetStateTransition
±±I [
(
±±[ \
_stateMachine
±±\ i
,
≤≤ 
State
≤≤ 
,
≥≥ 
toState
≥≥ 
,
¥¥ 
conditionAsync
¥¥  
,
µµ 
State
µµ 
,
∂∂ 
name
∂∂ 
,
∑∑ 
priority
∑∑ 
)
∑∑ 
;
∑∑ 
AddTransition
∏∏ 
(
∏∏ 
trigger
∏∏ !
,
∏∏! "

transition
∏∏# -
)
∏∏- .
;
∏∏. /
return
∫∫ 
this
∫∫ 
;
∫∫ 
}
ªª 	
public
√√ &
IStateConfigurationAsync
√√ '
<
√√' (
T
√√( )
,
√√) *
TState
√√+ 1
,
√√1 2
TTrigger
√√3 ;
>
√√; <
AddTriggerAction
√√= M
(
√√M N
TTrigger
√√N V
trigger
√√W ^
,
√√^ _
Func
√√` d
<
√√d e
T
√√e f
,
√√f g
CancellationToken
√√h y
,
√√y z
Task
√√{ 
>√√ Ä
action√√Å á
)√√á à
{
ƒƒ 	
if
≈≈ 
(
≈≈ 
_triggerActions
≈≈ 
.
≈≈  
ContainsKey
≈≈  +
(
≈≈+ ,
trigger
≈≈, 3
)
≈≈3 4
)
≈≈4 5
{
∆∆ 
throw
∆∆ 
new
∆∆ '
InvalidOperationException
∆∆ 1
(
∆∆1 2
$"
∆∆2 4-
Only one action is allowed for 
∆∆4 S
{
∆∆S T
trigger
∆∆T [
}
∆∆[ \
	 trigger.
∆∆\ e
"
∆∆e f
)
∆∆f g
;
∆∆g h
}
∆∆i j
_triggerActions
»» 
.
»» 
Add
»» 
(
»»  
trigger
»»  '
,
»»' ("
TriggerActionFactory
»») =
<
»»= >
T
»»> ?
,
»»? @
TTrigger
»»A I
>
»»I J
.
»»J K
GetTriggerAction
»»K [
(
»»[ \
action
»»\ b
)
»»b c
)
»»c d
;
»»d e
return
   
this
   
;
   
}
ÀÀ 	
public
‘‘ &
IStateConfigurationAsync
‘‘ '
<
‘‘' (
T
‘‘( )
,
‘‘) *
TState
‘‘+ 1
,
‘‘1 2
TTrigger
‘‘3 ;
>
‘‘; <
AddTriggerAction
‘‘= M
<
‘‘M N
TRequest
‘‘N V
>
‘‘V W
(
‘‘W X
TTrigger
‘‘X `
trigger
‘‘a h
,
’’
 
Func
’’ 
<
’’ 
T
’’ 
,
’’ 
TRequest
’’ 
,
’’ 
CancellationToken
’’ /
,
’’/ 0
Task
’’1 5
>
’’5 6
action
’’7 =
)
’’= >
{
÷÷ 	
if
◊◊ 
(
◊◊ 
_triggerActions
◊◊ 
.
◊◊  
ContainsKey
◊◊  +
(
◊◊+ ,
trigger
◊◊, 3
)
◊◊3 4
)
◊◊4 5
{
ÿÿ 
throw
ÿÿ 
new
ÿÿ '
InvalidOperationException
ÿÿ 1
(
ÿÿ1 2
$"
ÿÿ2 4-
Only one action is allowed for 
ÿÿ4 S
{
ÿÿS T
trigger
ÿÿT [
}
ÿÿ[ \
	 trigger.
ÿÿ\ e
"
ÿÿe f
)
ÿÿf g
;
ÿÿg h
}
ÿÿi j
_triggerActions
⁄⁄ 
.
⁄⁄ 
Add
⁄⁄ 
(
⁄⁄  
trigger
⁄⁄  '
,
⁄⁄' ("
TriggerActionFactory
⁄⁄) =
<
⁄⁄= >
T
⁄⁄> ?
,
⁄⁄? @
TTrigger
⁄⁄A I
>
⁄⁄I J
.
⁄⁄J K
GetTriggerAction
⁄⁄K [
(
⁄⁄[ \
action
⁄⁄\ b
)
⁄⁄b c
)
⁄⁄c d
;
⁄⁄d e
return
‹‹ 
this
‹‹ 
;
‹‹ 
}
›› 	
public
ﬂﬂ 
async
ﬂﬂ 
Task
ﬂﬂ 
<
ﬂﬂ #
StateTransitionResult
ﬂﬂ /
<
ﬂﬂ/ 0
TState
ﬂﬂ0 6
,
ﬂﬂ6 7
TTrigger
ﬂﬂ8 @
>
ﬂﬂ@ A
>
ﬂﬂA B(
ExecuteAutoTransitionAsync
ﬂﬂC ]
(
ﬂﬂ] ^!
ExecutionParameters
ﬂﬂ^ q
<
ﬂﬂq r
T
ﬂﬂr s
,
ﬂﬂs t
TTrigger
ﬂﬂu }
>
ﬂﬂ} ~

parametersﬂﬂ â
,
‡‡ #
StateTransitionResult
‡‡ #
<
‡‡# $
TState
‡‡$ *
,
‡‡* +
TTrigger
‡‡, 4
>
‡‡4 5
currentResult
‡‡6 C
)
‡‡C D
{
·· 	
if
‚‚ 
(
‚‚ 
AutoTransitions
‚‚ 
.
‚‚  
TryGetValue
‚‚  +
(
‚‚+ ,

parameters
‚‚, 6
.
‚‚6 7
Trigger
‚‚7 >
,
‚‚> ?
out
‚‚@ C
var
‚‚D G 
triggerTransitions
‚‚H Z
)
‚‚Z [
)
‚‚[ \
{
„„ 
foreach
‰‰ 
(
‰‰ 
var
‰‰ 

transition
‰‰ '
in
‰‰( * 
triggerTransitions
‰‰+ =
.
‰‰= >
OrderBy
‰‰> E
(
‰‰E F
t
‰‰F G
=>
‰‰H J
t
‰‰K L
.
‰‰L M
Priority
‰‰M U
)
‰‰U V
)
‰‰V W
{
ÂÂ 
var
ÊÊ 
localResult
ÊÊ #
=
ÊÊ$ %
await
ÊÊ& +

transition
ÊÊ, 6
.
ÊÊ6 7
ExecuteAsync
ÊÊ7 C
(
ÊÊC D

parameters
ÊÊD N
,
ÊÊN O
currentResult
ÊÊP ]
)
ÊÊ] ^
.
ÁÁ 
ConfigureAwait
ÁÁ &
(
ÁÁ& ''
continueOnCapturedContext
ÁÁ' @
:
ÁÁ@ A
false
ÁÁB G
)
ÁÁG H
;
ÁÁH I
if
ÈÈ 
(
ÈÈ 
localResult
ÈÈ #
.
ÈÈ# $
WasTransitioned
ÈÈ$ 3
)
ÈÈ3 4
{
ÍÍ 
return
ÍÍ 
localResult
ÍÍ (
;
ÍÍ( )
}
ÍÍ* +
}
ÎÎ 
}
ÏÏ 
return
ÔÔ 
_superState
ÔÔ 
!=
ÔÔ !
null
ÔÔ" &
?
 
await
 
_superState
 #
.
# $(
ExecuteAutoTransitionAsync
$ >
(
> ?

parameters
? I
,
I J
currentResult
K X
)
X Y
.
Y Z
ConfigureAwait
Z h
(
h i(
continueOnCapturedContexti Ç
:Ç É
falseÑ â
)â ä
:
ÒÒ 
new
ÒÒ #
StateTransitionResult
ÒÒ +
<
ÒÒ+ ,
TState
ÒÒ, 2
,
ÒÒ2 3
TTrigger
ÒÒ4 <
>
ÒÒ< =
(
ÒÒ= >

parameters
ÒÒ> H
.
ÒÒH I
Trigger
ÒÒI P
,
ÚÚ 
currentResult
ÚÚ #
.
ÚÚ# $
StartingState
ÚÚ$ 1
,
ÛÛ 
currentResult
ÛÛ #
.
ÛÛ# $
PreviousState
ÛÛ$ 1
,
ÙÙ 
currentResult
ÙÙ #
.
ÙÙ# $
CurrentState
ÙÙ$ 0
,
ıı 
currentResult
ıı #
.
ıı# $ 
LastTransitionName
ıı$ 6
,
ˆˆ 
transitionDefined
ˆˆ '
:
ˆˆ' (
true
ˆˆ) -
,
˜˜ 
wasCancelled
˜˜ "
:
˜˜" #

parameters
˜˜$ .
.
˜˜. /
CancellationToken
˜˜/ @
.
˜˜@ A%
IsCancellationRequested
˜˜A X
,
¯¯ 
conditionMet
¯¯ "
:
¯¯" #
false
¯¯$ )
)
¯¯) *
;
¯¯* +
}
˘˘ 	
public
˚˚ 
async
˚˚ 
Task
˚˚ %
ExecuteEntryActionAsync
˚˚ 1
(
˚˚1 2!
ExecutionParameters
˚˚2 E
<
˚˚E F
T
˚˚F G
,
˚˚G H
TTrigger
˚˚I Q
>
˚˚Q R

parameters
˚˚S ]
,
˚˚] ^#
StateTransitionResult
˚˚_ t
<
˚˚t u
TState
˚˚u {
,
˚˚{ |
TTrigger˚˚} Ö
>˚˚Ö Ü
currentResult˚˚á î
)˚˚î ï
{
¸¸ 	
if
˛˛ 
(
˛˛ (
_previousStateEntryActions
˛˛ *
.
˛˛* +
TryGetValue
˛˛+ 6
(
˛˛6 7
currentResult
˛˛7 D
.
˛˛D E
PreviousState
˛˛E R
,
˛˛R S
out
˛˛T W
var
˛˛X [
action
˛˛\ b
)
˛˛b c
)
˛˛c d
{
ˇˇ 
if
ÄÄ 
(
ÄÄ 

parameters
ÄÄ 
.
ÄÄ 
CancellationToken
ÄÄ 0
.
ÄÄ0 1%
IsCancellationRequested
ÄÄ1 H
)
ÄÄH I
{
ÅÅ 
return
ÅÅ 
;
ÅÅ 
}
ÅÅ 
await
ÉÉ 
action
ÉÉ 
.
ÉÉ 
Invoke
ÉÉ #
(
ÉÉ# $

parameters
ÉÉ$ .
.
ÉÉ. /
Context
ÉÉ/ 6
,
ÉÉ6 7

parameters
ÉÉ8 B
.
ÉÉB C
CancellationToken
ÉÉC T
)
ÉÉT U
.
ÉÉU V
ConfigureAwait
ÉÉV d
(
ÉÉd e'
continueOnCapturedContext
ÉÉe ~
:
ÉÉ~ 
falseÉÉÄ Ö
)ÉÉÖ Ü
;ÉÉÜ á
}
ÑÑ 
if
áá 
(
áá !
_defaultEntryAction
áá #
!=
áá$ &
null
áá' +
)
áá+ ,
{
àà 
if
ââ 
(
ââ 

parameters
ââ 
.
ââ 
CancellationToken
ââ 0
.
ââ0 1%
IsCancellationRequested
ââ1 H
)
ââH I
{
ää 
return
ää 
;
ää 
}
ää 
if
åå 
(
åå !
_defaultEntryAction
åå '
!=
åå( *
null
åå+ /
)
åå/ 0
{
çç 
await
çç !
_defaultEntryAction
çç +
.
çç+ ,
Invoke
çç, 2
(
çç2 3

parameters
çç3 =
.
çç= >
Context
çç> E
,
ççE F

parameters
ççG Q
.
ççQ R
CancellationToken
ççR c
)
ççc d
.
ççd e
ConfigureAwait
ççe s
(
ççs t(
continueOnCapturedContextççt ç
:ççç é
falseççè î
)ççî ï
;ççï ñ
}ççó ò
}
éé 
}
èè 	
public
ëë 
async
ëë 
Task
ëë '
ExecuteReentryActionAsync
ëë 3
(
ëë3 4!
ExecutionParameters
ëë4 G
<
ëëG H
T
ëëH I
,
ëëI J
TTrigger
ëëK S
>
ëëS T

parameters
ëëU _
,
ëë_ `#
StateTransitionResult
ëëa v
<
ëëv w
TState
ëëw }
,
ëë} ~
TTriggerëë á
>ëëá à
currentResultëëâ ñ
)ëëñ ó
{
íí 	
if
ìì 
(
ìì 
_superState
ìì 
!=
ìì 
null
ìì #
)
ìì# $
{
îî 
await
ïï 
_superState
ïï !
.
ïï! "'
ExecuteReentryActionAsync
ïï" ;
(
ïï; <

parameters
ïï< F
,
ïïF G
currentResult
ïïH U
)
ïïU V
.
ññ 
ConfigureAwait
ññ #
(
ññ# $'
continueOnCapturedContext
ññ$ =
:
ññ= >
false
ññ? D
)
ññD E
;
ññE F
}
óó 
if
ôô 
(
ôô 
_reentryAction
ôô 
!=
ôô !
null
ôô" &
&&
ôô' )
!
ôô* +

parameters
ôô+ 5
.
ôô5 6
CancellationToken
ôô6 G
.
ôôG H%
IsCancellationRequested
ôôH _
)
ôô_ `
{
öö 
await
õõ 
_reentryAction
õõ $
.
õõ$ %
Invoke
õõ% +
(
õõ+ ,

parameters
õõ, 6
.
õõ6 7
Context
õõ7 >
,
õõ> ?

parameters
õõ@ J
.
õõJ K
CancellationToken
õõK \
)
õõ\ ]
.
úú 
ConfigureAwait
úú #
(
úú# $'
continueOnCapturedContext
úú$ =
:
úú= >
false
úú? D
)
úúD E
;
úúE F
}
ùù 
}
ûû 	
public
†† 
async
†† 
Task
†† $
ExecuteExitActionAsync
†† 0
(
††0 1!
ExecutionParameters
††1 D
<
††D E
T
††E F
,
††F G
TTrigger
††H P
>
††P Q

parameters
††R \
,
°° #
StateTransitionResult
°° #
<
°°# $
TState
°°$ *
,
°°* +
TTrigger
°°, 4
>
°°4 5
currentResult
°°6 C
)
°°C D
{
¢¢ 	
if
§§ 
(
§§ #
_nextStateExitActions
§§ %
.
§§% &
TryGetValue
§§& 1
(
§§1 2
currentResult
§§2 ?
.
§§? @
CurrentState
§§@ L
,
§§L M
out
§§N Q
var
§§R U
action
§§V \
)
§§\ ]
)
§§] ^
{
•• 
if
¶¶ 
(
¶¶ 

parameters
¶¶ 
.
¶¶ 
CancellationToken
¶¶ 0
.
¶¶0 1%
IsCancellationRequested
¶¶1 H
)
¶¶H I
{
ßß 
return
ßß 
;
ßß 
}
ßß 
await
©© 
action
©© 
.
©© 
Invoke
©© #
(
©©# $

parameters
©©$ .
.
©©. /
Context
©©/ 6
,
©©6 7

parameters
©©8 B
.
©©B C
CancellationToken
©©C T
)
©©T U
.
™™ 
ConfigureAwait
™™ "
(
™™" #'
continueOnCapturedContext
™™# <
:
™™< =
false
™™> C
)
™™C D
;
™™D E
}
´´ 
if
ÆÆ 
(
ÆÆ  
_defaultExitAction
ÆÆ "
!=
ÆÆ# %
null
ÆÆ& *
)
ÆÆ* +
{
ØØ 
if
∞∞ 
(
∞∞ 

parameters
∞∞ 
.
∞∞ 
CancellationToken
∞∞ 0
.
∞∞0 1%
IsCancellationRequested
∞∞1 H
)
∞∞H I
{
±± 
return
±± 
;
±± 
}
±± 
if
≥≥ 
(
≥≥  
_defaultExitAction
≥≥ &
!=
≥≥' )
null
≥≥* .
)
≥≥. /
{
¥¥ 
await
µµ  
_defaultExitAction
µµ ,
.
µµ, -
Invoke
µµ- 3
(
µµ3 4

parameters
µµ4 >
.
µµ> ?
Context
µµ? F
,
µµF G

parameters
µµH R
.
µµR S
CancellationToken
µµS d
)
µµd e
.
∂∂ 
ConfigureAwait
∂∂ '
(
∂∂' ('
continueOnCapturedContext
∂∂( A
:
∂∂A B
false
∂∂C H
)
∂∂H I
;
∂∂I J
}
∑∑ 
}
∏∏ 
}
ππ 	
public
ªª 
async
ªª 
Task
ªª 
<
ªª #
StateTransitionResult
ªª /
<
ªª/ 0
TState
ªª0 6
,
ªª6 7
TTrigger
ªª8 @
>
ªª@ A
>
ªªA B
FireTriggerAsync
ªªC S
(
ªªS T!
ExecutionParameters
ªªT g
<
ªªg h
T
ªªh i
,
ªªi j
TTrigger
ªªk s
>
ªªs t

parameters
ªªu 
)ªª Ä
{
ºº 	
if
ΩΩ 
(
ΩΩ 
_triggerActions
ΩΩ 
.
ΩΩ  
TryGetValue
ΩΩ  +
(
ΩΩ+ ,

parameters
ΩΩ, 6
.
ΩΩ6 7
Trigger
ΩΩ7 >
,
ΩΩ> ?
out
ΩΩ@ C
var
ΩΩD G
triggerAction
ΩΩH U
)
ΩΩU V
)
ΩΩV W
{
ææ 
await
øø 
triggerAction
øø #
.
øø# $
ExecuteAsync
øø$ 0
(
øø0 1

parameters
øø1 ;
.
øø; <
Context
øø< C
,
øøC D
request
øøE L
:
øøL M
null
øøN R
,
øøR S
cancellationToken
øøT e
:
øøe f

parameters
øøg q
.
øøq r 
CancellationTokenøør É
)øøÉ Ñ
.
¿¿ 
ConfigureAwait
¿¿ #
(
¿¿# $'
continueOnCapturedContext
¿¿$ =
:
¿¿= >
false
¿¿? D
)
¿¿D E
;
¿¿E F
}
¡¡ 
var
√√ 
result
√√ 
=
√√ 
await
√√ "
FireTriggerPrimAsync
√√ 3
(
√√3 4

parameters
√√4 >
)
√√> ?
.
√√? @
ConfigureAwait
√√@ N
(
√√N O'
continueOnCapturedContext
√√O h
:
√√h i
false
√√j o
)
√√o p
;
√√p q
if
≈≈ 
(
≈≈ 
!
≈≈ 
(
≈≈ 
result
≈≈ 
?
≈≈ 
.
≈≈ 
WasTransitioned
≈≈ )
??
≈≈* ,
false
≈≈- 2
)
≈≈2 3
&&
≈≈4 6
_superState
≈≈7 B
!=
≈≈C E
null
≈≈F J
)
≈≈J K
{
∆∆ 
result
«« 
=
«« 
await
«« 
_superState
«« *
.
««* +
FireTriggerAsync
««+ ;
(
««; <

parameters
««< F
)
««F G
.
««G H
ConfigureAwait
««H V
(
««V W'
continueOnCapturedContext
««W p
:
««p q
false
««r w
)
««w x
;
««x y
}
»» 
else
…… 
{
   
var
ÀÀ 

startState
ÀÀ 
=
ÀÀ  
StateAccessor
ÀÀ! .
(
ÀÀ. /

parameters
ÀÀ/ 9
.
ÀÀ9 :
Context
ÀÀ: A
)
ÀÀA B
;
ÀÀB C
result
ÃÃ 
=
ÃÃ 
result
ÃÃ 
??
ÃÃ  "
new
ÃÃ# &#
StateTransitionResult
ÃÃ' <
<
ÃÃ< =
TState
ÃÃ= C
,
ÃÃC D
TTrigger
ÃÃE M
>
ÃÃM N
(
ÃÃN O

parameters
ÃÃO Y
.
ÃÃY Z
Trigger
ÃÃZ a
,
ÕÕ 

startState
ÕÕ  
,
ŒŒ 

startState
ŒŒ  
,
œœ 

startState
œœ  
,
––  
lastTransitionName
–– (
:
––( )
string
––* 0
.
––0 1
Empty
––1 6
,
—— 
transitionDefined
—— '
:
——' (
false
——) .
)
——. /
;
——/ 0
}
““ 
return
‘‘ 
result
‘‘ 
;
‘‘ 
}
’’ 	
private
◊◊ 
async
◊◊ 
Task
◊◊ 
<
◊◊ #
StateTransitionResult
◊◊ 0
<
◊◊0 1
TState
◊◊1 7
,
◊◊7 8
TTrigger
◊◊9 A
>
◊◊A B
>
◊◊B C"
FireTriggerPrimAsync
◊◊D X
(
◊◊X Y!
ExecutionParameters
◊◊Y l
<
◊◊l m
T
◊◊m n
,
◊◊n o
TTrigger
◊◊p x
>
◊◊x y

parameters◊◊z Ñ
)◊◊Ñ Ö
{
ÿÿ 	#
StateTransitionResult
ŸŸ !
<
ŸŸ! "
TState
ŸŸ" (
,
ŸŸ( )
TTrigger
ŸŸ* 2
>
ŸŸ2 3
result
ŸŸ4 :
=
ŸŸ; <
null
ŸŸ= A
;
ŸŸA B
if
€€ 
(
€€ 
Transitions
€€ 
.
€€ 
TryGetValue
€€ '
(
€€' (

parameters
€€( 2
.
€€2 3
Trigger
€€3 :
,
€€: ;
out
€€< ?
var
€€@ C
transitions
€€D O
)
€€O P
)
€€P Q
{
‹‹ 
foreach
›› 
(
›› 
var
›› 

transition
›› '
in
››( *
transitions
››+ 6
.
››6 7
OrderBy
››7 >
(
››> ?
t
››? @
=>
››A C
t
››D E
.
››E F
Priority
››F N
)
››N O
)
››O P
{
ﬁﬁ 
result
ﬂﬂ 
=
ﬂﬂ 
await
ﬂﬂ "

transition
ﬂﬂ# -
.
ﬂﬂ- .
ExecuteAsync
ﬂﬂ. :
(
ﬂﬂ: ;

parameters
ﬂﬂ; E
)
ﬂﬂE F
.
ﬂﬂF G
ConfigureAwait
ﬂﬂG U
(
ﬂﬂU V'
continueOnCapturedContext
ﬂﬂV o
:
ﬂﬂo p
false
ﬂﬂq v
)
ﬂﬂv w
;
ﬂﬂw x
if
‡‡ 
(
‡‡ 
result
‡‡ 
.
‡‡ 
WasTransitioned
‡‡ .
)
‡‡. /
{
·· 
return
·· 
result
·· #
;
··# $
}
··% &
}
‚‚ 
}
„„ 
return
ÂÂ 
result
ÂÂ 
;
ÂÂ 
}
ÊÊ 	
public
ËË 
bool
ËË 
	IsInState
ËË 
(
ËË 
TState
ËË $
state
ËË% *
)
ËË* +
{
ÈÈ 	
if
ÍÍ 
(
ÍÍ 
state
ÍÍ 
.
ÍÍ 
	CompareTo
ÍÍ 
(
ÍÍ  
State
ÍÍ  %
)
ÍÍ% &
==
ÍÍ' )
$num
ÍÍ* +
)
ÍÍ+ ,
{
ÎÎ 
return
ÎÎ 
true
ÎÎ 
;
ÎÎ 
}
ÎÎ 
return
ÌÌ 
_superState
ÌÌ 
?
ÌÌ 
.
ÌÌ  
	IsInState
ÌÌ  )
(
ÌÌ) *
state
ÌÌ* /
)
ÌÌ/ 0
??
ÌÌ1 3
false
ÌÌ4 9
;
ÌÌ9 :
}
ÓÓ 	
public
 &
IStateConfigurationAsync
 '
<
' (
T
( )
,
) *
TState
+ 1
,
1 2
TTrigger
3 ;
>
; <
MakeSubStateOf
= K
(
K L&
IStateConfigurationAsync
L d
<
d e
T
e f
,
f g
TState
h n
,
n o
TTrigger
p x
>
x y&
superStateConfigurationz ë
)ë í
{
ÒÒ 	
AddSuperState
ÚÚ 
(
ÚÚ %
superStateConfiguration
ÚÚ 1
as
ÚÚ2 4.
 IStateConfigurationAsyncInternal
ÚÚ5 U
<
ÚÚU V
T
ÚÚV W
,
ÚÚW X
TState
ÚÚY _
,
ÚÚ_ `
TTrigger
ÚÚa i
>
ÚÚi j
)
ÚÚj k
;
ÚÚk l
return
ÙÙ 
this
ÙÙ 
;
ÙÙ 
}
ıı 	
public
˜˜ 
void
˜˜ )
AddOtherStateAutoTransition
˜˜ /
(
˜˜/ 0
TState
˜˜0 6

otherState
˜˜7 A
,
¯¯
 
TTrigger
¯¯ 
trigger
¯¯ 
,
˘˘
 !
StateTransitionBase
˘˘ 
<
˘˘  
T
˘˘  !
,
˘˘! "
TState
˘˘# )
,
˘˘) *
TTrigger
˘˘+ 3
>
˘˘3 4

transition
˘˘5 ?
)
˘˘? @
{
˙˙ 	
var
˚˚ 
otherStateConfig
˚˚  
=
˚˚! ")
GetTargetStateConfiguration
˚˚# >
(
˚˚> ?

otherState
˚˚? I
)
˚˚I J
;
˚˚J K
otherStateConfig
˝˝ 
.
˝˝ 
AddAutoTransition
˝˝ .
(
˝˝. /
trigger
˝˝/ 6
,
˝˝6 7

transition
˝˝8 B
)
˝˝B C
;
˝˝C D
}
˛˛ 	
private
ÄÄ .
 IStateConfigurationAsyncInternal
ÄÄ 0
<
ÄÄ0 1
T
ÄÄ1 2
,
ÄÄ2 3
TState
ÄÄ4 :
,
ÄÄ: ;
TTrigger
ÄÄ< D
>
ÄÄD E)
GetTargetStateConfiguration
ÄÄF a
(
ÄÄa b
TState
ÄÄb h
targetState
ÄÄi t
)
ÄÄt u
{
ÅÅ 	
return
ÇÇ 
_stateMachine
ÇÇ  
.
ÇÇ  !
ConfigureState
ÇÇ! /
(
ÇÇ/ 0
targetState
ÇÇ0 ;
)
ÇÇ; <
as
ÇÇ= ?.
 IStateConfigurationAsyncInternal
ÇÇ@ `
<
ÇÇ` a
T
ÇÇa b
,
ÇÇb c
TState
ÇÇd j
,
ÇÇj k
TTrigger
ÇÇl t
>
ÇÇt u
;
ÇÇu v
}
ÉÉ 	
}
ÑÑ 
}ÖÖ ÅH
XC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateConfigurationBase.cs
	namespace 	
NStateManager
 
{ 
public 

abstract 
class "
StateConfigurationBase 0
<0 1
T1 2
,2 3
TState4 :
,: ;
TTrigger< D
>D E
whereF K
TStateL R
:S T
IComparableU `
{ 
	protected 
internal 

Dictionary %
<% &
TTrigger& .
,. /
List0 4
<4 5
StateTransitionBase5 H
<H I
TI J
,J K
TStateL R
,R S
TTriggerT \
>\ ]
>] ^
>^ _
AutoTransitions` o
=p q
newr u

Dictionary	v Ä
<
Ä Å
TTrigger
Å â
,
â ä
List
ã è
<
è ê!
StateTransitionBase
ê £
<
£ §
T
§ •
,
• ¶
TState
ß ≠
,
≠ Æ
TTrigger
Ø ∑
>
∑ ∏
>
∏ π
>
π ∫
(
∫ ª
)
ª º
;
º Ω
	protected 
internal 

Dictionary %
<% &
TTrigger& .
,. /
List0 4
<4 5
StateTransitionBase5 H
<H I
TI J
,J K
TStateL R
,R S
TTriggerT \
>\ ]
>] ^
>^ _
Transitions` k
=l m
newn q

Dictionaryr |
<| }
TTrigger	} Ö
,
Ö Ü
List
á ã
<
ã å!
StateTransitionBase
å ü
<
ü †
T
† °
,
° ¢
TState
£ ©
,
© ™
TTrigger
´ ≥
>
≥ ¥
>
¥ µ
>
µ ∂
(
∂ ∑
)
∑ ∏
;
∏ π
public 
TState 
State 
{ 
get !
;! "
}# $
public 
Func 
< 
T 
, 
TState 
> 
StateAccessor ,
{- .
get/ 2
;2 3
}4 5
public 
Action 
< 
T 
, 
TState 
>  
StateMutator! -
{. /
get0 3
;3 4
}5 6
	protected$$ "
StateConfigurationBase$$ (
($$( )
TState$$) /
state$$0 5
,$$5 6
Func$$7 ;
<$$; <
T$$< =
,$$= >
TState$$? E
>$$E F
stateAccessor$$G T
,$$T U
Action$$V \
<$$\ ]
T$$] ^
,$$^ _
TState$$` f
>$$f g
stateMutator$$h t
)$$t u
{%% 	
State&& 
=&& 
state&& 
;&& 
StateAccessor'' 
='' 
stateAccessor'' )
??''* ,
throw''- 2
new''3 6!
ArgumentNullException''7 L
(''L M
nameof''M S
(''S T
stateAccessor''T a
)''a b
)''b c
;''c d
StateMutator(( 
=(( 
stateMutator(( '
??((( *
throw((+ 0
new((1 4!
ArgumentNullException((5 J
(((J K
nameof((K Q
(((Q R
stateMutator((R ^
)((^ _
)((_ `
;((` a
})) 	
public00 
void00 
AddAutoTransition00 %
(00% &
TTrigger00& .
trigger00/ 6
,006 7
StateTransitionBase008 K
<00K L
T00L M
,00M N
TState00O U
,00U V
TTrigger00W _
>00_ `

transition00a k
)00k l
{11 	
if22 
(22 
!22 
AutoTransitions22  
.22  !
TryGetValue22! ,
(22, -
trigger22- 4
,224 5
out226 9
var22: =
triggerTransitions22> P
)22P Q
)22Q R
{33 
triggerTransitions44 "
=44# $
new44% (
List44) -
<44- .
StateTransitionBase44. A
<44A B
T44B C
,44C D
TState44E K
,44K L
TTrigger44M U
>44U V
>44V W
(44W X
)44X Y
;44Y Z
AutoTransitions55 
.55  
Add55  #
(55# $
trigger55$ +
,55+ ,
triggerTransitions55- ?
)55? @
;55@ A
}66 
if88 
(88 
triggerTransitions88 "
.88" #
Any88# &
(88& '
t88' (
=>88) +
t88, -
.88- .
Priority88. 6
==887 9

transition88: D
.88D E
Priority88E M
)88M N
)88N O
{99 
throw99 
new99 %
InvalidOperationException99 1
(991 2
$"992 4 
Auto transition for 994 H
{99H I
State99I N
}99N O!
 state with priority 99O d
{99d e

transition99e o
.99o p
Priority99p x
}99x y
 already added.	99y à
"
99à â
)
99â ä
;
99ä ã
}
99å ç
triggerTransitions;; 
.;; 
Add;; "
(;;" #

transition;;# -
);;- .
;;;. /
}<< 	
publicCC 
voidCC 
AddTransitionCC !
(CC! "
TTriggerCC" *
triggerCC+ 2
,CC2 3
StateTransitionBaseCC4 G
<CCG H
TCCH I
,CCI J
TStateCCK Q
,CCQ R
TTriggerCCS [
>CC[ \

transitionCC] g
)CCg h
{DD 	
ifEE 
(EE 
!EE 
TransitionsEE 
.EE 
TryGetValueEE (
(EE( )
triggerEE) 0
,EE0 1
outEE2 5
varEE6 9
existingTransitionsEE: M
)EEM N
)EEN O
{FF 
TransitionsFF 
.FF 
AddFF 
(FF 
triggerFF %
,FF% &
newFF' *
ListFF+ /
<FF/ 0
StateTransitionBaseFF0 C
<FFC D
TFFD E
,FFE F
TStateFFG M
,FFM N
TTriggerFFO W
>FFW X
>FFX Y
{FFZ [

transitionFF[ e
}FFe f
)FFf g
;FFg h
}FFi j
elseGG 
{HH 
ifII 
(II 
existingTransitionsII '
.II' (
AnyII( +
(II+ ,
tII, -
=>II. 0
tII1 2
.II2 3
PriorityII3 ;
==II< >

transitionII? I
.III J
PriorityIIJ R
)IIR S
)IIS T
{JJ 
throwJJ 
newJJ %
InvalidOperationExceptionJJ 5
(JJ5 6
$"JJ6 8
{JJ8 9
triggerJJ9 @
}JJ@ A.
" trigger was previously added for JJA c
{JJc d
StateJJd i
}JJi j
 state as priority JJj }
{JJ} ~

transition	JJ~ à
.
JJà â
Priority
JJâ ë
}
JJë í
.
JJí ì
"
JJì î
)
JJî ï
;
JJï ñ
}
JJó ò
existingTransitionsLL #
.LL# $
AddLL$ '
(LL' (

transitionLL( 2
)LL2 3
;LL3 4
}MM 
}NN 	
	protectedPP !
StateTransitionResultPP '
<PP' (
TStatePP( .
,PP. /
TTriggerPP0 8
>PP8 9
FireTriggerPrimPP: I
(PPI J
ExecutionParametersPPJ ]
<PP] ^
TPP^ _
,PP_ `
TTriggerPPa i
>PPi j

parametersPPk u
)PPu v
{QQ 	!
StateTransitionResultRR !
<RR! "
TStateRR" (
,RR( )
TTriggerRR* 2
>RR2 3
resultRR4 :
=RR; <
nullRR= A
;RRA B
ifTT 
(TT 
TransitionsTT 
.TT 
TryGetValueTT '
(TT' (

parametersTT( 2
.TT2 3
TriggerTT3 :
,TT: ;
outTT< ?
varTT@ C
transitionsTTD O
)TTO P
)TTP Q
{UU 
foreachVV 
(VV 
varVV 

transitionVV '
inVV( *
transitionsVV+ 6
.VV6 7
OrderByVV7 >
(VV> ?
tVV? @
=>VVA C
tVVD E
.VVE F
PriorityVVF N
)VVN O
)VVO P
{WW 
resultXX 
=XX 

transitionXX '
.XX' (
ExecuteXX( /
(XX/ 0

parametersXX0 :
)XX: ;
;XX; <
ifYY 
(YY 
resultYY 
.YY 
WasTransitionedYY .
)YY. /
{ZZ 
returnZZ 
resultZZ #
;ZZ# $
}ZZ% &
}[[ 
}\\ 
return^^ 
result^^ 
;^^ 
}__ 	
}`` 
}aa ˜¶
NC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateMachine.cs
	namespace 	
NStateManager
 
{ 
public 

sealed 
class 
StateMachine $
<$ %
T% &
,& '
TState( .
,. /
TTrigger0 8
>8 9
:: ;
IStateMachine< I
<I J
TJ K
,K L
TStateM S
,S T
TTriggerU ]
>] ^
where 
TState 
: 
IComparable "
{ 
private 
readonly 

Dictionary #
<# $
TState$ *
,* +'
IStateConfigurationInternal, G
<G H
TH I
,I J
TStateK Q
,Q R
TTriggerS [
>[ \
>\ ] 
_stateConfigurations^ r
=s t
new 

Dictionary 
< 
TState !
,! "'
IStateConfigurationInternal# >
<> ?
T? @
,@ A
TStateB H
,H I
TTriggerJ R
>R S
>S T
(T U
)U V
;V W
private 
readonly 

Dictionary #
<# $
TTrigger$ ,
,, -
TriggerActionBase. ?
<? @
T@ A
,A B
TTriggerC K
>K L
>L M
_triggerActionsN ]
=^ _
new 

Dictionary 
< 
TTrigger #
,# $
TriggerActionBase% 6
<6 7
T7 8
,8 9
TTrigger: B
>B C
>C D
(D E
)E F
;F G
public 
Func 
< 
T 
, 
TState 
> 
StateAccessor ,
{- .
get/ 2
;2 3
}4 5
public 
Action 
< 
T 
, 
TState 
>  
StateMutator! -
{. /
get0 3
;3 4
}5 6
public$$ 
event$$ 
EventHandler$$ !
<$$! "
TransitionEventArgs$$" 5
<$$5 6
T$$6 7
,$$7 8
TState$$9 ?
,$$? @
TTrigger$$A I
>$$I J
>$$J K
OnNoTransition$$L Z
;$$Z [
public)) 
event)) 
EventHandler)) !
<))! "
TransitionEventArgs))" 5
<))5 6
T))6 7
,))7 8
TState))9 ?
,))? @
TTrigger))A I
>))I J
>))J K"
OnTriggerNotConfigured))L b
;))b c
public00 
StateMachine00 
(00 
Func00  
<00  !
T00! "
,00" #
TState00$ *
>00* +
stateAccessor00, 9
,009 :
Action00; A
<00A B
T00B C
,00C D
TState00E K
>00K L
stateMutator00M Y
)00Y Z
{11 	
StateAccessor22 
=22 
stateAccessor22 )
??22* ,
throw22- 2
new223 6!
ArgumentNullException227 L
(22L M
nameof22M S
(22S T
stateAccessor22T a
)22a b
)22b c
;22c d
StateMutator33 
=33 
stateMutator33 '
??33( *
throw33+ 0
new331 4!
ArgumentNullException335 J
(33J K
nameof33K Q
(33Q R
stateMutator33R ^
)33^ _
)33_ `
;33` a
}44 	
public== 
IStateMachine== 
<== 
T== 
,== 
TState==  &
,==& '
TTrigger==( 0
>==0 1
AddTriggerAction==2 B
(==B C
TTrigger==C K
trigger==L S
,==S T
Action==U [
<==[ \
T==\ ]
>==] ^
action==_ e
)==e f
{>> 	
if?? 
(?? 
_triggerActions?? 
.??  
ContainsKey??  +
(??+ ,
trigger??, 3
)??3 4
)??4 5
{@@ 
throw@@ 
new@@ %
InvalidOperationException@@ 1
(@@1 2
$"@@2 4+
Only one action is allowed for @@4 S
{@@S T
trigger@@T [
}@@[ \
	 trigger.@@\ e
"@@e f
)@@f g
;@@g h
}@@i j
_triggerActionsBB 
.BB 
AddBB 
(BB  
triggerBB  '
,BB' ( 
TriggerActionFactoryBB) =
<BB= >
TBB> ?
,BB? @
TTriggerBBA I
>BBI J
.BBJ K
GetTriggerActionBBK [
(BB[ \
actionBB\ b
)BBb c
)BBc d
;BBd e
returnDD 
thisDD 
;DD 
}EE 	
publicOO 
IStateMachineOO 
<OO 
TOO 
,OO 
TStateOO  &
,OO& '
TTriggerOO( 0
>OO0 1
AddTriggerActionOO2 B
<OOB C
TRequestOOC K
>OOK L
(OOL M
TTriggerOOM U
triggerOOV ]
,OO] ^
ActionOO_ e
<OOe f
TOOf g
,OOg h
TRequestOOi q
>OOq r
actionOOs y
)OOy z
{PP 	
ifQQ 
(QQ 
_triggerActionsQQ 
.QQ  
ContainsKeyQQ  +
(QQ+ ,
triggerQQ, 3
)QQ3 4
)QQ4 5
{RR 
throwRR 
newRR %
InvalidOperationExceptionRR 1
(RR1 2
$"RR2 4+
Only one action is allowed for RR4 S
{RRS T
triggerRRT [
}RR[ \
	 trigger.RR\ e
"RRe f
)RRf g
;RRg h
}RRi j
_triggerActionsTT 
.TT 
AddTT 
(TT  
triggerTT  '
,TT' ( 
TriggerActionFactoryTT) =
<TT= >
TTT> ?
,TT? @
TTriggerTTA I
>TTI J
.TTJ K
GetTriggerActionTTK [
(TT[ \
actionTT\ b
)TTb c
)TTc d
;TTd e
returnVV 
thisVV 
;VV 
}WW 	
public^^ 
IStateConfiguration^^ "
<^^" #
T^^# $
,^^$ %
TState^^& ,
,^^, -
TTrigger^^. 6
>^^6 7
ConfigureState^^8 F
(^^F G
TState^^G M
state^^N S
)^^S T
{__ 	
if`` 
(``  
_stateConfigurations`` $
.``$ %
TryGetValue``% 0
(``0 1
state``1 6
,``6 7
out``8 ;
var``< ?
stateConfiguration``@ R
)``R S
)``S T
{aa 
returnaa 
stateConfigurationaa '
;aa' (
}aa) *
varcc 
newStatecc 
=cc 
newcc 
StateConfigurationcc 1
<cc1 2
Tcc2 3
,cc3 4
TStatecc5 ;
,cc; <
TTriggercc= E
>ccE F
(ccF G
stateccG L
,ccL M
thisccN R
)ccR S
;ccS T 
_stateConfigurationsdd  
.dd  !
Adddd! $
(dd$ %
statedd% *
,dd* +
newStatedd, 4
)dd4 5
;dd5 6
returnff 
newStateff 
;ff 
}gg 	
publicpp !
StateTransitionResultpp $
<pp$ %
TStatepp% +
,pp+ ,
TTriggerpp- 5
>pp5 6
FireTriggerpp7 B
<ppB C
TRequestppC K
>ppK L
(ppL M
TppM N
contextppO V
,ppV W
TTriggerppX `
triggerppa h
,pph i
TRequestppj r
requestpps z
)ppz {
whereqq 
TRequestqq 
:qq 
classqq "
{rr 	
varss 
executionParametersss #
=ss$ %
newss& )
ExecutionParametersss* =
<ss= >
Tss> ?
,ss? @
TTriggerssA I
>ssI J
(ssJ K
triggerssK R
,ssR S
contextssT [
,ss[ \
requestss] d
:ssd e
requestssf m
)ssm n
;ssn o
vartt 

startStatett 
=tt 
StateAccessortt *
(tt* +
contexttt+ 2
)tt2 3
;tt3 4
ifvv 
(vv 
_triggerActionsvv 
.vv  
TryGetValuevv  +
(vv+ ,
triggervv, 3
,vv3 4
outvv5 8
varvv9 <
triggerActionvv= J
)vvJ K
)vvK L
{ww 
triggerActionww 
.ww 
Executeww #
(ww# $
executionParametersww$ 7
)ww7 8
;ww8 9
}ww: ;
varyy 
resultyy 
=yy 
!yy  
_stateConfigurationsyy .
.yy. /
TryGetValueyy/ :
(yy: ;

startStateyy; E
,yyE F
outyyG J
varyyK N
stateConfigurationyyO a
)yya b
?zz 
newzz !
StateTransitionResultzz +
<zz+ ,
TStatezz, 2
,zz2 3
TTriggerzz4 <
>zz< =
(zz= >
triggerzz> E
,{{ 

startState{{  
,|| 

startState||  
,}} 

startState}}  
,~~ 
lastTransitionName~~ (
:~~( )
string~~* 0
.~~0 1
Empty~~1 6
, 
transitionDefined '
:' (
false) .
). /
:
ÄÄ  
stateConfiguration
ÄÄ $
.
ÄÄ$ %
FireTrigger
ÄÄ% 0
(
ÄÄ0 1!
executionParameters
ÄÄ1 D
)
ÄÄD E
;
ÄÄE F
return
ÇÇ (
executeExitAndEntryActions
ÇÇ -
(
ÇÇ- .!
executionParameters
ÇÇ. A
,
ÇÇA B
result
ÇÇC I
)
ÇÇI J
;
ÇÇJ K
}
ÉÉ 	
public
ãã #
StateTransitionResult
ãã $
<
ãã$ %
TState
ãã% +
,
ãã+ ,
TTrigger
ãã- 5
>
ãã5 6
FireTrigger
ãã7 B
(
ããB C
T
ããC D
context
ããE L
,
ããL M
TTrigger
ããN V
trigger
ããW ^
)
ãã^ _
{
åå 	
var
çç 

startState
çç 
=
çç 
StateAccessor
çç *
(
çç* +
context
çç+ 2
)
çç2 3
;
çç3 4
var
éé !
executionParameters
éé #
=
éé$ %
new
éé& )!
ExecutionParameters
éé* =
<
éé= >
T
éé> ?
,
éé? @
TTrigger
ééA I
>
ééI J
(
ééJ K
trigger
ééK R
,
ééR S
context
ééT [
)
éé[ \
;
éé\ ]
if
êê 
(
êê 
_triggerActions
êê 
.
êê  
TryGetValue
êê  +
(
êê+ ,
trigger
êê, 3
,
êê3 4
out
êê5 8
var
êê9 <
triggerAction
êê= J
)
êêJ K
)
êêK L
{
ëë 
triggerAction
ëë 
.
ëë 
Execute
ëë #
(
ëë# $!
executionParameters
ëë$ 7
)
ëë7 8
;
ëë8 9
}
ëë: ;
var
ìì 
result
ìì 
=
ìì 
!
ìì "
_stateConfigurations
ìì .
.
ìì. /
TryGetValue
ìì/ :
(
ìì: ;

startState
ìì; E
,
ììE F
out
ììG J
var
ììK N 
stateConfiguration
ììO a
)
ììa b
?
îî 
new
îî #
StateTransitionResult
îî +
<
îî+ ,
TState
îî, 2
,
îî2 3
TTrigger
îî4 <
>
îî< =
(
îî= >
trigger
îî> E
,
ïï 

startState
ïï  
,
ññ 

startState
ññ  
,
óó 

startState
óó  
,
òò  
lastTransitionName
òò '
:
òò' (
String
òò) /
.
òò/ 0
Empty
òò0 5
,
ôô 
transitionDefined
ôô '
:
ôô' (
false
ôô) .
)
ôô. /
:
öö  
stateConfiguration
öö $
.
öö$ %
FireTrigger
öö% 0
(
öö0 1!
executionParameters
öö1 D
)
ööD E
;
ööE F
return
úú (
executeExitAndEntryActions
úú -
(
úú- .!
executionParameters
úú. A
,
úúA B
result
úúC I
)
úúI J
;
úúJ K
}
ùù 	
public
üü 
bool
üü 
	IsInState
üü 
(
üü 
T
üü 
context
üü  '
,
üü' (
TState
üü) /
state
üü0 5
)
üü5 6
{
†† 	
var
°° 
objectState
°° 
=
°° 
StateAccessor
°° +
(
°°+ ,
context
°°, 3
)
°°3 4
;
°°4 5
if
££ 
(
££ 
state
££ 
.
££ 
IsEqual
££ 
(
££ 
objectState
££ )
)
££) *
)
££* +
{
§§ 
return
§§ 
true
§§ 
;
§§ 
}
§§ 
return
¶¶ "
_stateConfigurations
¶¶ '
.
¶¶' (
TryGetValue
¶¶( 3
(
¶¶3 4
objectState
¶¶4 ?
,
¶¶? @
out
¶¶A D
var
¶¶E H&
objectStateConfiguration
¶¶I a
)
¶¶a b
&&
ßß &
objectStateConfiguration
ßß .
.
ßß. /
	IsInState
ßß/ 8
(
ßß8 9
state
ßß9 >
)
ßß> ?
;
ßß? @
}
®® 	
public
ØØ 
IStateMachine
ØØ 
<
ØØ 
T
ØØ 
,
ØØ 
TState
ØØ  &
,
ØØ& '
TTrigger
ØØ( 0
>
ØØ0 1*
RegisterOnTransitionedAction
ØØ2 N
(
ØØN O
Action
ØØO U
<
ØØU V
T
ØØV W
,
ØØW X#
StateTransitionResult
ØØY n
<
ØØn o
TState
ØØo u
,
ØØu v
TTrigger
ØØw 
>ØØ Ä
>ØØÄ Å
actionØØÇ à
)ØØà â
{
∞∞ 	!
StateTransitionBase
±± 
<
±±  
T
±±  !
,
±±! "
TState
±±# )
,
±±) *
TTrigger
±±+ 3
>
±±3 4
.
±±4 5!
OnTransitionedEvent
±±5 H
+=
±±I K
action
±±L R
;
±±R S
return
≥≥ 
this
≥≥ 
;
≥≥ 
}
¥¥ 	
private
∂∂ #
StateTransitionResult
∂∂ %
<
∂∂% &
TState
∂∂& ,
,
∂∂, -
TTrigger
∂∂. 6
>
∂∂6 7(
executeExitAndEntryActions
∂∂8 R
(
∂∂R S!
ExecutionParameters
∂∂S f
<
∂∂f g
T
∂∂g h
,
∂∂h i
TTrigger
∂∂j r
>
∂∂r s

parameters
∂∂t ~
,
∑∑
 #
StateTransitionResult
∑∑ !
<
∑∑! "
TState
∑∑" (
,
∑∑( )
TTrigger
∑∑* 2
>
∑∑2 3
currentResult
∑∑4 A
)
∑∑A B
{
∏∏ 	
if
ππ 
(
ππ 
currentResult
ππ 
.
ππ 
WasTransitioned
ππ -
&&
ππ. 0
!
∫∫ 
(
∫∫ 
currentResult
∫∫ 
.
∫∫  
StartingState
∫∫  -
.
∫∫- .
	CompareTo
∫∫. 7
(
∫∫7 8
currentResult
∫∫8 E
.
∫∫E F
PreviousState
∫∫F S
)
∫∫S T
==
∫∫U W
$num
∫∫X Y
&&
ªª 
currentResult
ªª "
.
ªª" #
PreviousState
ªª# 0
.
ªª0 1
	CompareTo
ªª1 :
(
ªª: ;
currentResult
ªª; H
.
ªªH I
CurrentState
ªªI U
)
ªªU V
==
ªªW Y
$num
ªªZ [
)
ªª[ \
)
ªª\ ]
{
ºº "
_stateConfigurations
ΩΩ $
.
ΩΩ$ %
TryGetValue
ΩΩ% 0
(
ΩΩ0 1
currentResult
ΩΩ1 >
.
ΩΩ> ?
PreviousState
ΩΩ? L
,
ΩΩL M
out
ΩΩN Q
var
ΩΩR U
previousState
ΩΩV c
)
ΩΩc d
;
ΩΩd e
if
¿¿ 
(
¿¿ 
!
¿¿ 
	IsInState
¿¿ 
(
¿¿ 

parameters
¿¿ )
.
¿¿) *
Context
¿¿* 1
,
¿¿1 2
currentResult
¿¿3 @
.
¿¿@ A
PreviousState
¿¿A N
)
¿¿N O
)
¿¿O P
{
¡¡ 
previousState
¡¡ 
.
¡¡  
ExecuteExitAction
¡¡  1
(
¡¡1 2

parameters
¡¡2 <
.
¡¡< =
Context
¡¡= D
,
¡¡D E
currentResult
¡¡F S
)
¡¡S T
;
¡¡T U
}
¡¡V W
if
√√ 
(
√√ "
_stateConfigurations
√√ (
.
√√( )
TryGetValue
√√) 4
(
√√4 5
currentResult
√√5 B
.
√√B C
CurrentState
√√C O
,
√√O P
out
√√Q T
var
√√U X
newState
√√Y a
)
√√a b
)
√√b c
{
ƒƒ 
if
∆∆ 
(
∆∆ 
!
∆∆ 
previousState
∆∆ &
.
∆∆& '
	IsInState
∆∆' 0
(
∆∆0 1
currentResult
∆∆1 >
.
∆∆> ?
CurrentState
∆∆? K
)
∆∆K L
)
∆∆L M
{
«« 
newState
«« 
.
««  
ExecuteEntryAction
«« 1
(
««1 2

parameters
««2 <
.
««< =
Context
««= D
,
««D E
currentResult
««F S
)
««S T
;
««T U
}
««V W
var
   !
preAutoForwardState
   +
=
  , -
currentResult
  . ;
.
  ; <
CurrentState
  < H
;
  H I
var
ÀÀ "
autoTransitionResult
ÀÀ ,
=
ÀÀ- .
newState
ÀÀ/ 7
.
ÀÀ7 8#
ExecuteAutoTransition
ÀÀ8 M
(
ÀÀM N

parameters
ÀÀN X
,
ÀÀX Y
currentResult
ÀÀZ g
)
ÀÀg h
;
ÀÀh i
if
ÃÃ 
(
ÃÃ "
autoTransitionResult
ÃÃ ,
.
ÃÃ, -
WasTransitioned
ÃÃ- <
)
ÃÃ< =
{
ÕÕ 
currentResult
œœ %
.
œœ% &
PreviousState
œœ& 3
=
œœ4 5
currentResult
œœ6 C
.
œœC D
CurrentState
œœD P
;
œœP Q
currentResult
–– %
.
––% &
CurrentState
––& 2
=
––3 4"
autoTransitionResult
––5 I
.
––I J
CurrentState
––J V
;
––V W
currentResult
—— %
.
——% & 
LastTransitionName
——& 8
=
——9 :"
autoTransitionResult
——; O
.
——O P 
LastTransitionName
——P b
;
——b c
}
““ 
if
’’ 
(
’’ 
currentResult
’’ %
.
’’% &
CurrentState
’’& 2
.
’’2 3
	CompareTo
’’3 <
(
’’< =!
preAutoForwardState
’’= P
)
’’P Q
!=
’’R T
$num
’’U V
)
’’V W
{
÷÷ 
currentResult
÷÷ #
=
÷÷$ %(
executeExitAndEntryActions
÷÷& @
(
÷÷@ A

parameters
÷÷A K
,
÷÷K L
currentResult
÷÷M Z
)
÷÷Z [
;
÷÷[ \
}
÷÷] ^
}
◊◊ 
}
ÿÿ 
else
⁄⁄ 
if
⁄⁄ 
(
⁄⁄ "
_stateConfigurations
⁄⁄ )
.
⁄⁄) *
TryGetValue
⁄⁄* 5
(
⁄⁄5 6
currentResult
⁄⁄6 C
.
⁄⁄C D
CurrentState
⁄⁄D P
,
⁄⁄P Q
out
⁄⁄R U
var
⁄⁄V Y
reenteredState
⁄⁄Z h
)
⁄⁄h i
)
⁄⁄i j
{
€€ 
reenteredState
€€ 
.
€€ "
ExecuteReentryAction
€€ 1
(
€€1 2

parameters
€€2 <
.
€€< =
Context
€€= D
,
€€D E
currentResult
€€F S
)
€€S T
;
€€T U
}
€€V W
var
ﬁﬁ !
transitionEventArgs
ﬁﬁ #
=
ﬁﬁ$ %
new
ﬁﬁ& )!
TransitionEventArgs
ﬁﬁ* =
<
ﬁﬁ= >
T
ﬁﬁ> ?
,
ﬁﬁ? @
TState
ﬁﬁA G
,
ﬁﬁG H
TTrigger
ﬁﬁI Q
>
ﬁﬁQ R
(
ﬁﬁR S

parameters
ﬁﬁS ]
,
ﬁﬁ] ^
currentResult
ﬁﬁ_ l
)
ﬁﬁl m
;
ﬁﬁm n
if
ﬂﬂ 
(
ﬂﬂ 
!
ﬂﬂ 
currentResult
ﬂﬂ 
.
ﬂﬂ 
WasTransitioned
ﬂﬂ .
)
ﬂﬂ. /
{
‡‡ 
if
·· 
(
·· 
!
·· 
currentResult
·· "
.
··" #
TransitionDefined
··# 4
)
··4 5
{
‚‚ $
OnTriggerNotConfigured
‚‚ (
?
‚‚( )
.
‚‚) *
Invoke
‚‚* 0
(
‚‚0 1
this
‚‚1 5
,
‚‚5 6!
transitionEventArgs
‚‚7 J
)
‚‚J K
;
‚‚K L
}
‚‚M N
OnNoTransition
‰‰ 
?
‰‰ 
.
‰‰  
Invoke
‰‰  &
(
‰‰& '
this
‰‰' +
,
‰‰+ ,!
transitionEventArgs
‰‰- @
)
‰‰@ A
;
‰‰A B
}
ÂÂ 
return
ÁÁ 
currentResult
ÁÁ  
;
ÁÁ  !
}
ËË 	
}
ÈÈ 
}ÍÍ Ñ¿
SC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateMachineAsync.cs
	namespace 	
NStateManager
 
{ 
public 

sealed 
class 
StateMachineAsync )
<) *
T* +
,+ ,
TState- 3
,3 4
TTrigger5 =
>= >
:? @
IStateMachineAsyncA S
<S T
TT U
,U V
TStateW ]
,] ^
TTrigger_ g
>g h
where 
TState 
: 
IComparable "
{ 
private 
readonly 

Dictionary #
<# $
TState$ *
,* +,
 IStateConfigurationAsyncInternal, L
<L M
TM N
,N O
TStateP V
,V W
TTriggerX `
>` a
>a b 
_stateConfigurationsc w
=x y
newz }

Dictionary	~ à
<
à â
TState
â è
,
è ê.
 IStateConfigurationAsyncInternal
ë ±
<
± ≤
T
≤ ≥
,
≥ ¥
TState
µ ª
,
ª º
TTrigger
Ω ≈
>
≈ ∆
>
∆ «
(
« »
)
» …
;
…  
private 
readonly 

Dictionary #
<# $
TTrigger$ ,
,, -
FunctionActionBase. @
<@ A
TA B
>B C
>C D
_triggerActionsE T
=U V
newW Z

Dictionary[ e
<e f
TTriggerf n
,n o
FunctionActionBase	p Ç
<
Ç É
T
É Ñ
>
Ñ Ö
>
Ö Ü
(
Ü á
)
á à
;
à â
public 
Func 
< 
T 
, 
TState 
> 
StateAccessor ,
{- .
get/ 2
;2 3
}4 5
public 
Action 
< 
T 
, 
TState 
>  
StateMutator! -
{. /
get0 3
;3 4
}5 6
public$$ 
event$$ 
EventHandler$$ !
<$$! "
TransitionEventArgs$$" 5
<$$5 6
T$$6 7
,$$7 8
TState$$9 ?
,$$? @
TTrigger$$A I
>$$I J
>$$J K
OnNoTransition$$L Z
;$$Z [
public)) 
event)) 
EventHandler)) !
<))! "
TransitionEventArgs))" 5
<))5 6
T))6 7
,))7 8
TState))9 ?
,))? @
TTrigger))A I
>))I J
>))J K"
OnTriggerNotConfigured))L b
;))b c
public00 
StateMachineAsync00  
(00  !
Func00! %
<00% &
T00& '
,00' (
TState00) /
>00/ 0
stateAccessor001 >
,00> ?
Action00@ F
<00F G
T00G H
,00H I
TState00J P
>00P Q
stateMutator00R ^
)00^ _
{11 	
StateAccessor22 
=22 
stateAccessor22 )
??22* ,
throw22- 2
new223 6!
ArgumentNullException227 L
(22L M
nameof22M S
(22S T
stateAccessor22T a
)22a b
)22b c
;22c d
StateMutator33 
=33 
stateMutator33 '
??33( *
throw33+ 0
new331 4!
ArgumentNullException335 J
(33J K
nameof33K Q
(33Q R
stateMutator33R ^
)33^ _
)33_ `
;33` a
}44 	
public== 
IStateMachineAsync== !
<==! "
T==" #
,==# $
TState==% +
,==+ ,
TTrigger==- 5
>==5 6
AddTriggerAction==7 G
(==G H
TTrigger==H P
trigger==Q X
,==X Y
Func==Z ^
<==^ _
T==_ `
,==` a
CancellationToken==b s
,==s t
Task==u y
>==y z
action	=={ Å
)
==Å Ç
{>> 	
if?? 
(?? 
_triggerActions?? 
.??  
ContainsKey??  +
(??+ ,
trigger??, 3
)??3 4
)??4 5
{@@ 
throw@@ 
new@@ %
InvalidOperationException@@ 1
(@@1 2
$"@@2 4+
Only one action is allowed for @@4 S
{@@S T
trigger@@T [
}@@[ \
	 trigger.@@\ e
"@@e f
)@@f g
;@@g h
}@@i j
_triggerActionsBB 
.BB 
AddBB 
(BB  
triggerBB  '
,BB' ( 
TriggerActionFactoryBB) =
<BB= >
TBB> ?
,BB? @
TTriggerBBA I
>BBI J
.BBJ K
GetTriggerActionBBK [
(BB[ \
actionBB\ b
)BBb c
)BBc d
;BBd e
returnDD 
thisDD 
;DD 
}EE 	
publicOO 
IStateMachineAsyncOO !
<OO! "
TOO" #
,OO# $
TStateOO% +
,OO+ ,
TTriggerOO- 5
>OO5 6
AddTriggerActionOO7 G
<OOG H
TRequestOOH P
>OOP Q
(OOQ R
TTriggerOOR Z
triggerOO[ b
,OOb c
FuncOOd h
<OOh i
TOOi j
,OOj k
TRequestOOl t
,OOt u
CancellationToken	OOv á
,
OOá à
Task
OOâ ç
>
OOç é
action
OOè ï
)
OOï ñ
{PP 	
ifQQ 
(QQ 
_triggerActionsQQ 
.QQ  
ContainsKeyQQ  +
(QQ+ ,
triggerQQ, 3
)QQ3 4
)QQ4 5
{RR 
throwRR 
newRR %
InvalidOperationExceptionRR 1
(RR1 2
$"RR2 4+
Only one action is allowed for RR4 S
{RRS T
triggerRRT [
}RR[ \
	 trigger.RR\ e
"RRe f
)RRf g
;RRg h
}RRi j
_triggerActionsTT 
.TT 
AddTT 
(TT  
triggerTT  '
,TT' ( 
TriggerActionFactoryTT) =
<TT= >
TTT> ?
,TT? @
TTriggerTTA I
>TTI J
.TTJ K
GetTriggerActionTTK [
(TT[ \
actionTT\ b
)TTb c
)TTc d
;TTd e
returnVV 
thisVV 
;VV 
}WW 	
public^^ $
IStateConfigurationAsync^^ '
<^^' (
T^^( )
,^^) *
TState^^+ 1
,^^1 2
TTrigger^^3 ;
>^^; <
ConfigureState^^= K
(^^K L
TState^^L R
state^^S X
)^^X Y
{__ 	
if`` 
(``  
_stateConfigurations`` $
.``$ %
TryGetValue``% 0
(``0 1
state``1 6
,``6 7
out``8 ;
var``< ?
stateConfiguration``@ R
)``R S
)``S T
{aa 
returnaa 
stateConfigurationaa '
;aa' (
}aa) *
varcc 
newStatecc 
=cc 
newcc #
StateConfigurationAsynccc 6
<cc6 7
Tcc7 8
,cc8 9
TStatecc9 ?
,cc? @
TTriggerccA I
>ccI J
(ccJ K
stateccK P
,ccP Q
thisccR V
)ccV W
;ccW X 
_stateConfigurationsdd  
.dd  !
Adddd! $
(dd$ %
statedd% *
,dd* +
newStatedd, 4
)dd4 5
;dd5 6
returnff 
newStateff 
;ff 
}gg 	
publicpp 
asyncpp 
Taskpp 
<pp !
StateTransitionResultpp /
<pp/ 0
TStatepp0 6
,pp6 7
TTriggerpp8 @
>pp@ A
>ppA B
FireTriggerAsyncppC S
(ppS T
TppT U
contextppV ]
,pp] ^
TTriggerpp_ g
triggerpph o
,ppo p
CancellationToken	ppq Ç
cancellationToken
ppÉ î
=
ppï ñ
default
ppó û
(
ppû ü
CancellationToken
ppü ∞
)
pp∞ ±
)
pp± ≤
{qq 	
varrr 

startStaterr 
=rr 
StateAccessorrr *
(rr* +
contextrr+ 2
)rr2 3
;rr3 4
iftt 
(tt 
_triggerActionstt 
.tt  
TryGetValuett  +
(tt+ ,
triggertt, 3
,tt3 4
outtt5 8
vartt9 <
triggerActiontt= J
)ttJ K
)ttK L
{uu 
awaitvv 
triggerActionvv #
.vv# $
ExecuteAsyncvv$ 0
(vv0 1
contextvv1 8
,vv8 9
requestvv: A
:vvA B
nullvvC G
,vvG H
cancellationTokenvvI Z
:vvZ [
cancellationTokenvv\ m
)vvm n
.ww 
ConfigureAwaitww "
(ww" #%
continueOnCapturedContextww# <
:ww< =
falseww> C
)wwC D
;wwD E
}xx 
varzz 
executionParameterszz #
=zz$ %
newzz& )
ExecutionParameterszz* =
<zz= >
Tzz> ?
,zz? @
TTriggerzzA I
>zzI J
(zzJ K
triggerzzK R
,zzR S
contextzzT [
,zz[ \
cancellationTokenzz] n
)zzn o
;zzo p
var|| 
result|| 
=||  
_stateConfigurations|| -
.||- .
TryGetValue||. 9
(||9 :

startState||: D
,||D E
out||F I
var||J M
stateConfiguration||N `
)||` a
?}} 
await}} 
stateConfiguration}} *
.}}* +
FireTriggerAsync}}+ ;
(}}; <
executionParameters}}< O
)}}O P
.}}P Q
ConfigureAwait}}Q _
(}}_ `%
continueOnCapturedContext}}` y
:}}y z
false	}}{ Ä
)
}}Ä Å
:~~ 
new~~ !
StateTransitionResult~~ +
<~~+ ,
TState~~, 2
,~~2 3
TTrigger~~4 <
>~~< =
(~~= >
trigger~~> E
, 

startState  
,
ÄÄ 

startState
ÄÄ  
,
ÅÅ 

startState
ÅÅ  
,
ÇÇ  
lastTransitionName
ÇÇ (
:
ÇÇ( )
string
ÇÇ* 0
.
ÇÇ0 1
Empty
ÇÇ1 6
,
ÉÉ 
transitionDefined
ÉÉ '
:
ÉÉ' (
false
ÉÉ) .
)
ÉÉ. /
;
ÉÉ/ 0
return
ÖÖ 
await
ÖÖ -
executeExitAndEntryActionsAsync
ÖÖ 8
(
ÖÖ8 9!
executionParameters
ÖÖ9 L
,
ÖÖL M
result
ÖÖN T
)
ÖÖT U
.
ÖÖU V
ConfigureAwait
ÖÖV d
(
ÖÖd e'
continueOnCapturedContext
ÖÖe ~
:
ÖÖ~ 
falseÖÖÄ Ö
)ÖÖÖ Ü
;ÖÖÜ á
}
ÜÜ 	
public
êê 
async
êê 
Task
êê 
<
êê #
StateTransitionResult
êê /
<
êê/ 0
TState
êê0 6
,
êê6 7
TTrigger
êê8 @
>
êê@ A
>
êêA B
FireTriggerAsync
êêC S
<
êêS T
TRequest
êêT \
>
êê\ ]
(
êê] ^
T
êê^ _
context
êê` g
,
ëë
 
TTrigger
ëë 
trigger
ëë 
,
íí
 
TRequest
íí 
request
íí 
,
ìì
 
CancellationToken
ìì 
cancellationToken
ìì /
=
ìì0 1
default
ìì2 9
(
ìì9 :
CancellationToken
ìì: K
)
ììK L
)
ììL M
where
îî 
TRequest
îî 
:
îî 
class
îî "
{
ïï 	
var
ññ 

startState
ññ 
=
ññ 
StateAccessor
ññ *
(
ññ* +
context
ññ+ 2
)
ññ2 3
;
ññ3 4
if
òò 
(
òò 
_triggerActions
òò 
.
òò  
TryGetValue
òò  +
(
òò+ ,
trigger
òò, 3
,
òò3 4
out
òò5 8
var
òò9 <
triggerAction
òò= J
)
òòJ K
)
òòK L
{
ôô 
await
ôô 
triggerAction
ôô !
.
ôô! "
ExecuteAsync
ôô" .
(
ôô. /
context
ôô/ 6
,
ôô6 7
cancellationToken
ôô8 I
,
ôôI J
request
ôôK R
)
ôôR S
.
ôôS T
ConfigureAwait
ôôT b
(
ôôb c'
continueOnCapturedContext
ôôc |
:
ôô| }
falseôô~ É
)ôôÉ Ñ
;ôôÑ Ö
}ôôÜ á
var
õõ !
executionParameters
õõ #
=
õõ$ %
new
õõ& )!
ExecutionParameters
õõ* =
<
õõ= >
T
õõ> ?
,
õõ? @
TTrigger
õõA I
>
õõI J
(
õõJ K
trigger
õõK R
,
õõR S
context
õõT [
,
õõ[ \
cancellationToken
õõ] n
,
õõn o
request
õõp w
)
õõw x
;
õõx y#
StateTransitionResult
ùù !
<
ùù! "
TState
ùù" (
,
ùù( )
TTrigger
ùù* 2
>
ùù2 3
result
ùù4 :
;
ùù: ;
if
ûû 
(
ûû 
!
ûû "
_stateConfigurations
ûû %
.
ûû% &
TryGetValue
ûû& 1
(
ûû1 2

startState
ûû2 <
,
ûû< =
out
ûû> A
var
ûûB E 
stateConfiguration
ûûF X
)
ûûX Y
)
ûûY Z
{
üü 
result
üü 
=
üü 
new
üü #
StateTransitionResult
üü 0
<
üü0 1
TState
üü1 7
,
üü7 8
TTrigger
üü9 A
>
üüA B
(
üüB C
trigger
üüC J
,
†† 

startState
†† 
,
°° 

startState
°° 
,
¢¢ 

startState
¢¢ 
,
££  
lastTransitionName
££ $
:
££$ %
string
££& ,
.
££, -
Empty
££- 2
,
§§ 
transitionDefined
§§ #
:
§§# $
false
§§% *
)
§§* +
;
§§+ ,
}
§§- .
else
•• 
{
¶¶ 
result
ßß 
=
ßß 
await
ßß  
stateConfiguration
ßß 1
.
ßß1 2
FireTriggerAsync
ßß2 B
(
ßßB C!
executionParameters
ßßC V
)
ßßV W
.
ßßW X
ConfigureAwait
ßßX f
(
ßßf g(
continueOnCapturedContextßßg Ä
:ßßÄ Å
falseßßÇ á
)ßßá à
;ßßà â
}
®® 
return
™™ 
await
™™ -
executeExitAndEntryActionsAsync
™™ 8
(
™™8 9!
executionParameters
™™9 L
,
™™L M
result
™™N T
)
™™T U
.
™™U V
ConfigureAwait
™™V d
(
™™d e'
continueOnCapturedContext
™™e ~
:
™™~ 
false™™Ä Ö
)™™Ö Ü
;™™Ü á
}
´´ 	
private
≠≠ 
async
≠≠ 
Task
≠≠ 
<
≠≠ #
StateTransitionResult
≠≠ 0
<
≠≠0 1
TState
≠≠1 7
,
≠≠7 8
TTrigger
≠≠9 A
>
≠≠A B
>
≠≠B C-
executeExitAndEntryActionsAsync
≠≠D c
(
≠≠c d!
ExecutionParameters
≠≠d w
<
≠≠w x
T
≠≠x y
,
≠≠y z
TTrigger≠≠{ É
>≠≠É Ñ

parameters≠≠Ö è
,≠≠è ê%
StateTransitionResult≠≠ë ¶
<≠≠¶ ß
TState≠≠ß ≠
,≠≠≠ Æ
TTrigger≠≠Ø ∑
>≠≠∑ ∏
currentResult≠≠π ∆
)≠≠∆ «
{
ÆÆ 	
var
ØØ 
currentState
ØØ 
=
ØØ 
StateAccessor
ØØ ,
(
ØØ, -

parameters
ØØ- 7
.
ØØ7 8
Context
ØØ8 ?
)
ØØ? @
;
ØØ@ A
if
∞∞ 
(
∞∞ 
currentResult
∞∞ 
.
∞∞ 
WasTransitioned
∞∞ -
&&
∞∞. 0
!
∞∞1 2
currentState
∞∞2 >
.
∞∞> ?
Equals
∞∞? E
(
∞∞E F
currentResult
∞∞F S
.
∞∞S T
StartingState
∞∞T a
)
∞∞a b
)
∞∞b c
{
±± "
_stateConfigurations
≤≤ $
.
≤≤$ %
TryGetValue
≤≤% 0
(
≤≤0 1
currentResult
≤≤1 >
.
≤≤> ?
PreviousState
≤≤? L
,
≤≤L M
out
≤≤N Q
var
≤≤R U
previousState
≤≤V c
)
≤≤c d
;
≤≤d e
if
µµ 
(
µµ 
!
µµ 
	IsInState
µµ 
(
µµ 

parameters
µµ )
.
µµ) *
Context
µµ* 1
,
µµ1 2
currentResult
µµ3 @
.
µµ@ A
PreviousState
µµA N
)
µµN O
)
µµO P
{
∂∂ 
await
∑∑ 
previousState
∑∑ '
.
∑∑' ($
ExecuteExitActionAsync
∑∑( >
(
∑∑> ?

parameters
∑∑? I
,
∑∑I J
currentResult
∑∑K X
)
∑∑X Y
.
∏∏ 
ConfigureAwait
∏∏ '
(
∏∏' ('
continueOnCapturedContext
∏∏( A
:
∏∏A B
false
∏∏C H
)
∏∏H I
;
∏∏I J
}
ππ 
if
ªª 
(
ªª "
_stateConfigurations
ªª (
.
ªª( )
TryGetValue
ªª) 4
(
ªª4 5
currentResult
ªª5 B
.
ªªB C
CurrentState
ªªC O
,
ªªO P
out
ªªQ T
var
ªªU X
newState
ªªY a
)
ªªa b
)
ªªb c
{
ºº 
if
ææ 
(
ææ 
!
ææ 
previousState
ææ &
.
ææ& '
	IsInState
ææ' 0
(
ææ0 1
currentResult
ææ1 >
.
ææ> ?
CurrentState
ææ? K
)
ææK L
)
ææL M
{
øø 
await
¿¿ 
newState
¿¿ &
.
¿¿& '%
ExecuteEntryActionAsync
¿¿' >
(
¿¿> ?

parameters
¿¿? I
,
¿¿I J
currentResult
¿¿K X
)
¿¿X Y
.
¡¡ 
ConfigureAwait
¡¡ *
(
¡¡* +'
continueOnCapturedContext
¡¡+ D
:
¡¡D E
false
¡¡F K
)
¡¡K L
;
¡¡L M
}
¬¬ 
var
≈≈ !
preAutoForwardState
≈≈ +
=
≈≈, -
currentResult
≈≈. ;
.
≈≈; <
CurrentState
≈≈< H
;
≈≈H I
var
∆∆ "
autoTransitionResult
∆∆ ,
=
∆∆- .
await
∆∆/ 4
newState
∆∆5 =
.
∆∆= >(
ExecuteAutoTransitionAsync
∆∆> X
(
∆∆X Y

parameters
∆∆Y c
,
∆∆c d
currentResult
∆∆e r
)
∆∆r s
.
«« 
ConfigureAwait
«« &
(
««& ''
continueOnCapturedContext
««' @
:
««@ A
false
««B G
)
««G H
;
««H I
if
»» 
(
»» "
autoTransitionResult
»» ,
.
»», -
WasTransitioned
»»- <
)
»»< =
{
…… 
currentResult
ÀÀ %
.
ÀÀ% &
PreviousState
ÀÀ& 3
=
ÀÀ4 5
currentResult
ÀÀ6 C
.
ÀÀC D
CurrentState
ÀÀD P
;
ÀÀP Q
currentResult
ÃÃ %
.
ÃÃ% &
CurrentState
ÃÃ& 2
=
ÃÃ3 4"
autoTransitionResult
ÃÃ5 I
.
ÃÃI J
CurrentState
ÃÃJ V
;
ÃÃV W
currentResult
ÕÕ %
.
ÕÕ% & 
LastTransitionName
ÕÕ& 8
=
ÕÕ9 :"
autoTransitionResult
ÕÕ; O
.
ÕÕO P 
LastTransitionName
ÕÕP b
;
ÕÕb c
}
ŒŒ 
if
—— 
(
—— !
preAutoForwardState
—— +
.
——+ ,
	CompareTo
——, 5
(
——5 6
currentResult
——6 C
.
——C D
CurrentState
——D P
)
——P Q
!=
——R T
$num
——U V
)
——V W
{
““ 
await
”” -
executeExitAndEntryActionsAsync
”” =
(
””= >

parameters
””> H
,
””H I
currentResult
””J W
)
””W X
.
‘‘ 
ConfigureAwait
‘‘ *
(
‘‘* +'
continueOnCapturedContext
‘‘+ D
:
‘‘D E
false
‘‘F K
)
‘‘K L
;
‘‘L M
}
’’ 
}
÷÷ 
}
◊◊ 
else
ŸŸ 
if
ŸŸ 
(
ŸŸ "
_stateConfigurations
ŸŸ )
.
ŸŸ) *
TryGetValue
ŸŸ* 5
(
ŸŸ5 6
currentResult
ŸŸ6 C
.
ŸŸC D
CurrentState
ŸŸD P
,
ŸŸP Q
out
ŸŸR U
var
ŸŸV Y
reenteredState
ŸŸZ h
)
ŸŸh i
)
ŸŸi j
{
⁄⁄ 
await
€€ 
reenteredState
€€ $
.
€€$ %'
ExecuteReentryActionAsync
€€% >
(
€€> ?

parameters
€€? I
,
€€I J
currentResult
€€K X
)
€€X Y
.
‹‹ 
ConfigureAwait
‹‹ "
(
‹‹" #'
continueOnCapturedContext
‹‹# <
:
‹‹< =
false
‹‹> C
)
‹‹C D
;
‹‹D E
}
›› 
var
‡‡ !
transitionEventArgs
‡‡ #
=
‡‡$ %
new
‡‡& )!
TransitionEventArgs
‡‡* =
<
‡‡= >
T
‡‡> ?
,
‡‡? @
TState
‡‡A G
,
‡‡G H
TTrigger
‡‡I Q
>
‡‡Q R
(
‡‡R S

parameters
‡‡S ]
,
‡‡] ^
currentResult
‡‡_ l
)
‡‡l m
;
‡‡m n
if
·· 
(
·· 
!
·· 
currentResult
·· 
.
·· 
WasTransitioned
·· .
)
··. /
{
‚‚ 
if
„„ 
(
„„ 
!
„„ 
currentResult
„„ "
.
„„" #
TransitionDefined
„„# 4
)
„„4 5
{
‰‰ $
OnTriggerNotConfigured
‰‰ (
?
‰‰( )
.
‰‰) *
Invoke
‰‰* 0
(
‰‰0 1
this
‰‰1 5
,
‰‰5 6!
transitionEventArgs
‰‰7 J
)
‰‰J K
;
‰‰K L
}
‰‰M N
OnNoTransition
ÊÊ 
?
ÊÊ 
.
ÊÊ  
Invoke
ÊÊ  &
(
ÊÊ& '
this
ÊÊ' +
,
ÊÊ+ ,!
transitionEventArgs
ÊÊ- @
)
ÊÊ@ A
;
ÊÊA B
}
ÁÁ 
return
ÈÈ 
currentResult
ÈÈ  
;
ÈÈ  !
}
ÍÍ 	
public
ÏÏ 
bool
ÏÏ 
	IsInState
ÏÏ 
(
ÏÏ 
T
ÏÏ 
context
ÏÏ  '
,
ÏÏ' (
TState
ÏÏ) /
state
ÏÏ0 5
)
ÏÏ5 6
{
ÌÌ 	
var
ÓÓ 
objectState
ÓÓ 
=
ÓÓ 
StateAccessor
ÓÓ +
(
ÓÓ+ ,
context
ÓÓ, 3
)
ÓÓ3 4
;
ÓÓ4 5
if
 
(
 
state
 
.
 
	CompareTo
 
(
  
objectState
  +
)
+ ,
==
- /
$num
0 1
)
1 2
{
ÒÒ 
return
ÒÒ 
true
ÒÒ 
;
ÒÒ 
}
ÒÒ 
return
ÛÛ "
_stateConfigurations
ÛÛ '
.
ÛÛ' (
TryGetValue
ÛÛ( 3
(
ÛÛ3 4
objectState
ÛÛ4 ?
,
ÛÛ? @
out
ÛÛA D
var
ÛÛE H&
objectStateConfiguration
ÛÛI a
)
ÛÛa b
&&
ÙÙ &
objectStateConfiguration
ÙÙ .
.
ÙÙ. /
	IsInState
ÙÙ/ 8
(
ÙÙ8 9
state
ÙÙ9 >
)
ÙÙ> ?
;
ÙÙ? @
}
ıı 	
public
¸¸  
IStateMachineAsync
¸¸ !
<
¸¸! "
T
¸¸" #
,
¸¸# $
TState
¸¸% +
,
¸¸+ ,
TTrigger
¸¸- 5
>
¸¸5 6*
RegisterOnTransitionedAction
¸¸7 S
(
¸¸S T
Action
¸¸T Z
<
¸¸Z [
T
¸¸[ \
,
¸¸\ ]#
StateTransitionResult
¸¸^ s
<
¸¸s t
TState
¸¸t z
,
¸¸z {
TTrigger¸¸| Ñ
>¸¸Ñ Ö
>¸¸Ö Ü#
onTransitionedEvent¸¸á ö
)¸¸ö õ
{
˝˝ 	!
StateTransitionBase
˛˛ 
<
˛˛  
T
˛˛  !
,
˛˛! "
TState
˛˛# )
,
˛˛) *
TTrigger
˛˛+ 3
>
˛˛3 4
.
˛˛4 5!
OnTransitionedEvent
˛˛5 H
+=
˛˛I K!
onTransitionedEvent
˛˛L _
;
˛˛_ `
return
ÄÄ 
this
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
}
ÇÇ 
}ÉÉ Ú
QC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransition.cs
	namespace 	
NStateManager
 
{ 
internal 
class 
StateTransition "
<" #
T# $
,$ %
TState& ,
,, -
TTrigger. 6
>6 7
:8 9%
StateTransitionNonDynamic: S
<S T
TT U
,U V
TStateW ]
,] ^
TTrigger_ g
>g h
{ 
public 
Func 
< 
T 
, 
bool 
> 
	Condition &
{' (
get) ,
;, -
}. /
public 
StateTransition 
( 
Func #
<# $
T$ %
,% &
TState' -
>- .
stateAccessor/ <
,< =
Action> D
<D E
TE F
,F G
TStateH N
>N O
stateMutatorP \
,\ ]
TState^ d
toStatee l
,l m
Funcn r
<r s
Ts t
,t u
boolv z
>z {
	condition	| Ö
,
Ö Ü
string
á ç
name
é í
,
í ì
uint
î ò
priority
ô °
)
° ¢
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
toState0 7
,7 8
name9 =
,= >
priority? G
)G H
{ 	
	Condition 
= 
	condition !
??" $
throw% *
new+ .!
ArgumentNullException/ D
(D E
nameofE K
(K L
	conditionL U
)U V
)V W
;W X
} 	
public 
override !
StateTransitionResult -
<- .
TState. 4
,4 5
TTrigger6 >
>> ?
Execute@ G
(G H
ExecutionParametersH [
<[ \
T\ ]
,] ^
TTrigger_ g
>g h

parametersi s
,
 !
StateTransitionResult !
<! "
TState" (
,( )
TTrigger* 2
>2 3
currentResult4 A
=B C
nullD H
)H I
{ 	
return 
ExecutePrim 
( 

parameters )
,) *
currentResult+ 8
,8 9
	Condition: C
(C D

parametersD N
.N O
ContextO V
)V W
)W X
;X Y
} 	
} 
} €,
VC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class  
StateTransitionAsync '
<' (
T( )
,) *
TState+ 1
,1 2
TTrigger3 ;
>; <
:= >%
StateTransitionNonDynamic? X
<X Y
TY Z
,Z [
TState\ b
,b c
TTriggerd l
>l m
{ 
public 
Func 
< 
T 
, 
CancellationToken (
,( )
Task* .
<. /
bool/ 3
>3 4
>4 5
ConditionAsync6 D
{E F
getG J
;J K
}L M
public  
StateTransitionAsync #
(# $
Func$ (
<( )
T) *
,* +
TState, 2
>2 3
stateAccessor4 A
,A B
ActionC I
<I J
TJ K
,K L
TStateM S
>S T
stateMutatorU a
,a b
TStatec i
toStatej q
,q r
Funcs w
<w x
Tx y
,y z
CancellationToken	{ å
,
å ç
Task
é í
<
í ì
bool
ì ó
>
ó ò
>
ò ô
conditionAsync
ö ®
,
® ©
string
™ ∞
name
± µ
,
µ ∂
uint
∑ ª
priority
º ƒ
)
ƒ ≈
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
toState0 7
,7 8
name9 =
,= >
priority? G
)G H
{ 	
ConditionAsync 
= 
conditionAsync +
??, .
throw/ 4
new5 8!
ArgumentNullException9 N
(N O
nameofO U
(U V
conditionAsyncV d
)d e
)e f
;f g
} 	
public 
override 
async 
Task "
<" #!
StateTransitionResult# 8
<8 9
TState9 ?
,? @
TTriggerA I
>I J
>J K
ExecuteAsyncL X
(X Y
ExecutionParametersY l
<l m
Tm n
,n o
TTriggerp x
>x y

parameters	z Ñ
,
 !
StateTransitionResult !
<! "
TState" (
,( )
TTrigger* 2
>2 3
currentResult4 A
=B C
nullD H
)H I
{ 	
var 

startState 
= 
currentResult *
!=+ -
null. 2
?3 4
currentResult5 B
.B C
StartingStateC P
:Q R
StateAccessorS `
(` a

parametersa k
.k l
Contextl s
)s t
;t u
if   
(   

parameters   
.   
CancellationToken   ,
.  , -#
IsCancellationRequested  - D
)  D E
{!! 
return!! 
GetFreshResult!! #
(!!# $

parameters!!$ .
,!!. /
currentResult!!0 =
,!!= >

startState!!? I
,!!I J
wasCancelled!!K W
:!!W X
true!!Y ]
,!!] ^
transitionDefined!!_ p
:!!p q
true!!r v
,!!v w
conditionMet	!!x Ñ
:
!!Ñ Ö
false
!!Ü ã
)
!!ã å
;
!!å ç
}
!!é è
if## 
(## 
!## 
await## 
ConditionAsync## %
(##% &

parameters##& 0
.##0 1
Context##1 8
,##8 9

parameters##: D
.##D E
CancellationToken##E V
)##V W
.$$ 
ConfigureAwait$$ 
($$ %
continueOnCapturedContext$$ 8
:$$8 9
false$$: ?
)$$? @
)$$@ A
{%% 
return%% 
GetFreshResult%% #
(%%# $

parameters%%$ .
,%%. /
currentResult%%0 =
,%%= >

startState%%? I
,%%I J
wasCancelled%%K W
:%%W X

parameters%%Y c
.%%c d
CancellationToken%%d u
.%%u v$
IsCancellationRequested	%%v ç
,
%%ç é
transitionDefined
%%è †
:
%%† °
true
%%¢ ¶
,
%%¶ ß
conditionMet
%%® ¥
:
%%¥ µ
false
%%∂ ª
)
%%ª º
;
%%º Ω
}
%%æ ø
StateMutator'' 
('' 

parameters'' #
.''# $
Context''$ +
,''+ ,
ToState''- 4
)''4 5
;''5 6
var(( 
transitionResult((  
=((! "
GetFreshResult((# 1
(((1 2

parameters((2 <
,((< =
currentResult((> K
,((K L

startState((M W
,((W X
wasCancelled((Y e
:((e f
false((g l
,((l m
conditionMet((n z
:((z {
true	((| Ä
,
((Ä Å
transitionDefined
((Ç ì
:
((ì î
true
((ï ô
)
((ô ö
;
((ö õ
NotifyOfTransition)) 
()) 

parameters)) )
.))) *
Context))* 1
,))1 2
transitionResult))3 C
)))C D
;))D E
return++ 
transitionResult++ #
;++# $
},, 	
}-- 
}.. æ-
\C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoDynamic.cs
	namespace 	
NStateManager
 
{ 
internal 
class &
StateTransitionAutoDynamic -
<- .
T. /
,/ 0
TState1 7
,7 8
TTrigger9 A
>A B
:C D&
StateTransitionDynamicBaseE _
<_ `
T` a
,a b
TStatec i
,i j
TTriggerk s
>s t
where 
TState 
: 
IComparable "
{ 
private 
readonly 
IStateMachine &
<& '
T' (
,( )
TState* 0
,0 1
TTrigger2 :
>: ;
_stateMachine< I
;I J
private 
readonly 
TState 
_startState  +
;+ ,
private 
readonly 
TState 
_triggerState  -
;- .
private 
readonly 
Func 
< 
T 
,  
TState! '
>' (
_stateFunction) 7
;7 8
public &
StateTransitionAutoDynamic )
() *
IStateMachine* 7
<7 8
T8 9
,9 :
TState; A
,A B
TTriggerC K
>K L
stateMachineM Y
,
 
TState 

startState 
,
 
Func 
< 
T 
, 
TState 
> 
targetStateFunction /
,
 
TState 
triggerState 
,
 
string 
name 
,
 
uint 
priority 
) 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
nameJ N
,N O
priorityP X
)X Y
{ 	
_stateMachine 
= 
stateMachine (
;( )
_startState   
=   

startState   $
;  $ %
_triggerState!! 
=!! 
triggerState!! (
;!!( )
_stateFunction"" 
="" 
targetStateFunction"" 0
;""0 1
}## 	
public%% 
override%% !
StateTransitionResult%% -
<%%- .
TState%%. 4
,%%4 5
TTrigger%%6 >
>%%> ?
Execute%%@ G
(%%G H
ExecutionParameters%%H [
<%%[ \
T%%\ ]
,%%] ^
TTrigger%%_ g
>%%g h

parameters%%i s
,&&
 !
StateTransitionResult&& !
<&&! "
TState&&" (
,&&( )
TTrigger&&* 2
>&&2 3
currentResult&&4 A
=&&B C
null&&D H
)&&H I
{'' 	
if(( 
((( 
currentResult(( 
!=((  
null((! %
&&)) 
_startState)) 
.)) 
IsEqual)) &
())& '
currentResult))' 4
.))4 5
PreviousState))5 B
)))B C
&&** 
(** 
_triggerState** !
.**! "
IsEqual**" )
(**) *
currentResult*** 7
.**7 8
CurrentState**8 D
)**D E
||++ 
_stateMachine++ $
.++$ %
	IsInState++% .
(++. /

parameters++/ 9
.++9 :
Context++: A
,++A B
_triggerState++C P
)++P Q
)++Q R
)++R S
{,, 
StateMutator-- 
(-- 

parameters-- '
.--' (
Context--( /
,--/ 0
_stateFunction--1 ?
.--? @
Invoke--@ F
(--F G

parameters--G Q
.--Q R
Context--R Y
)--Y Z
)--Z [
;--[ \
var// 
transitioned//  
=//! "
!//# $
StateAccessor//$ 1
(//1 2

parameters//2 <
.//< =
Context//= D
)//D E
.//E F
IsEqual//F M
(//M N
_triggerState//N [
)//[ \
;//\ ]
var00 
result00 
=00 
GetFreshResult00 +
(00+ ,

parameters00, 6
,11 
currentResult11 !
,22 
currentResult22 !
.22! "
StartingState22" /
,33 
wasCancelled33  
:33  !
false33" '
,44 
transitionDefined44 %
:44% &
true44' +
,55 
conditionMet55  
:55  !
transitioned55" .
)55. /
;55/ 0
if66 
(66 
transitioned66  
)66  !
{77 
NotifyOfTransition77 $
(77$ %

parameters77% /
.77/ 0
Context770 7
,777 8
result779 ?
)77? @
;77@ A
}77B C
return99 
result99 
;99 
}:: 
return<< 
GetFreshResult<< !
(<<! "

parameters<<" ,
,== 
currentResult== 
,>> 
StateAccessor>> 
(>> 

parameters>> (
.>>( )
Context>>) 0
)>>0 1
,?? 
wasCancelled?? 
:?? 
false?? #
,@@ 
conditionMet@@ 
:@@ 
false@@ #
,AA 
transitionDefinedAA !
:AA! "
trueAA# '
)AA' (
;AA( )
}BB 	
}CC 
}DD ´2
aC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoDynamicAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class +
StateTransitionAutoDynamicAsync 2
<2 3
T3 4
,4 5
TState6 <
,< =
TTrigger> F
>F G
:H I&
StateTransitionDynamicBaseJ d
<d e
Te f
,f g
TStateh n
,n o
TTriggerp x
>x y
where 
TState 
: 
IComparable "
{ 
private 
readonly 
IStateMachineAsync +
<+ ,
T, -
,- .
TState/ 5
,5 6
TTrigger7 ?
>? @
_stateMachineA N
;N O
private 
readonly 
TState 
_startState  +
;+ ,
private 
readonly 
TState 
_triggerState  -
;- .
private 
readonly 
Func 
< 
T 
,  
TState! '
>' (
_stateFunction) 7
;7 8
public +
StateTransitionAutoDynamicAsync .
(. /
IStateMachineAsync/ A
<A B
TB C
,C D
TStateE K
,K L
TTriggerM U
>U V
stateMachineW c
,
 
TState 
startStartState "
,
 
Func 
< 
T 
, 
TState 
> 
targetStateFunction /
,
 
TState 
triggerState 
,
 
string 
name 
,
 
uint 
priority 
) 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
nameJ N
,N O
priorityP X
)X Y
{ 	
_stateMachine   
=   
stateMachine   (
;  ( )
_startState!! 
=!! 
startStartState!! )
;!!) *
_triggerState"" 
="" 
triggerState"" (
;""( )
_stateFunction## 
=## 
targetStateFunction## 0
;##0 1
}$$ 	
public&& 
override&& 
Task&& 
<&& !
StateTransitionResult&& 2
<&&2 3
TState&&3 9
,&&9 :
TTrigger&&; C
>&&C D
>&&D E
ExecuteAsync&&F R
(&&R S
ExecutionParameters&&S f
<&&f g
T&&g h
,&&h i
TTrigger&&j r
>&&r s

parameters&&t ~
,''
 !
StateTransitionResult'' !
<''! "
TState''" (
,''( )
TTrigger''* 2
>''2 3
currentResult''4 A
=''B C
null''D H
)''H I
{(( 	
if)) 
()) 
currentResult)) 
!=))  
null))! %
&&** 
!** 

parameters** 
.** 
CancellationToken** 0
.**0 1#
IsCancellationRequested**1 H
&&++ 
_startState++ 
.++ 
IsEqual++ &
(++& '
currentResult++' 4
.++4 5
PreviousState++5 B
)++B C
&&,, 
(,, 
_triggerState,, !
.,,! "
IsEqual,," )
(,,) *
currentResult,,* 7
.,,7 8
CurrentState,,8 D
),,D E
||-- 
_stateMachine-- $
.--$ %
	IsInState--% .
(--. /

parameters--/ 9
.--9 :
Context--: A
,--A B
_triggerState--C P
)--P Q
)--Q R
)--R S
{.. 
StateMutator// 
(// 

parameters// '
.//' (
Context//( /
,/// 0
_stateFunction//1 ?
.//? @
Invoke//@ F
(//F G

parameters//G Q
.//Q R
Context//R Y
)//Y Z
)//Z [
;//[ \
var11 
transitioned11  
=11! "
!11# $
StateAccessor11$ 1
(111 2

parameters112 <
.11< =
Context11= D
)11D E
.11E F
IsEqual11F M
(11M N
_triggerState11N [
)11[ \
;11\ ]
var22 
result22 
=22 
GetFreshResult22 +
(22+ ,

parameters22, 6
,33 
currentResult33 !
,44 
currentResult44 !
.44! "
StartingState44" /
,55 
wasCancelled55  
:55  !

parameters55" ,
.55, -
CancellationToken55- >
.55> ?#
IsCancellationRequested55? V
,66 
transitionDefined66 %
:66% &
true66' +
,77 
conditionMet77  
:77  !
transitioned77" .
)77. /
;77/ 0
if88 
(88 
transitioned88  
)88  !
{99 
NotifyOfTransition99 $
(99$ %

parameters99% /
.99/ 0
Context990 7
,997 8
result999 ?
)99? @
;99@ A
}99B C
return;; 
Task;; 
.;; 

FromResult;; &
(;;& '
result;;' -
);;- .
;;;. /
}<< 
return>> 
Task>> 
.>> 

FromResult>> "
(>>" #
GetFreshResult>># 1
(>>1 2

parameters>>2 <
,?? 
currentResult?? 
,@@ 
StateAccessor@@ 
(@@ 

parameters@@ (
.@@( )
Context@@) 0
)@@0 1
,AA 
wasCancelledAA 
:AA 

parametersAA (
.AA( )
CancellationTokenAA) :
.AA: ;#
IsCancellationRequestedAA; R
,BB 
transitionDefinedBB !
:BB! "
trueBB# '
,CC 
conditionMetCC 
:CC 
falseCC #
)CC# $
)CC$ %
;CC% &
}DD 	
}EE 
}FF ë6
iC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoDynamicParameterized.cs
	namespace 	
NStateManager
 
{ 
internal 
class 3
'StateTransitionAutoDynamicParameterized :
<: ;
T; <
,< =
TState> D
,D E
TTriggerF N
,N O
TRequestP X
>X Y
:Z [&
StateTransitionDynamicBase\ v
<v w
Tw x
,x y
TState	z Ä
,
Ä Å
TTrigger
Ç ä
>
ä ã
where 
TState 
: 
IComparable "
where 
TRequest 
: 
class 
{ 
private 
readonly 
IStateMachine &
<& '
T' (
,( )
TState* 0
,0 1
TTrigger2 :
>: ;
_stateMachine< I
;I J
private 
readonly 
TState 
_startState  +
;+ ,
private 
readonly 
TState 
_triggerState  -
;- .
private 
readonly 
Func 
< 
T 
,  
TRequest! )
,) *
TState+ 1
>1 2
_stateFunction3 A
;A B
public 3
'StateTransitionAutoDynamicParameterized 6
(6 7
IStateMachine7 D
<D E
TE F
,F G
TStateH N
,N O
TTriggerP X
>X Y
stateMachineZ f
,
 
TState 

startState 
,
 
Func 
< 
T 
, 
TRequest 
, 
TState $
>$ %
targetStateFunction& 9
,
 
TState 
triggerState 
,
 
string 
name 
,
 
uint 
priority 
) 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
nameJ N
,N O
priorityP X
)X Y
{ 	
_stateMachine   
=   
stateMachine   (
;  ( )
_startState!! 
=!! 

startState!! $
;!!$ %
_triggerState"" 
="" 
triggerState"" (
;""( )
_stateFunction## 
=## 
targetStateFunction## 0
;##0 1
}$$ 	
public&& 
override&& !
StateTransitionResult&& -
<&&- .
TState&&. 4
,&&4 5
TTrigger&&6 >
>&&> ?
Execute&&@ G
(&&G H
ExecutionParameters&&H [
<&&[ \
T&&\ ]
,&&] ^
TTrigger&&_ g
>&&g h

parameters&&i s
,''
 !
StateTransitionResult'' !
<''! "
TState''" (
,''( )
TTrigger''* 2
>''2 3
currentResult''4 A
=''B C
null''D H
)''H I
{(( 	
if)) 
()) 
!)) 
()) 

parameters)) 
.)) 
Request)) $
is))% '
TRequest))( 0
typeSafeParam))1 >
)))> ?
)))? @
{** 
throw** 
new** 
ArgumentException** )
(**) *
$"*** ,
Expected a **, 7
{**7 8
typeof**8 >
(**> ?
TRequest**? G
)**G H
.**H I
Name**I M
}**M N'
 parameter, but received a **N i
{**i j

parameters**j t
.**t u
Request**u |
?**| }
.**} ~
GetType	**~ Ö
(
**Ö Ü
)
**Ü á
.
**á à
Name
**à å
??
**ç è
$str
**ê ñ
}
**ñ ó
.
**ó ò
"
**ò ô
)
**ô ö
;
**ö õ
}
**ú ù
if,, 
(,, 
currentResult,, 
!=,,  
null,,! %
&&-- 
_startState-- 
.-- 
IsEqual-- &
(--& '
currentResult--' 4
.--4 5
PreviousState--5 B
)--B C
&&.. 
(.. 
_triggerState.. !
...! "
IsEqual.." )
(..) *
currentResult..* 7
...7 8
CurrentState..8 D
)..D E
||// 
_stateMachine// $
.//$ %
	IsInState//% .
(//. /

parameters/// 9
.//9 :
Context//: A
,//A B
_triggerState//C P
)//P Q
)//Q R
)//R S
{00 
StateMutator11 
(11 

parameters11 '
.11' (
Context11( /
,11/ 0
_stateFunction111 ?
(11? @

parameters11@ J
.11J K
Context11K R
,11R S
typeSafeParam11T a
)11a b
)11b c
;11c d
var33 
transitioned33  
=33! "
!33# $
StateAccessor33$ 1
(331 2

parameters332 <
.33< =
Context33= D
)33D E
.33E F
IsEqual33F M
(33M N
_triggerState33N [
)33[ \
;33\ ]
var44 
result44 
=44 
GetFreshResult44 +
(44+ ,

parameters44, 6
,55 
currentResult55 !
,66 
currentResult66 !
.66! "
StartingState66" /
,77 
wasCancelled77  
:77  !
false77" '
,88 
transitionDefined88 %
:88% &
true88' +
,99 
conditionMet99  
:99  !
transitioned99" .
)99. /
;99/ 0
if:: 
(:: 
transitioned::  
)::  !
{;; 
NotifyOfTransition;; $
(;;$ %

parameters;;% /
.;;/ 0
Context;;0 7
,;;7 8
result;;9 ?
);;? @
;;;@ A
};;B C
return== 
result== 
;== 
}>> 
return@@ 
GetFreshResult@@ !
(@@! "

parameters@@" ,
,AA 
currentResultAA 
,BB 
StateAccessorBB 
(BB 

parametersBB (
.BB( )
ContextBB) 0
)BB0 1
,CC 
wasCancelledCC 
:CC 
falseCC #
,DD 
conditionMetDD 
:DD 
falseDD #
,EE 
transitionDefinedEE !
:EE! "
trueEE# '
)EE' (
;EE( )
}FF 	
}GG 
}HH ™8
nC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoDynamicParameterizedAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class 8
,StateTransitionAutoDynamicParameterizedAsync ?
<? @
T@ A
,A B
TStateC I
,I J
TTriggerK S
,S T
TRequestU ]
>] ^
:_ `&
StateTransitionDynamicBasea {
<{ |
T| }
,} ~
TState	 Ö
,
Ö Ü
TTrigger
á è
>
è ê
where 
TState 
: 
IComparable "
where 
TRequest 
: 
class 
{ 
private 
readonly 
IStateMachineAsync +
<+ ,
T, -
,- .
TState/ 5
,5 6
TTrigger7 ?
>? @
_stateMachineA N
;N O
private 
readonly 
TState 
_startState  +
;+ ,
private 
readonly 
TState 
_triggerState  -
;- .
private 
readonly 
Func 
< 
T 
,  
TRequest! )
,) *
TState+ 1
>1 2
_stateFunction3 A
;A B
public 8
,StateTransitionAutoDynamicParameterizedAsync ;
(; <
IStateMachineAsync< N
<N O
TO P
,P Q
TStateR X
,X Y
TTriggerZ b
>b c
stateMachined p
,
 
TState 

startState 
,
 
Func 
< 
T 
, 
TRequest 
, 
TState $
>$ %
targetStateFunction& 9
,
 
TState 
triggerState 
,
 
string 
name 
,
 
uint 
priority 
) 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
nameJ N
,N O
priorityP X
)X Y
{ 	
_stateMachine   
=   
stateMachine   (
;  ( )
_startState!! 
=!! 

startState!! $
;!!$ %
_triggerState"" 
="" 
triggerState"" (
;""( )
_stateFunction## 
=## 
targetStateFunction## 0
;##0 1
}$$ 	
public&& 
override&& !
StateTransitionResult&& -
<&&- .
TState&&. 4
,&&4 5
TTrigger&&6 >
>&&> ?
Execute&&@ G
(&&G H
ExecutionParameters&&H [
<&&[ \
T&&\ ]
,&&] ^
TTrigger&&_ g
>&&g h

parameters&&i s
,''
 !
StateTransitionResult'' !
<''! "
TState''" (
,''( )
TTrigger''* 2
>''2 3
currentResult''4 A
=''B C
null''D H
)''H I
{(( 	
if)) 
()) 
!)) 
()) 

parameters)) 
.)) 
Request)) $
is))% '
TRequest))( 0
typeSafeParam))1 >
)))> ?
)))? @
{** 
throw** 
new** 
ArgumentException** )
(**) *
$"*** ,
Expected a **, 7
{**7 8
typeof**8 >
(**> ?
TRequest**? G
)**G H
.**H I
Name**I M
}**M N'
 parameter, but received a **N i
{**i j

parameters**j t
.**t u
Request**u |
?**| }
.**} ~
GetType	**~ Ö
(
**Ö Ü
)
**Ü á
.
**á à
Name
**à å
??
**ç è
$str
**ê ñ
}
**ñ ó
.
**ó ò
"
**ò ô
)
**ô ö
;
**ö õ
}
**ú ù
if,, 
(,, 
currentResult,, 
!=,,  
null,,! %
&&-- 
!-- 

parameters-- 
.-- 
CancellationToken-- 0
.--0 1#
IsCancellationRequested--1 H
&&.. 
_startState.. 
... 
IsEqual.. &
(..& '
currentResult..' 4
...4 5
PreviousState..5 B
)..B C
&&// 
(// 
_triggerState// !
.//! "
IsEqual//" )
(//) *
currentResult//* 7
.//7 8
CurrentState//8 D
)//D E
||00 
_stateMachine00 $
.00$ %
	IsInState00% .
(00. /

parameters00/ 9
.009 :
Context00: A
,00A B
_triggerState00C P
)00P Q
)00Q R
)00R S
{11 
StateMutator22 
(22 

parameters22 '
.22' (
Context22( /
,22/ 0
_stateFunction221 ?
(22? @

parameters22@ J
.22J K
Context22K R
,22R S
typeSafeParam22T a
)22a b
)22b c
;22c d
var44 
transitioned44  
=44! "
!44# $
StateAccessor44$ 1
(441 2

parameters442 <
.44< =
Context44= D
)44D E
.44E F
IsEqual44F M
(44M N
_triggerState44N [
)44[ \
;44\ ]
var55 
result55 
=55 
GetFreshResult55 +
(55+ ,

parameters55, 6
,66 
currentResult66 !
,77 
currentResult77 !
.77! "
StartingState77" /
,88 
wasCancelled88  
:88  !
false88" '
,99 
transitionDefined99 %
:99% &
true99' +
,:: 
conditionMet::  
:::  !
transitioned::" .
)::. /
;::/ 0
if;; 
(;; 
transitioned;;  
);;  !
{<< 
NotifyOfTransition<< $
(<<$ %

parameters<<% /
.<</ 0
Context<<0 7
,<<7 8
result<<9 ?
)<<? @
;<<@ A
}<<B C
return>> 
result>> 
;>> 
}?? 
returnAA 
GetFreshResultAA !
(AA! "

parametersAA" ,
,BB 
currentResultBB 
,CC 
StateAccessorCC 
(CC 

parametersCC (
.CC( )
ContextCC) 0
)CC0 1
,DD 
wasCancelledDD 
:DD 

parametersDD (
.DD( )
CancellationTokenDD) :
.DD: ;#
IsCancellationRequestedDD; R
,EE 
transitionDefinedEE !
:EE! "
trueEE# '
,FF 
conditionMetFF 
:FF 
falseFF #
)FF# $
;FF$ %
}GG 	
}HH 
}II µ"
]C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoFallback.cs
	namespace 	
NStateManager
 
{ 
internal 
class '
StateTransitionAutoFallback .
<. /
T/ 0
,0 1
TState2 8
,8 9
TTrigger: B
>B C
:D E
StateTransitionF U
<U V
TV W
,W X
TStateY _
,_ `
TTriggera i
>i j
where 
TState 
: 
IComparable "
{ 
private 
readonly 
IStateMachine &
<& '
T' (
,( )
TState* 0
,0 1
TTrigger2 :
>: ;
_stateMachine< I
;I J
private 
readonly 
TState 
_startState  +
;+ ,
private 
readonly 
TState 
_triggerState  -
;- .
public '
StateTransitionAutoFallback *
(* +
IStateMachine+ 8
<8 9
T9 :
,: ;
TState< B
,B C
TTriggerD L
>L M
stateMachineN Z
,
 
TState 

startState 
,
 
TState 
triggerState 
,
 
TState 
toState 
,
 
Func 
< 
T 
, 
bool 
> 
	condition #
,
 
string 
name 
,
 
uint 
priority 
) 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
toStateJ Q
,Q R
	conditionS \
,\ ]
name^ b
,b c
priorityd l
)l m
{ 	
_stateMachine 
= 
stateMachine (
;( )
_startState   
=   

startState   $
;  $ %
_triggerState!! 
=!! 
triggerState!! (
;!!( )
}"" 	
public$$ 
override$$ !
StateTransitionResult$$ -
<$$- .
TState$$. 4
,$$4 5
TTrigger$$6 >
>$$> ?
Execute$$@ G
($$G H
ExecutionParameters$$H [
<$$[ \
T$$\ ]
,$$] ^
TTrigger$$_ g
>$$g h

parameters$$i s
,%%
 !
StateTransitionResult%% !
<%%! "
TState%%" (
,%%( )
TTrigger%%* 2
>%%2 3
currentResult%%4 A
=%%B C
null%%D H
)%%H I
{&& 	
if'' 
('' 
currentResult'' 
!=''  
null''! %
&&(( 
_startState(( 
.(( 
IsEqual(( &
(((& '
currentResult((' 4
.((4 5
PreviousState((5 B
)((B C
&&)) 
()) 
_triggerState)) !
.))! "
IsEqual))" )
())) *
currentResult))* 7
.))7 8
CurrentState))8 D
)))D E
||** 
_stateMachine** $
.**$ %
	IsInState**% .
(**. /

parameters**/ 9
.**9 :
Context**: A
,**A B
_triggerState**C P
)**P Q
)**Q R
)**R S
{++ 
return++ 
base++ 
.++ 
Execute++ !
(++! "

parameters++" ,
,++, -
currentResult++. ;
)++; <
;++< =
}++> ?
return-- 
GetFreshResult-- !
(--! "

parameters--" ,
,.. 
currentResult.. 
,// 
StateAccessor// 
(// 

parameters// (
.//( )
Context//) 0
)//0 1
,00 
wasCancelled00 
:00 
false00 #
,11 
transitionDefined11 !
:11! "
true11# '
,22 
conditionMet22 
:22 
false22 #
)22# $
;22$ %
}33 	
}44 
}55 Ã&
bC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoFallbackAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class ,
 StateTransitionAutoFallbackAsync 3
<3 4
T4 5
,5 6
TState7 =
,= >
TTrigger? G
>G H
:I J 
StateTransitionAsyncK _
<_ `
T` a
,a b
TStatec i
,i j
TTriggerk s
>s t
where 
TState 
: 
IComparable "
{ 
private 
readonly 
IStateMachineAsync +
<+ ,
T, -
,- .
TState/ 5
,5 6
TTrigger7 ?
>? @
_stateMachineA N
;N O
private 
readonly 
TState 
_startState  +
;+ ,
private 
readonly 
TState 
_triggerState  -
;- .
public ,
 StateTransitionAutoFallbackAsync /
(/ 0
IStateMachineAsync0 B
<B C
TC D
,D E
TStateF L
,L M
TTriggerN V
>V W
stateMachineX d
,d e
TStatef l

startStatem w
,w x
TStatey 
triggerState
Ä å
,
å ç
TState
é î
toState
ï ú
,
ú ù
Func
û ¢
<
¢ £
T
£ §
,
§ •
CancellationToken
¶ ∑
,
∑ ∏
Task
π Ω
<
Ω æ
bool
æ ¬
>
¬ √
>
√ ƒ
conditionAsync
≈ ”
,
” ‘
string
’ €
name
‹ ‡
,
‡ ·
uint
‚ Ê
priority
Á Ô
)
Ô 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
toStateJ Q
,Q R
conditionAsyncS a
,a b
namec g
,g h
priorityi q
)q r
{ 	
_stateMachine 
= 
stateMachine (
;( )
_startState 
= 

startState $
;$ %
_triggerState 
= 
triggerState (
;( )
} 	
public   
override   
async   
Task   "
<  " #!
StateTransitionResult  # 8
<  8 9
TState  9 ?
,  ? @
TTrigger  A I
>  I J
>  J K
ExecuteAsync  L X
(  X Y
ExecutionParameters  Y l
<  l m
T  m n
,  n o
TTrigger  p x
>  x y

parameters	  z Ñ
,!!
 !
StateTransitionResult!! !
<!!! "
TState!!" (
,!!( )
TTrigger!!* 2
>!!2 3
currentResult!!4 A
=!!B C
null!!D H
)!!H I
{"" 	
if## 
(## 
currentResult## 
!=##  
null##! %
&&$$ 
!$$ 

parameters$$ 
.$$ 
CancellationToken$$ 0
.$$0 1#
IsCancellationRequested$$1 H
&&%% 
_startState%% 
.%% 
IsEqual%% &
(%%& '
currentResult%%' 4
.%%4 5
PreviousState%%5 B
)%%B C
&&&& 
(&& 
_triggerState&& !
.&&! "
IsEqual&&" )
(&&) *
currentResult&&* 7
.&&7 8
CurrentState&&8 D
)&&D E
||'' 
_stateMachine'' $
.''$ %
	IsInState''% .
(''. /

parameters''/ 9
.''9 :
Context'': A
,''A B
_triggerState''C P
)''P Q
)''Q R
)''R S
{(( 
return(( 
await(( 
base(( 
.((  
ExecuteAsync((  ,
(((, -

parameters((- 7
,((7 8
currentResult((9 F
)((F G
;((G H
}((I J
return** 
GetFreshResult** !
(**! "

parameters**" ,
,++ 
currentResult++ 
,,, 
StateAccessor,, 
(,, 

parameters,, (
.,,( )
Context,,) 0
),,0 1
,-- 
wasCancelled-- 
:-- 

parameters-- (
.--( )
CancellationToken--) :
.--: ;#
IsCancellationRequested--; R
,.. 
transitionDefined.. !
:..! "
true..# '
,// 
conditionMet// 
:// 
false// #
)//# $
;//$ %
}00 	
}11 
}22 ¶$
jC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoFallbackParameterized.cs
	namespace 	
NStateManager
 
{ 
internal 
class 4
(StateTransitionAutoFallbackParameterized ;
<; <
T< =
,= >
TState? E
,E F
TTriggerG O
,O P
TParamQ W
>W X
:Y Z(
StateTransitionParameterized[ w
<w x
Tx y
,y z
TState	{ Å
,
Å Ç
TTrigger
É ã
,
ã å
TParam
ç ì
>
ì î
where 
TState 
: 
IComparable "
where 
TParam 
: 
class 
{ 
private 
readonly 
IStateMachine &
<& '
T' (
,( )
TState* 0
,0 1
TTrigger2 :
>: ;
_stateMachine< I
;I J
private 
readonly 
TState 
_startState  +
;+ ,
private 
readonly 
TState 
_triggerState  -
;- .
public 4
(StateTransitionAutoFallbackParameterized 7
(7 8
IStateMachine8 E
<E F
TF G
,G H
TStateI O
,O P
TTriggerQ Y
>Y Z
stateMachine[ g
,
 
TState 

startState 
,
 
TState 
triggerState 
,
 
TState 
toState 
,
 
Func 
< 
T 
, 
TParam 
, 
bool  
>  !
	condition" +
,
 
string 
name 
,
 
uint 
priority 
) 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
toStateJ Q
,Q R
	conditionS \
,\ ]
name^ b
,b c
priorityd l
)l m
{ 	
_stateMachine   
=   
stateMachine   (
;  ( )
_startState!! 
=!! 

startState!! $
;!!$ %
_triggerState"" 
="" 
triggerState"" (
;""( )
}## 	
public%% 
override%% !
StateTransitionResult%% -
<%%- .
TState%%. 4
,%%4 5
TTrigger%%6 >
>%%> ?
Execute%%@ G
(%%G H
ExecutionParameters%%H [
<%%[ \
T%%\ ]
,%%] ^
TTrigger%%_ g
>%%g h

parameters%%i s
,&&
 !
StateTransitionResult&& !
<&&! "
TState&&" (
,&&( )
TTrigger&&* 2
>&&2 3
currentResult&&4 A
=&&B C
null&&D H
)&&H I
{'' 	
if(( 
((( 
currentResult(( 
!=((  
null((! %
&&)) 
_startState)) 
.)) 
IsEqual)) &
())& '
currentResult))' 4
.))4 5
PreviousState))5 B
)))B C
&&** 
(** 
_triggerState** !
.**! "
IsEqual**" )
(**) *
currentResult*** 7
.**7 8
CurrentState**8 D
)**D E
||++ 
_stateMachine++ $
.++$ %
	IsInState++% .
(++. /

parameters++/ 9
.++9 :
Context++: A
,++A B
_triggerState++C P
)++P Q
)++Q R
)++R S
{,, 
return,, 
base,, 
.,, 
Execute,, !
(,,! "

parameters,," ,
,,,, -
currentResult,,. ;
),,; <
;,,< =
},,> ?
return.. 
GetFreshResult.. !
(..! "

parameters.." ,
,// 
currentResult// 
,00 
StateAccessor00 
(00 

parameters00 (
.00( )
Context00) 0
)000 1
,11 
wasCancelled11 
:11 
false11 #
,22 
transitionDefined22 !
:22! "
true22# '
,33 
conditionMet33 
:33 
false33 #
)33# $
;33$ %
}44 	
}55 
}66 Œ(
oC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoFallbackParameterizedAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class 9
-StateTransitionAutoFallbackParameterizedAsync @
<@ A
TA B
,B C
TStateD J
,J K
TTriggerL T
,T U
TParamV \
>\ ]
:^ _.
!StateTransitionParameterizedAsync	` Å
<
Å Ç
T
Ç É
,
É Ñ
TState
Ö ã
,
ã å
TTrigger
ç ï
,
ï ñ
TParam
ó ù
>
ù û
where 
TParam 
: 
class 
where 
TState 
: 
IComparable "
{ 
private 
readonly 
IStateMachineAsync +
<+ ,
T, -
,- .
TState/ 5
,5 6
TTrigger7 ?
>? @
_stateMachineA N
;N O
private 
readonly 
TState 
_startState  +
;+ ,
private 
readonly 
TState 
_triggerState  -
;- .
public 9
-StateTransitionAutoFallbackParameterizedAsync <
(< =
IStateMachineAsync= O
<O P
TP Q
,Q R
TStateS Y
,Y Z
TTrigger[ c
>c d
stateMachinee q
,q r
TStates y

startState	z Ñ
,
Ñ Ö
TState
Ü å
toState
ç î
,
î ï
TState
ñ ú
triggerState
ù ©
,
© ™
Func
´ Ø
<
Ø ∞
T
∞ ±
,
± ≤
TParam
≥ π
,
π ∫
CancellationToken
ª Ã
,
Ã Õ
Task
Œ “
<
“ ”
bool
” ◊
>
◊ ÿ
>
ÿ Ÿ
conditionAsync
⁄ Ë
,
Ë È
string
Í 
name
Ò ı
,
ı ˆ
uint
˜ ˚
priority
¸ Ñ
)
Ñ Ö
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
toStateJ Q
,Q R
conditionAsyncS a
,a b
namec g
,g h
priorityi q
)q r
{ 	
_stateMachine 
= 
stateMachine (
;( )
_startState 
= 

startState $
;$ %
_triggerState 
= 
triggerState (
;( )
} 	
public!! 
override!! 
async!! 
Task!! "
<!!" #!
StateTransitionResult!!# 8
<!!8 9
TState!!9 ?
,!!? @
TTrigger!!A I
>!!I J
>!!J K
ExecuteAsync!!L X
(!!X Y
ExecutionParameters!!Y l
<!!l m
T!!m n
,!!n o
TTrigger!!p x
>!!x y

parameters	!!z Ñ
,""
 !
StateTransitionResult"" !
<""! "
TState""" (
,""( )
TTrigger""* 2
>""2 3
currentResult""4 A
=""B C
null""D H
)""H I
{## 	
if$$ 
($$ 
currentResult$$ 
!=$$  
null$$! %
&&%% 
!%% 

parameters%% 
.%% 
CancellationToken%% 0
.%%0 1#
IsCancellationRequested%%1 H
&&&& 
_startState&& 
.&& 
IsEqual&& &
(&&& '
currentResult&&' 4
.&&4 5
PreviousState&&5 B
)&&B C
&&'' 
('' 
_triggerState'' !
.''! "
IsEqual''" )
('') *
currentResult''* 7
.''7 8
CurrentState''8 D
)''D E
||(( 
_stateMachine(( !
.((! "
	IsInState((" +
(((+ ,

parameters((, 6
.((6 7
Context((7 >
,((> ?
_triggerState((@ M
)((M N
)((N O
)((O P
{)) 
return)) 
await)) 
base)) 
.))  
ExecuteAsync))  ,
()), -

parameters))- 7
,))7 8
currentResult))9 F
)))F G
;))G H
}))I J
return++ 
GetFreshResult++ !
(++! "

parameters++" ,
,,, 
currentResult,, 
,-- 
StateAccessor-- 
(-- 

parameters-- (
.--( )
Context--) 0
)--0 1
,.. 
wasCancelled.. 
:.. 

parameters.. (
...( )
CancellationToken..) :
...: ;#
IsCancellationRequested..; R
,// 
transitionDefined// !
://! "
true//# '
,00 
conditionMet00 
:00 
false00 #
)00# $
;00$ %
}11 	
}22 
}33 ë
\C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoForward.cs
	namespace 	
NStateManager
 
{ 
internal 
class &
StateTransitionAutoForward -
<- .
T. /
,/ 0
TState1 7
,7 8
TTrigger9 A
>A B
:C D
StateTransitionE T
<T U
TU V
,V W
TStateX ^
,^ _
TTrigger` h
>h i
where 
TState 
: 
IComparable "
{ 
private 
readonly 
IStateMachine &
<& '
T' (
,( )
TState* 0
,0 1
TTrigger2 :
>: ;
_stateMachine< I
;I J
private 
readonly 
TState 
_triggerState  -
;- .
public &
StateTransitionAutoForward )
() *
IStateMachine* 7
<7 8
T8 9
,9 :
TState; A
,A B
TTriggerC K
>K L
stateMachineM Y
,
 
TState 
triggerState 
,
 
TState 
toState 
,
 
Func 
< 
T 
, 
bool 
> 
	condition #
,
 
string 
name 
,
 
uint 
priority 
) 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
toStateJ Q
,Q R
	conditionS \
,\ ]
name^ b
,b c
priorityd l
)l m
{ 	
_stateMachine 
= 
stateMachine (
;( )
_triggerState 
= 
triggerState (
;( )
} 	
public!! 
override!! !
StateTransitionResult!! -
<!!- .
TState!!. 4
,!!4 5
TTrigger!!6 >
>!!> ?
Execute!!@ G
(!!G H
ExecutionParameters!!H [
<!![ \
T!!\ ]
,!!] ^
TTrigger!!_ g
>!!g h

parameters!!i s
,""
 !
StateTransitionResult"" !
<""! "
TState""" (
,""( )
TTrigger""* 2
>""2 3
currentResult""4 A
=""B C
null""D H
)""H I
{## 	
if$$ 
($$ 
currentResult$$ 
!=$$  
null$$! %
&&%% 
(%% 
_triggerState%% !
.%%! "
IsEqual%%" )
(%%) *
currentResult%%* 7
.%%7 8
CurrentState%%8 D
)%%D E
||&& 
_stateMachine&& $
.&&$ %
	IsInState&&% .
(&&. /

parameters&&/ 9
.&&9 :
Context&&: A
,&&A B
_triggerState&&C P
)&&P Q
)&&Q R
)&&R S
{'' 
return'' 
base'' 
.'' 
Execute'' !
(''! "

parameters''" ,
,'', -
currentResult''. ;
)''; <
;''< =
}''> ?
return)) 
GetFreshResult)) !
())! "

parameters))" ,
,** 
currentResult** 
,++ 
StateAccessor++ 
(++ 

parameters++ (
.++( )
Context++) 0
)++0 1
,,, 
wasCancelled,, 
:,, 
false,, #
,-- 
transitionDefined-- !
:--! "
true--# '
,.. 
conditionMet.. 
:.. 
false.. #
)..# $
;..$ %
}// 	
}00 
}11 £#
aC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoForwardAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class +
StateTransitionAutoForwardAsync 2
<2 3
T3 4
,4 5
TState6 <
,< =
TTrigger> F
>F G
:H I 
StateTransitionAsyncJ ^
<^ _
T_ `
,` a
TStateb h
,h i
TTriggerj r
>r s
where 
TState 
: 
IComparable "
{ 
private 
readonly 
IStateMachineAsync +
<+ ,
T, -
,- .
TState/ 5
,5 6
TTrigger7 ?
>? @
_stateMachineA N
;N O
private 
readonly 
TState 
_triggerState  -
;- .
public +
StateTransitionAutoForwardAsync .
(. /
IStateMachineAsync/ A
<A B
TB C
,C D
TStateE K
,K L
TTriggerM U
>U V
stateMachineW c
,c d
TStatee k
triggerStatel x
,x y
TState	z Ä
toState
Å à
,
à â
Func
ä é
<
é è
T
è ê
,
ê ë
CancellationToken
í £
,
£ §
Task
• ©
<
© ™
bool
™ Æ
>
Æ Ø
>
Ø ∞
conditionAsync
± ø
,
ø ¿
string
¡ «
name
» Ã
,
Ã Õ
uint
Œ “
priority
” €
)
€ ‹
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
toStateJ Q
,Q R
conditionAsyncS a
,a b
namec g
,g h
priorityi q
)q r
{ 	
_stateMachine 
= 
stateMachine (
;( )
_triggerState 
= 
triggerState (
;( )
} 	
public 
override 
async 
Task "
<" #!
StateTransitionResult# 8
<8 9
TState9 ?
,? @
TTriggerA I
>I J
>J K
ExecuteAsyncL X
(X Y
ExecutionParametersY l
<l m
Tm n
,n o
TTriggerp x
>x y

parameters	z Ñ
,
 !
StateTransitionResult !
<! "
TState" (
,( )
TTrigger* 2
>2 3
currentResult4 A
=B C
nullD H
)H I
{   	
if!! 
(!! 
currentResult!! 
!=!!  
null!!! %
&&"" 
!"" 

parameters"" 
."" 
CancellationToken"" 0
.""0 1#
IsCancellationRequested""1 H
&&## 
(## 
_triggerState## !
.##! "
IsEqual##" )
(##) *
currentResult##* 7
.##7 8
CurrentState##8 D
)##D E
||$$ 
_stateMachine$$ $
.$$$ %
	IsInState$$% .
($$. /

parameters$$/ 9
.$$9 :
Context$$: A
,$$A B
_triggerState$$C P
)$$P Q
)$$Q R
)$$R S
{%% 
return%% 
await%% 
base%% 
.%%  
ExecuteAsync%%  ,
(%%, -

parameters%%- 7
,%%7 8
currentResult%%9 F
)%%F G
;%%G H
}%%I J
return'' 
GetFreshResult'' !
(''! "

parameters''" ,
,(( 
currentResult(( 
,)) 
StateAccessor)) 
()) 

parameters)) (
.))( )
Context))) 0
)))0 1
,** 
wasCancelled** 
:** 

parameters** (
.**( )
CancellationToken**) :
.**: ;#
IsCancellationRequested**; R
,++ 
transitionDefined++ !
:++! "
true++# '
,,, 
conditionMet,, 
:,, 
false,, #
),,# $
;,,$ %
}-- 	
}.. 
}// «'
iC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoForwardParameterized.cs
	namespace 	
NStateManager
 
{ 
internal 
class 3
'StateTransitionAutoForwardParameterized :
<: ;
T; <
,< =
TState> D
,D E
TTriggerF N
,N O
TParamP V
>V W
:X Y(
StateTransitionParameterizedZ v
<v w
Tw x
,x y
TState	z Ä
,
Ä Å
TTrigger
Ç ä
,
ä ã
TParam
å í
>
í ì
where 
TState 
: 
IComparable "
where 
TParam 
: 
class 
{ 
private 
readonly 
IStateMachine &
<& '
T' (
,( )
TState* 0
,0 1
TTrigger2 :
>: ;
_stateMachine< I
;I J
private 
readonly 
TState 
_triggerState  -
;- .
public 3
'StateTransitionAutoForwardParameterized 6
(6 7
IStateMachine7 D
<D E
TE F
,F G
TStateH N
,N O
TTriggerP X
>X Y
stateMachineZ f
,
 
TState 
triggerState 
,
 
TState 
toState 
,
 
Func 
< 
T 
, 
TParam 
, 
bool  
>  !
	condition" +
,
 
string 
name 
,
 
uint 
priority 
) 
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
toStateJ Q
,Q R
	conditionS \
,\ ]
name^ b
,b c
priorityd l
)l m
{ 	
_stateMachine 
= 
stateMachine (
;( )
_triggerState 
= 
triggerState (
;( )
}   	
public"" 
override"" !
StateTransitionResult"" -
<""- .
TState"". 4
,""4 5
TTrigger""6 >
>""> ?
Execute""@ G
(""G H
ExecutionParameters""H [
<""[ \
T""\ ]
,""] ^
TTrigger""_ g
>""g h

parameters""i s
,##
 !
StateTransitionResult## !
<##! "
TState##" (
,##( )
TTrigger##* 2
>##2 3
currentResult##4 A
=##B C
null##D H
)##H I
{$$ 	
if%% 
(%% 
!%% 
(%% 

parameters%% 
.%% 
Request%% $
is%%% '
TParam%%( .
)%%. /
)%%/ 0
{&& 
throw&& 
new&& 
ArgumentException&& )
(&&) *
$"&&* ,
Expected a &&, 7
{&&7 8
typeof&&8 >
(&&> ?
TParam&&? E
)&&E F
.&&F G
Name&&G K
}&&K L'
 parameter, but received a &&L g
{&&g h

parameters&&h r
.&&r s
Request&&s z
?&&z {
.&&{ |
GetType	&&| É
(
&&É Ñ
)
&&Ñ Ö
.
&&Ö Ü
Name
&&Ü ä
??
&&ã ç
$str
&&é î
}
&&î ï
.
&&ï ñ
"
&&ñ ó
)
&&ó ò
;
&&ò ô
}
&&ö õ
if(( 
((( 
currentResult(( 
!=((  
null((! %
&&)) 
()) 
_triggerState)) !
.))! "
IsEqual))" )
())) *
currentResult))* 7
.))7 8
CurrentState))8 D
)))D E
||** 
_stateMachine** $
.**$ %
	IsInState**% .
(**. /

parameters**/ 9
.**9 :
Context**: A
,**A B
_triggerState**C P
)**P Q
)**Q R
)**R S
{++ 
return++ 
base++ 
.++ 
Execute++ !
(++! "

parameters++" ,
,++, -
currentResult++. ;
)++; <
;++< =
}++> ?
return-- 
GetFreshResult-- !
(--! "

parameters--" ,
,.. 
currentResult.. 
,// 
StateAccessor// 
(// 

parameters// (
.//( )
Context//) 0
)//0 1
,00 
wasCancelled00 
:00 
false00 #
,11 
transitionDefined11 !
:11! "
true11# '
,22 
conditionMet22 
:22 
false22 #
)22# $
;22$ %
}33 	
}44 
}55 §%
nC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionAutoForwardParameterizedAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class 8
,StateTransitionAutoForwardParameterizedAsync ?
<? @
T@ A
,A B
TStateC I
,I J
TTriggerK S
,S T
TParamU [
>[ \
:] ^.
!StateTransitionParameterizedAsync	_ Ä
<
Ä Å
T
Å Ç
,
Ç É
TState
Ñ ä
,
ä ã
TTrigger
å î
,
î ï
TParam
ñ ú
>
ú ù
where 
TParam 
: 
class 
where 
TState 
: 
IComparable "
{ 
private 
readonly 
IStateMachineAsync +
<+ ,
T, -
,- .
TState/ 5
,5 6
TTrigger7 ?
>? @
_stateMachineA N
;N O
private 
readonly 
TState 
_triggerState  -
;- .
public 8
,StateTransitionAutoForwardParameterizedAsync ;
(; <
IStateMachineAsync< N
<N O
TO P
,P Q
TStateR X
,X Y
TTriggerZ b
>b c
stateMachined p
,p q
TStater x
toState	y Ä
,
Ä Å
TState
Ç à
triggerState
â ï
,
ï ñ
Func
ó õ
<
õ ú
T
ú ù
,
ù û
TParam
ü •
,
• ¶
CancellationToken
ß ∏
,
∏ π
Task
∫ æ
<
æ ø
bool
ø √
>
√ ƒ
>
ƒ ≈
conditionAsync
∆ ‘
,
‘ ’
string
÷ ‹
name
› ·
,
· ‚
uint
„ Á
priority
Ë 
)
 Ò
: 
base 
( 
stateMachine 
.  
StateAccessor  -
,- .
stateMachine/ ;
.; <
StateMutator< H
,H I
toStateJ Q
,Q R
conditionAsyncS a
,a b
namec g
,g h
priorityi q
)q r
{ 	
_stateMachine 
= 
stateMachine (
;( )
_triggerState 
= 
triggerState (
;( )
} 	
public 
override 
async 
Task "
<" #!
StateTransitionResult# 8
<8 9
TState9 ?
,? @
TTriggerA I
>I J
>J K
ExecuteAsyncL X
(X Y
ExecutionParametersY l
<l m
Tm n
,n o
TTriggerp x
>x y

parameters	z Ñ
,  
 !
StateTransitionResult   !
<  ! "
TState  " (
,  ( )
TTrigger  * 2
>  2 3
currentResult  4 A
=  B C
null  D H
)  H I
{!! 	
if"" 
("" 
currentResult"" 
!=""  
null""! %
&&## 
!## 

parameters## 
.## 
CancellationToken## 0
.##0 1#
IsCancellationRequested##1 H
&&$$ 
($$ 
_triggerState$$ !
.$$! "
IsEqual$$" )
($$) *
currentResult$$* 7
.$$7 8
CurrentState$$8 D
)$$D E
||%% 
_stateMachine%% !
.%%! "
	IsInState%%" +
(%%+ ,

parameters%%, 6
.%%6 7
Context%%7 >
,%%> ?
_triggerState%%@ M
)%%M N
)%%N O
)%%O P
{&& 
return&& 
await&& 
base&& 
.&&  
ExecuteAsync&&  ,
(&&, -

parameters&&- 7
,&&7 8
currentResult&&9 F
)&&F G
;&&G H
}&&I J
return(( 
GetFreshResult(( !
(((! "

parameters((" ,
,)) 
currentResult)) 
,** 
StateAccessor** 
(** 

parameters** (
.**( )
Context**) 0
)**0 1
,++ 
wasCancelled++ 
:++ 

parameters++ (
.++( )
CancellationToken++) :
.++: ;#
IsCancellationRequested++; R
,,, 
transitionDefined,, !
:,,! "
true,,# '
,-- 
conditionMet-- 
:-- 
false-- #
)--# $
;--$ %
}.. 	
}// 
}00 ë6
UC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionBase.cs
	namespace 	
NStateManager
 
{ 
public 

abstract 
class 
StateTransitionBase -
<- .
T. /
,/ 0
TState1 7
,7 8
TTrigger9 A
>A B
{ 
public 
static 
event 
Action "
<" #
T# $
,$ %!
StateTransitionResult& ;
<; <
TState< B
,B C
TTriggerD L
>L M
>M N
OnTransitionedEventO b
;b c
	protected 
string 
Name 
; 
	protected 
internal 
uint 
Priority  (
;( )
	protected 
Func 
< 
T 
, 
TState  
>  !
StateAccessor" /
{0 1
get2 5
;5 6
}7 8
	protected 
Action 
< 
T 
, 
TState "
>" #
StateMutator$ 0
{1 2
get3 6
;6 7
}8 9
	protected 
StateTransitionBase %
(% &
Func& *
<* +
T+ ,
,, -
TState. 4
>4 5
stateAccessor6 C
, 
Action 
< 
T 
, 
TState 
> 
stateMutator  ,
, 
string 
name 
, 
uint 
priority 
) 
{ 	
StateAccessor 
= 
stateAccessor )
??* ,
throw- 2
new3 6!
ArgumentNullException7 L
(L M
nameofM S
(S T
stateAccessorT a
)a b
)b c
;c d
StateMutator 
= 
stateMutator '
??( *
throw+ 0
new1 4!
ArgumentNullException5 J
(J K
nameofK Q
(Q R
stateMutatorR ^
)^ _
)_ `
;` a
Name   
=   
name   
??   
$str   &
;  & '
Priority!! 
=!! 
priority!! 
;!!  
}"" 	
public$$ 
virtual$$ !
StateTransitionResult$$ ,
<$$, -
TState$$- 3
,$$3 4
TTrigger$$5 =
>$$= >
Execute$$? F
($$F G
ExecutionParameters$$G Z
<$$Z [
T$$[ \
,$$\ ]
TTrigger$$^ f
>$$f g

parameters$$h r
,%%
 !
StateTransitionResult%% !
<%%! "
TState%%" (
,%%( )
TTrigger%%* 2
>%%2 3
currentResult%%4 A
=%%B C
null%%D H
)%%H I
{&& 	
throw'' 
new'' #
NotImplementedException'' -
(''- .
$str	''. ì
)
''ì î
;
''î ï
}(( 	
public** 
virtual** 
Task** 
<** !
StateTransitionResult** 1
<**1 2
TState**2 8
,**8 9
TTrigger**: B
>**B C
>**C D
ExecuteAsync**E Q
(**Q R
ExecutionParameters**R e
<**e f
T**f g
,**g h
TTrigger**i q
>**q r

parameters**s }
,++
 !
StateTransitionResult++ !
<++! "
TState++" (
,++( )
TTrigger++* 2
>++2 3
currentResult++4 A
=++B C
null++D H
)++H I
{,, 	
throw-- 
new-- #
NotImplementedException-- -
(--- .
$str	--. ì
)
--ì î
;
--î ï
}.. 	
	protected00 !
StateTransitionResult00 '
<00' (
TState00( .
,00. /
TTrigger000 8
>008 9
GetFreshResult00: H
(00H I
ExecutionParameters00I \
<00\ ]
T00] ^
,00^ _
TTrigger00` h
>00h i

parameters00j t
,11 !
StateTransitionResult11 #
<11# $
TState11$ *
,11* +
TTrigger11, 4
>114 5
previousResult116 D
,22 
TState22 

startState22 
,33 
bool33 
transitionDefined33 $
,44 
bool44 
conditionMet44 
,55 
bool55 
wasCancelled55 
)55  
{66 	
bool77 
wasSuccessful77 
=77  
(77! "
transitionDefined77" 3
&&774 6
conditionMet777 C
&&77D F
!77G H
wasCancelled77H T
)77T U
;77U V
return99 
new99 !
StateTransitionResult99 ,
<99, -
TState99- 3
,993 4
TTrigger995 =
>99= >
(99> ?

parameters99? I
.99I J
Trigger99J Q
,:: 

startState:: 
,;; 
(;; 
!;; 
wasSuccessful;; 
||;;  "
previousResult;;# 1
==;;2 4
null;;5 9
);;9 :
?;;; <

startState;;= G
:;;H I
previousResult;;J X
.;;X Y
CurrentState;;Y e
,<< 
wasSuccessful<< 
?<< 
StateAccessor<<  -
(<<- .

parameters<<. 8
.<<8 9
Context<<9 @
)<<@ A
:<<B C
previousResult<<D R
==<<S U
null<<V Z
?<<[ \

startState<<] g
:<<h i
previousResult<<j x
.<<x y
CurrentState	<<y Ö
,== 
wasSuccessful== 
?== 
Name==  $
:==% &
string==' -
.==- .
Empty==. 3
,>> 
wasCancelled>> 
:>> 
wasCancelled>> *
,?? 
conditionMet?? 
:?? 
conditionMet?? *
,@@ 
transitionDefined@@ !
:@@! "
transitionDefined@@# 4
)@@4 5
;@@5 6
}AA 	
	protectedCC 
voidCC 
NotifyOfTransitionCC )
(CC) *
TCC* +
contextCC, 3
,CC3 4!
StateTransitionResultCC5 J
<CCJ K
TStateCCK Q
,CCQ R
TTriggerCCS [
>CC[ \
transitionResultCC] m
)CCm n
{DD 	
OnTransitionedEventEE 
?EE  
.EE  !
InvokeEE! '
(EE' (
contextEE( /
,EE/ 0
transitionResultEE1 A
)EEA B
;EEB C
}FF 	
}GG 
}HH é"
XC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionDynamic.cs
	namespace 	
NStateManager
 
{ 
internal 
class "
StateTransitionDynamic )
<) *
T* +
,+ ,
TState- 3
,3 4
TTrigger5 =
>= >
:? @&
StateTransitionDynamicBaseA [
<[ \
T\ ]
,] ^
TState_ e
,e f
TTriggerg o
>o p
where 
TState 
: 
IComparable "
{ 
public 
Func 
< 
T 
, 
TState 
> 
	StateFunc (
{) *
get+ .
;. /
}0 1
public "
StateTransitionDynamic %
(% &
Func& *
<* +
T+ ,
,, -
TState. 4
>4 5
stateAccessor6 C
, 
Action 
< 
T 
, 
TState 
> 
stateMutator  ,
, 
Func 
< 
T 
, 
TState 
> 
	stateFunc '
, 
string 
name 
, 
uint 
priority 
) 
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
name0 4
,4 5
priority6 >
)> ?
{ 	
	StateFunc 
= 
	stateFunc !
??" $
throw% *
new+ .!
ArgumentNullException/ D
(D E
nameofE K
(K L
	stateFuncL U
)U V
)V W
;W X
} 	
public 
override !
StateTransitionResult -
<- .
TState. 4
,4 5
TTrigger6 >
>> ?
Execute@ G
(G H
ExecutionParametersH [
<[ \
T\ ]
,] ^
TTrigger_ g
>g h

parametersi s
,s t"
StateTransitionResult	u ä
<
ä ã
TState
ã ë
,
ë í
TTrigger
ì õ
>
õ ú
currentResult
ù ™
=
´ ¨
null
≠ ±
)
± ≤
{ 	
var   

startState   
=   
currentResult   *
!=  + -
null  . 2
?  3 4
currentResult  5 B
.  B C
StartingState  C P
:  Q R
StateAccessor  S `
(  ` a

parameters  a k
.  k l
Context  l s
)  s t
;  t u
var!! 
toState!! 
=!! 
	StateFunc!! #
(!!# $

parameters!!$ .
.!!. /
Context!!/ 6
)!!6 7
;!!7 8
StateMutator## 
(## 

parameters## #
.### $
Context##$ +
,##+ ,
toState##- 4
)##4 5
;##5 6
var%% 
transitioned%% 
=%% 
!%%  
StateAccessor%%  -
(%%- .

parameters%%. 8
.%%8 9
Context%%9 @
)%%@ A
.%%A B
IsEqual%%B I
(%%I J

startState%%J T
)%%T U
;%%U V
var&& 
transitionResult&&  
=&&! "
GetFreshResult&&# 1
(&&1 2

parameters&&2 <
,&&< =
currentResult&&> K
,&&K L

startState&&M W
,&&W X
wasCancelled&&Y e
:&&e f
false&&g l
,&&l m
transitionDefined&&n 
:	&& Ä
true
&&Å Ö
,
&&Ö Ü
conditionMet
&&á ì
:
&&ì î
transitioned
&&ï °
)
&&° ¢
;
&&¢ £
if'' 
('' 
transitioned'' 
)'' 
{(( 
NotifyOfTransition((  
(((  !

parameters((! +
.((+ ,
Context((, 3
,((3 4
transitionResult((5 E
)((E F
;((F G
}((H I
return** 
transitionResult** #
;**# $
}++ 	
},, 
}-- ”

\C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionDynamicBase.cs
	namespace 	
NStateManager
 
{ 
internal 
abstract 
class &
StateTransitionDynamicBase 6
<6 7
T7 8
,8 9
TState: @
,@ A
TTriggerB J
>J K
:L M
StateTransitionBaseN a
<a b
Tb c
,c d
TStatee k
,k l
TTriggerm u
>u v
where 
TState 
: 
IComparable "
{ 
	protected &
StateTransitionDynamicBase ,
(, -
Func- 1
<1 2
T2 3
,3 4
TState5 ;
>; <
stateAccessor= J
,J K
ActionL R
<R S
TS T
,T U
TStateV \
>\ ]
stateMutator^ j
,j k
stringl r
names w
,w x
uinty }
priority	~ Ü
)
Ü á
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
name0 4
,4 5
priority6 >
)> ?
{ 	
}
 
} 
} ê+
eC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionDynamicParameterized.cs
	namespace 	
NStateManager
 
{ 
internal 
class /
#StateTransitionDynamicParameterized 6
<6 7
T7 8
,8 9
TState: @
,@ A
TTriggerB J
,J K
TParamL R
>R S
:T U&
StateTransitionDynamicBaseV p
<p q
Tq r
,r s
TStatet z
,z {
TTrigger	| Ñ
>
Ñ Ö
where 
TParam 
: 
class 
where 
TState 
: 
IComparable "
{ 
public 
Func 
< 
T 
, 
TParam 
, 
TState %
>% &
	StateFunc' 0
{1 2
get3 6
;6 7
}8 9
public /
#StateTransitionDynamicParameterized 2
(2 3
Func3 7
<7 8
T8 9
,9 :
TState; A
>A B
stateAccessorC P
,P Q
ActionR X
<X Y
TY Z
,Z [
TState\ b
>b c
stateMutatord p
,p q
Funcr v
<v w
Tw x
,x y
TParam	z Ä
,
Ä Å
TState
Ç à
>
à â
	stateFunc
ä ì
,
ì î
string
ï õ
name
ú †
,
† °
uint
¢ ¶
priority
ß Ø
)
Ø ∞
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
name0 4
,4 5
priority6 >
)> ?
{ 	
	StateFunc 
= 
	stateFunc !
??" $
throw% *
new+ .!
ArgumentNullException/ D
(D E
nameofE K
(K L
	stateFuncL U
)U V
)V W
;W X
} 	
public 
override !
StateTransitionResult -
<- .
TState. 4
,4 5
TTrigger6 >
>> ?
Execute@ G
(G H
ExecutionParametersH [
<[ \
T\ ]
,] ^
TTrigger_ g
>g h

parametersi s
,s t"
StateTransitionResult	u ä
<
ä ã
TState
ã ë
,
ë í
TTrigger
ì õ
>
õ ú
currentResult
ù ™
=
´ ¨
null
≠ ±
)
± ≤
{ 	
if 
( 
! 
( 

parameters 
. 
Request $
is% '
TParam( .
typeSafeParam/ <
)< =
)= >
{ 
throw 
new 
ArgumentException )
() *
$"* ,
Expected a , 7
{7 8
typeof8 >
(> ?
TParam? E
)E F
.F G
NameG K
}K L'
 parameter, but received a L g
{g h

parametersh r
.r s
Requests z
?z {
.{ |
GetType	| É
(
É Ñ
)
Ñ Ö
.
Ö Ü
Name
Ü ä
??
ã ç
$str
é î
}
î ï
.
ï ñ
"
ñ ó
)
ó ò
;
ò ô
}
ö õ
var   

startState   
=   
currentResult   *
!=  + -
null  . 2
?  3 4
currentResult  5 B
.  B C
StartingState  C P
:  Q R
StateAccessor  S `
(  ` a

parameters  a k
.  k l
Context  l s
)  s t
;  t u
var!! 
toState!! 
=!! 
	StateFunc!! #
(!!# $

parameters!!$ .
.!!. /
Context!!/ 6
,!!6 7
typeSafeParam!!8 E
)!!E F
;!!F G
var## 
transitioned## 
=## 
!##  
toState##  '
.##' (
IsEqual##( /
(##/ 0

startState##0 :
)##: ;
;##; <
if%% 
(%% 
transitioned%% 
)%% 
{&& 
StateMutator&& 
(&& 

parameters&& %
.&&% &
Context&&& -
,&&- .
toState&&/ 6
)&&6 7
;&&7 8
}&&9 :
var(( 
transitionResult((  
=((! "
GetFreshResult((# 1
(((1 2

parameters((2 <
,((< =
currentResult((> K
,((K L

startState((M W
,((W X
transitionDefined((Y j
:((j k
true((l p
,((p q
wasCancelled((r ~
:((~ 
false
((Ä Ö
,
((Ö Ü
conditionMet
((á ì
:
((ì î
transitioned
((ï °
)
((° ¢
;
((¢ £
if)) 
()) 
transitioned)) 
))) 
{** 
NotifyOfTransition**  
(**  !

parameters**! +
.**+ ,
Context**, 3
,**3 4
transitionResult**5 E
)**E F
;**F G
}**H I
return,, 
transitionResult,, #
;,,# $
}-- 	
}.. 
}// €Â
XC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionFactory.cs
	namespace 	
NStateManager
 
{ 
internal 
static 
class "
StateTransitionFactory 0
<0 1
T1 2
,2 3
TState4 :
,: ;
TTrigger< D
>D E
where 
TState 
: 
IComparable "
{ 
public 
static 
StateTransitionBase )
<) *
T* +
,+ ,
TState- 3
,3 4
TTrigger5 =
>= >
GetStateTransition? Q
(Q R
IStateMachineR _
<_ `
T` a
,a b
TStatec i
,i j
TTriggerk s
>s t
stateMachine	u Å
,
Å Ç
TState
É â
toState
ä ë
,
ë í
Func
ì ó
<
ó ò
T
ò ô
,
ô ö
bool
õ ü
>
ü †
	condition
° ™
,
™ ´
string
¨ ≤
name
≥ ∑
,
∑ ∏
uint
π Ω
priority
æ ∆
=
« »
$num
…  
)
  À
{ 	
return 
new 
StateTransition &
<& '
T' (
,( )
TState* 0
,0 1
TTrigger2 :
>: ;
(; <
stateMachine< H
.H I
StateAccessorI V
,V W
stateMachineX d
.d e
StateMutatore q
,q r
toStates z
,z {
	condition	| Ö
,
Ö Ü
name
á ã
,
ã å
priority
ç ï
)
ï ñ
;
ñ ó
} 	
public 
static 
StateTransitionBase )
<) *
T* +
,+ ,
TState- 3
,3 4
TTrigger5 =
>= >
GetStateTransition? Q
(Q R
IStateMachineR _
<_ `
T` a
,a b
TStatec i
,i j
TTriggerk s
>s t
stateMachine	u Å
,
Å Ç
TState
É â

startState
ä î
,
î ï
TState
ñ ú
toState
ù §
,
§ •
Func
¶ ™
<
™ ´
T
´ ¨
,
¨ ≠
bool
Æ ≤
>
≤ ≥
	condition
¥ Ω
,
Ω æ
TState
ø ≈
triggerState
∆ “
,
“ ”
string
‘ ⁄
name
€ ﬂ
,
ﬂ ‡
uint
· Â
priority
Ê Ó
=
Ô 
$num
Ò Ú
)
Ú Û
{ 	
return 
new '
StateTransitionAutoFallback 3
<3 4
T4 5
,5 6
TState7 =
,= >
TTrigger? G
>G H
(H I
stateMachineI U
,U V

startStateW a
,a b
triggerStatec o
,o p
toStateq x
,x y
	condition	z É
,
É Ñ
name
Ö â
,
â ä
priority
ã ì
)
ì î
;
î ï
} 	
public 
static 
StateTransitionBase )
<) *
T* +
,+ ,
TState- 3
,3 4
TTrigger5 =
>= >
GetStateTransition? Q
(Q R
IStateMachineR _
<_ `
T` a
,a b
TStatec i
,i j
TTriggerk s
>s t
stateMachine	u Å
,
Å Ç
TState
É â
triggerState
ä ñ
,
ñ ó
Func
ò ú
<
ú ù
T
ù û
,
û ü
bool
† §
>
§ •
	condition
¶ Ø
,
Ø ∞
TState
± ∑
toState
∏ ø
,
ø ¿
string
¡ «
name
» Ã
,
Ã Õ
uint
Œ “
priority
” €
=
‹ ›
$num
ﬁ ﬂ
)
ﬂ ‡
{ 	
return   
new   &
StateTransitionAutoForward   1
<  1 2
T  2 3
,  3 4
TState  5 ;
,  ; <
TTrigger  = E
>  E F
(  F G
stateMachine  G S
,  S T
triggerState  U a
,  a b
toState  c j
,  j k
	condition  l u
,  u v
name  w {
,  { |
priority	  } Ö
)
  Ö Ü
;
  Ü á
}!! 	
public## 
static## 
StateTransitionBase## )
<##) *
T##* +
,##+ ,
TState##- 3
,##3 4
TTrigger##5 =
>##= >
GetStateTransition##? Q
(##Q R
IStateMachine##R _
<##_ `
T##` a
,##a b
TState##c i
,##i j
TTrigger##k s
>##s t
stateMachine	##u Å
,
##Å Ç
TState
##É â

startState
##ä î
,
##î ï
Func
##ñ ö
<
##ö õ
T
##õ ú
,
##ú ù
TState
##û §
>
##§ •
stateFunction
##¶ ≥
,
##≥ ¥
TState
##µ ª
triggerState
##º »
,
##» …
string
##  –
name
##— ’
,
##’ ÷
uint
##◊ €
priority
##‹ ‰
=
##Â Ê
$num
##Á Ë
)
##Ë È
{$$ 	
return%% 
new%% &
StateTransitionAutoDynamic%% 1
<%%1 2
T%%2 3
,%%3 4
TState%%5 ;
,%%; <
TTrigger%%= E
>%%E F
(%%F G
stateMachine%%G S
,%%S T

startState%%U _
,%%_ `
stateFunction%%a n
,%%n o
triggerState%%p |
,%%| }
name	%%~ Ç
,
%%Ç É
priority
%%Ñ å
)
%%å ç
;
%%ç é
}&& 	
public(( 
static(( 
StateTransitionBase(( )
<(() *
T((* +
,((+ ,
TState((- 3
,((3 4
TTrigger((5 =
>((= >
GetStateTransition((? Q
<((Q R
TRequest((R Z
>((Z [
((([ \
IStateMachine((\ i
<((i j
T((j k
,((k l
TState((m s
,((s t
TTrigger((u }
>((} ~
stateMachine	(( ã
,
((ã å
TState
((ç ì

startState
((î û
,
((û ü
Func
((† §
<
((§ •
T
((• ¶
,
((¶ ß
TRequest
((® ∞
,
((∞ ±
TState
((≤ ∏
>
((∏ π
stateFunction
((∫ «
,
((« »
TState
((… œ
triggerState
((– ‹
,
((‹ ›
string
((ﬁ ‰
name
((Â È
,
((È Í
uint
((Î Ô
priority
(( ¯
=
((˘ ˙
$num
((˚ ¸
)
((¸ ˝
where)) 
TRequest)) 
:)) 
class)) "
{** 	
return++ 
new++ 3
'StateTransitionAutoDynamicParameterized++ >
<++> ?
T++? @
,++@ A
TState++B H
,++H I
TTrigger++J R
,++R S
TRequest++T \
>++\ ]
(++] ^
stateMachine++^ j
,++j k

startState++l v
,++v w
stateFunction	++x Ö
,
++Ö Ü
triggerState
++á ì
,
++ì î
name
++ï ô
,
++ô ö
priority
++õ £
)
++£ §
;
++§ •
},, 	
public.. 
static.. 
StateTransitionBase.. )
<..) *
T..* +
,..+ ,
TState..- 3
,..3 4
TTrigger..5 =
>..= >
GetStateTransition..? Q
<..Q R
TRequest..R Z
>..Z [
(..[ \
IStateMachine..\ i
<..i j
T..j k
,..k l
TState..m s
,..s t
TTrigger..u }
>..} ~
stateMachine	.. ã
,
..ã å
TState
..ç ì
toState
..î õ
,
..õ ú
Func
..ù °
<
..° ¢
T
..¢ £
,
..£ §
TRequest
..• ≠
,
..≠ Æ
bool
..Ø ≥
>
..≥ ¥
	condition
..µ æ
,
..æ ø
string
..¿ ∆
name
..« À
,
..À Ã
uint
..Õ —
priority
..“ ⁄
=
..€ ‹
$num
..› ﬁ
)
..ﬁ ﬂ
where// 
TRequest// 
:// 
class// "
{00 	
return11 
new11 (
StateTransitionParameterized11 3
<113 4
T114 5
,115 6
TState117 =
,11= >
TTrigger11? G
,11G H
TRequest11I Q
>11Q R
(11R S
stateMachine11S _
.11_ `
StateAccessor11` m
,11m n
stateMachine11o {
.11{ |
StateMutator	11| à
,
11à â
toState
11ä ë
,
11ë í
	condition
11ì ú
,
11ú ù
name
11û ¢
,
11¢ £
priority
11§ ¨
)
11¨ ≠
;
11≠ Æ
}22 	
public44 
static44 
StateTransitionBase44 )
<44) *
T44* +
,44+ ,
TState44- 3
,443 4
TTrigger445 =
>44= >
GetStateTransition44? Q
<44Q R
TRequest44R Z
>44Z [
(44[ \
IStateMachine44\ i
<44i j
T44j k
,44k l
TState44m s
,44s t
TTrigger44u }
>44} ~
stateMachine	44 ã
,
44ã å
TState
44ç ì

startState
44î û
,
44û ü
TState
44† ¶
toState
44ß Æ
,
44Æ Ø
Func
44∞ ¥
<
44¥ µ
T
44µ ∂
,
44∂ ∑
TRequest
44∏ ¿
,
44¿ ¡
bool
44¬ ∆
>
44∆ «
	condition
44» —
,
44— “
TState
44” Ÿ
triggerState
44⁄ Ê
,
44Ê Á
string
44Ë Ó
name
44Ô Û
,
44Û Ù
uint
44ı ˘
priority
44˙ Ç
=
44É Ñ
$num
44Ö Ü
)
44Ü á
where55 
TRequest55 
:55 
class55 "
{66 	
return77 
new77 4
(StateTransitionAutoFallbackParameterized77 ?
<77? @
T77@ A
,77A B
TState77C I
,77I J
TTrigger77K S
,77S T
TRequest77U ]
>77] ^
(77^ _
stateMachine77_ k
,77k l

startState77m w
,77w x
triggerState	77y Ö
,
77Ö Ü
toState
77á é
,
77é è
	condition
77ê ô
,
77ô ö
name
77õ ü
,
77ü †
priority
77° ©
)
77© ™
;
77™ ´
}88 	
public:: 
static:: 
StateTransitionBase:: )
<::) *
T::* +
,::+ ,
TState::- 3
,::3 4
TTrigger::5 =
>::= >
GetStateTransition::? Q
<::Q R
TRequest::R Z
>::Z [
(::[ \
IStateMachine::\ i
<::i j
T::j k
,::k l
TState::m s
,::s t
TTrigger::u }
>::} ~
stateMachine	:: ã
,
::ã å
TState
::ç ì
toState
::î õ
,
::õ ú
Func
::ù °
<
::° ¢
T
::¢ £
,
::£ §
TRequest
::• ≠
,
::≠ Æ
bool
::Ø ≥
>
::≥ ¥
	condition
::µ æ
,
::æ ø
TState
::¿ ∆
triggerState
::« ”
,
::” ‘
string
::’ €
name
::‹ ‡
,
::‡ ·
uint
::‚ Ê
priority
::Á Ô
=
:: Ò
$num
::Ú Û
)
::Û Ù
where;; 
TRequest;; 
:;; 
class;; "
{<< 	
return== 
new== 3
'StateTransitionAutoForwardParameterized== >
<==> ?
T==? @
,==@ A
TState==B H
,==H I
TTrigger==J R
,==R S
TRequest==T \
>==\ ]
(==] ^
stateMachine==^ j
,==j k
triggerState==l x
,==x y
toState	==z Å
,
==Å Ç
	condition
==É å
,
==å ç
name
==é í
,
==í ì
priority
==î ú
)
==ú ù
;
==ù û
}>> 	
publicKK 
staticKK 
StateTransitionBaseKK )
<KK) *
TKK* +
,KK+ ,
TStateKK- 3
,KK3 4
TTriggerKK5 =
>KK= >
GetStateTransitionKK? Q
(KKQ R
IStateMachineAsyncKKR d
<KKd e
TKKe f
,KKf g
TStateKKh n
,KKn o
TTriggerKKp x
>KKx y
stateMachine	KKz Ü
,
KKÜ á
TState
KKà é
toState
KKè ñ
,
KKñ ó
Func
KKò ú
<
KKú ù
T
KKù û
,
KKû ü
CancellationToken
KK† ±
,
KK± ≤
Task
KK≥ ∑
<
KK∑ ∏
bool
KK∏ º
>
KKº Ω
>
KKΩ æ
conditionAsync
KKø Õ
,
KKÕ Œ
string
KKœ ’
name
KK÷ ⁄
,
KK⁄ €
uint
KK‹ ‡
priority
KK· È
=
KKÍ Î
$num
KKÏ Ì
)
KKÌ Ó
{LL 	
returnMM 
newMM  
StateTransitionAsyncMM +
<MM+ ,
TMM, -
,MM- .
TStateMM/ 5
,MM5 6
TTriggerMM7 ?
>MM? @
(MM@ A
stateMachineMMA M
.MMM N
StateAccessorMMN [
,MM[ \
stateMachineMM] i
.MMi j
StateMutatorMMj v
,MMv w
toStateMMx 
,	MM Ä
conditionAsync
MMÅ è
,
MMè ê
name
MMë ï
,
MMï ñ
priority
MMó ü
)
MMü †
;
MM† °
}NN 	
publicPP 
staticPP 
StateTransitionBasePP )
<PP) *
TPP* +
,PP+ ,
TStatePP- 3
,PP3 4
TTriggerPP5 =
>PP= >
GetStateTransitionPP? Q
(PPQ R
IStateMachineAsyncPPR d
<PPd e
TPPe f
,PPf g
TStatePPh n
,PPn o
TTriggerPPp x
>PPx y
stateMachine	PPz Ü
,
PPÜ á
TState
PPà é

startState
PPè ô
,
PPô ö
Func
PPõ ü
<
PPü †
T
PP† °
,
PP° ¢
TState
PP£ ©
>
PP© ™
stateFunction
PP´ ∏
,
PP∏ π
TState
PP∫ ¿
triggerState
PP¡ Õ
,
PPÕ Œ
string
PPœ ’
name
PP÷ ⁄
,
PP⁄ €
uint
PP‹ ‡
priority
PP· È
=
PPÍ Î
$num
PPÏ Ì
)
PPÌ Ó
{QQ 	
returnRR 
newRR +
StateTransitionAutoDynamicAsyncRR 6
<RR6 7
TRR7 8
,RR8 9
TStateRR: @
,RR@ A
TTriggerRRB J
>RRJ K
(RRK L
stateMachineRRL X
,RRX Y

startStateRRZ d
,RRd e
stateFunctionRRf s
,RRs t
triggerState	RRu Å
,
RRÅ Ç
name
RRÉ á
,
RRá à
priority
RRâ ë
)
RRë í
;
RRí ì
}SS 	
publicUU 
staticUU 
StateTransitionBaseUU )
<UU) *
TUU* +
,UU+ ,
TStateUU- 3
,UU3 4
TTriggerUU5 =
>UU= >
GetStateTransitionUU? Q
<UUQ R
TRequestUUR Z
>UUZ [
(UU[ \
IStateMachineAsyncUU\ n
<UUn o
TUUo p
,UUp q
TStateUUr x
,UUx y
TTrigger	UUz Ç
>
UUÇ É
stateMachine
UUÑ ê
,
UUê ë
TState
UUí ò

startState
UUô £
,
UU£ §
Func
UU• ©
<
UU© ™
T
UU™ ´
,
UU´ ¨
TRequest
UU≠ µ
,
UUµ ∂
TState
UU∑ Ω
>
UUΩ æ
stateFunction
UUø Ã
,
UUÃ Õ
TState
UUŒ ‘
triggerState
UU’ ·
,
UU· ‚
string
UU„ È
name
UUÍ Ó
,
UUÓ Ô
uint
UU Ù
priority
UUı ˝
=
UU˛ ˇ
$num
UUÄ Å
)
UUÅ Ç
whereVV 
TRequestVV 
:VV 
classVV "
{WW 	
returnXX 
newXX 8
,StateTransitionAutoDynamicParameterizedAsyncXX C
<XXC D
TXXD E
,XXE F
TStateXXG M
,XXM N
TTriggerXXO W
,XXW X
TRequestXXY a
>XXa b
(XXb c
stateMachineXXc o
,XXo p

startStateXXq {
,XX{ |
stateFunction	XX} ä
,
XXä ã
triggerState
XXå ò
,
XXò ô
name
XXö û
,
XXû ü
priority
XX† ®
)
XX® ©
;
XX© ™
}YY 	
public[[ 
static[[ 
StateTransitionBase[[ )
<[[) *
T[[* +
,[[+ ,
TState[[- 3
,[[3 4
TTrigger[[5 =
>[[= >
GetStateTransition[[? Q
([[Q R
IStateMachineAsync[[R d
<[[d e
T[[e f
,[[f g
TState[[h n
,[[n o
TTrigger[[p x
>[[x y
stateMachine	[[z Ü
,
[[Ü á
TState
[[à é

startState
[[è ô
,
[[ô ö
TState
[[õ °
toState
[[¢ ©
,
[[© ™
Func
[[´ Ø
<
[[Ø ∞
T
[[∞ ±
,
[[± ≤
CancellationToken
[[≥ ƒ
,
[[ƒ ≈
Task
[[∆  
<
[[  À
bool
[[À œ
>
[[œ –
>
[[– —
conditionAsync
[[“ ‡
,
[[‡ ·
TState
[[‚ Ë
triggerState
[[È ı
,
[[ı ˆ
string
[[˜ ˝
name
[[˛ Ç
,
[[Ç É
uint
[[Ñ à
priority
[[â ë
=
[[í ì
$num
[[î ï
)
[[ï ñ
{\\ 	
return]] 
new]] ,
 StateTransitionAutoFallbackAsync]] 7
<]]7 8
T]]8 9
,]]9 :
TState]]; A
,]]A B
TTrigger]]C K
>]]K L
(]]L M
stateMachine]]M Y
,]]Y Z

startState]][ e
,]]e f
triggerState]]g s
,]]s t
toState]]u |
,]]| }
conditionAsync	]]~ å
,
]]å ç
name
]]é í
,
]]í ì
priority
]]î ú
)
]]ú ù
;
]]ù û
}^^ 	
public`` 
static`` 
StateTransitionBase`` )
<``) *
T``* +
,``+ ,
TState``- 3
,``3 4
TTrigger``5 =
>``= >
GetStateTransition``? Q
(``Q R
IStateMachineAsync``R d
<``d e
T``e f
,``f g
TState``h n
,``n o
TTrigger``p x
>``x y
stateMachine	``z Ü
,
``Ü á
TState
``à é
toState
``è ñ
,
``ñ ó
Func
``ò ú
<
``ú ù
T
``ù û
,
``û ü
CancellationToken
``† ±
,
``± ≤
Task
``≥ ∑
<
``∑ ∏
bool
``∏ º
>
``º Ω
>
``Ω æ
conditionAsync
``ø Õ
,
``Õ Œ
TState
``œ ’
triggerState
``÷ ‚
,
``‚ „
string
``‰ Í
name
``Î Ô
,
``Ô 
uint
``Ò ı
priority
``ˆ ˛
=
``ˇ Ä
$num
``Å Ç
)
``Ç É
{aa 	
returnbb 
newbb +
StateTransitionAutoForwardAsyncbb 6
<bb6 7
Tbb7 8
,bb8 9
TStatebb: @
,bb@ A
TTriggerbbB J
>bbJ K
(bbK L
stateMachinebbL X
,bbX Y
triggerStatebbZ f
,bbf g
toStatebbh o
,bbo p
conditionAsyncbbq 
,	bb Ä
name
bbÅ Ö
,
bbÖ Ü
priority
bbá è
)
bbè ê
;
bbê ë
}cc 	
publicee 
staticee 
StateTransitionBaseee )
<ee) *
Tee* +
,ee+ ,
TStateee- 3
,ee3 4
TTriggeree5 =
>ee= >
GetStateTransitionee? Q
(eeQ R
IStateMachineeeR _
<ee_ `
Tee` a
,eea b
TStateeec i
,eei j
TTriggereek s
>ees t
stateMachine	eeu Å
,
eeÅ Ç
Func
eeÉ á
<
eeá à
T
eeà â
,
eeâ ä
TState
eeã ë
>
eeë í
	stateFunc
eeì ú
,
eeú ù
string
eeû §
name
ee• ©
,
ee© ™
uint
ee´ Ø
priority
ee∞ ∏
=
eeπ ∫
$num
eeª º
)
eeº Ω
{ff 	
returngg 
newgg "
StateTransitionDynamicgg -
<gg- .
Tgg. /
,gg/ 0
TStategg1 7
,gg7 8
TTriggergg9 A
>ggA B
(ggB C
stateMachineggC O
.ggO P
StateAccessorggP ]
,gg] ^
stateMachinegg_ k
.ggk l
StateMutatorggl x
,ggx y
	stateFunc	ggz É
,
ggÉ Ñ
name
ggÖ â
,
ggâ ä
priority
ggã ì
)
ggì î
;
ggî ï
}hh 	
publicjj 
staticjj 
StateTransitionBasejj )
<jj) *
Tjj* +
,jj+ ,
TStatejj- 3
,jj3 4
TTriggerjj5 =
>jj= >
GetStateTransitionjj? Q
(jjQ R
IStateMachineAsyncjjR d
<jjd e
Tjje f
,jjf g
TStatejjh n
,jjn o
TTriggerjjp x
>jjx y
stateMachine	jjz Ü
,
jjÜ á
Func
jjà å
<
jjå ç
T
jjç é
,
jjé è
TState
jjê ñ
>
jjñ ó
	stateFunc
jjò °
,
jj° ¢
string
jj£ ©
name
jj™ Æ
,
jjÆ Ø
uint
jj∞ ¥
priority
jjµ Ω
=
jjæ ø
$num
jj¿ ¡
)
jj¡ ¬
{kk 	
returnll 
newll "
StateTransitionDynamicll -
<ll- .
Tll. /
,ll/ 0
TStatell1 7
,ll7 8
TTriggerll9 A
>llA B
(llB C
stateMachinellC O
.llO P
StateAccessorllP ]
,ll] ^
stateMachinell_ k
.llk l
StateMutatorlll x
,llx y
	stateFunc	llz É
,
llÉ Ñ
name
llÖ â
,
llâ ä
priority
llã ì
)
llì î
;
llî ï
}mm 	
publictt 
statictt 
StateTransitionBasett )
<tt) *
Ttt* +
,tt+ ,
TStatett- 3
,tt3 4
TTriggertt5 =
>tt= >
GetStateTransitiontt? Q
<ttQ R
TParamttR X
>ttX Y
(ttY Z
IStateMachinettZ g
<ttg h
Ttth i
,tti j
TStatettk q
,ttq r
TTriggertts {
>tt{ |
stateMachine	tt} â
,
ttâ ä
Func
ttã è
<
ttè ê
T
ttê ë
,
ttë í
TParam
ttì ô
,
ttô ö
TState
ttõ °
>
tt° ¢
	stateFunc
tt£ ¨
,
tt¨ ≠
string
ttÆ ¥
name
ttµ π
,
ttπ ∫
uint
ttª ø
priority
tt¿ »
=
tt…  
$num
ttÀ Ã
)
ttÃ Õ
whereuu 
TParamuu 
:uu 
classuu  
{vv 	
returnww 
newww /
#StateTransitionDynamicParameterizedww :
<ww: ;
Tww; <
,ww< =
TStateww> D
,wwD E
TTriggerwwF N
,wwN O
TParamwwP V
>wwV W
(wwW X
stateMachinewwX d
.wwd e
StateAccessorwwe r
,wwr s
stateMachine	wwt Ä
.
wwÄ Å
StateMutator
wwÅ ç
,
wwç é
	stateFunc
wwè ò
,
wwò ô
name
wwö û
,
wwû ü
priority
ww† ®
)
ww® ©
;
ww© ™
}xx 	
publiczz 
staticzz 
StateTransitionBasezz )
<zz) *
Tzz* +
,zz+ ,
TStatezz- 3
,zz3 4
TTriggerzz5 =
>zz= >
GetStateTransitionzz? Q
<zzQ R
TRequestzzR Z
>zzZ [
(zz[ \
IStateMachineAsynczz\ n
<zzn o
Tzzo p
,zzp q
TStatezzr x
,zzx y
TTrigger	zzz Ç
>
zzÇ É
stateMachine
zzÑ ê
,
zzê ë
Func
zzí ñ
<
zzñ ó
T
zzó ò
,
zzò ô
TRequest
zzö ¢
,
zz¢ £
TState
zz§ ™
>
zz™ ´
stateFuncAsync
zz¨ ∫
,
zz∫ ª
string
zzº ¬
name
zz√ «
,
zz« »
uint
zz… Õ
priority
zzŒ ÷
=
zz◊ ÿ
$num
zzŸ ⁄
)
zz⁄ €
where{{ 
TRequest{{ 
:{{ 
class{{ "
{|| 	
return}} 
new}} /
#StateTransitionDynamicParameterized}} :
<}}: ;
T}}; <
,}}< =
TState}}> D
,}}D E
TTrigger}}F N
,}}N O
TRequest}}P X
>}}X Y
(}}Y Z
stateMachine}}Z f
.}}f g
StateAccessor}}g t
,}}t u
stateMachine	}}v Ç
.
}}Ç É
StateMutator
}}É è
,
}}è ê
stateFuncAsync
}}ë ü
,
}}ü †
name
}}° •
,
}}• ¶
priority
}}ß Ø
)
}}Ø ∞
;
}}∞ ±
}~~ 	
public
ÄÄ 
static
ÄÄ !
StateTransitionBase
ÄÄ )
<
ÄÄ) *
T
ÄÄ* +
,
ÄÄ+ ,
TState
ÄÄ- 3
,
ÄÄ3 4
TTrigger
ÄÄ5 =
>
ÄÄ= > 
GetStateTransition
ÄÄ? Q
<
ÄÄQ R
TParam
ÄÄR X
>
ÄÄX Y
(
ÄÄY Z 
IStateMachineAsync
ÄÄZ l
<
ÄÄl m
T
ÄÄm n
,
ÄÄn o
TState
ÄÄp v
,
ÄÄv w
TTriggerÄÄx Ä
>ÄÄÄ Å
stateMachineÄÄÇ é
,ÄÄé è
TStateÄÄê ñ
toStateÄÄó û
,ÄÄû ü
FuncÄÄ† §
<ÄÄ§ •
TÄÄ• ¶
,ÄÄ¶ ß
TParamÄÄ® Æ
,ÄÄÆ Ø!
CancellationTokenÄÄ∞ ¡
,ÄÄ¡ ¬
TaskÄÄ√ «
<ÄÄ« »
boolÄÄ» Ã
>ÄÄÃ Õ
>ÄÄÕ Œ
conditionAsyncÄÄœ ›
,ÄÄ› ﬁ
stringÄÄﬂ Â
nameÄÄÊ Í
,ÄÄÍ Î
uintÄÄÏ 
priorityÄÄÒ ˘
=ÄÄ˙ ˚
$numÄÄ¸ ˝
)ÄÄ˝ ˛
where
ÅÅ 
TParam
ÅÅ 
:
ÅÅ 
class
ÅÅ 
{
ÇÇ 	
return
ÉÉ 
new
ÉÉ /
!StateTransitionParameterizedAsync
ÉÉ 8
<
ÉÉ8 9
T
ÉÉ9 :
,
ÉÉ: ;
TState
ÉÉ< B
,
ÉÉB C
TTrigger
ÉÉD L
,
ÉÉL M
TParam
ÉÉN T
>
ÉÉT U
(
ÉÉU V
stateMachine
ÉÉV b
.
ÉÉb c
StateAccessor
ÉÉc p
,
ÉÉp q
stateMachine
ÉÉr ~
.
ÉÉ~ 
StateMutatorÉÉ ã
,ÉÉã å
toStateÉÉç î
,ÉÉî ï
conditionAsyncÉÉñ §
,ÉÉ§ •
nameÉÉ¶ ™
,ÉÉ™ ´
priorityÉÉ¨ ¥
)ÉÉ¥ µ
;ÉÉµ ∂
}
ÑÑ 	
public
ÜÜ 
static
ÜÜ !
StateTransitionBase
ÜÜ )
<
ÜÜ) *
T
ÜÜ* +
,
ÜÜ+ ,
TState
ÜÜ- 3
,
ÜÜ3 4
TTrigger
ÜÜ5 =
>
ÜÜ= > 
GetStateTransition
ÜÜ? Q
<
ÜÜQ R
TParam
ÜÜR X
>
ÜÜX Y
(
ÜÜY Z 
IStateMachineAsync
ÜÜZ l
<
ÜÜl m
T
ÜÜm n
,
ÜÜn o
TState
ÜÜp v
,
ÜÜv w
TTriggerÜÜx Ä
>ÜÜÄ Å
stateMachineÜÜÇ é
,ÜÜé è
TStateÜÜê ñ

startStateÜÜó °
,ÜÜ° ¢
TStateÜÜ£ ©
toStateÜÜ™ ±
,ÜÜ± ≤
FuncÜÜ≥ ∑
<ÜÜ∑ ∏
TÜÜ∏ π
,ÜÜπ ∫
TParamÜÜª ¡
,ÜÜ¡ ¬!
CancellationTokenÜÜ√ ‘
,ÜÜ‘ ’
TaskÜÜ÷ ⁄
<ÜÜ⁄ €
boolÜÜ€ ﬂ
>ÜÜﬂ ‡
>ÜÜ‡ ·
conditionAsyncÜÜ‚ 
,ÜÜ Ò
TStateÜÜÚ ¯
triggerStateÜÜ˘ Ö
,ÜÜÖ Ü
stringÜÜá ç
nameÜÜé í
,ÜÜí ì
uintÜÜî ò
priorityÜÜô °
=ÜÜ¢ £
$numÜÜ§ •
)ÜÜ• ¶
where
áá 
TParam
áá 
:
áá 
class
áá  
{
àà 	
return
ââ 
new
ââ ;
-StateTransitionAutoFallbackParameterizedAsync
ââ D
<
ââD E
T
ââE F
,
ââF G
TState
ââH N
,
ââN O
TTrigger
ââP X
,
ââX Y
TParam
ââZ `
>
ââ` a
(
ââa b
stateMachine
ââb n
,
âân o

startState
ââp z
,
ââz {
toStateââ| É
,ââÉ Ñ
triggerStateââÖ ë
,ââë í
conditionAsyncââì °
,ââ° ¢
nameââ£ ß
,ââß ®
priorityââ© ±
)ââ± ≤
;ââ≤ ≥
}
ää 	
}
ãã 
}åå Ñ
[C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionNonDynamic.cs
	namespace 	
NStateManager
 
{ 
public 

abstract 
class %
StateTransitionNonDynamic 3
<3 4
T4 5
,5 6
TState7 =
,= >
TTrigger? G
>G H
:I J
StateTransitionBaseK ^
<^ _
T_ `
,` a
TStateb h
,h i
TTriggerj r
>r s
{ 
public 
TState 
ToState 
{ 
get  #
;# $
	protected% .
set/ 2
;2 3
}4 5
	protected %
StateTransitionNonDynamic +
(+ ,
Func, 0
<0 1
T1 2
,2 3
TState4 :
>: ;
stateAccessor< I
, 
Action 
< 
T 
, 
TState 
> 
stateMutator  ,
, 
TState 
toState 
, 
string 
name 
, 
uint 
priority 
) 
: 	
base
 
( 
stateAccessor 
, 
stateMutator *
,* +
name, 0
,0 1
priority2 :
): ;
{ 	
ToState 
= 
toState 
; 
} 	
	protected !
StateTransitionResult '
<' (
TState( .
,. /
TTrigger0 8
>8 9
ExecutePrim: E
(E F
ExecutionParametersF Y
<Y Z
TZ [
,[ \
TTrigger] e
>e f

parametersg q
,
 !
StateTransitionResult !
<! "
TState" (
,( )
TTrigger* 2
>2 3
currentResult4 A
,A B
boolC G
conditionMetH T
)T U
{ 	
var   

startState   
=   
currentResult   *
!=  + -
null  . 2
?  3 4
currentResult  5 B
.  B C
StartingState  C P
:  Q R
StateAccessor  S `
(  ` a

parameters  a k
.  k l
Context  l s
)  s t
;  t u
if"" 
("" 
!"" 
conditionMet"" 
)"" 
{## 
return## 
GetFreshResult## #
(### $

parameters##$ .
,##. /
currentResult##0 =
,##= >

startState##? I
,##I J
wasCancelled##K W
:##W X
false##Y ^
,##^ _
conditionMet##` l
:##l m
false##n s
,##s t
transitionDefined	##u Ü
:
##Ü á
true
##à å
)
##å ç
;
##ç é
}
##è ê
StateMutator%% 
(%% 

parameters%% #
.%%# $
Context%%$ +
,%%+ ,
ToState%%- 4
)%%4 5
;%%5 6
var&& 
transitionResult&&  
=&&! "
GetFreshResult&&# 1
(&&1 2

parameters&&2 <
,&&< =
currentResult&&> K
,&&K L

startState&&M W
,&&W X
wasCancelled&&Y e
:&&e f
false&&g l
,&&l m
conditionMet&&n z
:&&z {
true	&&| Ä
,
&&Ä Å
transitionDefined
&&Ç ì
:
&&ì î
true
&&ï ô
)
&&ô ö
;
&&ö õ
NotifyOfTransition'' 
('' 

parameters'' )
.'') *
Context''* 1
,''1 2
transitionResult''3 C
)''C D
;''D E
return)) 
transitionResult)) #
;))# $
}** 	
}++ 
},, „
^C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionParameterized.cs
	namespace 	
NStateManager
 
{ 
internal 
class (
StateTransitionParameterized /
</ 0
T0 1
,1 2
TState3 9
,9 :
TTrigger; C
,C D
TParamE K
>K L
:M N%
StateTransitionNonDynamicO h
<h i
Ti j
,j k
TStatel r
,r s
TTriggert |
>| }
where 
TParam 
: 
class 
{ 
public 
Func 
< 
T 
, 
TParam 
, 
bool #
># $
	Condition% .
{/ 0
get1 4
;4 5
}6 7
public (
StateTransitionParameterized +
(+ ,
Func, 0
<0 1
T1 2
,2 3
TState4 :
>: ;
stateAccessor< I
,I J
ActionK Q
<Q R
TR S
,S T
TStateU [
>[ \
stateMutator] i
,i j
TStatek q
toStater y
,y z
Func{ 
<	 Ä
T
Ä Å
,
Å Ç
TParam
É â
,
â ä
bool
ã è
>
è ê
	condition
ë ö
,
ö õ
string
ú ¢
name
£ ß
,
ß ®
uint
© ≠
priority
Æ ∂
)
∂ ∑
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
toState0 7
,7 8
name9 =
,= >
priority? G
)G H
{ 	
	Condition
 
= 
	condition 
??  "
throw# (
new) ,!
ArgumentNullException- B
(B C
nameofC I
(I J
	conditionJ S
)S T
)T U
;U V
}W X
public 
override !
StateTransitionResult -
<- .
TState. 4
,4 5
TTrigger6 >
>> ?
Execute@ G
(G H
ExecutionParametersH [
<[ \
T\ ]
,] ^
TTrigger_ g
>g h

parametersi s
,
 !
StateTransitionResult !
<! "
TState" (
,( )
TTrigger* 2
>2 3
currentResult4 A
=B C
nullD H
)H I
{ 	
if 
( 
! 
( 

parameters 
. 
Request $
is% '
TParam( .
typeSafeParam/ <
)< =
)= >
{ 
throw 
new 
ArgumentException )
() *
$"* ,
Expected a , 7
{7 8
typeof8 >
(> ?
TParam? E
)E F
.F G
NameG K
}K L'
 parameter, but received a L g
{g h

parametersh r
.r s
Requests z
?z {
.{ |
GetType	| É
(
É Ñ
)
Ñ Ö
.
Ö Ü
Name
Ü ä
??
ã ç
$str
é î
}
î ï
.
ï ñ
"
ñ ó
)
ó ò
;
ò ô
}
ö õ
return 
ExecutePrim 
( 

parameters )
,) *
currentResult+ 8
,8 9
	Condition: C
(C D

parametersD N
.N O
ContextO V
,V W
typeSafeParamX e
)e f
)f g
;g h
} 	
}   
}!! ©9
cC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionParameterizedAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class -
!StateTransitionParameterizedAsync 4
<4 5
T5 6
,6 7
TState8 >
,> ?
TTrigger@ H
,H I
TParamJ P
>P Q
:R S%
StateTransitionNonDynamicT m
<m n
Tn o
,o p
TStateq w
,w x
TTrigger	y Å
>
Å Ç
where 
TParam 
: 
class 
{ 
public 
Func 
< 
T 
, 
TParam 
, 
CancellationToken 0
,0 1
Task2 6
<6 7
bool7 ;
>; <
>< =
ConditionAsync> L
{M N
getO R
;R S
}T U
public -
!StateTransitionParameterizedAsync 0
(0 1
Func1 5
<5 6
T6 7
,7 8
TState9 ?
>? @
stateAccessorA N
,N O
ActionP V
<V W
TW X
,X Y
TStateZ `
>` a
stateMutatorb n
,n o
TStatep v
toStatew ~
,~ 
Func
Ä Ñ
<
Ñ Ö
T
Ö Ü
,
Ü á
TParam
à é
,
é è
CancellationToken
ê °
,
° ¢
Task
£ ß
<
ß ®
bool
® ¨
>
¨ ≠
>
≠ Æ
conditionAsync
Ø Ω
,
Ω æ
string
ø ≈
name
∆  
,
  À
uint
Ã –
priority
— Ÿ
)
Ÿ ⁄
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
toState0 7
,7 8
name9 =
,= >
priority? G
)G H
{ 	
ConditionAsync 
= 
conditionAsync +
??, .
throw/ 4
new5 8!
ArgumentNullException9 N
(N O
nameofO U
(U V
conditionAsyncV d
)d e
)e f
;f g
} 	
public 
override 
async 
Task "
<" #!
StateTransitionResult# 8
<8 9
TState9 ?
,? @
TTriggerA I
>I J
>J K
ExecuteAsyncL X
(X Y
ExecutionParametersY l
<l m
Tm n
,n o
TTriggerp x
>x y

parameters	z Ñ
,
 !
StateTransitionResult !
<! "
TState" (
,( )
TTrigger* 2
>2 3
currentResult4 A
=B C
nullD H
)H I
{ 	
if 
( 
! 
( 

parameters 
. 
Request $
is% '
TParam( .
typeSafeParam/ <
)< =
)= >
{   
throw   
new   
ArgumentException   )
(  ) *
$"  * ,
Expected a   , 7
{  7 8
typeof  8 >
(  > ?
TParam  ? E
)  E F
.  F G
Name  G K
}  K L'
 parameter, but received a   L g
{  g h

parameters  h r
.  r s
Request  s z
?  z {
.  { |
GetType	  | É
(
  É Ñ
)
  Ñ Ö
.
  Ö Ü
Name
  Ü ä
??
  ã ç
$str
  é î
}
  î ï
.
  ï ñ
"
  ñ ó
)
  ó ò
;
  ò ô
}
  ö õ
var"" 

startState"" 
="" 
currentResult"" *
!=""+ -
null"". 2
?""3 4
currentResult""5 B
.""B C
StartingState""C P
:""Q R
StateAccessor""S `
(""` a

parameters""a k
.""k l
Context""l s
)""s t
;""t u
if$$ 
($$ 

parameters$$ 
.$$ 
CancellationToken$$ ,
.$$, -#
IsCancellationRequested$$- D
)$$D E
{%% 
return&& 
GetFreshResult&& %
(&&% &

parameters&&& 0
,'' 
currentResult'' !
,(( 

startState(( 
,)) 
transitionDefined)) %
:))% &
true))' +
,** 
conditionMet**  
:**  !
false**" '
,++ 
wasCancelled++  
:++  !
true++" &
)++& '
;++' (
}++) *
if-- 
(-- 
!-- 
await-- 
ConditionAsync-- %
(--% &

parameters--& 0
.--0 1
Context--1 8
,--8 9
typeSafeParam--: G
,--G H

parameters--I S
.--S T
CancellationToken--T e
)--e f
... 
ConfigureAwait.. 
(.. %
continueOnCapturedContext.. 8
:..8 9
false..: ?
)..? @
)..@ A
{// 
return00 
GetFreshResult00 %
(00% &

parameters00& 0
,000 1
currentResult002 ?
,00? @

startState00A K
,00K L
transitionDefined00M ^
:00^ _
true00` d
,00d e
conditionMet00f r
:00r s
false00t y
,00y z
wasCancelled	00{ á
:
00á à

parameters
00â ì
.
00ì î
CancellationToken
00î •
.
00• ¶%
IsCancellationRequested
00¶ Ω
)
00Ω æ
;
00æ ø
}11 
StateMutator33 
(33 

parameters33 #
.33# $
Context33$ +
,33+ ,
ToState33- 4
)334 5
;335 6
var44 
transitionResult44  
=44! "
currentResult44# 0
==441 3
null444 8
?55 
new55 !
StateTransitionResult55 +
<55+ ,
TState55, 2
,552 3
TTrigger554 <
>55< =
(55= >

parameters55> H
.55H I
Trigger55I P
,55P Q

startState55R \
,55\ ]

startState55^ h
,55h i
ToState55j q
,55q r
Name55s w
)55w x
:66 
new66 !
StateTransitionResult66 +
<66+ ,
TState66, 2
,662 3
TTrigger664 <
>66< =
(66= >

parameters66> H
.66H I
Trigger66I P
,66P Q

startState66R \
,66\ ]
currentResult66^ k
.66k l
CurrentState66l x
,66x y
ToState	66z Å
,
66Å Ç
Name
66É á
)
66á à
;
66à â
NotifyOfTransition77 
(77 

parameters77 )
.77) *
Context77* 1
,771 2
transitionResult773 C
)77C D
;77D E
return99 
transitionResult99 #
;99# $
}:: 	
};; 
}<< ›
WC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionResult.cs
	namespace 	
NStateManager
 
{ 
public 

sealed 
class !
StateTransitionResult -
<- .
TState. 4
,4 5
TTrigger6 >
>> ?
{ 
public 
bool 
ConditionMet  
{! "
get# &
;& '
}( )
public 
TState 
CurrentState "
{# $
get% (
;( )
internal* 2
set3 6
;6 7
}8 9
public"" 
string"" 
LastTransitionName"" (
{"") *
get""+ .
;"". /
internal""0 8
set""9 <
;""< =
}""> ?
public'' 
TState'' 
PreviousState'' #
{''$ %
get''& )
;'') *
internal''+ 3
set''4 7
;''7 8
}''9 :
public,, 
TState,, 
StartingState,, #
{,,$ %
get,,& )
;,,) *
},,+ ,
public11 
bool11 
TransitionDefined11 %
{11& '
get11( +
;11+ ,
}11- .
public66 
TTrigger66 
Trigger66 
{66  !
get66" %
;66% &
}66' (
public;; 
bool;; 
WasCancelled;;  
{;;! "
get;;# &
;;;& '
};;( )
publicAA 
boolAA 
WasTransitionedAA #
{AA$ %
getAA& )
;AA) *
}AA+ ,
publicNN !
StateTransitionResultNN $
(NN$ %
TTriggerNN% -
triggerNN. 5
,OO
 
TStateOO 
startingStateOO  
,PP
 
TStatePP 
previousStatePP  
,QQ
 
TStateQQ 
currentStateQQ 
,RR
 
stringRR 
lastTransitionNameRR %
,SS
 
boolSS 
transitionDefinedSS "
=SS# $
trueSS% )
,TT
 
boolTT 
conditionMetTT 
=TT 
trueTT  $
,UU
 
boolUU 
wasCancelledUU 
=UU 
falseUU  %
)UU% &
{VV 	
TriggerWW 
=WW 
triggerWW 
;WW 
StartingStateXX 
=XX 
startingStateXX )
;XX) *
PreviousStateYY 
=YY 
previousStateYY )
;YY) *
CurrentStateZZ 
=ZZ 
currentStateZZ '
;ZZ' (
LastTransitionName[[ 
=[[  
lastTransitionName[[! 3
;[[3 4
WasTransitioned\\ 
=\\ 
transitionDefined\\ /
&&\\0 2
conditionMet\\3 ?
&&\\@ B
!\\C D
wasCancelled\\D P
;\\P Q
TransitionDefined]] 
=]] 
transitionDefined]]  1
;]]1 2
ConditionMet^^ 
=^^ 
transitionDefined^^ ,
&&^^- /
conditionMet^^0 <
;^^< =
WasCancelled__ 
=__ 
wasCancelled__ '
;__' (
}`` 	
}aa 
}bb ª
UC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\TransitionEventArgs.cs
	namespace 	
NStateManager
 
{ 
public 

class 
TransitionEventArgs $
<$ %
T% &
,& '
TState( .
,. /
TTrigger0 8
>8 9
:: ;
	EventArgs< E
{ 
public 
ExecutionParameters "
<" #
T# $
,$ %
TTrigger& .
>. /

Parameters0 :
{; <
get= @
;@ A
}B C
public !
StateTransitionResult $
<$ %
TState% +
,+ ,
TTrigger- 5
>5 6
TransitionResult7 G
{H I
getJ M
;M N
}O P
public   
TransitionEventArgs   "
(  " #
ExecutionParameters  # 6
<  6 7
T  7 8
,  8 9
TTrigger  : B
>  B C

parameters  D N
,  N O!
StateTransitionResult  P e
<  e f
TState  f l
,  l m
TTrigger  n v
>  v w
transitionResult	  x à
)
  à â
{!! 	

Parameters"" 
="" 

parameters"" #
??""$ &
throw""' ,
new""- 0!
ArgumentNullException""1 F
(""F G
nameof""G M
(""M N

parameters""N X
)""X Y
)""Y Z
;""Z [
TransitionResult## 
=## 
transitionResult## /
??##0 2
throw##3 8
new##9 <!
ArgumentNullException##= R
(##R S
nameof##S Y
(##Y Z
transitionResult##Z j
)##j k
)##k l
;##l m
}$$ 	
}%% 
}&& ı
OC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\TriggerAction.cs
	namespace 	
NStateManager
 
{ 
internal 
class 
TriggerAction  
<  !
T! "
," #
TTrigger$ ,
>, -
:. /
TriggerActionBase0 A
<A B
TB C
,C D
TTriggerE M
>M N
{ 
internal 
Action 
< 
T 
> 
Action !
{" #
get$ '
;' (
}) *
internal 
TriggerAction 
( 
Action %
<% &
T& '
>' (
action) /
)/ 0
{ 	
Action 
= 
action 
?? 
throw $
new% (!
ArgumentNullException) >
(> ?
nameof? E
(E F
actionF L
)L M
)M N
;N O
} 	
internal 
override 
void 
Execute &
(& '
ExecutionParameters' :
<: ;
T; <
,< =
TTrigger> F
>F G

parametersH R
)R S
{ 	
Action 
. 
Invoke 
( 

parameters $
.$ %
Context% ,
), -
;- .
} 	
} 
} ¯
SC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\TriggerActionBase.cs
	namespace 	
NStateManager
 
{ 
internal 
abstract 
class 
TriggerActionBase -
<- .
T. /
,/ 0
TTrigger1 9
>9 :
{ 
internal 
abstract 
void 
Execute &
(& '
ExecutionParameters' :
<: ;
T; <
,< =
TTrigger> F
>F G

parametersH R
)R S
;S T
} 
} Ö
VC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\TriggerActionFactory.cs
	namespace 	
NStateManager
 
{ 
internal 
static 
class  
TriggerActionFactory .
<. /
T/ 0
,0 1
TTrigger2 :
>: ;
{ 
internal 
static 
TriggerActionBase )
<) *
T* +
,+ ,
TTrigger- 5
>5 6
GetTriggerAction7 G
(G H
ActionH N
<N O
TO P
>P Q
actionR X
)X Y
{ 	
return 
new 
TriggerAction $
<$ %
T% &
,& '
TTrigger( 0
>0 1
(1 2
action2 8
)8 9
;9 :
} 	
internal 
static 
TriggerActionBase )
<) *
T* +
,+ ,
TTrigger- 5
>5 6
GetTriggerAction7 G
<G H
TRequestH P
>P Q
(Q R
ActionR X
<X Y
TY Z
,Z [
TRequest\ d
>d e
actionf l
)l m
{ 	
return 
new &
TriggerActionParameterized 1
<1 2
T2 3
,3 4
TTrigger5 =
,= >
TRequest? G
>G H
(H I
actionI O
)O P
;P Q
} 	
internal 
static 
FunctionActionBase *
<* +
T+ ,
>, -
GetTriggerAction. >
(> ?
Func? C
<C D
TD E
,E F
CancellationTokenG X
,X Y
TaskZ ^
>^ _
action` f
)f g
{ 	
return 
new 
FunctionAction %
<% &
T& '
>' (
(( )
action) /
)/ 0
;0 1
}   	
internal"" 
static"" 
FunctionActionBase"" *
<""* +
T""+ ,
>"", -
GetTriggerAction"". >
<""> ?
TRequest""? G
>""G H
(""H I
Func""I M
<""M N
T""N O
,""O P
TRequest""Q Y
,""Y Z
CancellationToken""[ l
,""l m
Task""n r
>""r s
action""t z
)""z {
{## 	
return$$ 
new$$ '
FunctionActionParameterized$$ 2
<$$2 3
T$$3 4
,$$4 5
TRequest$$5 =
>$$= >
($$> ?
action$$? E
)$$E F
;$$F G
}%% 	
}&& 
}'' ≈
\C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\TriggerActionParameterized.cs
	namespace 	
NStateManager
 
{ 
internal 
class &
TriggerActionParameterized -
<- .
T. /
,/ 0
TTrigger1 9
,9 :
TRequest; C
>C D
:E F
TriggerActionBaseG X
<X Y
TY Z
,Z [
TTrigger\ d
>d e
{ 
internal 
Action 
< 
T 
, 
TRequest #
># $
Action% +
{, -
get. 1
;1 2
}3 4
internal &
TriggerActionParameterized +
(+ ,
Action, 2
<2 3
T3 4
,4 5
TRequest6 >
>> ?
action@ F
)F G
{ 	
Action 
= 
action 
?? 
throw $
new% (!
ArgumentNullException) >
(> ?
nameof? E
(E F
actionF L
)L M
)M N
;N O
} 	
internal 
override 
void 
Execute &
(& '
ExecutionParameters' :
<: ;
T; <
,< =
TTrigger> F
>F G

parametersH R
)R S
{ 	
if 
( 

parameters 
== 
null "
)" #
{$ %
throw& +
new, /!
ArgumentNullException0 E
(E F
nameofF L
(L M

parametersM W
)W X
)X Y
;Y Z
}[ \
if 
( 
! 
( 

parameters 
. 
Request $
is% '
TRequest( 0
typedRequestType1 A
)A B
)B C
{ 
throw 
new 
ArgumentException )
() *
$"* ,
{, -
nameof- 3
(3 4

parameters4 >
.> ?
Request? F
)F G
}G H
 must be of type H Y
{Y Z
typeofZ `
(` a
TRequesta i
)i j
.j k
Namek o
}o p
.p q
"q r
)r s
;s t
}u v
Action 
. 
Invoke 
( 

parameters $
.$ %
Context% ,
,, -
typedRequestType. >
)> ?
;? @
}   	
}!! 
}"" 