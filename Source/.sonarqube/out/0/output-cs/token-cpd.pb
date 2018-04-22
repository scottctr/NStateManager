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
$str++  
)++  !
]++! "
[,, 
assembly,, 	
:,,	 

AssemblyFileVersion,, 
(,, 
$str,, $
),,$ %
],,% &·
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
}!! ´
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
}"" ≤_
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
IStateConfiguration 
< 
T 
, 
TState %
,% &
TTrigger' /
>/ 0%
AddAutoFallbackTransition1 J
(J K
FuncK O
<O P
TP Q
,Q R
boolS W
>W X
	conditionY b
,b c
stringd j
namek o
=p q
nullr v
,v w
uintx |
priority	} Ö
=
Ü á
$num
à â
)
â ä
;
ä ã
IStateConfiguration"" 
<"" 
T"" 
,"" 
TState"" %
,""% &
TTrigger""' /
>""/ 0%
AddAutoFallbackTransition""1 J
<""J K
TRequest""K S
>""S T
(""T U
Func""U Y
<""Y Z
T""Z [
,""[ \
TRequest""] e
,""e f
bool""g k
>""k l
	condition""m v
,""v w
string""x ~
name	"" É
=
""Ñ Ö
null
""Ü ä
,
""ä ã
uint
""å ê
priority
""ë ô
=
""ö õ
$num
""ú ù
)
""ù û
where## 
TRequest## 
:## 
class## "
;##" #
IStateConfiguration-- 
<-- 
T-- 
,-- 
TState-- %
,--% &
TTrigger--' /
>--/ 0%
AddAutoFallbackTransition--1 J
(--J K
TState--K Q
previousState--R _
,--_ `
Func--a e
<--e f
T--f g
,--g h
bool--i m
>--m n
	condition--o x
,--x y
string	--z Ä
name
--Å Ö
=
--Ü á
null
--à å
,
--å ç
uint
--é í
priority
--ì õ
=
--ú ù
$num
--û ü
)
--ü †
;
--† °
IStateConfiguration88 
<88 
T88 
,88 
TState88 %
,88% &
TTrigger88' /
>88/ 0%
AddAutoFallbackTransition881 J
<88J K
TRequest88K S
>88S T
(88T U
TState88U [
previousState88\ i
,88i j
Func88k o
<88o p
T88p q
,88q r
TRequest88s {
,88{ |
bool	88} Å
>
88Å Ç
	condition
88É å
,
88å ç
string
88é î
name
88ï ô
=
88ö õ
null
88ú †
,
88† °
uint
88¢ ¶
priority
88ß Ø
=
88∞ ±
$num
88≤ ≥
)
88≥ ¥
where99 
TRequest99 
:99 
class99 "
;99" #
IStateConfigurationCC 
<CC 
TCC 
,CC 
TStateCC %
,CC% &
TTriggerCC' /
>CC/ 0$
AddAutoForwardTransitionCC1 I
(CCI J
TStateCCJ P
toStateCCQ X
,CCX Y
FuncCCZ ^
<CC^ _
TCC_ `
,CC` a
boolCCb f
>CCf g
	conditionCCh q
=CCr s
nullCCt x
,CCx y
string	CCz Ä
name
CCÅ Ö
=
CCÜ á
null
CCà å
,
CCå ç
uint
CCé í
priority
CCì õ
=
CCú ù
$num
CCû ü
)
CCü †
;
CC† °
IStateConfigurationNN 
<NN 
TNN 
,NN 
TStateNN %
,NN% &
TTriggerNN' /
>NN/ 0$
AddAutoForwardTransitionNN1 I
<NNI J
TRequestNNJ R
>NNR S
(NNS T
TStateNNT Z
toStateNN[ b
,NNb c
FuncNNd h
<NNh i
TNNi j
,NNj k
TRequestNNl t
,NNt u
boolNNv z
>NNz {
	condition	NN| Ö
=
NNÜ á
null
NNà å
,
NNå ç
string
NNé î
name
NNï ô
=
NNö õ
null
NNú †
,
NN† °
uint
NN¢ ¶
priority
NNß Ø
=
NN∞ ±
$num
NN≤ ≥
)
NN≥ ¥
whereOO 
TRequestOO 
:OO 
classOO "
;OO" #
IStateConfigurationZZ 
<ZZ 
TZZ 
,ZZ 
TStateZZ %
,ZZ% &
TTriggerZZ' /
>ZZ/ 0$
AddAutoForwardTransitionZZ1 I
(ZZI J
TStateZZJ P
toStateZZQ X
,ZZX Y
FuncZZZ ^
<ZZ^ _
TZZ_ `
,ZZ` a
boolZZb f
>ZZf g
	conditionZZh q
,ZZq r
TStateZZs y
previousState	ZZz á
,
ZZá à
string
ZZâ è
name
ZZê î
=
ZZï ñ
null
ZZó õ
,
ZZõ ú
uint
ZZù °
priority
ZZ¢ ™
=
ZZ´ ¨
$num
ZZ≠ Æ
)
ZZÆ Ø
;
ZZØ ∞
IStateConfigurationff 
<ff 
Tff 
,ff 
TStateff %
,ff% &
TTriggerff' /
>ff/ 0$
AddAutoForwardTransitionff1 I
<ffI J
TRequestffJ R
>ffR S
(ffS T
TStateffT Z
toStateff[ b
,ffb c
Funcffd h
<ffh i
Tffi j
,ffj k
TRequestffl t
,fft u
boolffv z
>ffz {
	condition	ff| Ö
,
ffÖ Ü
TState
ffá ç
previousState
ffé õ
,
ffõ ú
string
ffù £
name
ff§ ®
=
ff© ™
null
ff´ Ø
,
ffØ ∞
uint
ff± µ
priority
ff∂ æ
=
ffø ¿
$num
ff¡ ¬
)
ff¬ √
wheregg 
TRequestgg 
:gg 
classgg "
;gg" #
IStateConfigurationqq 
<qq 
Tqq 
,qq 
TStateqq %
,qq% &
TTriggerqq' /
>qq/ 0 
AddDynamicTransitionqq1 E
(qqE F
TTriggerqqF N
triggerqqO V
,qqV W
FuncqqX \
<qq\ ]
Tqq] ^
,qq^ _
TStateqq` f
>qqf g
functionqqh p
,qqp q
stringqqr x
nameqqy }
=qq~ 
null
qqÄ Ñ
,
qqÑ Ö
uint
qqÜ ä
priority
qqã ì
=
qqî ï
$num
qqñ ó
)
qqó ò
;
qqò ô
IStateConfiguration|| 
<|| 
T|| 
,|| 
TState|| %
,||% &
TTrigger||' /
>||/ 0 
AddDynamicTransition||1 E
<||E F
TRequest||F N
>||N O
(||O P
TTrigger||P X
trigger||Y `
,||` a
Func||b f
<||f g
T||g h
,||h i
TRequest||j r
,||r s
TState||t z
>||z {
function	||| Ñ
,
||Ñ Ö
string
||Ü å
name
||ç ë
=
||í ì
null
||î ò
,
||ò ô
uint
||ö û
priority
||ü ß
=
||® ©
$num
||™ ´
)
||´ ¨
where}} 
TRequest}} 
:}} 
class}} "
;}}" #!
IStateConfiguration
ÑÑ 
<
ÑÑ 
T
ÑÑ 
,
ÑÑ 
TState
ÑÑ %
,
ÑÑ% &
TTrigger
ÑÑ' /
>
ÑÑ/ 0
AddEntryAction
ÑÑ1 ?
(
ÑÑ? @
Action
ÑÑ@ F
<
ÑÑF G
T
ÑÑG H
>
ÑÑH I
action
ÑÑJ P
)
ÑÑP Q
;
ÑÑQ R!
IStateConfiguration
åå 
<
åå 
T
åå 
,
åå 
TState
åå %
,
åå% &
TTrigger
åå' /
>
åå/ 0
AddEntryAction
åå1 ?
(
åå? @
Action
åå@ F
<
ååF G
T
ååG H
>
ååH I
action
ååJ P
,
ååP Q
TState
ååR X
previousState
ååY f
)
ååf g
;
ååg h!
IStateConfiguration
ìì 
<
ìì 
T
ìì 
,
ìì 
TState
ìì %
,
ìì% &
TTrigger
ìì' /
>
ìì/ 0
AddExitAction
ìì1 >
(
ìì> ?
Action
ìì? E
<
ììE F
T
ììF G
>
ììG H
action
ììI O
)
ììO P
;
ììP Q!
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
AddExitAction
õõ1 >
(
õõ> ?
Action
õõ? E
<
õõE F
T
õõF G
>
õõG H
action
õõI O
,
õõO P
TState
õõQ W
	nextState
õõX a
)
õõa b
;
õõb c!
IStateConfiguration
¢¢ 
<
¢¢ 
T
¢¢ 
,
¢¢ 
TState
¢¢ %
,
¢¢% &
TTrigger
¢¢' /
>
¢¢/ 0
AddReentryAction
¢¢1 A
(
¢¢A B
Action
¢¢B H
<
¢¢H I
T
¢¢I J
>
¢¢J K
action
¢¢L R
)
¢¢R S
;
¢¢S T!
IStateConfiguration
≠≠ 
<
≠≠ 
T
≠≠ 
,
≠≠ 
TState
≠≠ %
,
≠≠% &
TTrigger
≠≠' /
>
≠≠/ 0
AddTransition
≠≠1 >
(
≠≠> ?
TTrigger
≠≠? G
trigger
≠≠H O
,
≠≠O P
TState
≠≠Q W
toState
≠≠X _
,
≠≠_ `
Func
≠≠a e
<
≠≠e f
T
≠≠f g
,
≠≠g h
bool
≠≠i m
>
≠≠m n
	condition
≠≠o x
=
≠≠y z
null
≠≠{ 
,≠≠ Ä
string≠≠Å á
name≠≠à å
=≠≠ç é
null≠≠è ì
,≠≠ì î
uint≠≠ï ô
priority≠≠ö ¢
=≠≠£ §
$num≠≠• ¶
)≠≠¶ ß
;≠≠ß ®!
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
ππ/ 0
AddTransition
ππ1 >
<
ππ> ?
TRequest
ππ? G
>
ππG H
(
ππH I
TTrigger
ππI Q
trigger
ππR Y
,
ππY Z
TState
ππ[ a
toState
ππb i
,
ππi j
Func
ππk o
<
ππo p
T
ππp q
,
ππq r
TRequest
ππs {
,
ππ{ |
boolππ} Å
>ππÅ Ç
	conditionππÉ å
,ππå ç
stringππé î
nameππï ô
=ππö õ
nullππú †
,ππ† °
uintππ¢ ¶
priorityππß Ø
=ππ∞ ±
$numππ≤ ≥
)ππ≥ ¥
where
∫∫ 
TRequest
∫∫ 
:
∫∫ 
class
∫∫ "
;
∫∫" #!
IStateConfiguration
¬¬ 
<
¬¬ 
T
¬¬ 
,
¬¬ 
TState
¬¬ %
,
¬¬% &
TTrigger
¬¬' /
>
¬¬/ 0
AddTriggerAction
¬¬1 A
(
¬¬A B
TTrigger
¬¬B J
trigger
¬¬K R
,
¬¬R S
Action
¬¬T Z
<
¬¬Z [
T
¬¬[ \
>
¬¬\ ]
action
¬¬^ d
)
¬¬d e
;
¬¬e f!
IStateConfiguration
ÀÀ 
<
ÀÀ 
T
ÀÀ 
,
ÀÀ 
TState
ÀÀ %
,
ÀÀ% &
TTrigger
ÀÀ' /
>
ÀÀ/ 0
AddTriggerAction
ÀÀ1 A
<
ÀÀA B
TRequest
ÀÀB J
>
ÀÀJ K
(
ÀÀK L
TTrigger
ÀÀL T
trigger
ÀÀU \
,
ÀÀ\ ]
Action
ÀÀ^ d
<
ÀÀd e
T
ÀÀe f
,
ÀÀf g
TRequest
ÀÀh p
>
ÀÀp q
action
ÀÀr x
)
ÀÀx y
;
ÀÀy z!
IStateConfiguration
““ 
<
““ 
T
““ 
,
““ 
TState
““ %
,
““% &
TTrigger
““' /
>
““/ 0
IsSubStateOf
““1 =
(
““= >!
IStateConfiguration
““> Q
<
““Q R
T
““R S
,
““S T
TState
““U [
,
““[ \
TTrigger
““] e
>
““e f%
superStateConfiguration
““g ~
)
““~ 
;““ Ä
}
”” 
}‘‘ Ép
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
IStateConfigurationAsync  
<  !
T! "
," #
TState$ *
,* +
TTrigger, 4
>4 5%
AddAutoFallbackTransition6 O
(O P
FuncP T
<T U
TU V
,V W
CancellationTokenX i
,i j
Taskk o
<o p
boolp t
>t u
>u v
	condition	w Ä
,
Ä Å
string
Ç à
name
â ç
=
é è
null
ê î
,
î ï
uint
ñ ö
priority
õ £
=
§ •
$num
¶ ß
)
ß ®
;
® ©$
IStateConfigurationAsync$$  
<$$  !
T$$! "
,$$" #
TState$$$ *
,$$* +
TTrigger$$, 4
>$$4 5%
AddAutoFallbackTransition$$6 O
<$$O P
TRequest$$P X
>$$X Y
($$Y Z
Func$$Z ^
<$$^ _
T$$_ `
,$$` a
TRequest$$b j
,$$j k
CancellationToken$$l }
,$$} ~
Task	$$ É
<
$$É Ñ
bool
$$Ñ à
>
$$à â
>
$$â ä
	condition
$$ã î
,
$$î ï
string
$$ñ ú
name
$$ù °
=
$$¢ £
null
$$§ ®
,
$$® ©
uint
$$™ Æ
priority
$$Ø ∑
=
$$∏ π
$num
$$∫ ª
)
$$ª º
where%% 
TRequest%% 
:%% 
class%% "
;%%" #$
IStateConfigurationAsync//  
<//  !
T//! "
,//" #
TState//$ *
,//* +
TTrigger//, 4
>//4 5%
AddAutoFallbackTransition//6 O
(//O P
Func//P T
<//T U
T//U V
,//V W
CancellationToken//X i
,//i j
Task//k o
<//o p
bool//p t
>//t u
>//u v
	condition	//w Ä
,
//Ä Å
TState
//Ç à
previousState
//â ñ
,
//ñ ó
string
//ò û
name
//ü £
=
//§ •
null
//¶ ™
,
//™ ´
uint
//¨ ∞
priority
//± π
=
//∫ ª
$num
//º Ω
)
//Ω æ
;
//æ ø$
IStateConfigurationAsync::  
<::  !
T::! "
,::" #
TState::$ *
,::* +
TTrigger::, 4
>::4 5%
AddAutoFallbackTransition::6 O
<::O P
TRequest::P X
>::X Y
(::Y Z
Func::Z ^
<::^ _
T::_ `
,::` a
TRequest::b j
,::j k
CancellationToken::l }
,::} ~
Task	:: É
<
::É Ñ
bool
::Ñ à
>
::à â
>
::â ä
	condition
::ã î
,
::î ï
TState
::ñ ú
previousState
::ù ™
,
::™ ´
string
::¨ ≤
name
::≥ ∑
=
::∏ π
null
::∫ æ
,
::æ ø
uint
::¿ ƒ
priority
::≈ Õ
=
::Œ œ
$num
::– —
)
::— “
where;; 
TRequest;; 
:;; 
class;; "
;;;" #$
IStateConfigurationAsyncFF  
<FF  !
TFF! "
,FF" #
TStateFF$ *
,FF* +
TTriggerFF, 4
>FF4 5$
AddAutoForwardTransitionFF6 N
<FFN O
TRequestFFO W
>FFW X
(FFX Y
TStateFFY _
toStateFF` g
,FFg h
FuncFFi m
<FFm n
TFFn o
,FFo p
TRequestFFq y
,FFy z
CancellationToken	FF{ å
,
FFå ç
Task
FFé í
<
FFí ì
bool
FFì ó
>
FFó ò
>
FFò ô
	condition
FFö £
,
FF£ §
string
FF• ´
name
FF¨ ∞
=
FF± ≤
null
FF≥ ∑
,
FF∑ ∏
uint
FFπ Ω
priority
FFæ ∆
=
FF« »
$num
FF…  
)
FF  À
whereGG 
TRequestGG 
:GG 
classGG "
;GG" #$
IStateConfigurationAsyncRR  
<RR  !
TRR! "
,RR" #
TStateRR$ *
,RR* +
TTriggerRR, 4
>RR4 5$
AddAutoForwardTransitionRR6 N
(RRN O
TStateRRO U
toStateRRV ]
,RR] ^
FuncRR_ c
<RRc d
TRRd e
,RRe f
CancellationTokenRRg x
,RRx y
TaskRRz ~
<RR~ 
bool	RR É
>
RRÉ Ñ
>
RRÑ Ö
	condition
RRÜ è
,
RRè ê
TState
RRë ó
previousState
RRò •
,
RR• ¶
string
RRß ≠
name
RRÆ ≤
=
RR≥ ¥
null
RRµ π
,
RRπ ∫
uint
RRª ø
priority
RR¿ »
=
RR…  
$num
RRÀ Ã
)
RRÃ Õ
;
RRÕ Œ$
IStateConfigurationAsync\\  
<\\  !
T\\! "
,\\" #
TState\\$ *
,\\* +
TTrigger\\, 4
>\\4 5$
AddAutoForwardTransition\\6 N
(\\N O
TState\\O U
toState\\V ]
,\\] ^
Func\\_ c
<\\c d
T\\d e
,\\e f
CancellationToken\\g x
,\\x y
Task\\z ~
<\\~ 
bool	\\ É
>
\\É Ñ
>
\\Ñ Ö
	condition
\\Ü è
,
\\è ê
string
\\ë ó
name
\\ò ú
=
\\ù û
null
\\ü £
,
\\£ §
uint
\\• ©
priority
\\™ ≤
=
\\≥ ¥
$num
\\µ ∂
)
\\∂ ∑
;
\\∑ ∏$
IStateConfigurationAsynchh  
<hh  !
Thh! "
,hh" #
TStatehh$ *
,hh* +
TTriggerhh, 4
>hh4 5$
AddAutoForwardTransitionhh6 N
<hhN O
TRequesthhO W
>hhW X
(hhX Y
TStatehhY _
toStatehh` g
,hhg h
Funchhi m
<hhm n
Thhn o
,hho p
TRequesthhq y
,hhy z
CancellationToken	hh{ å
,
hhå ç
Task
hhé í
<
hhí ì
bool
hhì ó
>
hhó ò
>
hhò ô
	condition
hhö £
,
hh£ §
TState
hh• ´
previousState
hh¨ π
,
hhπ ∫
string
hhª ¡
name
hh¬ ∆
=
hh« »
null
hh… Õ
,
hhÕ Œ
uint
hhœ ”
priority
hh‘ ‹
=
hh› ﬁ
$num
hhﬂ ‡
)
hh‡ ·
whereii 
TRequestii 
:ii 
classii "
;ii" #$
IStateConfigurationAsyncss  
<ss  !
Tss! "
,ss" #
TStatess$ *
,ss* +
TTriggerss, 4
>ss4 5 
AddDynamicTransitionss6 J
(ssJ K
TTriggerssK S
triggerssT [
,ss[ \
Funcss] a
<ssa b
Tssb c
,ssc d
CancellationTokensse v
,ssv w
Taskssx |
<ss| }
TState	ss} É
>
ssÉ Ñ
>
ssÑ Ö
function
ssÜ é
,
ssé è
string
ssê ñ
name
ssó õ
=
ssú ù
null
ssû ¢
,
ss¢ £
uint
ss§ ®
priority
ss© ±
=
ss≤ ≥
$num
ss¥ µ
)
ssµ ∂
;
ss∂ ∑$
IStateConfigurationAsync~~  
<~~  !
T~~! "
,~~" #
TState~~$ *
,~~* +
TTrigger~~, 4
>~~4 5 
AddDynamicTransition~~6 J
<~~J K
TRequest~~K S
>~~S T
(~~T U
TTrigger~~U ]
trigger~~^ e
,~~e f
Func~~g k
<~~k l
T~~l m
,~~m n
TRequest~~o w
,~~w x
CancellationToken	~~y ä
,
~~ä ã
Task
~~å ê
<
~~ê ë
TState
~~ë ó
>
~~ó ò
>
~~ò ô
function
~~ö ¢
,
~~¢ £
string
~~§ ™
name
~~´ Ø
=
~~∞ ±
null
~~≤ ∂
,
~~∂ ∑
uint
~~∏ º
priority
~~Ω ≈
=
~~∆ «
$num
~~» …
)
~~…  
where 
TRequest 
: 
class "
;" #&
IStateConfigurationAsync
ÜÜ  
<
ÜÜ  !
T
ÜÜ! "
,
ÜÜ" #
TState
ÜÜ$ *
,
ÜÜ* +
TTrigger
ÜÜ, 4
>
ÜÜ4 5
AddEntryAction
ÜÜ6 D
(
ÜÜD E
Func
ÜÜE I
<
ÜÜI J
T
ÜÜJ K
,
ÜÜK L
CancellationToken
ÜÜM ^
,
ÜÜ^ _
Task
ÜÜ` d
>
ÜÜd e
action
ÜÜf l
)
ÜÜl m
;
ÜÜm n&
IStateConfigurationAsync
éé  
<
éé  !
T
éé! "
,
éé" #
TState
éé$ *
,
éé* +
TTrigger
éé, 4
>
éé4 5
AddEntryAction
éé6 D
(
ééD E
Func
ééE I
<
ééI J
T
ééJ K
,
ééK L
CancellationToken
ééM ^
,
éé^ _
Task
éé` d
>
ééd e
action
ééf l
,
éél m
TState
één t
previousStateééu Ç
)ééÇ É
;ééÉ Ñ&
IStateConfigurationAsync
ïï  
<
ïï  !
T
ïï! "
,
ïï" #
TState
ïï$ *
,
ïï* +
TTrigger
ïï, 4
>
ïï4 5
AddExitAction
ïï6 C
(
ïïC D
Func
ïïD H
<
ïïH I
T
ïïI J
,
ïïJ K
CancellationToken
ïïL ]
,
ïï] ^
Task
ïï_ c
>
ïïc d
action
ïïe k
)
ïïk l
;
ïïl m&
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
AddExitAction
ùù6 C
(
ùùC D
Func
ùùD H
<
ùùH I
T
ùùI J
,
ùùJ K
CancellationToken
ùùL ]
,
ùù] ^
Task
ùù_ c
>
ùùc d
action
ùùe k
,
ùùk l
TState
ùùm s
	nextState
ùùt }
)
ùù} ~
;
ùù~ &
IStateConfigurationAsync
§§  
<
§§  !
T
§§! "
,
§§" #
TState
§§$ *
,
§§* +
TTrigger
§§, 4
>
§§4 5
AddReentryAction
§§6 F
(
§§F G
Func
§§G K
<
§§K L
T
§§L M
,
§§M N
CancellationToken
§§O `
,
§§` a
Task
§§b f
>
§§f g
action
§§h n
)
§§n o
;
§§o p&
IStateConfigurationAsync
ØØ  
<
ØØ  !
T
ØØ! "
,
ØØ" #
TState
ØØ$ *
,
ØØ* +
TTrigger
ØØ, 4
>
ØØ4 5
AddTransition
ØØ6 C
(
ØØC D
TTrigger
ØØD L
trigger
ØØM T
,
ØØT U
TState
ØØV \
toState
ØØ] d
,
ØØd e
Func
ØØf j
<
ØØj k
T
ØØk l
,
ØØl m
CancellationToken
ØØn 
,ØØ Ä
TaskØØÅ Ö
<ØØÖ Ü
boolØØÜ ä
>ØØä ã
>ØØã å
conditionAsyncØØç õ
=ØØú ù
nullØØû ¢
,ØØ¢ £
stringØØ§ ™
nameØØ´ Ø
=ØØ∞ ±
nullØØ≤ ∂
,ØØ∂ ∑
uintØØ∏ º
priorityØØΩ ≈
=ØØ∆ «
$numØØ» …
)ØØ…  
;ØØ  À&
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
ªª4 5
AddTransition
ªª6 C
<
ªªC D
TRequest
ªªD L
>
ªªL M
(
ªªM N
TTrigger
ªªN V
trigger
ªªW ^
,
ªª^ _
TState
ªª` f
toState
ªªg n
,
ªªn o
Func
ªªp t
<
ªªt u
T
ªªu v
,
ªªv w
TRequestªªx Ä
,ªªÄ Å!
CancellationTokenªªÇ ì
,ªªì î
Taskªªï ô
<ªªô ö
boolªªö û
>ªªû ü
>ªªü †
conditionAsyncªª° Ø
,ªªØ ∞
stringªª± ∑
nameªª∏ º
=ªªΩ æ
nullªªø √
,ªª√ ƒ
uintªª≈ …
priorityªª  “
=ªª” ‘
$numªª’ ÷
)ªª÷ ◊
where
ºº 
TRequest
ºº 
:
ºº 
class
ºº "
;
ºº" #&
IStateConfigurationAsync
ƒƒ  
<
ƒƒ  !
T
ƒƒ! "
,
ƒƒ" #
TState
ƒƒ$ *
,
ƒƒ* +
TTrigger
ƒƒ, 4
>
ƒƒ4 5
AddTriggerAction
ƒƒ6 F
(
ƒƒF G
TTrigger
ƒƒG O
trigger
ƒƒP W
,
ƒƒW X
Func
ƒƒY ]
<
ƒƒ] ^
T
ƒƒ^ _
,
ƒƒ_ `
CancellationToken
ƒƒa r
,
ƒƒr s
Task
ƒƒt x
>
ƒƒx y
actionƒƒz Ä
)ƒƒÄ Å
;ƒƒÅ Ç&
IStateConfigurationAsync
ÕÕ  
<
ÕÕ  !
T
ÕÕ! "
,
ÕÕ" #
TState
ÕÕ$ *
,
ÕÕ* +
TTrigger
ÕÕ, 4
>
ÕÕ4 5
AddTriggerAction
ÕÕ6 F
<
ÕÕF G
TRequest
ÕÕG O
>
ÕÕO P
(
ÕÕP Q
TTrigger
ÕÕQ Y
trigger
ÕÕZ a
,
ÕÕa b
Func
ÕÕc g
<
ÕÕg h
T
ÕÕh i
,
ÕÕi j
TRequest
ÕÕk s
,
ÕÕs t 
CancellationTokenÕÕu Ü
,ÕÕÜ á
TaskÕÕà å
>ÕÕå ç
actionÕÕé î
)ÕÕî ï
;ÕÕï ñ
bool
‘‘ 
	IsInState
‘‘ 
(
‘‘ 
TState
‘‘ 
state
‘‘ #
)
‘‘# $
;
‘‘$ %&
IStateConfigurationAsync
€€  
<
€€  !
T
€€! "
,
€€" #
TState
€€$ *
,
€€* +
TTrigger
€€, 4
>
€€4 5
IsSubStateOf
€€6 B
(
€€B C&
IStateConfigurationAsync
€€C [
<
€€[ \
T
€€\ ]
,
€€] ^
TState
€€_ e
,
€€e f
TTrigger
€€g o
>
€€o p&
superStateConfiguration€€q à
)€€à â
;€€â ä
}
‹‹ 
}›› Ñ
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
void 
AddSuperState 
( ,
 IStateConfigurationAsyncInternal ;
<; <
T< =
,= >
TState? E
,E F
TTriggerG O
>O P#
superStateConfigurationQ h
)h i
;i j
void 
AddTransition 
( 
TTrigger #
trigger$ +
,+ ,
StateTransitionBase- @
<@ A
TA B
,B C
TStateD J
,J K
TTriggerL T
>T U

transitionV `
)` a
;a b
Task 
< !
StateTransitionResult "
<" #
TState# )
,) *
TTrigger+ 3
>3 4
>4 5&
ExecuteAutoTransitionAsync6 P
(P Q
ExecutionParametersQ d
<d e
Te f
,f g
TTriggerh p
>p q

parametersr |
,
 !
StateTransitionResult !
<! "
TState" (
,( )
TTrigger* 2
>2 3
currentResult4 A
)A B
;B C
Task #
ExecuteEntryActionAsync $
($ %
ExecutionParameters% 8
<8 9
T9 :
,: ;
TTrigger< D
>D E

parametersF P
,P Q!
StateTransitionResultR g
<g h
TStateh n
,n o
TTriggerp x
>x y
currentResult	z á
)
á à
;
à â
Task "
ExecuteExitActionAsync #
(# $
ExecutionParameters$ 7
<7 8
T8 9
,9 :
TTrigger; C
>C D

parametersE O
,O P!
StateTransitionResultQ f
<f g
TStateg m
,m n
TTriggero w
>w x
currentResult	y Ü
)
Ü á
;
á à
Task %
ExecuteReentryActionAsync &
(& '
ExecutionParameters' :
<: ;
T; <
,< =
TTrigger> F
>F G

parametersH R
,R S!
StateTransitionResultT i
<i j
TStatej p
,p q
TTriggerr z
>z {
currentResult	| â
)
â ä
;
ä ã
Task 
< !
StateTransitionResult "
<" #
TState# )
,) *
TTrigger+ 3
>3 4
>4 5
FireTriggerAsync6 F
(F G
ExecutionParametersG Z
<Z [
T[ \
,\ ]
TTrigger^ f
>f g

parametersh r
)r s
;s t
TState 
State 
{ 
get 
; 
} 
} 
} ¡
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
void 
AddSuperState 
( '
IStateConfigurationInternal 6
<6 7
T7 8
,8 9
TState: @
,@ A
TTriggerB J
>J K#
superStateConfigurationL c
)c d
;d e
void 
AddTransition 
( 
TTrigger #
trigger$ +
,+ ,
StateTransitionBase- @
<@ A
TA B
,B C
TStateD J
,J K
TTriggerL T
>T U

transitionV `
)` a
;a b!
StateTransitionResult 
< 
TState $
,$ %
TTrigger& .
>. /!
ExecuteAutoTransition0 E
(E F
ExecutionParametersF Y
<Y Z
TZ [
,[ \
TTrigger] e
>e f

parametersg q
,q r"
StateTransitionResult	s à
<
à â
TState
â è
,
è ê
TTrigger
ë ô
>
ô ö
currentResult
õ ®
)
® ©
;
© ™
void 
ExecuteEntryAction 
(  
T  !
context" )
,) *!
StateTransitionResult+ @
<@ A
TStateA G
,G H
TTriggerI Q
>Q R
currentResultS `
)` a
;a b
void 
ExecuteExitAction 
( 
T  
context! (
,( )!
StateTransitionResult* ?
<? @
TState@ F
,F G
TTriggerH P
>P Q
currentResultR _
)_ `
;` a
void  
ExecuteReentryAction !
(! "
T" #
context$ +
,+ ,!
StateTransitionResult- B
<B C
TStateC I
,I J
TTriggerK S
>S T
currentResultU b
)b c
;c d!
StateTransitionResult 
< 
TState $
,$ %
TTrigger& .
>. /
FireTrigger0 ;
(; <
ExecutionParameters< O
<O P
TP Q
,Q R
TTriggerS [
>[ \

parameters] g
)g h
;h i
bool 
	IsInState 
( 
TState 
state #
)# $
;$ %
TState 
State 
{ 
get 
; 
} 
} 
} î
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
} õ
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
>DD. /'
RegisterOnTransitionedEventDD0 K
(DDK L
ActionDDL R
<DDR S
TDDS T
,DDT U!
StateTransitionResultDDV k
<DDk l
TStateDDl r
,DDr s
TTriggerDDt |
>DD| }
>DD} ~ 
onTransitionedEvent	DD í
)
DDí ì
;
DDì î
}EE 
}FF ´ê
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
private 
Action 
< 
T 
> 
_defaultEntryAction -
;- .
private 
Action 
< 
T 
> 
_defaultExitAction ,
;, -
private   
Action   
<   
T   
>   
_reentryAction   (
;  ( )
private!! '
IStateConfigurationInternal!! +
<!!+ ,
T!!, -
,!!- .
TState!!/ 5
,!!5 6
TTrigger!!7 ?
>!!? @
_superState!!A L
;!!L M
internal)) 
StateConfiguration)) #
())# $
TState))$ *
state))+ 0
,))0 1
Func))2 6
<))6 7
T))7 8
,))8 9
TState)): @
>))@ A
stateAccessor))B O
,))O P
Action))Q W
<))W X
T))X Y
,))Y Z
TState))[ a
>))a b
stateMutator))c o
)))o p
:** 
base** 
(** 
state** 
,** 
stateAccessor** '
,**' (
stateMutator**) 5
)**5 6
{++ 	
}++
 
public44 
IStateConfiguration44 "
<44" #
T44# $
,44$ %
TState44& ,
,44, -
TTrigger44. 6
>446 7%
AddAutoFallbackTransition448 Q
(44Q R
Func44R V
<44V W
T44W X
,44X Y
bool44Z ^
>44^ _
	condition44` i
,44i j
string44k q
name44r v
=44w x
null44y }
,44} ~
uint	44 É
priority
44Ñ å
=
44ç é
$num
44è ê
)
44ê ë
{55 	
if66 
(66 
	condition66 
==66 
null66 !
)66! "
{77 
throw77 
new77 !
ArgumentNullException77 -
(77- .
nameof77. 4
(774 5
	condition775 >
)77> ?
)77? @
;77@ A
}77B C
var99 

transition99 
=99 "
StateTransitionFactory99 3
<993 4
T994 5
,995 6
TState997 =
,99= >
TTrigger99? G
>99G H
.99H I
GetStateTransition99I [
(99[ \
StateAccessor99\ i
,:: 
StateMutator:: 
,;; 
State;; 
,<< 
State<< 
,== 
	condition== 
,>> 
name>> 
,?? 
priority?? 
)?? 
;?? 
AddAutoTransition@@ 
(@@ 

transition@@ (
)@@( )
;@@) *
returnBB 
thisBB 
;BB 
}CC 	
publicLL 
IStateConfigurationLL "
<LL" #
TLL# $
,LL$ %
TStateLL& ,
,LL, -
TTriggerLL. 6
>LL6 7%
AddAutoFallbackTransitionLL8 Q
<LLQ R
TRequestLLR Z
>LLZ [
(LL[ \
FuncLL\ `
<LL` a
TLLa b
,LLb c
TRequestLLd l
,LLl m
boolLLn r
>LLr s
	conditionLLt }
,MM
 
stringMM 
nameMM 
=MM 
nullMM 
,NN
 
uintNN 
priorityNN 
=NN 
$numNN 
)NN 
whereOO 
TRequestOO 
:OO 
classOO "
{PP 	
ifQQ 
(QQ 
	conditionQQ 
==QQ 
nullQQ !
)QQ! "
{RR 
throwRR 
newRR !
ArgumentNullExceptionRR -
(RR- .
nameofRR. 4
(RR4 5
	conditionRR5 >
)RR> ?
)RR? @
;RR@ A
}RRB C
varTT 

transitionTT 
=TT "
StateTransitionFactoryTT 3
<TT3 4
TTT4 5
,TT5 6
TStateTT7 =
,TT= >
TTriggerTT? G
>TTG H
.TTH I
GetStateTransitionTTI [
(TT[ \
StateAccessorTT\ i
,UU 
StateMutatorUU 
,VV 
StateVV 
,WW 
StateWW 
,XX 
	conditionXX 
,YY 
nameYY 
,ZZ 
priorityZZ 
)ZZ 
;ZZ 
AddAutoTransition[[ 
([[ 

transition[[ (
)[[( )
;[[) *
return]] 
this]] 
;]] 
}^^ 	
publichh 
IStateConfigurationhh "
<hh" #
Thh# $
,hh$ %
TStatehh& ,
,hh, -
TTriggerhh. 6
>hh6 7%
AddAutoFallbackTransitionhh8 Q
(hhQ R
TStatehhR X
previousStatehhY f
,ii
 
Funcii 
<ii 
Tii 
,ii 
boolii 
>ii 
	conditionii #
,jj
 
stringjj 
namejj 
=jj 
nulljj 
,kk
 
uintkk 
prioritykk 
=kk 
$numkk 
)kk 
{ll 	
ifmm 
(mm 
	conditionmm 
==mm 
nullmm !
)mm! "
{nn 
thrownn 
newnn !
ArgumentNullExceptionnn -
(nn- .
nameofnn. 4
(nn4 5
	conditionnn5 >
)nn> ?
)nn? @
;nn@ A
}nnB C
varpp 

transitionpp 
=pp "
StateTransitionFactorypp 3
<pp3 4
Tpp4 5
,pp5 6
TStatepp7 =
,pp= >
TTriggerpp? G
>ppG H
.ppH I
GetStateTransitionppI [
(pp[ \
StateAccessorpp\ i
,qq 
StateMutatorqq 
,rr 
Staterr 
,ss 
Statess 
,tt 
	conditiontt 
,uu 
nameuu 
,vv 
priorityvv 
)vv 
;vv 
AddAutoTransitionww 
(ww 

transitionww (
)ww( )
;ww) *
returnyy 
thisyy 
;yy 
}zz 	
public
ÑÑ !
IStateConfiguration
ÑÑ "
<
ÑÑ" #
T
ÑÑ# $
,
ÑÑ$ %
TState
ÑÑ& ,
,
ÑÑ, -
TTrigger
ÑÑ. 6
>
ÑÑ6 7'
AddAutoFallbackTransition
ÑÑ8 Q
<
ÑÑQ R
TRequest
ÑÑR Z
>
ÑÑZ [
(
ÑÑ[ \
TState
ÑÑ\ b
previousState
ÑÑc p
,
ÖÖ
 
Func
ÖÖ 
<
ÖÖ 
T
ÖÖ 
,
ÖÖ 
TRequest
ÖÖ 
,
ÖÖ 
bool
ÖÖ "
>
ÖÖ" #
	condition
ÖÖ$ -
,
ÜÜ
 
string
ÜÜ 
name
ÜÜ 
=
ÜÜ 
null
ÜÜ 
,
áá
 
uint
áá 
priority
áá 
=
áá 
$num
áá 
)
áá 
where
àà 
TRequest
àà 
:
àà 
class
àà "
{
ââ 	
if
ää 
(
ää 
	condition
ää 
==
ää 
null
ää !
)
ää! "
{
ãã 
throw
ãã 
new
ãã #
ArgumentNullException
ãã -
(
ãã- .
nameof
ãã. 4
(
ãã4 5
	condition
ãã5 >
)
ãã> ?
)
ãã? @
;
ãã@ A
}
ããB C
if
çç 
(
çç 
!
çç *
AutoPreviousStateTransitions
çç -
.
çç- .
TryGetValue
çç. 9
(
çç9 :
previousState
çç: G
,
ççG H
out
ççI L
var
ççM P
transitions
ççQ \
)
çç\ ]
)
çç] ^
{
éé 
transitions
èè 
=
èè 
new
èè !
List
èè" &
<
èè& '!
StateTransitionBase
èè' :
<
èè: ;
T
èè; <
,
èè< =
TState
èè> D
,
èèD E
TTrigger
èèF N
>
èèN O
>
èèO P
(
èèP Q
)
èèQ R
;
èèR S*
AutoPreviousStateTransitions
êê ,
.
êê, -
Add
êê- 0
(
êê0 1
previousState
êê1 >
,
êê> ?
transitions
êê@ K
)
êêK L
;
êêL M
}
ëë 
var
ìì 

transition
ìì 
=
ìì $
StateTransitionFactory
ìì 3
<
ìì3 4
T
ìì4 5
,
ìì5 6
TState
ìì7 =
,
ìì= >
TTrigger
ìì? G
>
ììG H
.
ììH I 
GetStateTransition
ììI [
(
ìì[ \
StateAccessor
ìì\ i
,
îî 
StateMutator
îî 
,
ïï 
State
ïï 
,
ññ 
State
ññ 
,
óó 
	condition
óó 
,
òò 
name
òò 
,
ôô 
priority
ôô 
)
ôô 
;
ôô 
transitions
öö 
.
öö 
Add
öö 
(
öö 

transition
öö &
)
öö& '
;
öö' (
return
úú 
this
úú 
;
úú 
}
ùù 	
public
ßß !
IStateConfiguration
ßß "
<
ßß" #
T
ßß# $
,
ßß$ %
TState
ßß& ,
,
ßß, -
TTrigger
ßß. 6
>
ßß6 7&
AddAutoForwardTransition
ßß8 P
(
ßßP Q
TState
ßßQ W
toState
ßßX _
,
®®
 
Func
®® 
<
®® 
T
®® 
,
®® 
bool
®® 
>
®® 
	condition
®® #
,
©©
 
string
©© 
name
©© 
=
©© 
null
©© 
,
™™
 
uint
™™ 
priority
™™ 
=
™™ 
$num
™™ 
)
™™ 
{
´´ 	
if
¨¨ 
(
¨¨ 
	condition
¨¨ 
==
¨¨ 
null
¨¨ !
)
¨¨! "
{
≠≠ 
throw
≠≠ 
new
≠≠ #
ArgumentNullException
≠≠ -
(
≠≠- .
nameof
≠≠. 4
(
≠≠4 5
	condition
≠≠5 >
)
≠≠> ?
)
≠≠? @
;
≠≠@ A
}
≠≠B C
var
ØØ 

transition
ØØ 
=
ØØ $
StateTransitionFactory
ØØ 3
<
ØØ3 4
T
ØØ4 5
,
ØØ5 6
TState
ØØ7 =
,
ØØ= >
TTrigger
ØØ? G
>
ØØG H
.
ØØH I 
GetStateTransition
ØØI [
(
ØØ[ \
StateAccessor
ØØ\ i
,
∞∞ 
StateMutator
∞∞ 
,
±± 
State
±± 
,
≤≤ 
toState
≤≤ 
,
≥≥ 
	condition
≥≥ 
,
¥¥ 
name
¥¥ 
,
µµ 
priority
µµ 
)
µµ 
;
µµ 
AddAutoTransition
∂∂ 
(
∂∂ 

transition
∂∂ (
)
∂∂( )
;
∂∂) *
return
∏∏ 
this
∏∏ 
;
∏∏ 
}
ππ 	
public
ƒƒ !
IStateConfiguration
ƒƒ "
<
ƒƒ" #
T
ƒƒ# $
,
ƒƒ$ %
TState
ƒƒ& ,
,
ƒƒ, -
TTrigger
ƒƒ. 6
>
ƒƒ6 7&
AddAutoForwardTransition
ƒƒ8 P
<
ƒƒP Q
TRequest
ƒƒQ Y
>
ƒƒY Z
(
ƒƒZ [
TState
ƒƒ[ a
toState
ƒƒb i
,
≈≈ 
Func
≈≈ 
<
≈≈ 
T
≈≈ 
,
≈≈ 
TRequest
≈≈ 
,
≈≈ 
bool
≈≈  $
>
≈≈$ %
	condition
≈≈& /
,
∆∆ 
string
∆∆ 
name
∆∆ 
=
∆∆ 
null
∆∆  
,
«« 
uint
«« 
priority
«« 
=
«« 
$num
«« 
)
««  
where
»» 
TRequest
»» 
:
»» 
class
»» "
{
…… 	
if
   
(
   
	condition
   
==
   
null
   !
)
  ! "
{
ÀÀ 
throw
ÀÀ 
new
ÀÀ #
ArgumentNullException
ÀÀ -
(
ÀÀ- .
nameof
ÀÀ. 4
(
ÀÀ4 5
	condition
ÀÀ5 >
)
ÀÀ> ?
)
ÀÀ? @
;
ÀÀ@ A
}
ÀÀB C
var
ÕÕ 

transition
ÕÕ 
=
ÕÕ $
StateTransitionFactory
ÕÕ 3
<
ÕÕ3 4
T
ÕÕ4 5
,
ÕÕ5 6
TState
ÕÕ7 =
,
ÕÕ= >
TTrigger
ÕÕ? G
>
ÕÕG H
.
ÕÕH I 
GetStateTransition
ÕÕI [
(
ÕÕ[ \
StateAccessor
ÕÕ\ i
,
ŒŒ 
StateMutator
ŒŒ 
,
œœ 
State
œœ 
,
–– 
toState
–– 
,
—— 
	condition
—— 
,
““ 
name
““ 
,
”” 
priority
”” 
)
”” 
;
”” 
AddAutoTransition
‘‘ 
(
‘‘ 

transition
‘‘ (
)
‘‘( )
;
‘‘) *
return
÷÷ 
this
÷÷ 
;
÷÷ 
}
◊◊ 	
public
‚‚ !
IStateConfiguration
‚‚ "
<
‚‚" #
T
‚‚# $
,
‚‚$ %
TState
‚‚& ,
,
‚‚, -
TTrigger
‚‚. 6
>
‚‚6 7&
AddAutoForwardTransition
‚‚8 P
(
‚‚P Q
TState
‚‚Q W
toState
‚‚X _
,
„„ 
Func
„„ 
<
„„ 
T
„„ 
,
„„ 
bool
„„ 
>
„„ 
	condition
„„ %
,
‰‰ 
TState
‰‰ 
previousState
‰‰ "
,
ÂÂ 
string
ÂÂ 
name
ÂÂ 
=
ÂÂ 
null
ÂÂ  
,
ÊÊ 
uint
ÊÊ 
priority
ÊÊ 
=
ÊÊ 
$num
ÊÊ 
)
ÊÊ  
{
ÁÁ 	
if
ËË 
(
ËË 
	condition
ËË 
==
ËË 
null
ËË !
)
ËË! "
{
ÈÈ 
throw
ÈÈ 
new
ÈÈ #
ArgumentNullException
ÈÈ -
(
ÈÈ- .
nameof
ÈÈ. 4
(
ÈÈ4 5
	condition
ÈÈ5 >
)
ÈÈ> ?
)
ÈÈ? @
;
ÈÈ@ A
}
ÈÈB C
if
ÎÎ 
(
ÎÎ 
!
ÎÎ *
AutoPreviousStateTransitions
ÎÎ -
.
ÎÎ- .
TryGetValue
ÎÎ. 9
(
ÎÎ9 :
previousState
ÎÎ: G
,
ÎÎG H
out
ÎÎI L
var
ÎÎM P
transitions
ÎÎQ \
)
ÎÎ\ ]
)
ÎÎ] ^
{
ÏÏ 
transitions
ÌÌ 
=
ÌÌ 
new
ÌÌ !
List
ÌÌ" &
<
ÌÌ& '!
StateTransitionBase
ÌÌ' :
<
ÌÌ: ;
T
ÌÌ; <
,
ÌÌ< =
TState
ÌÌ> D
,
ÌÌD E
TTrigger
ÌÌF N
>
ÌÌN O
>
ÌÌO P
(
ÌÌP Q
)
ÌÌQ R
;
ÌÌR S*
AutoPreviousStateTransitions
ÓÓ ,
.
ÓÓ, -
Add
ÓÓ- 0
(
ÓÓ0 1
previousState
ÓÓ1 >
,
ÓÓ> ?
transitions
ÓÓ@ K
)
ÓÓK L
;
ÓÓL M
}
ÔÔ 
var
ÒÒ 

transition
ÒÒ 
=
ÒÒ $
StateTransitionFactory
ÒÒ 3
<
ÒÒ3 4
T
ÒÒ4 5
,
ÒÒ5 6
TState
ÒÒ7 =
,
ÒÒ= >
TTrigger
ÒÒ? G
>
ÒÒG H
.
ÒÒH I 
GetStateTransition
ÒÒI [
(
ÒÒ[ \
StateAccessor
ÒÒ\ i
,
ÚÚ 
StateMutator
ÚÚ 
,
ÛÛ 
State
ÛÛ 
,
ÙÙ 
toState
ÙÙ 
,
ıı 
	condition
ıı 
,
ˆˆ 
name
ˆˆ 
,
˜˜ 
priority
˜˜ 
)
˜˜ 
;
˜˜ 
transitions
¯¯ 
.
¯¯ 
Add
¯¯ 
(
¯¯ 

transition
¯¯ &
)
¯¯& '
;
¯¯' (
return
˙˙ 
this
˙˙ 
;
˙˙ 
}
˚˚ 	
public
áá !
IStateConfiguration
áá "
<
áá" #
T
áá# $
,
áá$ %
TState
áá& ,
,
áá, -
TTrigger
áá. 6
>
áá6 7&
AddAutoForwardTransition
áá8 P
<
ááP Q
TRequest
ááQ Y
>
ááY Z
(
ááZ [
TState
áá[ a
toState
ááb i
,
àà 
Func
àà 
<
àà 
T
àà 
,
àà 
TRequest
àà 
,
àà 
bool
àà  $
>
àà$ %
	condition
àà& /
,
ââ 
TState
ââ 
previousState
ââ "
,
ää 
string
ää 
name
ää 
=
ää 
null
ää  
,
ãã 
uint
ãã 
priority
ãã 
=
ãã 
$num
ãã 
)
ãã  
where
åå 
TRequest
åå 
:
åå 
class
åå "
{
çç 	
if
éé 
(
éé 
	condition
éé 
==
éé 
null
éé !
)
éé! "
{
èè 
throw
èè 
new
èè #
ArgumentNullException
èè -
(
èè- .
nameof
èè. 4
(
èè4 5
	condition
èè5 >
)
èè> ?
)
èè? @
;
èè@ A
}
èèB C
if
ëë 
(
ëë 
!
ëë *
AutoPreviousStateTransitions
ëë -
.
ëë- .
TryGetValue
ëë. 9
(
ëë9 :
previousState
ëë: G
,
ëëG H
out
ëëI L
var
ëëM P
transitions
ëëQ \
)
ëë\ ]
)
ëë] ^
{
íí 
transitions
ìì 
=
ìì 
new
ìì !
List
ìì" &
<
ìì& '!
StateTransitionBase
ìì' :
<
ìì: ;
T
ìì; <
,
ìì< =
TState
ìì> D
,
ììD E
TTrigger
ììF N
>
ììN O
>
ììO P
(
ììP Q
)
ììQ R
;
ììR S*
AutoPreviousStateTransitions
îî ,
.
îî, -
Add
îî- 0
(
îî0 1
previousState
îî1 >
,
îî> ?
transitions
îî@ K
)
îîK L
;
îîL M
}
ïï 
var
óó 

transition
óó 
=
óó $
StateTransitionFactory
óó 3
<
óó3 4
T
óó4 5
,
óó5 6
TState
óó7 =
,
óó= >
TTrigger
óó? G
>
óóG H
.
óóH I 
GetStateTransition
óóI [
(
óó[ \
StateAccessor
óó\ i
,
òò 
StateMutator
òò 
,
ôô 
State
ôô 
,
öö 
toState
öö 
,
õõ 
	condition
õõ 
,
úú 
name
úú 
,
ùù 
priority
ùù 
)
ùù 
;
ùù 
transitions
ûû 
.
ûû 
Add
ûû 
(
ûû 

transition
ûû &
)
ûû& '
;
ûû' (
return
†† 
this
†† 
;
†† 
}
°° 	
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
(
´´L M
TTrigger
´´M U
trigger
´´V ]
,
¨¨ 
Func
¨¨ 
<
¨¨ 
T
¨¨ 
,
¨¨ 
TState
¨¨ 
>
¨¨ 
function
¨¨ &
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
ÆÆ  
{
ØØ 	
if
∞∞ 
(
∞∞ 
function
∞∞ 
==
∞∞ 
null
∞∞  
)
∞∞  !
{
±± 
throw
±± 
new
±± #
ArgumentNullException
±± -
(
±±- .
nameof
±±. 4
(
±±4 5
function
±±5 =
)
±±= >
)
±±> ?
;
±±? @
}
±±A B
var
≥≥ 

transition
≥≥ 
=
≥≥ $
StateTransitionFactory
≥≥ 3
<
≥≥3 4
T
≥≥4 5
,
≥≥5 6
TState
≥≥7 =
,
≥≥= >
TTrigger
≥≥? G
>
≥≥G H
.
≥≥H I 
GetStateTransition
≥≥I [
(
≥≥[ \
StateAccessor
≥≥\ i
,
¥¥ 
StateMutator
¥¥ 
,
µµ 
State
µµ 
,
∂∂ 
function
∂∂ 
,
∑∑ 
name
∑∑ 
,
∏∏ 
priority
∏∏ 
)
∏∏ 
;
∏∏ 
AddTransition
ππ 
(
ππ 
trigger
ππ !
,
ππ! "

transition
ππ# -
)
ππ- .
;
ππ. /
return
ªª 
this
ªª 
;
ªª 
}
ºº 	
public
«« !
IStateConfiguration
«« "
<
««" #
T
««# $
,
««$ %
TState
««& ,
,
««, -
TTrigger
««. 6
>
««6 7"
AddDynamicTransition
««8 L
<
««L M
TRequest
««M U
>
««U V
(
««V W
TTrigger
««W _
trigger
««` g
,
»» 
Func
»» 
<
»» 
T
»» 
,
»» 
TRequest
»» 
,
»» 
TState
»»  &
>
»»& '
function
»»( 0
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
    
where
ÀÀ 
TRequest
ÀÀ 
:
ÀÀ 
class
ÀÀ "
{
ÃÃ 	
if
ÕÕ 
(
ÕÕ 
function
ÕÕ 
==
ÕÕ 
null
ÕÕ  
)
ÕÕ  !
{
ŒŒ 
throw
ŒŒ 
new
ŒŒ #
ArgumentNullException
ŒŒ -
(
ŒŒ- .
nameof
ŒŒ. 4
(
ŒŒ4 5
function
ŒŒ5 =
)
ŒŒ= >
)
ŒŒ> ?
;
ŒŒ? @
}
ŒŒA B
var
–– 

transition
–– 
=
–– $
StateTransitionFactory
–– 3
<
––3 4
T
––4 5
,
––5 6
TState
––7 =
,
––= >
TTrigger
––? G
>
––G H
.
––H I 
GetStateTransition
––I [
(
––[ \
StateAccessor
––\ i
,
—— 
StateMutator
—— 
,
““ 
State
““ 
,
”” 
function
”” 
,
‘‘ 
name
‘‘ 
,
’’ 
priority
’’ 
)
’’ 
;
’’ 
AddTransition
÷÷ 
(
÷÷ 
trigger
÷÷ !
,
÷÷! "

transition
÷÷# -
)
÷÷- .
;
÷÷. /
return
ÿÿ 
this
ÿÿ 
;
ÿÿ 
}
ŸŸ 	
public
‰‰ !
IStateConfiguration
‰‰ "
<
‰‰" #
T
‰‰# $
,
‰‰$ %
TState
‰‰& ,
,
‰‰, -
TTrigger
‰‰. 6
>
‰‰6 7
AddTransition
‰‰8 E
(
‰‰E F
TTrigger
‰‰F N
trigger
‰‰O V
,
ÂÂ 
TState
ÂÂ 
toState
ÂÂ 
,
ÊÊ 
Func
ÊÊ 
<
ÊÊ 
T
ÊÊ 
,
ÊÊ 
bool
ÊÊ 
>
ÊÊ 
	condition
ÊÊ %
=
ÊÊ& '
null
ÊÊ( ,
,
ÁÁ 
string
ÁÁ 
name
ÁÁ 
=
ÁÁ 
null
ÁÁ  
,
ËË 
uint
ËË 
priority
ËË 
=
ËË 
$num
ËË 
)
ËË  
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
ÎÎ 
	condition
ÎÎ 
=
ÎÎ 
_
ÎÎ 
=>
ÎÎ 
true
ÎÎ #
;
ÎÎ# $
}
ÎÎ% &
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
StateAccessor
ÌÌ\ i
,
ÓÓ 
StateMutator
ÓÓ 
,
ÔÔ 
State
ÔÔ 
,
 
toState
 
,
ÒÒ 
	condition
ÒÒ 
,
ÚÚ 
name
ÚÚ 
,
ÛÛ 
priority
ÛÛ 
)
ÛÛ 
;
ÛÛ 
AddTransition
ÙÙ 
(
ÙÙ 
trigger
ÙÙ !
,
ÙÙ! "

transition
ÙÙ# -
)
ÙÙ- .
;
ÙÙ. /
return
ˆˆ 
this
ˆˆ 
;
ˆˆ 
}
˜˜ 	
public
ÉÉ !
IStateConfiguration
ÉÉ "
<
ÉÉ" #
T
ÉÉ# $
,
ÉÉ$ %
TState
ÉÉ& ,
,
ÉÉ, -
TTrigger
ÉÉ. 6
>
ÉÉ6 7
AddTransition
ÉÉ8 E
<
ÉÉE F
TRequest
ÉÉF N
>
ÉÉN O
(
ÉÉO P
TTrigger
ÉÉP X
trigger
ÉÉY `
,
ÑÑ 
TState
ÑÑ 
toState
ÑÑ 
,
ÖÖ 
Func
ÖÖ 
<
ÖÖ 
T
ÖÖ 
,
ÖÖ 
TRequest
ÖÖ 
,
ÖÖ 
bool
ÖÖ  $
>
ÖÖ$ %
	condition
ÖÖ& /
,
ÜÜ 
string
ÜÜ 
name
ÜÜ 
=
ÜÜ 
null
ÜÜ  
,
áá 
uint
áá 
priority
áá 
=
áá 
$num
áá 
)
áá  
where
àà 
TRequest
àà 
:
àà 
class
àà "
{
ââ 	
if
ää 
(
ää 
	condition
ää 
==
ää 
null
ää !
)
ää! "
{
ãã 
throw
ãã 
new
ãã #
ArgumentNullException
ãã -
(
ãã- .
nameof
ãã. 4
(
ãã4 5
	condition
ãã5 >
)
ãã> ?
)
ãã? @
;
ãã@ A
}
ããB C
var
çç 

transition
çç 
=
çç $
StateTransitionFactory
çç 3
<
çç3 4
T
çç4 5
,
çç5 6
TState
çç7 =
,
çç= >
TTrigger
çç? G
>
ççG H
.
ççH I 
GetStateTransition
ççI [
(
çç[ \
StateAccessor
çç\ i
,
éé 
StateMutator
éé 
,
èè 
State
èè 
,
êê 
toState
êê 
,
ëë 
	condition
ëë 
,
íí 
name
íí 
,
ìì 
priority
ìì 
)
ìì 
;
ìì 
AddTransition
îî 
(
îî 
trigger
îî !
,
îî! "

transition
îî# -
)
îî- .
;
îî. /
return
ññ 
this
ññ 
;
ññ 
}
óó 	
public
ûû !
IStateConfiguration
ûû "
<
ûû" #
T
ûû# $
,
ûû$ %
TState
ûû& ,
,
ûû, -
TTrigger
ûû. 6
>
ûû6 7
AddEntryAction
ûû8 F
(
ûûF G
Action
ûûG M
<
ûûM N
T
ûûN O
>
ûûO P
action
ûûQ W
)
ûûW X
{
üü 	
if
†† 
(
†† !
_defaultEntryAction
†† #
!=
††$ &
null
††' +
)
††+ ,
{
°° 
throw
°° 
new
°° '
InvalidOperationException
°° 1
(
°°1 2
$str
°°2 a
)
°°a b
;
°°b c
}
°°d e!
_defaultEntryAction
££ 
=
££  !
action
££" (
??
££) +
throw
££, 1
new
££2 5#
ArgumentNullException
££6 K
(
££K L
nameof
££L R
(
££R S
action
££S Y
)
££Y Z
)
££Z [
;
££[ \
return
•• 
this
•• 
;
•• 
}
¶¶ 	
public
ØØ !
IStateConfiguration
ØØ "
<
ØØ" #
T
ØØ# $
,
ØØ$ %
TState
ØØ& ,
,
ØØ, -
TTrigger
ØØ. 6
>
ØØ6 7
AddReentryAction
ØØ8 H
(
ØØH I
Action
ØØI O
<
ØØO P
T
ØØP Q
>
ØØQ R
action
ØØS Y
)
ØØY Z
{
∞∞ 	
if
±± 
(
±± 
_reentryAction
±± 
!=
±± !
null
±±" &
)
±±& '
{
≤≤ 
throw
≤≤ 
new
≤≤ '
InvalidOperationException
≤≤ 1
(
≤≤1 2
$str
≤≤2 Y
)
≤≤Y Z
;
≤≤Z [
}
≤≤\ ]
_reentryAction
¥¥ 
=
¥¥ 
action
¥¥ #
??
¥¥$ &
throw
¥¥' ,
new
¥¥- 0#
ArgumentNullException
¥¥1 F
(
¥¥F G
nameof
¥¥G M
(
¥¥M N
action
¥¥N T
)
¥¥T U
)
¥¥U V
;
¥¥V W
return
∂∂ 
this
∂∂ 
;
∂∂ 
}
∑∑ 	
public
øø !
IStateConfiguration
øø "
<
øø" #
T
øø# $
,
øø$ %
TState
øø& ,
,
øø, -
TTrigger
øø. 6
>
øø6 7
AddEntryAction
øø8 F
(
øøF G
Action
øøG M
<
øøM N
T
øøN O
>
øøO P
action
øøQ W
,
øøW X
TState
øøY _
previousState
øø` m
)
øøm n
{
¿¿ 	
if
¡¡ 
(
¡¡ 
action
¡¡ 
==
¡¡ 
null
¡¡ 
)
¡¡ 
{
¬¬ 
throw
¬¬ 
new
¬¬ #
ArgumentNullException
¬¬ -
(
¬¬- .
nameof
¬¬. 4
(
¬¬4 5
action
¬¬5 ;
)
¬¬; <
)
¬¬< =
;
¬¬= >
}
¬¬? @
if
ƒƒ 
(
ƒƒ (
_previousStateEntryActions
ƒƒ *
.
ƒƒ* +
ContainsKey
ƒƒ+ 6
(
ƒƒ6 7
previousState
ƒƒ7 D
)
ƒƒD E
)
ƒƒE F
{
≈≈ 
throw
≈≈ 
new
≈≈ '
InvalidOperationException
≈≈ 1
(
≈≈1 2
$str
≈≈2 g
)
≈≈g h
;
≈≈h i
}
≈≈j k(
_previousStateEntryActions
«« &
.
««& '
Add
««' *
(
««* +
previousState
««+ 8
,
««8 9
action
««: @
)
««@ A
;
««A B
return
…… 
this
…… 
;
…… 
}
   	
public
—— !
IStateConfiguration
—— "
<
——" #
T
——# $
,
——$ %
TState
——& ,
,
——, -
TTrigger
——. 6
>
——6 7
AddExitAction
——8 E
(
——E F
Action
——F L
<
——L M
T
——M N
>
——N O
action
——P V
)
——V W
{
““ 	
if
”” 
(
””  
_defaultExitAction
”” "
!=
””# %
null
””& *
)
””* +
{
‘‘ 
throw
‘‘ 
new
‘‘ '
InvalidOperationException
‘‘ 1
(
‘‘1 2
$str
‘‘2 T
)
‘‘T U
;
‘‘U V
}
‘‘W X 
_defaultExitAction
÷÷ 
=
÷÷  
action
÷÷! '
??
÷÷( *
throw
÷÷+ 0
new
÷÷1 4#
ArgumentNullException
÷÷5 J
(
÷÷J K
nameof
÷÷K Q
(
÷÷Q R
action
÷÷R X
)
÷÷X Y
)
÷÷Y Z
;
÷÷Z [
return
ÿÿ 
this
ÿÿ 
;
ÿÿ 
}
ŸŸ 	
public
·· !
IStateConfiguration
·· "
<
··" #
T
··# $
,
··$ %
TState
··& ,
,
··, -
TTrigger
··. 6
>
··6 7
AddExitAction
··8 E
(
··E F
Action
··F L
<
··L M
T
··M N
>
··N O
action
··P V
,
··V W
TState
··X ^
	nextState
··_ h
)
··h i
{
‚‚ 	
if
„„ 
(
„„ 
action
„„ 
==
„„ 
null
„„ 
)
„„ 
{
‰‰ 
throw
‰‰ 
new
‰‰ #
ArgumentNullException
‰‰ -
(
‰‰- .
nameof
‰‰. 4
(
‰‰4 5
action
‰‰5 ;
)
‰‰; <
)
‰‰< =
;
‰‰= >
}
‰‰> ?
if
ÊÊ 
(
ÊÊ #
_nextStateExitActions
ÊÊ %
.
ÊÊ% &
ContainsKey
ÊÊ& 1
(
ÊÊ1 2
	nextState
ÊÊ2 ;
)
ÊÊ; <
)
ÊÊ< =
{
ÁÁ 
throw
ÁÁ 
new
ÁÁ '
InvalidOperationException
ÁÁ 1
(
ÁÁ1 2
$"
ÁÁ2 4)
Exit action for next state 
ÁÁ4 O
{
ÁÁO P
	nextState
ÁÁP Y
}
ÁÁY Z
 already set.
ÁÁZ g
"
ÁÁg h
)
ÁÁh i
;
ÁÁi j
}
ÁÁk l#
_nextStateExitActions
ÈÈ !
.
ÈÈ! "
Add
ÈÈ" %
(
ÈÈ% &
	nextState
ÈÈ& /
,
ÈÈ/ 0
action
ÈÈ1 7
)
ÈÈ7 8
;
ÈÈ8 9
return
ÎÎ 
this
ÎÎ 
;
ÎÎ 
}
ÏÏ 	
public
ÓÓ 
void
ÓÓ 
AddSuperState
ÓÓ !
(
ÓÓ! ")
IStateConfigurationInternal
ÓÓ" =
<
ÓÓ= >
T
ÓÓ> ?
,
ÓÓ? @
TState
ÓÓA G
,
ÓÓG H
TTrigger
ÓÓI Q
>
ÓÓQ R%
superStateConfiguration
ÓÓS j
)
ÓÓj k
{
ÔÔ 	
if
 
(
 
	IsInState
 
(
 %
superStateConfiguration
 1
.
1 2
State
2 7
)
7 8
)
8 9
{
ÒÒ 
throw
ÒÒ 
new
ÒÒ )
ArgumentOutOfRangeException
ÒÒ 3
(
ÒÒ3 4
$"
ÒÒ4 6
{
ÒÒ6 7
State
ÒÒ7 <
}
ÒÒ< =)
 is already a sub-state of 
ÒÒ= X
{
ÒÒX Y%
superStateConfiguration
ÒÒY p
.
ÒÒp q
State
ÒÒq v
}
ÒÒv w
.
ÒÒw x
"
ÒÒx y
)
ÒÒy z
;
ÒÒz {
}
ÒÒ| }
if
ÛÛ 
(
ÛÛ %
superStateConfiguration
ÛÛ '
.
ÛÛ' (
	IsInState
ÛÛ( 1
(
ÛÛ1 2
State
ÛÛ2 7
)
ÛÛ7 8
)
ÛÛ8 9
{
ÙÙ 
throw
ÙÙ 
new
ÙÙ )
ArgumentOutOfRangeException
ÙÙ 3
(
ÙÙ3 4
$"
ÙÙ4 6
{
ÙÙ6 7%
superStateConfiguration
ÙÙ7 N
.
ÙÙN O
State
ÙÙO T
}
ÙÙT U)
 is already a sub-state of 
ÙÙU p
{
ÙÙp q
State
ÙÙq v
}
ÙÙv w
.
ÙÙw x
"
ÙÙx y
)
ÙÙy z
;
ÙÙz {
}
ÙÙ| }
_superState
ˆˆ 
=
ˆˆ %
superStateConfiguration
ˆˆ 1
;
ˆˆ1 2
}
˜˜ 	
public
ˇˇ !
IStateConfiguration
ˇˇ "
<
ˇˇ" #
T
ˇˇ# $
,
ˇˇ$ %
TState
ˇˇ& ,
,
ˇˇ, -
TTrigger
ˇˇ. 6
>
ˇˇ6 7
AddTriggerAction
ˇˇ8 H
(
ˇˇH I
TTrigger
ˇˇI Q
trigger
ˇˇR Y
,
ˇˇY Z
Action
ˇˇ[ a
<
ˇˇa b
T
ˇˇb c
>
ˇˇc d
action
ˇˇe k
)
ˇˇk l
{
ÄÄ 	
if
ÅÅ 
(
ÅÅ 
_triggerActions
ÅÅ 
.
ÅÅ  
ContainsKey
ÅÅ  +
(
ÅÅ+ ,
trigger
ÅÅ, 3
)
ÅÅ3 4
)
ÅÅ4 5
{
ÇÇ 
throw
ÇÇ 
new
ÇÇ '
InvalidOperationException
ÇÇ 1
(
ÇÇ1 2
$"
ÇÇ2 41
#Only one action is allowed for the 
ÇÇ4 W
{
ÇÇW X
trigger
ÇÇX _
}
ÇÇ_ `
	 trigger.
ÇÇ` i
"
ÇÇi j
)
ÇÇj k
;
ÇÇk l
}
ÇÇm n
_triggerActions
ÑÑ 
.
ÑÑ 
Add
ÑÑ 
(
ÑÑ  
trigger
ÑÑ  '
,
ÑÑ' ("
TriggerActionFactory
ÑÑ) =
<
ÑÑ= >
T
ÑÑ> ?
,
ÑÑ? @
TTrigger
ÑÑA I
>
ÑÑI J
.
ÑÑJ K
GetTriggerAction
ÑÑK [
(
ÑÑ[ \
action
ÑÑ\ b
)
ÑÑb c
)
ÑÑc d
;
ÑÑd e
return
ÜÜ 
this
ÜÜ 
;
ÜÜ 
}
áá 	
public
êê !
IStateConfiguration
êê "
<
êê" #
T
êê# $
,
êê$ %
TState
êê& ,
,
êê, -
TTrigger
êê. 6
>
êê6 7
AddTriggerAction
êê8 H
<
êêH I
TRequest
êêI Q
>
êêQ R
(
êêR S
TTrigger
êêS [
trigger
êê\ c
,
êêc d
Action
ëë 
<
ëë 
T
ëë 
,
ëë 
TRequest
ëë 
>
ëë 
action
ëë  &
)
ëë& '
{
íí 	
if
ìì 
(
ìì 
_triggerActions
ìì 
.
ìì  
ContainsKey
ìì  +
(
ìì+ ,
trigger
ìì, 3
)
ìì3 4
)
ìì4 5
{
îî 
throw
îî 
new
îî '
InvalidOperationException
îî 1
(
îî1 2
$"
îî2 4-
Only one action is allowed for 
îî4 S
{
îîS T
trigger
îîT [
}
îî[ \
	 trigger.
îî\ e
"
îîe f
)
îîf g
;
îîg h
}
îîi j
_triggerActions
ññ 
.
ññ 
Add
ññ 
(
ññ  
trigger
ññ  '
,
ññ' ("
TriggerActionFactory
ññ) =
<
ññ= >
T
ññ> ?
,
ññ? @
TTrigger
ññA I
>
ññI J
.
ññJ K
GetTriggerAction
ññK [
(
ññ[ \
action
ññ\ b
)
ññb c
)
ññc d
;
ññd e
return
òò 
this
òò 
;
òò 
}
ôô 	
public
õõ #
StateTransitionResult
õõ $
<
õõ$ %
TState
õõ% +
,
õõ+ ,
TTrigger
õõ- 5
>
õõ5 6#
ExecuteAutoTransition
õõ7 L
(
õõL M!
ExecutionParameters
õõM `
<
õõ` a
T
õõa b
,
õõb c
TTrigger
õõd l
>
õõl m

parameters
õõn x
,
úú #
StateTransitionResult
úú #
<
úú# $
TState
úú$ *
,
úú* +
TTrigger
úú, 4
>
úú4 5
currentResult
úú6 C
)
úúC D
{
ùù 	#
StateTransitionResult
ûû !
<
ûû! "
TState
ûû" (
,
ûû( )
TTrigger
ûû* 2
>
ûû2 3
localResult
ûû4 ?
;
ûû? @
if
°° 
(
°° *
AutoPreviousStateTransitions
°° ,
.
°°, -
TryGetValue
°°- 8
(
°°8 9
currentResult
°°9 F
.
°°F G
PreviousState
°°G T
,
°°T U
out
°°V Y
var
°°Z ]&
previousStateTransitions
°°^ v
)
°°v w
)
°°w x
{
¢¢ 
foreach
££ 
(
££ 
var
££ 

transition
££ '
in
££( *&
previousStateTransitions
££+ C
.
££C D
OrderBy
££D K
(
££K L
t
££L M
=>
££N P
t
££Q R
.
££R S
Priority
££S [
)
££[ \
)
££\ ]
{
§§ 
localResult
•• 
=
••  !

transition
••" ,
.
••, -
Execute
••- 4
(
••4 5

parameters
••5 ?
,
••? @
currentResult
••A N
)
••N O
;
••O P
if
¶¶ 
(
¶¶ 
localResult
¶¶ #
.
¶¶# $
WasSuccessful
¶¶$ 1
)
¶¶1 2
{
ßß 
return
ßß 
localResult
ßß (
;
ßß( )
}
ßß* +
}
®® 
}
©© 
foreach
¨¨ 
(
¨¨ 
var
¨¨ 

transition
¨¨ #
in
¨¨$ &
AutoTransitions
¨¨' 6
.
¨¨6 7
OrderBy
¨¨7 >
(
¨¨> ?
t
¨¨? @
=>
¨¨A C
t
¨¨D E
.
¨¨E F
Priority
¨¨F N
)
¨¨N O
)
¨¨O P
{
≠≠ 
localResult
ÆÆ 
=
ÆÆ 

transition
ÆÆ (
.
ÆÆ( )
Execute
ÆÆ) 0
(
ÆÆ0 1

parameters
ÆÆ1 ;
,
ÆÆ; <
currentResult
ÆÆ= J
)
ÆÆJ K
;
ÆÆK L
if
ØØ 
(
ØØ 
localResult
ØØ 
.
ØØ  
WasSuccessful
ØØ  -
)
ØØ- .
{
∞∞ 
return
∞∞ 
localResult
∞∞ $
;
∞∞$ %
}
∞∞& '
}
±± 
return
¥¥ 
_superState
¥¥ 
!=
¥¥ !
null
¥¥" &
?
µµ 
_superState
µµ 
.
µµ #
ExecuteAutoTransition
µµ 3
(
µµ3 4

parameters
µµ4 >
,
µµ> ?
currentResult
µµ@ M
)
µµM N
:
∂∂ 
new
∂∂ #
StateTransitionResult
∂∂ +
<
∂∂+ ,
TState
∂∂, 2
,
∂∂2 3
TTrigger
∂∂4 <
>
∂∂< =
(
∂∂= >

parameters
∂∂> H
.
∂∂H I
Trigger
∂∂I P
,
∑∑ 
currentResult
∑∑ !
.
∑∑! "
StartingState
∑∑" /
,
∏∏ 
currentResult
∏∏ !
.
∏∏! "
PreviousState
∏∏" /
,
ππ 
currentResult
ππ !
.
ππ! "
CurrentState
ππ" .
,
∫∫ 
currentResult
∫∫ !
.
∫∫! " 
LastTransitionName
∫∫" 4
,
ªª 
transitionDefined
ªª %
:
ªª% &
true
ªª' +
)
ªª+ ,
;
ªª, -
}
ºº 	
public
ææ 
void
ææ  
ExecuteEntryAction
ææ &
(
ææ& '
T
ææ' (
context
ææ) 0
,
ææ0 1#
StateTransitionResult
ææ2 G
<
ææG H
TState
ææH N
,
ææN O
TTrigger
ææP X
>
ææX Y
currentResult
ææZ g
)
ææg h
{
øø 	
if
¡¡ 
(
¡¡ 
_superState
¡¡ 
!=
¡¡ 
null
¡¡ #
&&
¡¡$ &
!
¡¡' (
	IsInState
¡¡( 1
(
¡¡1 2
currentResult
¡¡2 ?
.
¡¡? @
CurrentState
¡¡@ L
)
¡¡L M
)
¡¡M N
{
¬¬ 
_superState
¬¬ 
.
¬¬  
ExecuteEntryAction
¬¬ ,
(
¬¬, -
context
¬¬- 4
,
¬¬4 5
currentResult
¬¬6 C
)
¬¬C D
;
¬¬D E
}
¬¬F G
if
≈≈ 
(
≈≈ (
_previousStateEntryActions
≈≈ *
.
≈≈* +
TryGetValue
≈≈+ 6
(
≈≈6 7
currentResult
≈≈7 D
.
≈≈D E
PreviousState
≈≈E R
,
≈≈R S
out
≈≈T W
var
≈≈X [
action
≈≈\ b
)
≈≈b c
)
≈≈c d
{
∆∆ 
action
∆∆ 
.
∆∆ 
Invoke
∆∆ 
(
∆∆ 
context
∆∆ #
)
∆∆# $
;
∆∆$ %
}
∆∆& '!
_defaultEntryAction
…… 
?
……  
.
……  !
Invoke
……! '
(
……' (
context
……( /
)
……/ 0
;
……0 1
}
   	
public
ÃÃ 
void
ÃÃ 
ExecuteExitAction
ÃÃ %
(
ÃÃ% &
T
ÃÃ& '
context
ÃÃ( /
,
ÃÃ/ 0#
StateTransitionResult
ÃÃ1 F
<
ÃÃF G
TState
ÃÃG M
,
ÃÃM N
TTrigger
ÃÃO W
>
ÃÃW X
currentResult
ÃÃY f
)
ÃÃf g
{
ÕÕ 	
if
œœ 
(
œœ #
_nextStateExitActions
œœ %
.
œœ% &
TryGetValue
œœ& 1
(
œœ1 2
currentResult
œœ2 ?
.
œœ? @
CurrentState
œœ@ L
,
œœL M
out
œœN Q
var
œœR U
action
œœV \
)
œœ\ ]
)
œœ] ^
{
–– 
action
–– 
.
–– 
Invoke
–– 
(
–– 
context
–– #
)
––# $
;
––$ %
}
––& ' 
_defaultExitAction
”” 
?
”” 
.
””  
Invoke
””  &
(
””& '
context
””' .
)
””. /
;
””/ 0
if
’’ 
(
’’ 
_superState
’’ 
!=
’’ 
null
’’ #
&&
’’$ &
!
’’' (
	IsInState
’’( 1
(
’’1 2
currentResult
’’2 ?
.
’’? @
CurrentState
’’@ L
)
’’L M
)
’’M N
{
÷÷ 
_superState
÷÷ 
.
÷÷ 
ExecuteExitAction
÷÷ +
(
÷÷+ ,
context
÷÷, 3
,
÷÷3 4
currentResult
÷÷5 B
)
÷÷B C
;
÷÷C D
}
÷÷E F
}
◊◊ 	
public
ŸŸ 
void
ŸŸ "
ExecuteReentryAction
ŸŸ (
(
ŸŸ( )
T
ŸŸ) *
context
ŸŸ+ 2
,
ŸŸ2 3#
StateTransitionResult
ŸŸ4 I
<
ŸŸI J
TState
ŸŸJ P
,
ŸŸP Q
TTrigger
ŸŸR Z
>
ŸŸZ [
currentResult
ŸŸ\ i
)
ŸŸi j
{
⁄⁄ 	
_superState
€€ 
?
€€ 
.
€€ "
ExecuteReentryAction
€€ -
(
€€- .
context
€€. 5
,
€€5 6
currentResult
€€7 D
)
€€D E
;
€€E F
_reentryAction
›› 
?
›› 
.
›› 
Invoke
›› "
(
››" #
context
››# *
)
››* +
;
››+ ,
}
ﬁﬁ 	
public
‡‡ #
StateTransitionResult
‡‡ $
<
‡‡$ %
TState
‡‡% +
,
‡‡+ ,
TTrigger
‡‡- 5
>
‡‡5 6
FireTrigger
‡‡7 B
(
‡‡B C!
ExecutionParameters
‡‡C V
<
‡‡V W
T
‡‡W X
,
‡‡X Y
TTrigger
‡‡Z b
>
‡‡b c

parameters
‡‡d n
)
‡‡n o
{
·· 	
if
‚‚ 
(
‚‚ 
_triggerActions
‚‚ 
.
‚‚  
TryGetValue
‚‚  +
(
‚‚+ ,

parameters
‚‚, 6
.
‚‚6 7
Trigger
‚‚7 >
,
‚‚> ?
out
‚‚@ C
var
‚‚D G
triggerAction
‚‚H U
)
‚‚U V
)
‚‚V W
{
„„ 
triggerAction
„„ 
.
„„ 
Execute
„„ #
(
„„# $

parameters
„„$ .
)
„„. /
;
„„/ 0
}
„„1 2
var
ÂÂ 
result
ÂÂ 
=
ÂÂ 
FireTriggerPrim
ÂÂ (
(
ÂÂ( )

parameters
ÂÂ) 3
)
ÂÂ3 4
;
ÂÂ4 5
if
ÁÁ 
(
ÁÁ 
!
ÁÁ 
(
ÁÁ 
result
ÁÁ 
?
ÁÁ 
.
ÁÁ 
WasSuccessful
ÁÁ '
??
ÁÁ( *
false
ÁÁ+ 0
)
ÁÁ0 1
&&
ÁÁ2 4
_superState
ÁÁ5 @
!=
ÁÁA C
null
ÁÁD H
)
ÁÁH I
{
ËË 
result
ËË 
=
ËË 
_superState
ËË "
.
ËË" #
FireTrigger
ËË# .
(
ËË. /

parameters
ËË/ 9
)
ËË9 :
;
ËË: ;
}
ËË< =
else
ÈÈ 
{
ÍÍ 
var
ÎÎ 

startState
ÎÎ 
=
ÎÎ  
StateAccessor
ÎÎ! .
(
ÎÎ. /

parameters
ÎÎ/ 9
.
ÎÎ9 :
Context
ÎÎ: A
)
ÎÎA B
;
ÎÎB C
result
ÏÏ 
=
ÏÏ 
result
ÏÏ 
??
ÏÏ  "
new
ÌÌ #
StateTransitionResult
ÌÌ -
<
ÌÌ- .
TState
ÌÌ. 4
,
ÌÌ4 5
TTrigger
ÌÌ6 >
>
ÌÌ> ?
(
ÌÌ? @

parameters
ÌÌ@ J
.
ÌÌJ K
Trigger
ÌÌK R
,
ÓÓ 

startState
ÓÓ $
,
ÔÔ 

startState
ÔÔ $
,
 

startState
 $
,
ÒÒ 
string
ÒÒ  
.
ÒÒ  !
Empty
ÒÒ! &
,
ÚÚ 
transitionDefined
ÚÚ +
:
ÚÚ+ ,
false
ÚÚ- 2
)
ÚÚ2 3
;
ÚÚ3 4
}
ÛÛ 
return
ıı 
result
ıı 
;
ıı 
}
ˆˆ 	
public
¯¯ 
bool
¯¯ 
	IsInState
¯¯ 
(
¯¯ 
TState
¯¯ $
state
¯¯% *
)
¯¯* +
{
˘˘ 	
if
˙˙ 
(
˙˙ 
state
˙˙ 
.
˙˙ 
	CompareTo
˙˙ 
(
˙˙  
State
˙˙  %
)
˙˙% &
==
˙˙' )
$num
˙˙* +
)
˙˙+ ,
{
˚˚ 
return
˚˚ 
true
˚˚ 
;
˚˚ 
}
˚˚ 
return
˝˝ 
_superState
˝˝ 
?
˝˝ 
.
˝˝  
	IsInState
˝˝  )
(
˝˝) *
state
˝˝* /
)
˝˝/ 0
??
˝˝1 3
false
˝˝4 9
;
˝˝9 :
}
˛˛ 	
public
ÄÄ !
IStateConfiguration
ÄÄ "
<
ÄÄ" #
T
ÄÄ# $
,
ÄÄ$ %
TState
ÄÄ& ,
,
ÄÄ, -
TTrigger
ÄÄ. 6
>
ÄÄ6 7
IsSubStateOf
ÄÄ8 D
(
ÄÄD E!
IStateConfiguration
ÄÄE X
<
ÄÄX Y
T
ÄÄY Z
,
ÄÄZ [
TState
ÄÄ\ b
,
ÄÄb c
TTrigger
ÄÄd l
>
ÄÄl m&
superStateConfigurationÄÄn Ö
)ÄÄÖ Ü
{
ÅÅ 	
AddSuperState
ÇÇ 
(
ÇÇ %
superStateConfiguration
ÇÇ 1
as
ÇÇ2 4)
IStateConfigurationInternal
ÇÇ5 P
<
ÇÇP Q
T
ÇÇQ R
,
ÇÇR S
TState
ÇÇT Z
,
ÇÇZ [
TTrigger
ÇÇ\ d
>
ÇÇd e
)
ÇÇe f
;
ÇÇf g
return
ÑÑ 
this
ÑÑ 
;
ÑÑ 
}
ÖÖ 	
}
ÜÜ 
}áá ù‰
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
new 

Dictionary 
< 
TState !
,! "
Func# '
<' (
T( )
,) *
CancellationToken+ <
,< =
Task> B
>B C
>C D
(D E
)E F
;F G
private   
readonly   

Dictionary   #
<  # $
TState  $ *
,  * +
Func  , 0
<  0 1
T  1 2
,  2 3
CancellationToken  4 E
,  E F
Task  G K
>  K L
>  L M!
_nextStateExitActions  N c
=  d e
new!! 

Dictionary!! 
<!! 
TState!! !
,!!! "
Func!!# '
<!!' (
T!!( )
,!!) *
CancellationToken!!+ <
,!!< =
Task!!> B
>!!B C
>!!C D
(!!D E
)!!E F
;!!F G
private## 
Func## 
<## 
T## 
,## 
CancellationToken## )
,##) *
Task##+ /
>##/ 0
_defaultEntryAction##1 D
;##D E
private$$ 
Func$$ 
<$$ 
T$$ 
,$$ 
CancellationToken$$ )
,$$) *
Task$$+ /
>$$/ 0
_defaultExitAction$$1 C
;$$C D
private%% 
Func%% 
<%% 
T%% 
,%% 
CancellationToken%% )
,%%) *
Task%%+ /
>%%/ 0
_reentryAction%%1 ?
;%%? @
private'' 
readonly'' 

Dictionary'' #
<''# $
TTrigger''$ ,
,'', -
FunctionActionBase''. @
<''@ A
T''A B
>''B C
>''C D
_triggerActions''E T
=''U V
new''W Z

Dictionary''[ e
<''e f
TTrigger''f n
,''n o
FunctionActionBase	''p Ç
<
''Ç É
T
''É Ñ
>
''Ñ Ö
>
''Ö Ü
(
''Ü á
)
''á à
;
''à â
private)) ,
 IStateConfigurationAsyncInternal)) 0
<))0 1
T))1 2
,))2 3
TState))4 :
,)): ;
TTrigger))< D
>))D E
_superState))F Q
;))Q R
internal11 #
StateConfigurationAsync11 (
(11( )
TState11) /
state110 5
,115 6
Func117 ;
<11; <
T11< =
,11= >
TState11? E
>11E F
stateAccessor11G T
,11T U
Action11V \
<11\ ]
T11] ^
,11^ _
TState11` f
>11f g
stateMutator11h t
)11t u
:22 
base22 
(22 
state22 
,22 
stateAccessor22 '
,22' (
stateMutator22) 5
)225 6
{33 	
}33
 
public== $
IStateConfigurationAsync== '
<==' (
T==( )
,==) *
TState==+ 1
,==1 2
TTrigger==3 ;
>==; <$
AddAutoForwardTransition=== U
(==U V
TState==V \
toState==] d
,>>
 
Func>> 
<>> 
T>> 
,>> 
CancellationToken>> %
,>>% &
Task>>' +
<>>+ ,
bool>>, 0
>>>0 1
>>>1 2
	condition>>3 <
,??
 
string?? 
name?? 
=?? 
null?? 
,@@
 
uint@@ 
priority@@ 
=@@ 
$num@@ 
)@@ 
{AA 	
ifBB 
(BB 
	conditionBB 
==BB 
nullBB !
)BB! "
{CC 
throwCC 
newCC !
ArgumentNullExceptionCC -
(CC- .
nameofCC. 4
(CC4 5
	conditionCC5 >
)CC> ?
)CC? @
;CC@ A
}CCB C
varEE 

transitionEE 
=EE "
StateTransitionFactoryEE 3
<EE3 4
TEE4 5
,EE5 6
TStateEE7 =
,EE= >
TTriggerEE? G
>EEG H
.EEH I
GetStateTransitionEEI [
(EE[ \
StateAccessorEE\ i
,FF 
StateMutatorFF 
,GG 
StateGG 
,HH 
toStateHH 
,II 
	conditionII 
,JJ 
nameJJ 
,KK 
priorityKK 
)KK 
;KK 
AddAutoTransitionLL 
(LL 

transitionLL (
)LL( )
;LL) *
returnNN 
thisNN 
;NN 
}OO 	
publicZZ $
IStateConfigurationAsyncZZ '
<ZZ' (
TZZ( )
,ZZ) *
TStateZZ+ 1
,ZZ1 2
TTriggerZZ3 ;
>ZZ; <$
AddAutoForwardTransitionZZ= U
<ZZU V
TRequestZZV ^
>ZZ^ _
(ZZ_ `
TStateZZ` f
toStateZZg n
,[[
 
Func[[ 
<[[ 
T[[ 
,[[ 
TRequest[[ 
,[[ 
CancellationToken[[ /
,[[/ 0
Task[[1 5
<[[5 6
bool[[6 :
>[[: ;
>[[; <
	condition[[= F
,\\
 
string\\ 
name\\ 
=\\ 
null\\ 
,]]
 
uint]] 
priority]] 
=]] 
$num]] 
)]] 
where^^ 
TRequest^^ 
:^^ 
class^^ "
{__ 	
if`` 
(`` 
	condition`` 
==`` 
null`` !
)``! "
{aa 
throwaa 
newaa !
ArgumentNullExceptionaa -
(aa- .
nameofaa. 4
(aa4 5
	conditionaa5 >
)aa> ?
)aa? @
;aa@ A
}aaB C
varcc 

transitioncc 
=cc "
StateTransitionFactorycc 3
<cc3 4
Tcc4 5
,cc5 6
TStatecc7 =
,cc= >
TTriggercc? G
>ccG H
.ccH I
GetStateTransitionccI [
(cc[ \
StateAccessorcc\ i
,dd 
StateMutatordd 
,ee 
Stateee 
,ff 
toStateff 
,gg 
	conditiongg 
,hh 
namehh 
,ii 
priorityii 
)ii 
;ii 
AddAutoTransitionjj 
(jj 

transitionjj (
)jj( )
;jj) *
returnll 
thisll 
;ll 
}mm 	
publicxx $
IStateConfigurationAsyncxx '
<xx' (
Txx( )
,xx) *
TStatexx+ 1
,xx1 2
TTriggerxx3 ;
>xx; <$
AddAutoForwardTransitionxx= U
(xxU V
TStatexxV \
toStatexx] d
,yy
 
Funcyy 
<yy 
Tyy 
,yy 
CancellationTokenyy %
,yy% &
Taskyy' +
<yy+ ,
boolyy, 0
>yy0 1
>yy1 2
	conditionyy3 <
,zz
 
TStatezz 
previousStatezz  
,{{
 
string{{ 
name{{ 
={{ 
null{{ 
,||
 
uint|| 
priority|| 
=|| 
$num|| 
)|| 
{}} 	
if~~ 
(~~ 
	condition~~ 
==~~ 
null~~ !
)~~! "
{ 
throw 
new !
ArgumentNullException -
(- .
nameof. 4
(4 5
	condition5 >
)> ?
)? @
;@ A
}B C
if
ÅÅ 
(
ÅÅ 
!
ÅÅ *
AutoPreviousStateTransitions
ÅÅ -
.
ÅÅ- .
TryGetValue
ÅÅ. 9
(
ÅÅ9 :
previousState
ÅÅ: G
,
ÅÅG H
out
ÅÅI L
var
ÅÅM P
transitions
ÅÅQ \
)
ÅÅ\ ]
)
ÅÅ] ^
{
ÇÇ 
transitions
ÉÉ 
=
ÉÉ 
new
ÉÉ !
List
ÉÉ" &
<
ÉÉ& '!
StateTransitionBase
ÉÉ' :
<
ÉÉ: ;
T
ÉÉ; <
,
ÉÉ< =
TState
ÉÉ> D
,
ÉÉD E
TTrigger
ÉÉF N
>
ÉÉN O
>
ÉÉO P
(
ÉÉP Q
)
ÉÉQ R
;
ÉÉR S*
AutoPreviousStateTransitions
ÑÑ ,
.
ÑÑ, -
Add
ÑÑ- 0
(
ÑÑ0 1
previousState
ÑÑ1 >
,
ÑÑ> ?
transitions
ÑÑ@ K
)
ÑÑK L
;
ÑÑL M
}
ÖÖ 
var
áá 

transition
áá 
=
áá $
StateTransitionFactory
áá 3
<
áá3 4
T
áá4 5
,
áá5 6
TState
áá7 =
,
áá= >
TTrigger
áá? G
>
ááG H
.
ááH I 
GetStateTransition
ááI [
(
áá[ \
StateAccessor
áá\ i
,
àà 
StateMutator
àà 
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
åå 
name
åå 
,
çç 
priority
çç 
)
çç 
;
çç 
transitions
éé 
.
éé 
Add
éé 
(
éé 

transition
éé &
)
éé& '
;
éé' (
return
êê 
this
êê 
;
êê 
}
ëë 	
public
ùù &
IStateConfigurationAsync
ùù '
<
ùù' (
T
ùù( )
,
ùù) *
TState
ùù+ 1
,
ùù1 2
TTrigger
ùù3 ;
>
ùù; <&
AddAutoForwardTransition
ùù= U
<
ùùU V
TRequest
ùùV ^
>
ùù^ _
(
ùù_ `
TState
ùù` f
toState
ùùg n
,
ûû
 
Func
ûû 
<
ûû 
T
ûû 
,
ûû 
TRequest
ûû 
,
ûû 
CancellationToken
ûû /
,
ûû/ 0
Task
ûû1 5
<
ûû5 6
bool
ûû6 :
>
ûû: ;
>
ûû; <
	condition
ûû= F
,
üü
 
TState
üü 
previousState
üü  
,
††
 
string
†† 
name
†† 
=
†† 
null
†† 
,
°°
 
uint
°° 
priority
°° 
=
°° 
$num
°° 
)
°° 
where
¢¢ 
TRequest
¢¢ 
:
¢¢ 
class
¢¢ "
{
££ 	
if
§§ 
(
§§ 
	condition
§§ 
==
§§ 
null
§§ !
)
§§! "
{
•• 
throw
•• 
new
•• #
ArgumentNullException
•• -
(
••- .
nameof
••. 4
(
••4 5
	condition
••5 >
)
••> ?
)
••? @
;
••@ A
}
••B C
if
ßß 
(
ßß 
!
ßß *
AutoPreviousStateTransitions
ßß -
.
ßß- .
TryGetValue
ßß. 9
(
ßß9 :
previousState
ßß: G
,
ßßG H
out
ßßI L
var
ßßM P
transitions
ßßQ \
)
ßß\ ]
)
ßß] ^
{
®® 
transitions
©© 
=
©© 
new
©© !
List
©©" &
<
©©& '!
StateTransitionBase
©©' :
<
©©: ;
T
©©; <
,
©©< =
TState
©©> D
,
©©D E
TTrigger
©©F N
>
©©N O
>
©©O P
(
©©P Q
)
©©Q R
;
©©R S*
AutoPreviousStateTransitions
™™ ,
.
™™, -
Add
™™- 0
(
™™0 1
previousState
™™1 >
,
™™> ?
transitions
™™@ K
)
™™K L
;
™™L M
}
´´ 
var
≠≠ 

transition
≠≠ 
=
≠≠ $
StateTransitionFactory
≠≠ 3
<
≠≠3 4
T
≠≠4 5
,
≠≠5 6
TState
≠≠7 =
,
≠≠= >
TTrigger
≠≠? G
>
≠≠G H
.
≠≠H I 
GetStateTransition
≠≠I [
(
≠≠[ \
StateAccessor
≠≠\ i
,
ÆÆ 
StateMutator
ÆÆ 
,
ØØ 
State
ØØ 
,
∞∞ 
toState
∞∞ 
,
±± 
	condition
±± 
,
≤≤ 
name
≤≤ 
,
≥≥ 
priority
≥≥ 
)
≥≥ 
;
≥≥ 
transitions
¥¥ 
.
¥¥ 
Add
¥¥ 
(
¥¥ 

transition
¥¥ &
)
¥¥& '
;
¥¥' (
return
∂∂ 
this
∂∂ 
;
∂∂ 
}
∑∑ 	
public
¡¡ &
IStateConfigurationAsync
¡¡ '
<
¡¡' (
T
¡¡( )
,
¡¡) *
TState
¡¡+ 1
,
¡¡1 2
TTrigger
¡¡3 ;
>
¡¡; <"
AddDynamicTransition
¡¡= Q
(
¡¡Q R
TTrigger
¡¡R Z
trigger
¡¡[ b
,
¬¬ 
Func
¬¬ 
<
¬¬ 
T
¬¬ 
,
¬¬ 
CancellationToken
¬¬ '
,
¬¬' (
Task
¬¬) -
<
¬¬- .
TState
¬¬. 4
>
¬¬4 5
>
¬¬5 6
function
¬¬7 ?
,
√√ 
string
√√ 
name
√√ 
=
√√ 
null
√√  
,
ƒƒ 
uint
ƒƒ 
priority
ƒƒ 
=
ƒƒ 
$num
ƒƒ 
)
ƒƒ  
{
≈≈ 	
if
∆∆ 
(
∆∆ 
function
∆∆ 
==
∆∆ 
null
∆∆  
)
∆∆  !
{
«« 
throw
«« 
new
«« #
ArgumentNullException
«« -
(
««- .
nameof
««. 4
(
««4 5
function
««5 =
)
««= >
)
««> ?
;
««? @
}
««A B
var
…… 

transition
…… 
=
…… $
StateTransitionFactory
…… 3
<
……3 4
T
……4 5
,
……5 6
TState
……7 =
,
……= >
TTrigger
……? G
>
……G H
.
……H I 
GetStateTransition
……I [
(
……[ \
StateAccessor
……\ i
,
   
StateMutator
   
,
ÀÀ 
State
ÀÀ 
,
ÃÃ 
function
ÃÃ 
,
ÕÕ 
name
ÕÕ 
,
ŒŒ 
priority
ŒŒ 
)
ŒŒ 
;
ŒŒ 
AddTransition
œœ 
(
œœ 
trigger
œœ !
,
œœ! "

transition
œœ# -
)
œœ- .
;
œœ. /
return
—— 
this
—— 
;
—— 
}
““ 	
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
››; <"
AddDynamicTransition
››= Q
<
››Q R
TRequest
››R Z
>
››Z [
(
››[ \
TTrigger
››\ d
trigger
››e l
,
ﬁﬁ 
Func
ﬁﬁ 
<
ﬁﬁ 
T
ﬁﬁ 
,
ﬁﬁ 
TRequest
ﬁﬁ 
,
ﬁﬁ 
CancellationToken
ﬁﬁ  1
,
ﬁﬁ1 2
Task
ﬁﬁ3 7
<
ﬁﬁ7 8
TState
ﬁﬁ8 >
>
ﬁﬁ> ?
>
ﬁﬁ? @
function
ﬁﬁA I
,
ﬂﬂ 
string
ﬂﬂ 
name
ﬂﬂ 
=
ﬂﬂ 
null
ﬂﬂ  
,
‡‡ 
uint
‡‡ 
priority
‡‡ 
=
‡‡ 
$num
‡‡ 
)
‡‡  
where
·· 
TRequest
·· 
:
·· 
class
·· "
{
‚‚ 	
if
„„ 
(
„„ 
function
„„ 
==
„„ 
null
„„  
)
„„  !
{
‰‰ 
throw
‰‰ 
new
‰‰ #
ArgumentNullException
‰‰ -
(
‰‰- .
nameof
‰‰. 4
(
‰‰4 5
function
‰‰5 =
)
‰‰= >
)
‰‰> ?
;
‰‰? @
}
‰‰A B
var
ÊÊ 

transition
ÊÊ 
=
ÊÊ $
StateTransitionFactory
ÊÊ 3
<
ÊÊ3 4
T
ÊÊ4 5
,
ÊÊ5 6
TState
ÊÊ7 =
,
ÊÊ= >
TTrigger
ÊÊ? G
>
ÊÊG H
.
ÁÁ  
GetStateTransition
ÁÁ "
(
ÁÁ" #
StateAccessor
ÁÁ# 0
,
ËË 
StateMutator
ËË "
,
ÈÈ 
State
ÈÈ 
,
ÍÍ 
function
ÍÍ 
,
ÎÎ 
name
ÎÎ 
,
ÏÏ 
priority
ÏÏ 
)
ÏÏ 
;
ÏÏ  
AddTransition
ÌÌ 
(
ÌÌ 
trigger
ÌÌ !
,
ÌÌ! "

transition
ÌÌ# -
)
ÌÌ- .
;
ÌÌ. /
return
ÔÔ 
this
ÔÔ 
;
ÔÔ 
}
 	
public
˜˜ &
IStateConfigurationAsync
˜˜ '
<
˜˜' (
T
˜˜( )
,
˜˜) *
TState
˜˜+ 1
,
˜˜1 2
TTrigger
˜˜3 ;
>
˜˜; <
AddEntryAction
˜˜= K
(
˜˜K L
Func
˜˜L P
<
˜˜P Q
T
˜˜Q R
,
˜˜R S
CancellationToken
˜˜T e
,
˜˜e f
Task
˜˜g k
>
˜˜k l
action
˜˜m s
)
˜˜s t
{
¯¯ 	
if
˘˘ 
(
˘˘ !
_defaultEntryAction
˘˘ #
!=
˘˘$ &
null
˘˘' +
)
˘˘+ ,
{
˙˙ 
throw
˙˙ 
new
˙˙ '
InvalidOperationException
˙˙ 1
(
˙˙1 2
$str
˙˙2 a
)
˙˙a b
;
˙˙b c
}
˙˙d e!
_defaultEntryAction
¸¸ 
=
¸¸  !
action
¸¸" (
??
¸¸) +
throw
¸¸, 1
new
¸¸2 5#
ArgumentNullException
¸¸6 K
(
¸¸K L
nameof
¸¸L R
(
¸¸R S
action
¸¸S Y
)
¸¸Y Z
)
¸¸Z [
;
¸¸[ \
return
˛˛ 
this
˛˛ 
;
˛˛ 
}
ˇˇ 	
public
áá &
IStateConfigurationAsync
áá '
<
áá' (
T
áá( )
,
áá) *
TState
áá+ 1
,
áá1 2
TTrigger
áá3 ;
>
áá; <
AddEntryAction
áá= K
(
ááK L
Func
ááL P
<
ááP Q
T
ááQ R
,
ááR S
CancellationToken
ááT e
,
ááe f
Task
áág k
>
áák l
action
áám s
,
áás t
TState
ááu {
previousStateáá| â
)ááâ ä
{
àà 	
if
ââ 
(
ââ 
action
ââ 
==
ââ 
null
ââ 
)
ââ 
{
ää 
throw
ää 
new
ää #
ArgumentNullException
ää -
(
ää- .
nameof
ää. 4
(
ää4 5
action
ää5 ;
)
ää; <
)
ää< =
;
ää= >
}
ää? @
if
åå 
(
åå (
_previousStateEntryActions
åå *
.
åå* +
ContainsKey
åå+ 6
(
åå6 7
previousState
åå7 D
)
ååD E
)
ååE F
{
çç 
throw
çç 
new
çç '
InvalidOperationException
çç 1
(
çç1 2
$str
çç2 g
)
ççg h
;
ççh i
}
ççj k(
_previousStateEntryActions
èè &
.
èè& '
Add
èè' *
(
èè* +
previousState
èè+ 8
,
èè8 9
action
èè: @
)
èè@ A
;
èèA B
return
ëë 
this
ëë 
;
ëë 
}
íí 	
public
ôô &
IStateConfigurationAsync
ôô '
<
ôô' (
T
ôô( )
,
ôô) *
TState
ôô+ 1
,
ôô1 2
TTrigger
ôô3 ;
>
ôô; <
AddExitAction
ôô= J
(
ôôJ K
Func
ôôK O
<
ôôO P
T
ôôP Q
,
ôôQ R
CancellationToken
ôôS d
,
ôôd e
Task
ôôf j
>
ôôj k
action
ôôl r
)
ôôr s
{
öö 	
if
õõ 
(
õõ  
_defaultExitAction
õõ "
!=
õõ# %
null
õõ& *
)
õõ* +
{
úú 
throw
úú 
new
úú '
InvalidOperationException
úú 1
(
úú1 2
$str
úú2 T
)
úúT U
;
úúU V
}
úúW X 
_defaultExitAction
ûû 
=
ûû  
action
ûû! '
??
ûû( *
throw
ûû+ 0
new
ûû1 4#
ArgumentNullException
ûû5 J
(
ûûJ K
nameof
ûûK Q
(
ûûQ R
action
ûûR X
)
ûûX Y
)
ûûY Z
;
ûûZ [
return
†† 
this
†† 
;
†† 
}
°° 	
public
©© &
IStateConfigurationAsync
©© '
<
©©' (
T
©©( )
,
©©) *
TState
©©+ 1
,
©©1 2
TTrigger
©©3 ;
>
©©; <
AddExitAction
©©= J
(
©©J K
Func
©©K O
<
©©O P
T
©©P Q
,
©©Q R
CancellationToken
©©S d
,
©©d e
Task
©©f j
>
©©j k
action
©©l r
,
©©r s
TState
©©t z
	nextState©©{ Ñ
)©©Ñ Ö
{
™™ 	
if
´´ 
(
´´ 
action
´´ 
==
´´ 
null
´´ 
)
´´ 
{
¨¨ 
throw
¨¨ 
new
¨¨ #
ArgumentNullException
¨¨ -
(
¨¨- .
nameof
¨¨. 4
(
¨¨4 5
	nextState
¨¨5 >
)
¨¨> ?
)
¨¨? @
;
¨¨@ A
}
¨¨B C
if
ÆÆ 
(
ÆÆ #
_nextStateExitActions
ÆÆ %
.
ÆÆ% &
ContainsKey
ÆÆ& 1
(
ÆÆ1 2
	nextState
ÆÆ2 ;
)
ÆÆ; <
)
ÆÆ< =
{
ØØ 
throw
ØØ 
new
ØØ '
InvalidOperationException
ØØ 1
(
ØØ1 2
$"
ØØ2 4)
Exit action with nextState 
ØØ4 O
{
ØØO P
	nextState
ØØP Y
}
ØØY Z
 already set.
ØØZ g
"
ØØg h
)
ØØh i
;
ØØi j
}
ØØk l#
_nextStateExitActions
±± !
.
±±! "
Add
±±" %
(
±±% &
	nextState
±±& /
,
±±/ 0
action
±±1 7
)
±±7 8
;
±±8 9
return
≥≥ 
this
≥≥ 
;
≥≥ 
}
¥¥ 	
public
∂∂ &
IStateConfigurationAsync
∂∂ '
<
∂∂' (
T
∂∂( )
,
∂∂) *
TState
∂∂+ 1
,
∂∂1 2
TTrigger
∂∂3 ;
>
∂∂; <'
AddAutoFallbackTransition
∂∂= V
(
∂∂V W
Func
∂∂W [
<
∂∂[ \
T
∂∂\ ]
,
∂∂] ^
CancellationToken
∂∂_ p
,
∂∂p q
Task
∂∂r v
<
∂∂v w
bool
∂∂w {
>
∂∂{ |
>
∂∂| }
	condition∂∂~ á
,
∑∑
 
string
∑∑ 
name
∑∑ 
=
∑∑ 
null
∑∑ 
,
∏∏
 
uint
∏∏ 
priority
∏∏ 
=
∏∏ 
$num
∏∏ 
)
∏∏ 
{
ππ 	
if
∫∫ 
(
∫∫ 
	condition
∫∫ 
==
∫∫ 
null
∫∫ !
)
∫∫! "
{
ªª 
throw
ªª 
new
ªª #
ArgumentNullException
ªª -
(
ªª- .
nameof
ªª. 4
(
ªª4 5
	condition
ªª5 >
)
ªª> ?
)
ªª? @
;
ªª@ A
}
ªªB C
var
ΩΩ 

transition
ΩΩ 
=
ΩΩ $
StateTransitionFactory
ΩΩ 3
<
ΩΩ3 4
T
ΩΩ4 5
,
ΩΩ5 6
TState
ΩΩ7 =
,
ΩΩ= >
TTrigger
ΩΩ? G
>
ΩΩG H
.
ΩΩH I 
GetStateTransition
ΩΩI [
(
ΩΩ[ \
StateAccessor
ΩΩ\ i
,
ææ 
StateMutator
ææ 
,
øø 
State
øø 
,
¿¿ 
State
¿¿ 
,
¡¡ 
	condition
¡¡ 
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
√√ 
AddAutoTransition
ƒƒ 
(
ƒƒ 

transition
ƒƒ (
)
ƒƒ( )
;
ƒƒ) *
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
……` a
Func
……a e
<
……e f
T
……f g
,
……g h
TRequest
……i q
,
……q r 
CancellationToken……s Ñ
,……Ñ Ö
Task……Ü ä
<……ä ã
bool……ã è
>……è ê
>……ê ë
	condition……í õ
,
  
 
string
   
name
   
=
   
null
   
,
ÀÀ
 
uint
ÀÀ 
priority
ÀÀ 
=
ÀÀ 
$num
ÀÀ 
)
ÀÀ 
where
ÃÃ 
TRequest
ÃÃ 
:
ÃÃ 
class
ÃÃ "
{
ÕÕ 	
if
ŒŒ 
(
ŒŒ 
	condition
ŒŒ 
==
ŒŒ 
null
ŒŒ !
)
ŒŒ! "
{
œœ 
throw
œœ 
new
œœ #
ArgumentNullException
œœ -
(
œœ- .
nameof
œœ. 4
(
œœ4 5
	condition
œœ5 >
)
œœ> ?
)
œœ? @
;
œœ@ A
}
œœB C
var
—— 

transition
—— 
=
—— $
StateTransitionFactory
—— 3
<
——3 4
T
——4 5
,
——5 6
TState
——7 =
,
——= >
TTrigger
——? G
>
——G H
.
——H I 
GetStateTransition
——I [
(
——[ \
StateAccessor
——\ i
,
““ 
StateMutator
““ 
,
”” 
State
”” 
,
‘‘ 
State
‘‘ 
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
◊◊ 
AddAutoTransition
ÿÿ 
(
ÿÿ 

transition
ÿÿ (
)
ÿÿ( )
;
ÿÿ) *
return
⁄⁄ 
this
⁄⁄ 
;
⁄⁄ 
}
€€ 	
public
›› &
IStateConfigurationAsync
›› '
<
››' (
T
››( )
,
››) *
TState
››+ 1
,
››1 2
TTrigger
››3 ;
>
››; <'
AddAutoFallbackTransition
››= V
(
››V W
Func
››W [
<
››[ \
T
››\ ]
,
››] ^
CancellationToken
››_ p
,
››p q
Task
››r v
<
››v w
bool
››w {
>
››{ |
>
››| }
	condition››~ á
,
ﬁﬁ
 
TState
ﬁﬁ 
previousState
ﬁﬁ  
,
ﬂﬂ
 
string
ﬂﬂ 
name
ﬂﬂ 
=
ﬂﬂ 
null
ﬂﬂ 
,
‡‡
 
uint
‡‡ 
priority
‡‡ 
=
‡‡ 
$num
‡‡ 
)
‡‡ 
{
·· 	
if
‚‚ 
(
‚‚ 
	condition
‚‚ 
==
‚‚ 
null
‚‚ !
)
‚‚! "
{
„„ 
throw
„„ 
new
„„ #
ArgumentNullException
„„ -
(
„„- .
nameof
„„. 4
(
„„4 5
	condition
„„5 >
)
„„> ?
)
„„? @
;
„„@ A
}
„„B C
if
ÂÂ 
(
ÂÂ 
!
ÂÂ *
AutoPreviousStateTransitions
ÂÂ -
.
ÂÂ- .
TryGetValue
ÂÂ. 9
(
ÂÂ9 :
previousState
ÂÂ: G
,
ÂÂG H
out
ÂÂI L
var
ÂÂM P
transitions
ÂÂQ \
)
ÂÂ\ ]
)
ÂÂ] ^
{
ÊÊ 
transitions
ÁÁ 
=
ÁÁ 
new
ÁÁ !
List
ÁÁ" &
<
ÁÁ& '!
StateTransitionBase
ÁÁ' :
<
ÁÁ: ;
T
ÁÁ; <
,
ÁÁ< =
TState
ÁÁ> D
,
ÁÁD E
TTrigger
ÁÁF N
>
ÁÁN O
>
ÁÁO P
(
ÁÁP Q
)
ÁÁQ R
;
ÁÁR S*
AutoPreviousStateTransitions
ËË ,
.
ËË, -
Add
ËË- 0
(
ËË0 1
previousState
ËË1 >
,
ËË> ?
transitions
ËË@ K
)
ËËK L
;
ËËL M
}
ÈÈ 
var
ÎÎ 

transition
ÎÎ 
=
ÎÎ $
StateTransitionFactory
ÎÎ 3
<
ÎÎ3 4
T
ÎÎ4 5
,
ÎÎ5 6
TState
ÎÎ7 =
,
ÎÎ= >
TTrigger
ÎÎ? G
>
ÎÎG H
.
ÎÎH I 
GetStateTransition
ÎÎI [
(
ÎÎ[ \
StateAccessor
ÎÎ\ i
,
ÏÏ 
StateMutator
ÏÏ 
,
ÌÌ 
State
ÌÌ 
,
ÓÓ 
State
ÓÓ 
,
ÔÔ 
	condition
ÔÔ 
,
 
name
 
,
ÒÒ 
priority
ÒÒ 
)
ÒÒ 
;
ÒÒ 
transitions
ÚÚ 
.
ÚÚ 
Add
ÚÚ 
(
ÚÚ 

transition
ÚÚ &
)
ÚÚ& '
;
ÚÚ' (
return
ÙÙ 
this
ÙÙ 
;
ÙÙ 
}
ıı 	
public
˜˜ &
IStateConfigurationAsync
˜˜ '
<
˜˜' (
T
˜˜( )
,
˜˜) *
TState
˜˜+ 1
,
˜˜1 2
TTrigger
˜˜3 ;
>
˜˜; <'
AddAutoFallbackTransition
˜˜= V
<
˜˜V W
TRequest
˜˜W _
>
˜˜_ `
(
˜˜` a
Func
˜˜a e
<
˜˜e f
T
˜˜f g
,
˜˜g h
TRequest
˜˜i q
,
˜˜q r 
CancellationToken˜˜s Ñ
,˜˜Ñ Ö
Task˜˜Ü ä
<˜˜ä ã
bool˜˜ã è
>˜˜è ê
>˜˜ê ë
	condition˜˜í õ
,
¯¯
 
TState
¯¯ 
previousState
¯¯  
,
˘˘
 
string
˘˘ 
name
˘˘ 
=
˘˘ 
null
˘˘ 
,
˙˙
 
uint
˙˙ 
priority
˙˙ 
=
˙˙ 
$num
˙˙ 
)
˙˙ 
where
˚˚ 
TRequest
˚˚ 
:
˚˚ 
class
˚˚ "
{
¸¸ 	
if
˝˝ 
(
˝˝ 
	condition
˝˝ 
==
˝˝ 
null
˝˝ !
)
˝˝! "
{
˛˛ 
throw
˛˛ 
new
˛˛ #
ArgumentNullException
˛˛ -
(
˛˛- .
nameof
˛˛. 4
(
˛˛4 5
	condition
˛˛5 >
)
˛˛> ?
)
˛˛? @
;
˛˛@ A
}
˛˛B C
if
ÄÄ 
(
ÄÄ 
!
ÄÄ *
AutoPreviousStateTransitions
ÄÄ -
.
ÄÄ- .
TryGetValue
ÄÄ. 9
(
ÄÄ9 :
previousState
ÄÄ: G
,
ÄÄG H
out
ÄÄI L
var
ÄÄM P
transitions
ÄÄQ \
)
ÄÄ\ ]
)
ÄÄ] ^
{
ÅÅ 
transitions
ÇÇ 
=
ÇÇ 
new
ÇÇ !
List
ÇÇ" &
<
ÇÇ& '!
StateTransitionBase
ÇÇ' :
<
ÇÇ: ;
T
ÇÇ; <
,
ÇÇ< =
TState
ÇÇ> D
,
ÇÇD E
TTrigger
ÇÇF N
>
ÇÇN O
>
ÇÇO P
(
ÇÇP Q
)
ÇÇQ R
;
ÇÇR S*
AutoPreviousStateTransitions
ÉÉ ,
.
ÉÉ, -
Add
ÉÉ- 0
(
ÉÉ0 1
previousState
ÉÉ1 >
,
ÉÉ> ?
transitions
ÉÉ@ K
)
ÉÉK L
;
ÉÉL M
}
ÑÑ 
var
ÜÜ 

transition
ÜÜ 
=
ÜÜ $
StateTransitionFactory
ÜÜ 3
<
ÜÜ3 4
T
ÜÜ4 5
,
ÜÜ5 6
TState
ÜÜ7 =
,
ÜÜ= >
TTrigger
ÜÜ? G
>
ÜÜG H
.
ÜÜH I 
GetStateTransition
ÜÜI [
(
ÜÜ[ \
StateAccessor
ÜÜ\ i
,
áá 
StateMutator
áá 
,
àà 
State
àà 
,
ââ 
State
ââ 
,
ää 
	condition
ää 
,
ãã 
name
ãã 
,
åå 
priority
åå 
)
åå 
;
åå 
transitions
çç 
.
çç 
Add
çç 
(
çç 

transition
çç &
)
çç& '
;
çç' (
return
èè 
this
èè 
;
èè 
}
êê 	
public
òò &
IStateConfigurationAsync
òò '
<
òò' (
T
òò( )
,
òò) *
TState
òò+ 1
,
òò1 2
TTrigger
òò3 ;
>
òò; <
AddReentryAction
òò= M
(
òòM N
Func
òòN R
<
òòR S
T
òòS T
,
òòT U
CancellationToken
òòV g
,
òòg h
Task
òòi m
>
òòm n
action
òòo u
)
òòu v
{
ôô 	
if
öö 
(
öö 
_reentryAction
öö 
!=
öö !
null
öö" &
)
öö& '
{
õõ 
throw
õõ 
new
õõ '
InvalidOperationException
õõ 1
(
õõ1 2
$str
õõ2 Y
)
õõY Z
;
õõZ [
}
õõ\ ]
_reentryAction
ùù 
=
ùù 
action
ùù #
??
ùù$ &
throw
ùù' ,
new
ùù- 0#
ArgumentNullException
ùù1 F
(
ùùF G
nameof
ùùG M
(
ùùM N
action
ùùN T
)
ùùT U
)
ùùU V
;
ùùV W
return
üü 
this
üü 
;
üü 
}
†† 	
public
¢¢ 
void
¢¢ 
AddSuperState
¢¢ !
(
¢¢! ".
 IStateConfigurationAsyncInternal
¢¢" B
<
¢¢B C
T
¢¢C D
,
¢¢D E
TState
¢¢F L
,
¢¢L M
TTrigger
¢¢N V
>
¢¢V W%
superStateConfiguration
¢¢X o
)
¢¢o p
{
££ 	
if
§§ 
(
§§ 
	IsInState
§§ 
(
§§ %
superStateConfiguration
§§ 1
.
§§1 2
State
§§2 7
)
§§7 8
)
§§8 9
{
•• 
throw
•• 
new
•• )
ArgumentOutOfRangeException
•• 3
(
••3 4
$"
••4 6
{
••6 7
State
••7 <
}
••< =)
 is already a sub-state of 
••= X
{
••X Y%
superStateConfiguration
••Y p
.
••p q
State
••q v
}
••v w
.
••w x
"
••x y
)
••y z
;
••z {
}
••| }
if
ßß 
(
ßß %
superStateConfiguration
ßß '
.
ßß' (
	IsInState
ßß( 1
(
ßß1 2
State
ßß2 7
)
ßß7 8
)
ßß8 9
{
®® 
throw
®® 
new
®® )
ArgumentOutOfRangeException
®® 3
(
®®3 4
$"
®®4 6
{
®®6 7%
superStateConfiguration
®®7 N
.
®®N O
State
®®O T
}
®®T U)
 is already a sub-state of 
®®U p
{
®®p q
State
®®q v
}
®®v w
.
®®w x
"
®®x y
)
®®y z
;
®®z {
}
®®| }
_superState
™™ 
=
™™ %
superStateConfiguration
™™ 1
;
™™1 2
}
´´ 	
public
∂∂ &
IStateConfigurationAsync
∂∂ '
<
∂∂' (
T
∂∂( )
,
∂∂) *
TState
∂∂+ 1
,
∂∂1 2
TTrigger
∂∂3 ;
>
∂∂; <
AddTransition
∂∂= J
(
∂∂J K
TTrigger
∂∂K S
trigger
∂∂T [
,
∑∑ 
TState
∑∑ 
toState
∑∑ 
,
∏∏ 
Func
∏∏ 
<
∏∏ 
T
∏∏ 
,
∏∏ 
CancellationToken
∏∏ '
,
∏∏' (
Task
∏∏) -
<
∏∏- .
bool
∏∏. 2
>
∏∏2 3
>
∏∏3 4
conditionAsync
∏∏5 C
=
∏∏D E
null
∏∏F J
,
ππ 
string
ππ 
name
ππ 
=
ππ 
null
ππ  
,
∫∫ 
uint
∫∫ 
priority
∫∫ 
=
∫∫ 
$num
∫∫ 
)
∫∫  
{
ªª 	
if
ºº 
(
ºº 
conditionAsync
ºº 
==
ºº !
null
ºº" &
)
ºº& '
{
ΩΩ 
conditionAsync
ΩΩ 
=
ΩΩ 
(
ΩΩ  
_
ΩΩ  !
,
ΩΩ! "
ct
ΩΩ# %
)
ΩΩ% &
=>
ΩΩ' )
Task
ΩΩ* .
.
ΩΩ. /

FromResult
ΩΩ/ 9
(
ΩΩ9 :
result
ΩΩ: @
:
ΩΩ@ A
true
ΩΩB F
)
ΩΩF G
;
ΩΩG H
}
ΩΩI J
var
øø 

transition
øø 
=
øø $
StateTransitionFactory
øø 3
<
øø3 4
T
øø4 5
,
øø5 6
TState
øø7 =
,
øø= >
TTrigger
øø? G
>
øøG H
.
øøH I 
GetStateTransition
øøI [
(
øø[ \
StateAccessor
øø\ i
,
¿¿ 
StateMutator
¿¿ 
,
¡¡ 
State
¡¡ 
,
¬¬ 
toState
¬¬ 
,
√√ 
conditionAsync
√√  
,
ƒƒ 
name
ƒƒ 
,
≈≈ 
priority
≈≈ 
)
≈≈ 
;
≈≈ 
AddTransition
∆∆ 
(
∆∆ 
trigger
∆∆ !
,
∆∆! "

transition
∆∆# -
)
∆∆- .
;
∆∆. /
return
»» 
this
»» 
;
»» 
}
…… 	
public
’’ &
IStateConfigurationAsync
’’ '
<
’’' (
T
’’( )
,
’’) *
TState
’’+ 1
,
’’1 2
TTrigger
’’3 ;
>
’’; <
AddTransition
’’= J
<
’’J K
TRequest
’’K S
>
’’S T
(
’’T U
TTrigger
’’U ]
trigger
’’^ e
,
÷÷ 
TState
÷÷ 
toState
÷÷ 
,
◊◊ 
Func
◊◊ 
<
◊◊ 
T
◊◊ 
,
◊◊ 
TRequest
◊◊ 
,
◊◊ 
CancellationToken
◊◊  1
,
◊◊1 2
Task
◊◊3 7
<
◊◊7 8
bool
◊◊8 <
>
◊◊< =
>
◊◊= >
conditionAsync
◊◊? M
,
ÿÿ 
string
ÿÿ 
name
ÿÿ 
=
ÿÿ 
null
ÿÿ  
,
ŸŸ 
uint
ŸŸ 
priority
ŸŸ 
=
ŸŸ 
$num
ŸŸ 
)
ŸŸ  
where
⁄⁄ 
TRequest
⁄⁄ 
:
⁄⁄ 
class
⁄⁄ "
{
€€ 	
if
‹‹ 
(
‹‹ 
conditionAsync
‹‹ 
==
‹‹ !
null
‹‹" &
)
‹‹& '
{
›› 
throw
›› 
new
›› #
ArgumentNullException
›› -
(
››- .
nameof
››. 4
(
››4 5
conditionAsync
››5 C
)
››C D
)
››D E
;
››E F
}
››G H
var
ﬂﬂ 

transition
ﬂﬂ 
=
ﬂﬂ $
StateTransitionFactory
ﬂﬂ 3
<
ﬂﬂ3 4
T
ﬂﬂ4 5
,
ﬂﬂ5 6
TState
ﬂﬂ7 =
,
ﬂﬂ= >
TTrigger
ﬂﬂ? G
>
ﬂﬂG H
.
ﬂﬂH I 
GetStateTransition
ﬂﬂI [
(
ﬂﬂ[ \
StateAccessor
ﬂﬂ\ i
,
‡‡ 
StateMutator
‡‡ 
,
·· 
State
·· 
,
‚‚ 
toState
‚‚ 
,
„„ 
conditionAsync
„„  
,
‰‰ 
name
‰‰ 
,
ÂÂ 
priority
ÂÂ 
)
ÂÂ 
;
ÂÂ 
AddTransition
ÊÊ 
(
ÊÊ 
trigger
ÊÊ !
,
ÊÊ! "

transition
ÊÊ# -
)
ÊÊ- .
;
ÊÊ. /
return
ËË 
this
ËË 
;
ËË 
}
ÈÈ 	
public
ÒÒ &
IStateConfigurationAsync
ÒÒ '
<
ÒÒ' (
T
ÒÒ( )
,
ÒÒ) *
TState
ÒÒ+ 1
,
ÒÒ1 2
TTrigger
ÒÒ3 ;
>
ÒÒ; <
AddTriggerAction
ÒÒ= M
(
ÒÒM N
TTrigger
ÒÒN V
trigger
ÒÒW ^
,
ÒÒ^ _
Func
ÒÒ` d
<
ÒÒd e
T
ÒÒe f
,
ÒÒf g
CancellationToken
ÒÒh y
,
ÒÒy z
Task
ÒÒ{ 
>ÒÒ Ä
actionÒÒÅ á
)ÒÒá à
{
ÚÚ 	
if
ÛÛ 
(
ÛÛ 
_triggerActions
ÛÛ 
.
ÛÛ  
ContainsKey
ÛÛ  +
(
ÛÛ+ ,
trigger
ÛÛ, 3
)
ÛÛ3 4
)
ÛÛ4 5
{
ÙÙ 
throw
ÙÙ 
new
ÙÙ '
InvalidOperationException
ÙÙ 1
(
ÙÙ1 2
$"
ÙÙ2 4-
Only one action is allowed for 
ÙÙ4 S
{
ÙÙS T
trigger
ÙÙT [
}
ÙÙ[ \
	 trigger.
ÙÙ\ e
"
ÙÙe f
)
ÙÙf g
;
ÙÙg h
}
ÙÙi j
_triggerActions
ˆˆ 
.
ˆˆ 
Add
ˆˆ 
(
ˆˆ  
trigger
ˆˆ  '
,
ˆˆ' ("
TriggerActionFactory
ˆˆ) =
<
ˆˆ= >
T
ˆˆ> ?
,
ˆˆ? @
TTrigger
ˆˆA I
>
ˆˆI J
.
ˆˆJ K
GetTriggerAction
ˆˆK [
(
ˆˆ[ \
action
ˆˆ\ b
)
ˆˆb c
)
ˆˆc d
;
ˆˆd e
return
¯¯ 
this
¯¯ 
;
¯¯ 
}
˘˘ 	
public
ÇÇ &
IStateConfigurationAsync
ÇÇ '
<
ÇÇ' (
T
ÇÇ( )
,
ÇÇ) *
TState
ÇÇ+ 1
,
ÇÇ1 2
TTrigger
ÇÇ3 ;
>
ÇÇ; <
AddTriggerAction
ÇÇ= M
<
ÇÇM N
TRequest
ÇÇN V
>
ÇÇV W
(
ÇÇW X
TTrigger
ÇÇX `
trigger
ÇÇa h
,
ÉÉ
 
Func
ÉÉ 
<
ÉÉ 
T
ÉÉ 
,
ÉÉ 
TRequest
ÉÉ 
,
ÉÉ 
CancellationToken
ÉÉ /
,
ÉÉ/ 0
Task
ÉÉ1 5
>
ÉÉ5 6
action
ÉÉ7 =
)
ÉÉ= >
{
ÑÑ 	
if
ÖÖ 
(
ÖÖ 
_triggerActions
ÖÖ 
.
ÖÖ  
ContainsKey
ÖÖ  +
(
ÖÖ+ ,
trigger
ÖÖ, 3
)
ÖÖ3 4
)
ÖÖ4 5
{
ÜÜ 
throw
ÜÜ 
new
ÜÜ '
InvalidOperationException
ÜÜ 1
(
ÜÜ1 2
$"
ÜÜ2 4-
Only one action is allowed for 
ÜÜ4 S
{
ÜÜS T
trigger
ÜÜT [
}
ÜÜ[ \
	 trigger.
ÜÜ\ e
"
ÜÜe f
)
ÜÜf g
;
ÜÜg h
}
ÜÜi j
_triggerActions
àà 
.
àà 
Add
àà 
(
àà  
trigger
àà  '
,
àà' ("
TriggerActionFactory
àà) =
<
àà= >
T
àà> ?
,
àà? @
TTrigger
ààA I
>
ààI J
.
ààJ K
GetTriggerAction
ààK [
(
àà[ \
action
àà\ b
)
ààb c
)
ààc d
;
ààd e
return
ää 
this
ää 
;
ää 
}
ãã 	
public
çç 
async
çç 
Task
çç 
<
çç #
StateTransitionResult
çç /
<
çç/ 0
TState
çç0 6
,
çç6 7
TTrigger
çç8 @
>
çç@ A
>
ççA B(
ExecuteAutoTransitionAsync
ççC ]
(
çç] ^!
ExecutionParameters
çç^ q
<
ççq r
T
ççr s
,
ççs t
TTrigger
ççu }
>
çç} ~

parametersçç â
,
éé #
StateTransitionResult
éé #
<
éé# $
TState
éé$ *
,
éé* +
TTrigger
éé, 4
>
éé4 5
currentResult
éé6 C
)
ééC D
{
èè 	#
StateTransitionResult
êê !
<
êê! "
TState
êê" (
,
êê( )
TTrigger
êê* 2
>
êê2 3
localResult
êê4 ?
;
êê? @
if
ìì 
(
ìì *
AutoPreviousStateTransitions
ìì ,
.
ìì, -
TryGetValue
ìì- 8
(
ìì8 9
currentResult
ìì9 F
.
ììF G
PreviousState
ììG T
,
ììT U
out
ììV Y
var
ììZ ]&
previousStateTransitions
ìì^ v
)
ììv w
)
ììw x
{
îî 
foreach
ïï 
(
ïï 
var
ïï 

transition
ïï '
in
ïï( *&
previousStateTransitions
ïï+ C
.
ïïC D
OrderBy
ïïD K
(
ïïK L
t
ïïL M
=>
ïïN P
t
ïïQ R
.
ïïR S
Priority
ïïS [
)
ïï[ \
)
ïï\ ]
{
ññ 
localResult
óó 
=
óó  !
await
óó" '

transition
óó( 2
.
óó2 3
ExecuteAsync
óó3 ?
(
óó? @

parameters
óó@ J
,
óóJ K
currentResult
óóL Y
)
óóY Z
.
óóZ [
ConfigureAwait
óó[ i
(
óói j(
continueOnCapturedContextóój É
:óóÉ Ñ
falseóóÖ ä
)óóä ã
;óóã å
if
òò 
(
òò 
localResult
òò #
.
òò# $
WasSuccessful
òò$ 1
)
òò1 2
{
ôô 
return
ôô 
localResult
ôô (
;
ôô( )
}
ôô* +
}
öö 
}
õõ 
foreach
ûû 
(
ûû 
var
ûû 

transition
ûû #
in
ûû$ &
AutoTransitions
ûû' 6
.
ûû6 7
OrderBy
ûû7 >
(
ûû> ?
t
ûû? @
=>
ûûA C
t
ûûD E
.
ûûE F
Priority
ûûF N
)
ûûN O
)
ûûO P
{
üü 
localResult
†† 
=
†† 
await
†† #

transition
††$ .
.
††. /
ExecuteAsync
††/ ;
(
††; <

parameters
††< F
,
††F G
currentResult
††H U
)
††U V
.
††V W
ConfigureAwait
††W e
(
††e f'
continueOnCapturedContext
††f 
:†† Ä
false††Å Ü
)††Ü á
;††á à
if
°° 
(
°° 
localResult
°° 
.
°°  
WasSuccessful
°°  -
)
°°- .
{
¢¢ 
return
¢¢ 
localResult
¢¢ $
;
¢¢$ %
}
¢¢& '
}
££ 
return
¶¶ 
_superState
¶¶ 
!=
¶¶ !
null
¶¶" &
?
ßß 
await
ßß 
_superState
ßß #
.
ßß# $(
ExecuteAutoTransitionAsync
ßß$ >
(
ßß> ?

parameters
ßß? I
,
ßßI J
currentResult
ßßK X
)
ßßX Y
.
ßßY Z
ConfigureAwait
ßßZ h
(
ßßh i(
continueOnCapturedContextßßi Ç
:ßßÇ É
falseßßÑ â
)ßßâ ä
:
®® 
new
®® #
StateTransitionResult
®® +
<
®®+ ,
TState
®®, 2
,
®®2 3
TTrigger
®®4 <
>
®®< =
(
®®= >

parameters
®®> H
.
®®H I
Trigger
®®I P
,
©© 
currentResult
©© #
.
©©# $
StartingState
©©$ 1
,
™™ 
currentResult
™™ #
.
™™# $
PreviousState
™™$ 1
,
´´ 
currentResult
´´ #
.
´´# $
CurrentState
´´$ 0
,
¨¨ 
currentResult
¨¨ #
.
¨¨# $ 
LastTransitionName
¨¨$ 6
,
≠≠ 
transitionDefined
≠≠ '
:
≠≠' (
true
≠≠) -
,
ÆÆ 
wasCancelled
ÆÆ "
:
ÆÆ" #

parameters
ÆÆ$ .
.
ÆÆ. /
CancellationToken
ÆÆ/ @
.
ÆÆ@ A%
IsCancellationRequested
ÆÆA X
)
ÆÆX Y
;
ÆÆY Z
}
ØØ 	
public
±± 
async
±± 
Task
±± %
ExecuteEntryActionAsync
±± 1
(
±±1 2!
ExecutionParameters
±±2 E
<
±±E F
T
±±F G
,
±±G H
TTrigger
±±I Q
>
±±Q R

parameters
±±S ]
,
±±] ^#
StateTransitionResult
±±_ t
<
±±t u
TState
±±u {
,
±±{ |
TTrigger±±} Ö
>±±Ö Ü
currentResult±±á î
)±±î ï
{
≤≤ 	
if
¥¥ 
(
¥¥ (
_previousStateEntryActions
¥¥ *
.
¥¥* +
TryGetValue
¥¥+ 6
(
¥¥6 7
currentResult
¥¥7 D
.
¥¥D E
PreviousState
¥¥E R
,
¥¥R S
out
¥¥T W
var
¥¥X [
action
¥¥\ b
)
¥¥b c
)
¥¥c d
{
µµ 
if
∂∂ 
(
∂∂ 

parameters
∂∂ 
.
∂∂ 
CancellationToken
∂∂ 0
.
∂∂0 1%
IsCancellationRequested
∂∂1 H
)
∂∂H I
{
∑∑ 
return
∑∑ 
;
∑∑ 
}
∑∑ 
await
ππ 
action
ππ 
.
ππ 
Invoke
ππ #
(
ππ# $

parameters
ππ$ .
.
ππ. /
Context
ππ/ 6
,
ππ6 7

parameters
ππ8 B
.
ππB C
CancellationToken
ππC T
)
ππT U
.
ππU V
ConfigureAwait
ππV d
(
ππd e'
continueOnCapturedContext
ππe ~
:
ππ~ 
falseππÄ Ö
)ππÖ Ü
;ππÜ á
}
∫∫ 
if
ΩΩ 
(
ΩΩ !
_defaultEntryAction
ΩΩ #
!=
ΩΩ$ &
null
ΩΩ' +
)
ΩΩ+ ,
{
ææ 
if
øø 
(
øø 

parameters
øø 
.
øø 
CancellationToken
øø 0
.
øø0 1%
IsCancellationRequested
øø1 H
)
øøH I
{
¿¿ 
return
¿¿ 
;
¿¿ 
}
¿¿ 
if
¬¬ 
(
¬¬ !
_defaultEntryAction
¬¬ '
!=
¬¬( *
null
¬¬+ /
)
¬¬/ 0
{
√√ 
await
√√ !
_defaultEntryAction
√√ +
.
√√+ ,
Invoke
√√, 2
(
√√2 3

parameters
√√3 =
.
√√= >
Context
√√> E
,
√√E F

parameters
√√G Q
.
√√Q R
CancellationToken
√√R c
)
√√c d
.
√√d e
ConfigureAwait
√√e s
(
√√s t(
continueOnCapturedContext√√t ç
:√√ç é
false√√è î
)√√î ï
;√√ï ñ
}√√ó ò
}
ƒƒ 
}
≈≈ 	
public
«« 
async
«« 
Task
«« '
ExecuteReentryActionAsync
«« 3
(
««3 4!
ExecutionParameters
««4 G
<
««G H
T
««H I
,
««I J
TTrigger
««K S
>
««S T

parameters
««U _
,
««_ `#
StateTransitionResult
««a v
<
««v w
TState
««w }
,
««} ~
TTrigger«« á
>««á à
currentResult««â ñ
)««ñ ó
{
»» 	
if
…… 
(
…… 
_superState
…… 
!=
…… 
null
…… #
)
……# $
{
   
await
ÀÀ 
_superState
ÀÀ !
.
ÀÀ! "'
ExecuteReentryActionAsync
ÀÀ" ;
(
ÀÀ; <

parameters
ÀÀ< F
,
ÀÀF G
currentResult
ÀÀH U
)
ÀÀU V
.
ÃÃ 
ConfigureAwait
ÃÃ #
(
ÃÃ# $'
continueOnCapturedContext
ÃÃ$ =
:
ÃÃ= >
false
ÃÃ? D
)
ÃÃD E
;
ÃÃE F
}
ÕÕ 
if
œœ 
(
œœ 
_reentryAction
œœ 
!=
œœ !
null
œœ" &
&&
œœ' )
!
œœ* +

parameters
œœ+ 5
.
œœ5 6
CancellationToken
œœ6 G
.
œœG H%
IsCancellationRequested
œœH _
)
œœ_ `
{
–– 
await
—— 
_reentryAction
—— $
.
——$ %
Invoke
——% +
(
——+ ,

parameters
——, 6
.
——6 7
Context
——7 >
,
——> ?

parameters
——@ J
.
——J K
CancellationToken
——K \
)
——\ ]
.
““ 
ConfigureAwait
““ #
(
““# $'
continueOnCapturedContext
““$ =
:
““= >
false
““? D
)
““D E
;
““E F
}
”” 
}
‘‘ 	
public
÷÷ 
async
÷÷ 
Task
÷÷ $
ExecuteExitActionAsync
÷÷ 0
(
÷÷0 1!
ExecutionParameters
÷÷1 D
<
÷÷D E
T
÷÷E F
,
÷÷F G
TTrigger
÷÷H P
>
÷÷P Q

parameters
÷÷R \
,
◊◊ #
StateTransitionResult
◊◊ #
<
◊◊# $
TState
◊◊$ *
,
◊◊* +
TTrigger
◊◊, 4
>
◊◊4 5
currentResult
◊◊6 C
)
◊◊C D
{
ÿÿ 	
if
⁄⁄ 
(
⁄⁄ #
_nextStateExitActions
⁄⁄ %
.
⁄⁄% &
TryGetValue
⁄⁄& 1
(
⁄⁄1 2
currentResult
⁄⁄2 ?
.
⁄⁄? @
CurrentState
⁄⁄@ L
,
⁄⁄L M
out
⁄⁄N Q
var
⁄⁄R U
action
⁄⁄V \
)
⁄⁄\ ]
)
⁄⁄] ^
{
€€ 
if
‹‹ 
(
‹‹ 

parameters
‹‹ 
.
‹‹ 
CancellationToken
‹‹ 0
.
‹‹0 1%
IsCancellationRequested
‹‹1 H
)
‹‹H I
{
›› 
return
›› 
;
›› 
}
›› 
await
ﬂﬂ 
action
ﬂﬂ 
.
ﬂﬂ 
Invoke
ﬂﬂ #
(
ﬂﬂ# $

parameters
ﬂﬂ$ .
.
ﬂﬂ. /
Context
ﬂﬂ/ 6
,
ﬂﬂ6 7

parameters
ﬂﬂ8 B
.
ﬂﬂB C
CancellationToken
ﬂﬂC T
)
ﬂﬂT U
.
‡‡ 
ConfigureAwait
‡‡ "
(
‡‡" #'
continueOnCapturedContext
‡‡# <
:
‡‡< =
false
‡‡> C
)
‡‡C D
;
‡‡D E
}
·· 
if
‰‰ 
(
‰‰  
_defaultExitAction
‰‰ "
!=
‰‰# %
null
‰‰& *
)
‰‰* +
{
ÂÂ 
if
ÊÊ 
(
ÊÊ 

parameters
ÊÊ 
.
ÊÊ 
CancellationToken
ÊÊ 0
.
ÊÊ0 1%
IsCancellationRequested
ÊÊ1 H
)
ÊÊH I
{
ÁÁ 
return
ÁÁ 
;
ÁÁ 
}
ÁÁ 
if
ÈÈ 
(
ÈÈ  
_defaultExitAction
ÈÈ &
!=
ÈÈ' )
null
ÈÈ* .
)
ÈÈ. /
{
ÍÍ 
await
ÎÎ  
_defaultExitAction
ÎÎ ,
.
ÎÎ, -
Invoke
ÎÎ- 3
(
ÎÎ3 4

parameters
ÎÎ4 >
.
ÎÎ> ?
Context
ÎÎ? F
,
ÎÎF G

parameters
ÎÎH R
.
ÎÎR S
CancellationToken
ÎÎS d
)
ÎÎd e
.
ÏÏ 
ConfigureAwait
ÏÏ '
(
ÏÏ' ('
continueOnCapturedContext
ÏÏ( A
:
ÏÏA B
false
ÏÏC H
)
ÏÏH I
;
ÏÏI J
}
ÌÌ 
}
ÓÓ 
}
ÔÔ 	
public
ÒÒ 
async
ÒÒ 
Task
ÒÒ 
<
ÒÒ #
StateTransitionResult
ÒÒ /
<
ÒÒ/ 0
TState
ÒÒ0 6
,
ÒÒ6 7
TTrigger
ÒÒ8 @
>
ÒÒ@ A
>
ÒÒA B
FireTriggerAsync
ÒÒC S
(
ÒÒS T!
ExecutionParameters
ÒÒT g
<
ÒÒg h
T
ÒÒh i
,
ÒÒi j
TTrigger
ÒÒk s
>
ÒÒs t

parameters
ÒÒu 
)ÒÒ Ä
{
ÚÚ 	
if
ÛÛ 
(
ÛÛ 
_triggerActions
ÛÛ 
.
ÛÛ  
TryGetValue
ÛÛ  +
(
ÛÛ+ ,

parameters
ÛÛ, 6
.
ÛÛ6 7
Trigger
ÛÛ7 >
,
ÛÛ> ?
out
ÛÛ@ C
var
ÛÛD G
triggerAction
ÛÛH U
)
ÛÛU V
)
ÛÛV W
{
ÙÙ 
await
ıı 
triggerAction
ıı #
.
ıı# $
ExecuteAsync
ıı$ 0
(
ıı0 1

parameters
ıı1 ;
.
ıı; <
Context
ıı< C
,
ııC D
request
ııE L
:
ııL M
null
ııN R
,
ııR S
cancellationToken
ııT e
:
ııe f

parameters
ııg q
.
ııq r 
CancellationTokenıır É
)ııÉ Ñ
.
ˆˆ 
ConfigureAwait
ˆˆ #
(
ˆˆ# $'
continueOnCapturedContext
ˆˆ$ =
:
ˆˆ= >
false
ˆˆ? D
)
ˆˆD E
;
ˆˆE F
}
˜˜ 
var
˘˘ 
result
˘˘ 
=
˘˘ 
await
˘˘ "
FireTriggerPrimAsync
˘˘ 3
(
˘˘3 4

parameters
˘˘4 >
)
˘˘> ?
.
˘˘? @
ConfigureAwait
˘˘@ N
(
˘˘N O'
continueOnCapturedContext
˘˘O h
:
˘˘h i
false
˘˘j o
)
˘˘o p
;
˘˘p q
if
˚˚ 
(
˚˚ 
!
˚˚ 
(
˚˚ 
result
˚˚ 
?
˚˚ 
.
˚˚ 
WasSuccessful
˚˚ '
??
˚˚( *
false
˚˚+ 0
)
˚˚0 1
&&
˚˚2 4
_superState
˚˚5 @
!=
˚˚A C
null
˚˚D H
)
˚˚H I
{
¸¸ 
result
˝˝ 
=
˝˝ 
await
˝˝ 
_superState
˝˝ *
.
˝˝* +
FireTriggerAsync
˝˝+ ;
(
˝˝; <

parameters
˝˝< F
)
˝˝F G
.
˝˝G H
ConfigureAwait
˝˝H V
(
˝˝V W'
continueOnCapturedContext
˝˝W p
:
˝˝p q
false
˝˝r w
)
˝˝w x
;
˝˝x y
}
˛˛ 
else
ˇˇ 
{
ÄÄ 
var
ÅÅ 

startState
ÅÅ 
=
ÅÅ  
StateAccessor
ÅÅ! .
(
ÅÅ. /

parameters
ÅÅ/ 9
.
ÅÅ9 :
Context
ÅÅ: A
)
ÅÅA B
;
ÅÅB C
result
ÇÇ 
=
ÇÇ 
result
ÇÇ 
??
ÇÇ  "
new
ÇÇ# &#
StateTransitionResult
ÇÇ' <
<
ÇÇ< =
TState
ÇÇ= C
,
ÇÇC D
TTrigger
ÇÇE M
>
ÇÇM N
(
ÇÇN O

parameters
ÇÇO Y
.
ÇÇY Z
Trigger
ÇÇZ a
,
ÉÉ 

startState
ÉÉ  
,
ÑÑ 

startState
ÑÑ  
,
ÖÖ 

startState
ÖÖ  
,
ÜÜ  
lastTransitionName
ÜÜ (
:
ÜÜ( )
string
ÜÜ* 0
.
ÜÜ0 1
Empty
ÜÜ1 6
,
áá 
transitionDefined
áá '
:
áá' (
false
áá) .
)
áá. /
;
áá/ 0
}
àà 
return
ää 
result
ää 
;
ää 
}
ãã 	
private
çç 
async
çç 
Task
çç 
<
çç #
StateTransitionResult
çç 0
<
çç0 1
TState
çç1 7
,
çç7 8
TTrigger
çç9 A
>
ççA B
>
ççB C"
FireTriggerPrimAsync
ççD X
(
ççX Y!
ExecutionParameters
ççY l
<
ççl m
T
ççm n
,
ççn o
TTrigger
ççp x
>
ççx y

parametersççz Ñ
)ççÑ Ö
{
éé 	#
StateTransitionResult
èè !
<
èè! "
TState
èè" (
,
èè( )
TTrigger
èè* 2
>
èè2 3
result
èè4 :
=
èè; <
null
èè= A
;
èèA B
if
ëë 
(
ëë 
Transitions
ëë 
.
ëë 
TryGetValue
ëë '
(
ëë' (

parameters
ëë( 2
.
ëë2 3
Trigger
ëë3 :
,
ëë: ;
out
ëë< ?
var
ëë@ C
transitions
ëëD O
)
ëëO P
)
ëëP Q
{
íí 
foreach
ìì 
(
ìì 
var
ìì 

transition
ìì '
in
ìì( *
transitions
ìì+ 6
.
ìì6 7
OrderBy
ìì7 >
(
ìì> ?
t
ìì? @
=>
ììA C
t
ììD E
.
ììE F
Priority
ììF N
)
ììN O
)
ììO P
{
îî 
result
ïï 
=
ïï 
await
ïï "

transition
ïï# -
.
ïï- .
ExecuteAsync
ïï. :
(
ïï: ;

parameters
ïï; E
)
ïïE F
.
ïïF G
ConfigureAwait
ïïG U
(
ïïU V'
continueOnCapturedContext
ïïV o
:
ïïo p
false
ïïq v
)
ïïv w
;
ïïw x
if
ññ 
(
ññ 
result
ññ 
.
ññ 
WasSuccessful
ññ ,
)
ññ, -
{
óó 
return
óó 
result
óó #
;
óó# $
}
óó% &
}
òò 
}
ôô 
return
õõ 
result
õõ 
;
õõ 
}
úú 	
public
ûû 
bool
ûû 
	IsInState
ûû 
(
ûû 
TState
ûû $
state
ûû% *
)
ûû* +
{
üü 	
if
†† 
(
†† 
state
†† 
.
†† 
	CompareTo
†† 
(
††  
State
††  %
)
††% &
==
††' )
$num
††* +
)
††+ ,
{
°° 
return
°° 
true
°° 
;
°° 
}
°° 
return
££ 
_superState
££ 
?
££ 
.
££  
	IsInState
££  )
(
££) *
state
££* /
)
££/ 0
??
££1 3
false
££4 9
;
££9 :
}
§§ 	
public
¶¶ &
IStateConfigurationAsync
¶¶ '
<
¶¶' (
T
¶¶( )
,
¶¶) *
TState
¶¶+ 1
,
¶¶1 2
TTrigger
¶¶3 ;
>
¶¶; <
IsSubStateOf
¶¶= I
(
¶¶I J&
IStateConfigurationAsync
¶¶J b
<
¶¶b c
T
¶¶c d
,
¶¶d e
TState
¶¶f l
,
¶¶l m
TTrigger
¶¶n v
>
¶¶v w&
superStateConfiguration¶¶x è
)¶¶è ê
{
ßß 	
AddSuperState
®® 
(
®® %
superStateConfiguration
®® 1
as
®®2 4.
 IStateConfigurationAsyncInternal
®®5 U
<
®®U V
T
®®V W
,
®®W X
TState
®®Y _
,
®®_ `
TTrigger
®®a i
>
®®i j
)
®®j k
;
®®k l
return
™™ 
this
™™ 
;
™™ 
}
´´ 	
}
¨¨ 
}≠≠ ›E
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
internal 
List 
<  
StateTransitionBase  3
<3 4
T4 5
,5 6
TState7 =
,= >
TTrigger? G
>G H
>H I
AutoTransitionsJ Y
=Z [
new\ _
List` d
<d e
StateTransitionBasee x
<x y
Ty z
,z {
TState	| Ç
,
Ç É
TTrigger
Ñ å
>
å ç
>
ç é
(
é è
)
è ê
;
ê ë
	protected 
internal 

Dictionary %
<% &
TState& ,
,, -
List. 2
<2 3
StateTransitionBase3 F
<F G
TG H
,H I
TStateJ P
,P Q
TTriggerR Z
>Z [
>[ \
>\ ](
AutoPreviousStateTransitions^ z
={ |
new	} Ä

Dictionary
Å ã
<
ã å
TState
å í
,
í ì
List
î ò
<
ò ô!
StateTransitionBase
ô ¨
<
¨ ≠
T
≠ Æ
,
Æ Ø
TState
∞ ∂
,
∂ ∑
TTrigger
∏ ¿
>
¿ ¡
>
¡ ¬
>
¬ √
(
√ ƒ
)
ƒ ≈
;
≈ ∆
	protected 

Dictionary 
< 
TTrigger %
,% &
List' +
<+ ,
StateTransitionBase, ?
<? @
T@ A
,A B
TStateC I
,I J
TTriggerK S
>S T
>T U
>U V
TransitionsW b
=c d
newe h

Dictionaryi s
<s t
TTriggert |
,| }
List	~ Ç
<
Ç É!
StateTransitionBase
É ñ
<
ñ ó
T
ó ò
,
ò ô
TState
ö †
,
† °
TTrigger
¢ ™
>
™ ´
>
´ ¨
>
¨ ≠
(
≠ Æ
)
Æ Ø
;
Ø ∞
public 
TState 
State 
{ 
get !
;! "
}# $
public 
Func 
< 
T 
, 
TState 
> 
StateAccessor ,
{- .
get/ 2
;2 3
}4 5
public 
Action 
< 
T 
, 
TState 
>  
StateMutator! -
{. /
get0 3
;3 4
}5 6
	protected%% "
StateConfigurationBase%% (
(%%( )
TState%%) /
state%%0 5
,%%5 6
Func%%7 ;
<%%; <
T%%< =
,%%= >
TState%%? E
>%%E F
stateAccessor%%G T
,%%T U
Action%%V \
<%%\ ]
T%%] ^
,%%^ _
TState%%` f
>%%f g
stateMutator%%h t
)%%t u
{&& 	
State'' 
='' 
state'' 
;'' 
StateAccessor(( 
=(( 
stateAccessor(( )
??((* ,
throw((- 2
new((3 6!
ArgumentNullException((7 L
(((L M
nameof((M S
(((S T
stateAccessor((T a
)((a b
)((b c
;((c d
StateMutator)) 
=)) 
stateMutator)) '
??))( *
throw))+ 0
new))1 4!
ArgumentNullException))5 J
())J K
nameof))K Q
())Q R
stateMutator))R ^
)))^ _
)))_ `
;))` a
}** 	
public00 
void00 
AddAutoTransition00 %
(00% &
StateTransitionBase00& 9
<009 :
T00: ;
,00; <
TState00= C
,00C D
TTrigger00E M
>00M N

transition00O Y
)00Y Z
{11 	
if22 
(22 
AutoTransitions22 
.22  
Any22  #
(22# $
t22$ %
=>22& (
t22) *
.22* +
Priority22+ 3
==224 6

transition227 A
.22A B
Priority22B J
)22J K
)22K L
{33 
throw33 
new33 %
InvalidOperationException33 1
(331 2
$"332 4 
Auto transition for 334 H
{33H I
State33I N
}33N O!
 state with priority 33O d
{33d e

transition33e o
.33o p
Priority33p x
}33x y
 already added.	33y à
"
33à â
)
33â ä
;
33ä ã
}
33å ç
AutoTransitions55 
.55 
Add55 
(55  

transition55  *
)55* +
;55+ ,
}66 	
public== 
void== 
AddTransition== !
(==! "
TTrigger==" *
trigger==+ 2
,==2 3
StateTransitionBase==4 G
<==G H
T==H I
,==I J
TState==K Q
,==Q R
TTrigger==S [
>==[ \

transition==] g
)==g h
{>> 	
if?? 
(?? 
!?? 
Transitions?? 
.?? 
TryGetValue?? (
(??( )
trigger??) 0
,??0 1
out??2 5
var??6 9
existingTransitions??: M
)??M N
)??N O
{@@ 
Transitions@@ 
.@@ 
Add@@ 
(@@ 
trigger@@ %
,@@% &
new@@' *
List@@+ /
<@@/ 0
StateTransitionBase@@0 C
<@@C D
T@@D E
,@@E F
TState@@G M
,@@M N
TTrigger@@O W
>@@W X
>@@X Y
{@@Z [

transition@@[ e
}@@e f
)@@f g
;@@g h
}@@i j
elseAA 
{BB 
ifCC 
(CC 
existingTransitionsCC '
.CC' (
AnyCC( +
(CC+ ,
tCC, -
=>CC. 0
tCC1 2
.CC2 3
PriorityCC3 ;
==CC< >

transitionCC? I
.CCI J
PriorityCCJ R
)CCR S
)CCS T
{DD 
throwDD 
newDD %
InvalidOperationExceptionDD 5
(DD5 6
$"DD6 8
{DD8 9
triggerDD9 @
}DD@ A.
" trigger was previously added for DDA c
{DDc d
StateDDd i
}DDi j
 state as priority DDj }
{DD} ~

transition	DD~ à
.
DDà â
Priority
DDâ ë
}
DDë í
.
DDí ì
"
DDì î
)
DDî ï
;
DDï ñ
}
DDó ò
existingTransitionsFF #
.FF# $
AddFF$ '
(FF' (

transitionFF( 2
)FF2 3
;FF3 4
}GG 
}HH 	
	protectedJJ !
StateTransitionResultJJ '
<JJ' (
TStateJJ( .
,JJ. /
TTriggerJJ0 8
>JJ8 9
FireTriggerPrimJJ: I
(JJI J
ExecutionParametersJJJ ]
<JJ] ^
TJJ^ _
,JJ_ `
TTriggerJJa i
>JJi j

parametersJJk u
)JJu v
{KK 	!
StateTransitionResultLL !
<LL! "
TStateLL" (
,LL( )
TTriggerLL* 2
>LL2 3
resultLL4 :
=LL; <
nullLL= A
;LLA B
ifNN 
(NN 
TransitionsNN 
.NN 
TryGetValueNN '
(NN' (

parametersNN( 2
.NN2 3
TriggerNN3 :
,NN: ;
outNN< ?
varNN@ C
transitionsNND O
)NNO P
)NNP Q
{OO 
foreachPP 
(PP 
varPP 

transitionPP '
inPP( *
transitionsPP+ 6
.PP6 7
OrderByPP7 >
(PP> ?
tPP? @
=>PPA C
tPPD E
.PPE F
PriorityPPF N
)PPN O
)PPO P
{QQ 
resultRR 
=RR 

transitionRR '
.RR' (
ExecuteRR( /
(RR/ 0

parametersRR0 :
)RR: ;
;RR; <
ifSS 
(SS 
resultSS 
.SS 
WasSuccessfulSS ,
)SS, -
{TT 
returnTT 
resultTT #
;TT# $
}TT% &
}UU 
}VV 
returnXX 
resultXX 
;XX 
}YY 	
}ZZ 
}[[ óî
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
public&& 
StateMachine&& 
(&& 
Func&&  
<&&  !
T&&! "
,&&" #
TState&&$ *
>&&* +
stateAccessor&&, 9
,&&9 :
Action&&; A
<&&A B
T&&B C
,&&C D
TState&&E K
>&&K L
stateMutator&&M Y
)&&Y Z
{'' 	
StateAccessor(( 
=(( 
stateAccessor(( )
??((* ,
throw((- 2
new((3 6!
ArgumentNullException((7 L
(((L M
nameof((M S
(((S T
stateAccessor((T a
)((a b
)((b c
;((c d
StateMutator)) 
=)) 
stateMutator)) '
??))( *
throw))+ 0
new))1 4!
ArgumentNullException))5 J
())J K
nameof))K Q
())Q R
stateMutator))R ^
)))^ _
)))_ `
;))` a
}** 	
public33 
IStateMachine33 
<33 
T33 
,33 
TState33  &
,33& '
TTrigger33( 0
>330 1
AddTriggerAction332 B
(33B C
TTrigger33C K
trigger33L S
,33S T
Action33U [
<33[ \
T33\ ]
>33] ^
action33_ e
)33e f
{44 	
if55 
(55 
_triggerActions55 
.55  
ContainsKey55  +
(55+ ,
trigger55, 3
)553 4
)554 5
{66 
throw66 
new66 %
InvalidOperationException66 1
(661 2
$"662 4+
Only one action is allowed for 664 S
{66S T
trigger66T [
}66[ \
	 trigger.66\ e
"66e f
)66f g
;66g h
}66i j
_triggerActions88 
.88 
Add88 
(88  
trigger88  '
,88' ( 
TriggerActionFactory88) =
<88= >
T88> ?
,88? @
TTrigger88A I
>88I J
.88J K
GetTriggerAction88K [
(88[ \
action88\ b
)88b c
)88c d
;88d e
return:: 
this:: 
;:: 
};; 	
publicEE 
IStateMachineEE 
<EE 
TEE 
,EE 
TStateEE  &
,EE& '
TTriggerEE( 0
>EE0 1
AddTriggerActionEE2 B
<EEB C
TRequestEEC K
>EEK L
(EEL M
TTriggerEEM U
triggerEEV ]
,EE] ^
ActionFF 
<FF 
TFF 
,FF 
TRequestFF 
>FF 
actionFF  &
)FF& '
{GG 	
ifHH 
(HH 
_triggerActionsHH 
.HH  
ContainsKeyHH  +
(HH+ ,
triggerHH, 3
)HH3 4
)HH4 5
{II 
throwII 
newII %
InvalidOperationExceptionII 1
(II1 2
$"II2 4+
Only one action is allowed for II4 S
{IIS T
triggerIIT [
}II[ \
	 trigger.II\ e
"IIe f
)IIf g
;IIg h
}IIi j
_triggerActionsKK 
.KK 
AddKK 
(KK  
triggerKK  '
,KK' ( 
TriggerActionFactoryKK) =
<KK= >
TKK> ?
,KK? @
TTriggerKKA I
>KKI J
.KKJ K
GetTriggerActionKKK [
(KK[ \
actionKK\ b
)KKb c
)KKc d
;KKd e
returnMM 
thisMM 
;MM 
}NN 	
publicUU 
IStateConfigurationUU "
<UU" #
TUU# $
,UU$ %
TStateUU& ,
,UU, -
TTriggerUU. 6
>UU6 7
ConfigureStateUU8 F
(UUF G
TStateUUG M
stateUUN S
)UUS T
{VV 	
ifWW 
(WW  
_stateConfigurationsWW $
.WW$ %
TryGetValueWW% 0
(WW0 1
stateWW1 6
,WW6 7
outWW8 ;
varWW< ?
stateConfigurationWW@ R
)WWR S
)WWS T
{XX 
returnXX 
stateConfigurationXX '
;XX' (
}XX) *
varZZ 
newStateZZ 
=ZZ 
newZZ 
StateConfigurationZZ 1
<ZZ1 2
TZZ2 3
,ZZ3 4
TStateZZ5 ;
,ZZ; <
TTriggerZZ= E
>ZZE F
(ZZF G
stateZZG L
,ZZL M
StateAccessorZZN [
,ZZ[ \
StateMutatorZZ] i
)ZZi j
;ZZj k 
_stateConfigurations[[  
.[[  !
Add[[! $
([[$ %
state[[% *
,[[* +
newState[[, 4
)[[4 5
;[[5 6
return\\ 
newState\\ 
;\\ 
}]] 	
publicff !
StateTransitionResultff $
<ff$ %
TStateff% +
,ff+ ,
TTriggerff- 5
>ff5 6
FireTriggerff7 B
<ffB C
TRequestffC K
>ffK L
(ffL M
TffM N
contextffO V
,ffV W
TTriggerffX `
triggerffa h
,ffh i
TRequestffj r
requestffs z
)ffz {
wheregg 
TRequestgg 
:gg 
classgg "
{hh 	
varii 
executionParametersii #
=ii$ %
newii& )
ExecutionParametersii* =
<ii= >
Tii> ?
,ii? @
TTriggeriiA I
>iiI J
(iiJ K
triggeriiK R
,iiR S
contextiiT [
,ii[ \
requestii] d
:iid e
requestiif m
)iim n
;iin o
varjj 

startStatejj 
=jj 
StateAccessorjj *
(jj* +
contextjj+ 2
)jj2 3
;jj3 4
ifll 
(ll 
_triggerActionsll 
.ll  
TryGetValuell  +
(ll+ ,
triggerll, 3
,ll3 4
outll5 8
varll9 <
triggerActionll= J
)llJ K
)llK L
{mm 
triggerActionmm 
.mm 
Executemm #
(mm# $
executionParametersmm$ 7
)mm7 8
;mm8 9
}mm: ;
varoo 
resultoo 
=oo 
!oo  
_stateConfigurationsoo .
.oo. /
TryGetValueoo/ :
(oo: ;

startStateoo; E
,ooE F
outooG J
varooK N
stateConfigurationooO a
)ooa b
?pp 
newpp !
StateTransitionResultpp +
<pp+ ,
TStatepp, 2
,pp2 3
TTriggerpp4 <
>pp< =
(pp= >
triggerpp> E
,qq 

startStateqq  
,rr 

startStaterr  
,ss 

startStatess  
,tt 
lastTransitionNamett (
:tt( )
stringtt* 0
.tt0 1
Emptytt1 6
,uu 
transitionDefineduu '
:uu' (
falseuu) .
)uu. /
:vv 
stateConfigurationvv $
.vv$ %
FireTriggervv% 0
(vv0 1
executionParametersvv1 D
)vvD E
;vvE F
returnxx &
executeExitAndEntryActionsxx -
(xx- .
executionParametersxx. A
,xxA B
resultxxC I
)xxI J
;xxJ K
}yy 	
public
ÅÅ #
StateTransitionResult
ÅÅ $
<
ÅÅ$ %
TState
ÅÅ% +
,
ÅÅ+ ,
TTrigger
ÅÅ- 5
>
ÅÅ5 6
FireTrigger
ÅÅ7 B
(
ÅÅB C
T
ÅÅC D
context
ÅÅE L
,
ÅÅL M
TTrigger
ÅÅN V
trigger
ÅÅW ^
)
ÅÅ^ _
{
ÇÇ 	
var
ÉÉ 

startState
ÉÉ 
=
ÉÉ 
StateAccessor
ÉÉ *
(
ÉÉ* +
context
ÉÉ+ 2
)
ÉÉ2 3
;
ÉÉ3 4
var
ÑÑ !
executionParameters
ÑÑ #
=
ÑÑ$ %
new
ÑÑ& )!
ExecutionParameters
ÑÑ* =
<
ÑÑ= >
T
ÑÑ> ?
,
ÑÑ? @
TTrigger
ÑÑA I
>
ÑÑI J
(
ÑÑJ K
trigger
ÑÑK R
,
ÑÑR S
context
ÑÑT [
)
ÑÑ[ \
;
ÑÑ\ ]
if
ÜÜ 
(
ÜÜ 
_triggerActions
ÜÜ 
.
ÜÜ  
TryGetValue
ÜÜ  +
(
ÜÜ+ ,
trigger
ÜÜ, 3
,
ÜÜ3 4
out
ÜÜ5 8
var
ÜÜ9 <
triggerAction
ÜÜ= J
)
ÜÜJ K
)
ÜÜK L
{
áá 
triggerAction
áá 
.
áá 
Execute
áá #
(
áá# $!
executionParameters
áá$ 7
)
áá7 8
;
áá8 9
}
áá: ;
var
ââ 
result
ââ 
=
ââ 
!
ââ "
_stateConfigurations
ââ .
.
ââ. /
TryGetValue
ââ/ :
(
ââ: ;

startState
ââ; E
,
ââE F
out
ââG J
var
ââK N 
stateConfiguration
ââO a
)
ââa b
?
ää 
new
ää #
StateTransitionResult
ää +
<
ää+ ,
TState
ää, 2
,
ää2 3
TTrigger
ää4 <
>
ää< =
(
ää= >
trigger
ää> E
,
ãã 

startState
ãã  
,
åå 

startState
åå  
,
çç 

startState
çç  
,
éé  
lastTransitionName
éé '
:
éé' (
String
éé) /
.
éé/ 0
Empty
éé0 5
,
èè 
transitionDefined
èè '
:
èè' (
false
èè) .
)
èè. /
:
êê  
stateConfiguration
êê $
.
êê$ %
FireTrigger
êê% 0
(
êê0 1!
executionParameters
êê1 D
)
êêD E
;
êêE F
return
íí (
executeExitAndEntryActions
íí -
(
íí- .!
executionParameters
íí. A
,
ííA B
result
ííC I
)
ííI J
;
ííJ K
}
ìì 	
public
ïï 
bool
ïï 
	IsInState
ïï 
(
ïï 
T
ïï 
context
ïï  '
,
ïï' (
TState
ïï) /
state
ïï0 5
)
ïï5 6
{
ññ 	
var
óó 
objectState
óó 
=
óó 
StateAccessor
óó +
(
óó+ ,
context
óó, 3
)
óó3 4
;
óó4 5
if
ôô 
(
ôô 
state
ôô 
.
ôô 
	CompareTo
ôô 
(
ôô  
objectState
ôô  +
)
ôô+ ,
==
ôô- /
$num
ôô0 1
)
ôô1 2
{
öö 
return
öö 
true
öö 
;
öö 
}
öö 
return
úú "
_stateConfigurations
úú '
.
úú' (
TryGetValue
úú( 3
(
úú3 4
objectState
úú4 ?
,
úú? @
out
úúA D
var
úúE H&
objectStateConfiguration
úúI a
)
úúa b
&&
ùù &
objectStateConfiguration
ùù .
.
ùù. /
	IsInState
ùù/ 8
(
ùù8 9
state
ùù9 >
)
ùù> ?
;
ùù? @
}
ûû 	
public
†† 
IStateMachine
†† 
<
†† 
T
†† 
,
†† 
TState
††  &
,
††& '
TTrigger
††( 0
>
††0 1*
RegisterOnTransitionedAction
††2 N
(
††N O
Action
††O U
<
††U V
T
††V W
,
††W X#
StateTransitionResult
††Y n
<
††n o
TState
††o u
,
††u v
TTrigger
††w 
>†† Ä
>††Ä Å
action††Ç à
)††à â
{
°° 	!
StateTransitionBase
¢¢ 
<
¢¢  
T
¢¢  !
,
¢¢! "
TState
¢¢# )
,
¢¢) *
TTrigger
¢¢+ 3
>
¢¢3 4
.
¢¢4 5!
OnTransitionedEvent
¢¢5 H
+=
¢¢I K
action
¢¢L R
;
¢¢R S
return
§§ 
this
§§ 
;
§§ 
}
•• 	
private
ßß #
StateTransitionResult
ßß %
<
ßß% &
TState
ßß& ,
,
ßß, -
TTrigger
ßß. 6
>
ßß6 7(
executeExitAndEntryActions
ßß8 R
(
ßßR S!
ExecutionParameters
ßßS f
<
ßßf g
T
ßßg h
,
ßßh i
TTrigger
ßßj r
>
ßßr s

parameters
ßßt ~
,
®®
 #
StateTransitionResult
®® !
<
®®! "
TState
®®" (
,
®®( )
TTrigger
®®* 2
>
®®2 3
currentResult
®®4 A
)
®®A B
{
©© 	
if
™™ 
(
™™ 
currentResult
™™ 
.
™™ 
WasSuccessful
™™ +
&&
™™, .
!
´´ 
(
´´ 
currentResult
´´ 
.
´´  
StartingState
´´  -
.
´´- .
	CompareTo
´´. 7
(
´´7 8
currentResult
´´8 E
.
´´E F
PreviousState
´´F S
)
´´S T
==
´´U W
$num
´´X Y
&&
´´Z \
currentResult
´´] j
.
´´j k
PreviousState
´´k x
.
´´x y
	CompareTo´´y Ç
(´´Ç É
currentResult´´É ê
.´´ê ë
CurrentState´´ë ù
)´´ù û
==´´ü °
$num´´¢ £
)´´£ §
)´´§ •
{
¨¨ "
_stateConfigurations
≠≠ $
.
≠≠$ %
TryGetValue
≠≠% 0
(
≠≠0 1
currentResult
≠≠1 >
.
≠≠> ?
PreviousState
≠≠? L
,
≠≠L M
out
≠≠N Q
var
≠≠R U
previousState
≠≠V c
)
≠≠c d
;
≠≠d e
if
∞∞ 
(
∞∞ 
!
∞∞ 
	IsInState
∞∞ 
(
∞∞ 

parameters
∞∞ )
.
∞∞) *
Context
∞∞* 1
,
∞∞1 2
currentResult
∞∞3 @
.
∞∞@ A
PreviousState
∞∞A N
)
∞∞N O
)
∞∞O P
{
±± 
previousState
±± 
.
±±  
ExecuteExitAction
±±  1
(
±±1 2

parameters
±±2 <
.
±±< =
Context
±±= D
,
±±D E
currentResult
±±F S
)
±±S T
;
±±T U
}
±±V W
if
≥≥ 
(
≥≥ "
_stateConfigurations
≥≥ (
.
≥≥( )
TryGetValue
≥≥) 4
(
≥≥4 5
currentResult
≥≥5 B
.
≥≥B C
CurrentState
≥≥C O
,
≥≥O P
out
≥≥Q T
var
≥≥U X
newState
≥≥Y a
)
≥≥a b
)
≥≥b c
{
¥¥ 
if
∂∂ 
(
∂∂ 
!
∂∂ 
previousState
∂∂ &
.
∂∂& '
	IsInState
∂∂' 0
(
∂∂0 1
currentResult
∂∂1 >
.
∂∂> ?
CurrentState
∂∂? K
)
∂∂K L
)
∂∂L M
{
∑∑ 
newState
∑∑ 
.
∑∑  
ExecuteEntryAction
∑∑ 1
(
∑∑1 2

parameters
∑∑2 <
.
∑∑< =
Context
∑∑= D
,
∑∑D E
currentResult
∑∑F S
)
∑∑S T
;
∑∑T U
}
∑∑V W
var
∫∫ !
preAutoForwardState
∫∫ +
=
∫∫, -
currentResult
∫∫. ;
.
∫∫; <
CurrentState
∫∫< H
;
∫∫H I
currentResult
ªª !
=
ªª" #
newState
ªª$ ,
.
ªª, -#
ExecuteAutoTransition
ªª- B
(
ªªB C

parameters
ªªC M
,
ªªM N
currentResult
ªªO \
)
ªª\ ]
??
ªª^ `
currentResult
ªªa n
;
ªªn o
if
ææ 
(
ææ 
currentResult
ææ %
.
ææ% &
CurrentState
ææ& 2
.
ææ2 3
	CompareTo
ææ3 <
(
ææ< =!
preAutoForwardState
ææ= P
)
ææP Q
!=
ææR T
$num
ææU V
)
ææV W
{
øø 
currentResult
øø #
=
øø$ %(
executeExitAndEntryActions
øø& @
(
øø@ A

parameters
øøA K
,
øøK L
currentResult
øøM Z
)
øøZ [
;
øø[ \
}
øø] ^
}
¿¿ 
}
¡¡ 
else
√√ 
if
√√ 
(
√√ "
_stateConfigurations
√√ )
.
√√) *
TryGetValue
√√* 5
(
√√5 6
currentResult
√√6 C
.
√√C D
CurrentState
√√D P
,
√√P Q
out
√√R U
var
√√V Y
reenteredState
√√Z h
)
√√h i
)
√√i j
{
ƒƒ 
reenteredState
ƒƒ 
.
ƒƒ "
ExecuteReentryAction
ƒƒ 1
(
ƒƒ1 2

parameters
ƒƒ2 <
.
ƒƒ< =
Context
ƒƒ= D
,
ƒƒD E
currentResult
ƒƒF S
)
ƒƒS T
;
ƒƒT U
}
ƒƒV W
return
∆∆ 
currentResult
∆∆  
;
∆∆  !
}
«« 	
}
»» 
}…… ã¨
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
readonly 
Func 
< 
T 
,  
TState! '
>' (
_stateAccessor) 7
;7 8
private 
readonly 
Action 
<  
T  !
,! "
TState# )
>) *
_stateMutator+ 8
;8 9
private 
readonly 

Dictionary #
<# $
TState$ *
,* +,
 IStateConfigurationAsyncInternal, L
<L M
TM N
,N O
TStateP V
,V W
TTriggerX `
>` a
>a b 
_stateConfigurationsc w
=x y
newz }

Dictionary	~ à
<
à â
TState
â è
,
è ê.
 IStateConfigurationAsyncInternal
ë ±
<
± ≤
T
≤ ≥
,
≥ ¥
TState
µ ª
,
ª º
TTrigger
Ω ≈
>
≈ ∆
>
∆ «
(
« »
)
» …
;
…  
private 
readonly 

Dictionary #
<# $
TTrigger$ ,
,, -
FunctionActionBase. @
<@ A
TA B
>B C
>C D
_triggerActionsE T
=U V
newW Z

Dictionary[ e
<e f
TTriggerf n
,n o
FunctionActionBase	p Ç
<
Ç É
T
É Ñ
>
Ñ Ö
>
Ö Ü
(
Ü á
)
á à
;
à â
public%% 
StateMachineAsync%%  
(%%  !
Func%%! %
<%%% &
T%%& '
,%%' (
TState%%) /
>%%/ 0
stateAccessor%%1 >
,%%> ?
Action%%@ F
<%%F G
T%%G H
,%%H I
TState%%J P
>%%P Q
stateMutator%%R ^
)%%^ _
{&& 	
_stateAccessor'' 
='' 
stateAccessor'' *
??''+ -
throw''. 3
new''4 7!
ArgumentNullException''8 M
(''M N
nameof''N T
(''T U
stateAccessor''U b
)''b c
)''c d
;''d e
_stateMutator(( 
=(( 
stateMutator(( (
??(() +
throw((, 1
new((2 5!
ArgumentNullException((6 K
(((K L
nameof((L R
(((R S
stateMutator((S _
)((_ `
)((` a
;((a b
})) 	
public22 
IStateMachineAsync22 !
<22! "
T22" #
,22# $
TState22% +
,22+ ,
TTrigger22- 5
>225 6
AddTriggerAction227 G
(22G H
TTrigger22H P
trigger22Q X
,22X Y
Func22Z ^
<22^ _
T22_ `
,22` a
CancellationToken22b s
,22s t
Task22u y
>22y z
action	22{ Å
)
22Å Ç
{33 	
if44 
(44 
_triggerActions44 
.44  
ContainsKey44  +
(44+ ,
trigger44, 3
)443 4
)444 5
{55 
throw55 
new55 %
InvalidOperationException55 1
(551 2
$"552 4+
Only one action is allowed for 554 S
{55S T
trigger55T [
}55[ \
	 trigger.55\ e
"55e f
)55f g
;55g h
}55i j
_triggerActions77 
.77 
Add77 
(77  
trigger77  '
,77' ( 
TriggerActionFactory77) =
<77= >
T77> ?
,77? @
TTrigger77A I
>77I J
.77J K
GetTriggerAction77K [
(77[ \
action77\ b
)77b c
)77c d
;77d e
return99 
this99 
;99 
}:: 	
publicDD 
IStateMachineAsyncDD !
<DD! "
TDD" #
,DD# $
TStateDD% +
,DD+ ,
TTriggerDD- 5
>DD5 6
AddTriggerActionDD7 G
<DDG H
TRequestDDH P
>DDP Q
(DDQ R
TTriggerDDR Z
triggerDD[ b
,DDb c
FuncDDd h
<DDh i
TDDi j
,DDj k
TRequestDDl t
,DDt u
CancellationToken	DDv á
,
DDá à
Task
DDâ ç
>
DDç é
action
DDè ï
)
DDï ñ
{EE 	
ifFF 
(FF 
_triggerActionsFF 
.FF  
ContainsKeyFF  +
(FF+ ,
triggerFF, 3
)FF3 4
)FF4 5
{GG 
throwGG 
newGG %
InvalidOperationExceptionGG 1
(GG1 2
$"GG2 4+
Only one action is allowed for GG4 S
{GGS T
triggerGGT [
}GG[ \
	 trigger.GG\ e
"GGe f
)GGf g
;GGg h
}GGi j
_triggerActionsII 
.II 
AddII 
(II  
triggerII  '
,II' ( 
TriggerActionFactoryII) =
<II= >
TII> ?
,II? @
TTriggerIIA I
>III J
.IIJ K
GetTriggerActionIIK [
(II[ \
actionII\ b
)IIb c
)IIc d
;IId e
returnKK 
thisKK 
;KK 
}LL 	
publicSS $
IStateConfigurationAsyncSS '
<SS' (
TSS( )
,SS) *
TStateSS+ 1
,SS1 2
TTriggerSS3 ;
>SS; <
ConfigureStateSS= K
(SSK L
TStateSSL R
stateSSS X
)SSX Y
{TT 	
ifUU 
(UU  
_stateConfigurationsUU $
.UU$ %
TryGetValueUU% 0
(UU0 1
stateUU1 6
,UU6 7
outUU8 ;
varUU< ?
stateConfigurationUU@ R
)UUR S
)UUS T
{VV 
returnVV 
stateConfigurationVV '
;VV' (
}VV) *
varXX 
newStateXX 
=XX 
newXX #
StateConfigurationAsyncXX 6
<XX6 7
TXX7 8
,XX8 9
TStateXX9 ?
,XX? @
TTriggerXXA I
>XXI J
(XXJ K
stateXXK P
,XXP Q
_stateAccessorXXR `
,XX` a
_stateMutatorXXb o
)XXo p
;XXp q 
_stateConfigurationsYY  
.YY  !
AddYY! $
(YY$ %
stateYY% *
,YY* +
newStateYY, 4
)YY4 5
;YY5 6
return[[ 
newState[[ 
;[[ 
}\\ 	
publicee 
asyncee 
Taskee 
<ee !
StateTransitionResultee /
<ee/ 0
TStateee0 6
,ee6 7
TTriggeree8 @
>ee@ A
>eeA B
FireTriggerAsynceeC S
(eeS T
TeeT U
contexteeV ]
,ee] ^
TTriggeree_ g
triggereeh o
,eeo p
CancellationToken	eeq Ç
cancellationToken
eeÉ î
=
eeï ñ
default
eeó û
(
eeû ü
CancellationToken
eeü ∞
)
ee∞ ±
)
ee± ≤
{ff 	
vargg 

startStategg 
=gg 
_stateAccessorgg +
(gg+ ,
contextgg, 3
)gg3 4
;gg4 5
ifii 
(ii 
_triggerActionsii 
.ii  
TryGetValueii  +
(ii+ ,
triggerii, 3
,ii3 4
outii5 8
varii9 <
triggerActionii= J
)iiJ K
)iiK L
{jj 
awaitkk 
triggerActionkk #
.kk# $
ExecuteAsynckk$ 0
(kk0 1
contextkk1 8
,kk8 9
requestkk: A
:kkA B
nullkkC G
,kkG H
cancellationTokenkkI Z
:kkZ [
cancellationTokenkk\ m
)kkm n
.ll 
ConfigureAwaitll "
(ll" #%
continueOnCapturedContextll# <
:ll< =
falsell> C
)llC D
;llD E
}mm 
varoo 
executionParametersoo #
=oo$ %
newoo& )
ExecutionParametersoo* =
<oo= >
Too> ?
,oo? @
TTriggerooA I
>ooI J
(ooJ K
triggerooK R
,ooR S
contextooT [
,oo[ \
cancellationTokenoo] n
)oon o
;ooo p
varqq 
resultqq 
=qq  
_stateConfigurationsqq -
.qq- .
TryGetValueqq. 9
(qq9 :

startStateqq: D
,qqD E
outqqF I
varqqJ M
stateConfigurationqqN `
)qq` a
?rr 
awaitrr 
stateConfigurationrr *
.rr* +
FireTriggerAsyncrr+ ;
(rr; <
executionParametersrr< O
)rrO P
.rrP Q
ConfigureAwaitrrQ _
(rr_ `%
continueOnCapturedContextrr` y
:rry z
false	rr{ Ä
)
rrÄ Å
:ss 
newss !
StateTransitionResultss +
<ss+ ,
TStatess, 2
,ss2 3
TTriggerss4 <
>ss< =
(ss= >
triggerss> E
,tt 

startStatett  
,uu 

startStateuu  
,vv 

startStatevv  
,ww 
lastTransitionNameww (
:ww( )
stringww* 0
.ww0 1
Emptyww1 6
,xx 
transitionDefinedxx '
:xx' (
falsexx) .
)xx. /
;xx/ 0
returnzz 
awaitzz +
executeExitAndEntryActionsAsynczz 8
(zz8 9
executionParameterszz9 L
,zzL M
resultzzN T
)zzT U
.zzU V
ConfigureAwaitzzV d
(zzd e%
continueOnCapturedContextzze ~
:zz~ 
false
zzÄ Ö
)
zzÖ Ü
;
zzÜ á
}{{ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ #
StateTransitionResult
ÖÖ /
<
ÖÖ/ 0
TState
ÖÖ0 6
,
ÖÖ6 7
TTrigger
ÖÖ8 @
>
ÖÖ@ A
>
ÖÖA B
FireTriggerAsync
ÖÖC S
<
ÖÖS T
TRequest
ÖÖT \
>
ÖÖ\ ]
(
ÖÖ] ^
T
ÖÖ^ _
context
ÖÖ` g
,
ÜÜ
 
TTrigger
ÜÜ 
trigger
ÜÜ 
,
áá
 
TRequest
áá 
request
áá 
,
àà
 
CancellationToken
àà 
cancellationToken
àà /
=
àà0 1
default
àà2 9
(
àà9 :
CancellationToken
àà: K
)
ààK L
)
ààL M
where
ââ 
TRequest
ââ 
:
ââ 
class
ââ "
{
ää 	
var
ãã 

startState
ãã 
=
ãã 
_stateAccessor
ãã +
(
ãã+ ,
context
ãã, 3
)
ãã3 4
;
ãã4 5
if
çç 
(
çç 
_triggerActions
çç 
.
çç  
TryGetValue
çç  +
(
çç+ ,
trigger
çç, 3
,
çç3 4
out
çç5 8
var
çç9 <
triggerAction
çç= J
)
ççJ K
)
ççK L
{
éé 
await
èè 
triggerAction
èè #
.
èè# $
ExecuteAsync
èè$ 0
(
èè0 1
context
èè1 8
,
èè8 9
cancellationToken
èè: K
,
èèK L
request
èèM T
)
èèT U
.
êê 
ConfigureAwait
êê #
(
êê# $'
continueOnCapturedContext
êê$ =
:
êê= >
false
êê? D
)
êêD E
;
êêE F
}
ëë 
var
ìì !
executionParameters
ìì #
=
ìì$ %
new
ìì& )!
ExecutionParameters
ìì* =
<
ìì= >
T
ìì> ?
,
ìì? @
TTrigger
ììA I
>
ììI J
(
ììJ K
trigger
ììK R
,
ììR S
context
ììT [
,
ìì[ \
cancellationToken
ìì] n
,
ììn o
request
ììp w
)
ììw x
;
ììx y#
StateTransitionResult
ïï !
<
ïï! "
TState
ïï" (
,
ïï( )
TTrigger
ïï* 2
>
ïï2 3
result
ïï4 :
;
ïï: ;
if
ññ 
(
ññ 
!
ññ "
_stateConfigurations
ññ %
.
ññ% &
TryGetValue
ññ& 1
(
ññ1 2

startState
ññ2 <
,
ññ< =
out
ññ> A
var
ññB E 
stateConfiguration
ññF X
)
ññX Y
)
ññY Z
{
óó 
result
óó 
=
óó 
new
óó #
StateTransitionResult
óó 0
<
óó0 1
TState
óó1 7
,
óó7 8
TTrigger
óó9 A
>
óóA B
(
óóB C
trigger
óóC J
,
òò 

startState
òò 
,
ôô 

startState
ôô 
,
öö 

startState
öö 
,
õõ  
lastTransitionName
õõ $
:
õõ$ %
string
õõ& ,
.
õõ, -
Empty
õõ- 2
,
úú 
transitionDefined
úú #
:
úú# $
false
úú% *
)
úú* +
;
úú+ ,
}
úú- .
else
ùù 
{
ûû 
result
üü 
=
üü 
await
üü  
stateConfiguration
üü 1
.
üü1 2
FireTriggerAsync
üü2 B
(
üüB C!
executionParameters
üüC V
)
üüV W
.
†† 
ConfigureAwait
†† #
(
††# $'
continueOnCapturedContext
††$ =
:
††= >
false
††? D
)
††D E
;
††E F
}
°° 
return
££ 
await
££ -
executeExitAndEntryActionsAsync
££ 8
(
££8 9!
executionParameters
££9 L
,
££L M
result
££N T
)
££T U
.
§§ 
ConfigureAwait
§§ 
(
§§  '
continueOnCapturedContext
§§  9
:
§§9 :
false
§§; @
)
§§@ A
;
§§A B
}
•• 	
private
ßß 
async
ßß 
Task
ßß 
<
ßß #
StateTransitionResult
ßß 0
<
ßß0 1
TState
ßß1 7
,
ßß7 8
TTrigger
ßß9 A
>
ßßA B
>
ßßB C-
executeExitAndEntryActionsAsync
ßßD c
(
ßßc d!
ExecutionParameters
ßßd w
<
ßßw x
T
ßßx y
,
ßßy z
TTriggerßß{ É
>ßßÉ Ñ

parametersßßÖ è
,ßßè ê%
StateTransitionResultßßë ¶
<ßß¶ ß
TStateßßß ≠
,ßß≠ Æ
TTriggerßßØ ∑
>ßß∑ ∏
currentResultßßπ ∆
)ßß∆ «
{
®® 	
var
©© 
currentState
©© 
=
©© 
_stateAccessor
©© -
(
©©- .

parameters
©©. 8
.
©©8 9
Context
©©9 @
)
©©@ A
;
©©A B
if
™™ 
(
™™ 
currentResult
™™ 
.
™™ 
WasSuccessful
™™ +
&&
™™, .
!
™™/ 0
currentState
™™0 <
.
™™< =
Equals
™™= C
(
™™C D
currentResult
™™D Q
.
™™Q R
StartingState
™™R _
)
™™_ `
)
™™` a
{
´´ "
_stateConfigurations
¨¨ $
.
¨¨$ %
TryGetValue
¨¨% 0
(
¨¨0 1
currentResult
¨¨1 >
.
¨¨> ?
PreviousState
¨¨? L
,
¨¨L M
out
¨¨N Q
var
¨¨R U
previousState
¨¨V c
)
¨¨c d
;
¨¨d e
if
ØØ 
(
ØØ 
!
ØØ 
	IsInState
ØØ 
(
ØØ 

parameters
ØØ )
.
ØØ) *
Context
ØØ* 1
,
ØØ1 2
currentResult
ØØ3 @
.
ØØ@ A
PreviousState
ØØA N
)
ØØN O
)
ØØO P
{
∞∞ 
await
±± 
previousState
±± '
.
±±' ($
ExecuteExitActionAsync
±±( >
(
±±> ?

parameters
±±? I
,
±±I J
currentResult
±±K X
)
±±X Y
.
≤≤ 
ConfigureAwait
≤≤ '
(
≤≤' ('
continueOnCapturedContext
≤≤( A
:
≤≤A B
false
≤≤C H
)
≤≤H I
;
≤≤I J
}
≥≥ 
if
µµ 
(
µµ "
_stateConfigurations
µµ (
.
µµ( )
TryGetValue
µµ) 4
(
µµ4 5
currentResult
µµ5 B
.
µµB C
CurrentState
µµC O
,
µµO P
out
µµQ T
var
µµU X
newState
µµY a
)
µµa b
)
µµb c
{
∂∂ 
if
∏∏ 
(
∏∏ 
!
∏∏ 
previousState
∏∏ &
.
∏∏& '
	IsInState
∏∏' 0
(
∏∏0 1
currentResult
∏∏1 >
.
∏∏> ?
CurrentState
∏∏? K
)
∏∏K L
)
∏∏L M
{
ππ 
await
∫∫ 
newState
∫∫ &
.
∫∫& '%
ExecuteEntryActionAsync
∫∫' >
(
∫∫> ?

parameters
∫∫? I
,
∫∫I J
currentResult
∫∫K X
)
∫∫X Y
.
ªª 
ConfigureAwait
ªª *
(
ªª* +'
continueOnCapturedContext
ªª+ D
:
ªªD E
false
ªªF K
)
ªªK L
;
ªªL M
}
ºº 
var
øø !
preAutoForwardState
øø +
=
øø, -
currentResult
øø. ;
.
øø; <
CurrentState
øø< H
;
øøH I
currentResult
¿¿ !
=
¿¿" #
await
¿¿$ )
newState
¿¿* 2
.
¿¿2 3(
ExecuteAutoTransitionAsync
¿¿3 M
(
¿¿M N

parameters
¿¿N X
,
¿¿X Y
currentResult
¿¿Z g
)
¿¿g h
.
¡¡ 
ConfigureAwait
¡¡ &
(
¡¡& ''
continueOnCapturedContext
¡¡' @
:
¡¡@ A
false
¡¡B G
)
¡¡G H
;
¡¡H I
if
ƒƒ 
(
ƒƒ !
preAutoForwardState
ƒƒ +
.
ƒƒ+ ,
	CompareTo
ƒƒ, 5
(
ƒƒ5 6
currentResult
ƒƒ6 C
.
ƒƒC D
CurrentState
ƒƒD P
)
ƒƒP Q
!=
ƒƒR T
$num
ƒƒU V
)
ƒƒV W
{
≈≈ 
currentResult
∆∆ %
=
∆∆& '
await
∆∆( --
executeExitAndEntryActionsAsync
∆∆. M
(
∆∆M N

parameters
∆∆N X
,
∆∆X Y
currentResult
∆∆Z g
)
∆∆g h
.
«« 
ConfigureAwait
«« *
(
««* +'
continueOnCapturedContext
««+ D
:
««D E
false
««F K
)
««K L
;
««L M
}
»» 
}
…… 
}
   
else
ÃÃ 
if
ÃÃ 
(
ÃÃ "
_stateConfigurations
ÃÃ )
.
ÃÃ) *
TryGetValue
ÃÃ* 5
(
ÃÃ5 6
currentResult
ÃÃ6 C
.
ÃÃC D
CurrentState
ÃÃD P
,
ÃÃP Q
out
ÃÃR U
var
ÃÃV Y
reenteredState
ÃÃZ h
)
ÃÃh i
)
ÃÃi j
{
ÕÕ 
await
ŒŒ 
reenteredState
ŒŒ $
.
ŒŒ$ %'
ExecuteReentryActionAsync
ŒŒ% >
(
ŒŒ> ?

parameters
ŒŒ? I
,
ŒŒI J
currentResult
ŒŒK X
)
ŒŒX Y
.
œœ 
ConfigureAwait
œœ "
(
œœ" #'
continueOnCapturedContext
œœ# <
:
œœ< =
false
œœ> C
)
œœC D
;
œœD E
}
–– 
return
““ 
currentResult
““  
;
““  !
}
”” 	
public
’’ 
bool
’’ 
	IsInState
’’ 
(
’’ 
T
’’ 
context
’’  '
,
’’' (
TState
’’) /
state
’’0 5
)
’’5 6
{
÷÷ 	
var
◊◊ 
objectState
◊◊ 
=
◊◊ 
_stateAccessor
◊◊ ,
(
◊◊, -
context
◊◊- 4
)
◊◊4 5
;
◊◊5 6
if
ŸŸ 
(
ŸŸ 
state
ŸŸ 
.
ŸŸ 
	CompareTo
ŸŸ 
(
ŸŸ  
objectState
ŸŸ  +
)
ŸŸ+ ,
==
ŸŸ- /
$num
ŸŸ0 1
)
ŸŸ1 2
{
⁄⁄ 
return
⁄⁄ 
true
⁄⁄ 
;
⁄⁄ 
}
⁄⁄ 
return
‹‹ "
_stateConfigurations
‹‹ '
.
‹‹' (
TryGetValue
‹‹( 3
(
‹‹3 4
objectState
‹‹4 ?
,
‹‹? @
out
‹‹A D
var
‹‹E H&
objectStateConfiguration
‹‹I a
)
‹‹a b
&&
›› &
objectStateConfiguration
›› .
.
››. /
	IsInState
››/ 8
(
››8 9
state
››9 >
)
››> ?
;
››? @
}
ﬁﬁ 	
public
‡‡  
IStateMachineAsync
‡‡ !
<
‡‡! "
T
‡‡" #
,
‡‡# $
TState
‡‡% +
,
‡‡+ ,
TTrigger
‡‡- 5
>
‡‡5 6)
RegisterOnTransitionedEvent
‡‡7 R
(
‡‡R S
Action
‡‡S Y
<
‡‡Y Z
T
‡‡Z [
,
‡‡[ \#
StateTransitionResult
‡‡] r
<
‡‡r s
TState
‡‡s y
,
‡‡y z
TTrigger‡‡{ É
>‡‡É Ñ
>‡‡Ñ Ö#
onTransitionedEvent‡‡Ü ô
)‡‡ô ö
{
·· 	!
StateTransitionBase
‚‚ 
<
‚‚  
T
‚‚  !
,
‚‚! "
TState
‚‚# )
,
‚‚) *
TTrigger
‚‚+ 3
>
‚‚3 4
.
‚‚4 5!
OnTransitionedEvent
‚‚5 H
+=
‚‚I K!
onTransitionedEvent
‚‚L _
;
‚‚_ `
return
‰‰ 
this
‰‰ 
;
‰‰ 
}
ÂÂ 	
}
ÊÊ 
}ÁÁ Ï
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
:8 9
StateTransitionBase: M
<M N
TN O
,O P
TStateQ W
,W X
TTriggerY a
>a b
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
} ∏*
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
:= >
StateTransitionBase? R
<R S
TS T
,T U
TStateV \
,\ ]
TTrigger^ f
>f g
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
return!! 
	GetResult!! 
(!! 

parameters!! )
,!!) *
currentResult!!+ 8
,!!8 9

startState!!: D
,!!D E
wasSuccessful!!F S
:!!S T
false!!U Z
,!!Z [
wasCancelled!!\ h
:!!h i
true!!j n
)!!n o
;!!o p
}!!q r
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
return%% 
	GetResult%% 
(%% 

parameters%% )
,%%) *
currentResult%%+ 8
,%%8 9

startState%%: D
,%%D E
wasSuccessful%%F S
:%%S T
false%%U Z
,%%Z [
wasCancelled%%\ h
:%%h i

parameters%%j t
.%%t u
CancellationToken	%%u Ü
.
%%Ü á%
IsCancellationRequested
%%á û
)
%%û ü
;
%%ü †
}
%%° ¢
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
=((! "
	GetResult((# ,
(((, -

parameters((- 7
,((7 8
currentResult((9 F
,((F G

startState((H R
,((R S
wasSuccessful((T a
:((a b
true((c g
,((g h
wasCancelled((i u
:((u v
false((w |
)((| }
;((} ~
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
}.. ÄL
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
}8 9
public 
TState 
ToState 
{ 
get  #
;# $
	protected% .
set/ 2
;2 3
}4 5
	protected 
StateTransitionBase %
(% &
Func& *
<* +
T+ ,
,, -
TState. 4
>4 5
stateAccessor6 C
, 
Action 
< 
T 
, 
TState 
> 
stateMutator  ,
, 
TState 
toState 
, 
string 
name 
, 
uint 
priority 
) 
{   	
StateAccessor!! 
=!! 
stateAccessor!! )
??!!* ,
throw!!- 2
new!!3 6!
ArgumentNullException!!7 L
(!!L M
nameof!!M S
(!!S T
stateAccessor!!T a
)!!a b
)!!b c
;!!c d
StateMutator"" 
="" 
stateMutator"" '
??""( *
throw""+ 0
new""1 4!
ArgumentNullException""5 J
(""J K
nameof""K Q
(""Q R
stateMutator""R ^
)""^ _
)""_ `
;""` a
ToState## 
=## 
toState## 
;## 
Name$$ 
=$$ 
name$$ 
??$$ 
$str$$ &
;$$& '
Priority%% 
=%% 
priority%% 
;%%  
}&& 	
public(( 
virtual(( !
StateTransitionResult(( ,
<((, -
TState((- 3
,((3 4
TTrigger((5 =
>((= >
Execute((? F
(((F G
ExecutionParameters((G Z
<((Z [
T(([ \
,((\ ]
TTrigger((^ f
>((f g

parameters((h r
,))
 !
StateTransitionResult)) !
<))! "
TState))" (
,))( )
TTrigger))* 2
>))2 3
currentResult))4 A
=))B C
null))D H
)))H I
{** 	
throw++ 
new++ #
NotImplementedException++ -
(++- .
$str	++. ì
)
++ì î
;
++î ï
},, 	
public.. 
virtual.. 
Task.. 
<.. !
StateTransitionResult.. 1
<..1 2
TState..2 8
,..8 9
TTrigger..: B
>..B C
>..C D
ExecuteAsync..E Q
(..Q R
ExecutionParameters..R e
<..e f
T..f g
,..g h
TTrigger..i q
>..q r

parameters..s }
,//
 !
StateTransitionResult// !
<//! "
TState//" (
,//( )
TTrigger//* 2
>//2 3
currentResult//4 A
=//B C
null//D H
)//H I
{00 	
throw11 
new11 #
NotImplementedException11 -
(11- .
$str	11. ì
)
11ì î
;
11î ï
}22 	
	protected44 !
StateTransitionResult44 '
<44' (
TState44( .
,44. /
TTrigger440 8
>448 9
ExecutePrim44: E
(44E F
ExecutionParameters44F Y
<44Y Z
T44Z [
,44[ \
TTrigger44] e
>44e f

parameters44g q
,55
 !
StateTransitionResult55 !
<55! "
TState55" (
,55( )
TTrigger55* 2
>552 3
currentResult554 A
,55A B
bool55C G
conditionMet55H T
)55T U
{66 	
var77 

startState77 
=77 
currentResult77 *
!=77+ -
null77. 2
?773 4
currentResult775 B
.77B C
StartingState77C P
:77Q R
StateAccessor77S `
(77` a

parameters77a k
.77k l
Context77l s
)77s t
;77t u
if99 
(99 
!99 
conditionMet99 
)99 
{:: 
return:: 
	GetResult:: 
(:: 

parameters:: )
,::) *
currentResult::+ 8
,::8 9

startState::: D
,::D E
wasSuccessful::F S
:::S T
false::U Z
,::Z [
wasCancelled::\ h
:::h i
false::j o
)::o p
;::p q
}::r s
StateMutator<< 
(<< 

parameters<< #
.<<# $
Context<<$ +
,<<+ ,
ToState<<- 4
)<<4 5
;<<5 6
var== 
transitionResult==  
===! "
	GetResult==# ,
(==, -

parameters==- 7
,==7 8
currentResult==9 F
,==F G

startState==H R
,==R S
wasSuccessful==T a
:==a b
true==c g
,==g h
wasCancelled==i u
:==u v
false==w |
)==| }
;==} ~
NotifyOfTransition>> 
(>> 

parameters>> )
.>>) *
Context>>* 1
,>>1 2
transitionResult>>3 C
)>>C D
;>>D E
return@@ 
transitionResult@@ #
;@@# $
}AA 	
	protectedCC !
StateTransitionResultCC '
<CC' (
TStateCC( .
,CC. /
TTriggerCC0 8
>CC8 9
	GetResultCC: C
(CCC D
ExecutionParametersCCD W
<CCW X
TCCX Y
,CCY Z
TTriggerCC[ c
>CCc d

parametersCCe o
,DD !
StateTransitionResultDD #
<DD# $
TStateDD$ *
,DD* +
TTriggerDD, 4
>DD4 5
currentResultDD6 C
,EE 
TStateEE 

startStateEE 
,FF 
boolFF 
wasSuccessfulFF  
,GG 
boolGG 
wasCancelledGG 
)GG  
{HH 	
returnII 
newII !
StateTransitionResultII ,
<II, -
TStateII- 3
,II3 4
TTriggerII5 =
>II= >
(II> ?

parametersII? I
.III J
TriggerIIJ Q
,JJ 

startStateJJ 
,KK 
(KK 
!KK 
wasSuccessfulKK 
||KK  "
currentResultKK# 0
==KK1 3
nullKK4 8
)KK8 9
?KK: ;

startStateKK< F
:KKG H
currentResultKKI V
.KKV W
CurrentStateKKW c
,LL 
wasSuccessfulLL 
?LL 
StateAccessorLL  -
(LL- .

parametersLL. 8
.LL8 9
ContextLL9 @
)LL@ A
:LLB C
currentResultLLD Q
==LLR T
nullLLU Y
?LLZ [

startStateLL\ f
:LLg h
currentResultLLi v
.LLv w
PreviousState	LLw Ñ
,MM 
wasSuccessfulMM 
?MM 
NameMM  $
:MM& '
currentResultMM( 5
==MM6 8
nullMM9 =
?MM> ?
stringMM@ F
.MMF G
EmptyMMG L
:MMM N
currentResultMMO \
.MM\ ]
LastTransitionNameMM] o
,NN 
wasCancelledNN 
:NN 
wasCancelledNN *
,OO 
conditionMetOO 
:OO 
wasSuccessfulOO +
||OO, .
(OO/ 0
currentResultOO0 =
!=OO> @
nullOOA E
&&OOF H
currentResultOOI V
.OOV W
ConditionMetOOW c
)OOc d
)OOd e
;OOe f
}PP 	
	protectedRR 
stringRR #
GetTransitionNameIfTrueRR 0
(RR0 1
boolRR1 5
isTrueRR6 <
)RR< =
{SS 	
returnTT 
isTrueTT 
?TT 
NameTT  
:TT! "
stringTT# )
.TT) *
EmptyTT* /
;TT/ 0
}UU 	
	protectedWW 
voidWW 
NotifyOfTransitionWW )
(WW) *
TWW* +
contextWW, 3
,WW3 4!
StateTransitionResultWW5 J
<WWJ K
TStateWWK Q
,WWQ R
TTriggerWWS [
>WW[ \
transitionResultWW] m
)WWm n
{XX 	
OnTransitionedEventYY 
?YY  
.YY  !
InvokeYY! '
(YY' (
contextYY( /
,YY/ 0
transitionResultYY1 A
)YYA B
;YYB C
}ZZ 	
}[[ 
}\\ Ù#
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
, 
TState 
	fromState 
, 
Func 
< 
T 
, 
TState 
> 
	stateFunc '
, 
string 
name 
, 
uint 
priority 
) 
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
	fromState0 9
,9 :
name; ?
,? @
priorityA I
)I J
{ 	
	StateFunc 
= 
	stateFunc !
??" $
throw% *
new+ .!
ArgumentNullException/ D
(D E
nameofE K
(K L
	stateFuncL U
)U V
)V W
;W X
} 	
public 
override !
StateTransitionResult -
<- .
TState. 4
,4 5
TTrigger6 >
>> ?
Execute@ G
(G H
ExecutionParametersH [
<[ \
T\ ]
,] ^
TTrigger_ g
>g h

parametersi s
,s t"
StateTransitionResult	u ä
<
ä ã
TState
ã ë
,
ë í
TTrigger
ì õ
>
õ ú
currentResult
ù ™
=
´ ¨
null
≠ ±
)
± ≤
{   	
var!! 

startState!! 
=!! 
currentResult!! *
!=!!+ -
null!!. 2
?!!3 4
currentResult!!5 B
.!!B C
StartingState!!C P
:!!Q R
StateAccessor!!S `
(!!` a

parameters!!a k
.!!k l
Context!!l s
)!!s t
;!!t u
var"" 
toState"" 
="" 
	StateFunc"" #
.""# $
Invoke""$ *
(""* +

parameters""+ 5
.""5 6
Context""6 =
)""= >
;""> ?
if$$ 
($$ 
toState$$ 
.$$ 
	CompareTo$$ !
($$! "

startState$$" ,
)$$, -
==$$. 0
$num$$1 2
)$$2 3
{%% 
return%% 
	GetResult%% 
(%% 

parameters%% )
,%%) *
currentResult%%+ 8
,%%8 9

startState%%: D
,%%D E
wasSuccessful%%F S
:%%S T
false%%U Z
,%%Z [
wasCancelled%%\ h
:%%h i
false%%j o
)%%o p
;%%p q
}%%r s
StateMutator'' 
.'' 
Invoke'' 
(''  

parameters''  *
.''* +
Context''+ 2
,''2 3
toState''4 ;
)''; <
;''< =
var(( 
transitionResult((  
=((! "
	GetResult((# ,
(((, -

parameters((- 7
,((7 8
currentResult((9 F
,((F G

startState((H R
,((R S
wasSuccessful((T a
:((a b
true((c g
,((g h
wasCancelled((i u
:((u v
false((w |
)((| }
;((} ~
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
}.. ä#
]C:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionDynamicAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class '
StateTransitionDynamicAsync .
<. /
T/ 0
,0 1
TState2 8
,8 9
TTrigger: B
>B C
:D E&
StateTransitionDynamicBaseF `
<` a
Ta b
,b c
TStated j
,j k
TTriggerl t
>t u
where 
TState 
: 
IComparable "
{ 
public 
Func 
< 
T 
, 
CancellationToken (
,( )
Task* .
<. /
TState/ 5
>5 6
>6 7
StateFunctionAsync8 J
{K L
getM P
;P Q
}R S
public '
StateTransitionDynamicAsync *
(* +
Func+ /
</ 0
T0 1
,1 2
TState3 9
>9 :
stateAccessor; H
, 
Action 
< 
T 
, 
TState 
> 
stateMutator  ,
, 
TState 
	fromState 
, 
Func 
< 
T 
, 
CancellationToken '
,' (
Task) -
<- .
TState. 4
>4 5
>5 6
stateFuncAsync7 E
, 
string 
name 
, 
uint 
priority 
) 
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
	fromState0 9
,9 :
name; ?
,? @
priorityA I
)I J
{ 	
StateFunctionAsync 
=  
stateFuncAsync! /
??0 2
throw3 8
new9 <!
ArgumentNullException= R
(R S
nameofS Y
(Y Z
stateFuncAsyncZ h
)h i
)i j
;j k
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
{## 	
var$$ 

startState$$ 
=$$ 
currentResult$$ *
!=$$+ -
null$$. 2
?$$3 4
currentResult$$5 B
.$$B C
StartingState$$C P
:$$Q R
StateAccessor$$S `
($$` a

parameters$$a k
.$$k l
Context$$l s
)$$s t
;$$t u
if&& 
(&& 

parameters&& 
.&& 
CancellationToken&& ,
.&&, -#
IsCancellationRequested&&- D
)&&D E
{'' 
return'' 
	GetResult'' 
('' 

parameters'' )
,'') *
currentResult''+ 8
,''8 9

startState'': D
,''D E
wasSuccessful''F S
:''S T
false''U Z
,''Z [
wasCancelled''\ h
:''h i
true''j n
)''n o
;''o p
}''q r
var)) 
toState)) 
=)) 
await)) 
StateFunctionAsync))  2
())2 3

parameters))3 =
.))= >
Context))> E
,))E F

parameters))G Q
.))Q R
CancellationToken))R c
)))c d
.** 
ConfigureAwait** 
(**  %
continueOnCapturedContext**  9
:**9 :
false**; @
)**@ A
;**A B
return,,  
ExecuteFinalizeAsync,, '
(,,' (

parameters,,( 2
,,,2 3
currentResult,,4 A
,,,A B

startState,,C M
,,,M N
toState,,O V
),,V W
;,,W X
}-- 	
}.. 
}// ˆ
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
TStatel r
	fromStates |
,| }
string	~ Ñ
name
Ö â
,
â ä
uint
ã è
priority
ê ò
)
ò ô
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
	fromState0 9
,9 :
name; ?
,? @
priorityA I
)I J
{ 	
}	 

	protected !
StateTransitionResult '
<' (
TState( .
,. /
TTrigger0 8
>8 9 
ExecuteFinalizeAsync: N
(N O
ExecutionParametersO b
<b c
Tc d
,d e
TTriggerf n
>n o

parametersp z
, !
StateTransitionResult #
<# $
TState$ *
,* +
TTrigger, 4
>4 5
currentResult6 C
,C D
TStateE K

startStateL V
,V W
TStateX ^
toState_ f
)f g
{ 	
var 
wasSuccessful 
= 
false  %
;% &
if 
( 
toState 
. 
	CompareTo !
(! "

startState" ,
), -
!=. 0
$num1 2
)2 3
{ 
StateMutator 
( 

parameters '
.' (
Context( /
,/ 0
toState1 8
)8 9
;9 :
wasSuccessful 
= 
true  $
;$ %
} 
var   
transitionResult    
=  ! "
	GetResult  # ,
(  , -

parameters  - 7
,!! 
currentResult!! 
,"" 

startState"" 
,## 
wasSuccessful## 
,$$ 

parameters$$ 
.$$ 
CancellationToken$$ ,
.$$, -#
IsCancellationRequested$$- D
)$$D E
;$$E F
if&& 
(&& 
wasSuccessful&& 
)&& 
{'' 
NotifyOfTransition''  
(''  !

parameters''! +
.''+ ,
Context'', 3
,''3 4
transitionResult''5 E
)''E F
;''F G
}''H I
return)) 
transitionResult)) #
;))# $
}** 	
}++ 
},, Ü+
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
,p q
TStater x
	fromState	y Ç
,
Ç É
Func
Ñ à
<
à â
T
â ä
,
ä ã
TParam
å í
,
í ì
TState
î ö
>
ö õ
	stateFunc
ú •
,
• ¶
string
ß ≠
name
Æ ≤
,
≤ ≥
uint
¥ ∏
priority
π ¡
)
¡ ¬
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
	fromState0 9
,9 :
name; ?
,? @
priorityA I
)I J
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
=## 
toState## &
.##& '
	CompareTo##' 0
(##0 1

startState##1 ;
)##; <
!=##= ?
$num##@ A
;##A B
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
=((! "
	GetResult((# ,
(((, -

parameters((- 7
,((7 8
currentResult((9 F
,((F G

startState((H R
,((R S
transitioned((T `
,((` a
wasCancelled((b n
:((n o
false((p u
)((u v
;((v w
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
}// ë/
jC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionDynamicParameterizedAsync.cs
	namespace 	
NStateManager
 
{ 
internal 
class 4
(StateTransitionDynamicParameterizedAsync ;
<; <
T< =
,= >
TState? E
,E F
TTriggerG O
,O P
TParamQ W
>W X
:Y Z&
StateTransitionDynamicBase[ u
<u v
Tv w
,w x
TStatey 
,	 Ä
TTrigger
Å â
>
â ä
where 
TParam 
: 
class 
where 
TState 
: 
IComparable "
{ 
public 
Func 
< 
T 
, 
TParam 
, 
CancellationToken 0
,0 1
Task2 6
<6 7
TState7 =
>= >
>> ?
StateFuncAsync@ N
{O P
getQ T
;T U
}V W
public 4
(StateTransitionDynamicParameterizedAsync 7
(7 8
Func8 <
<< =
T= >
,> ?
TState@ F
>F G
stateAccessorH U
, 
Action 
< 
T 
, 
TState 
> 
stateMutator  ,
, 
TState 
	fromState 
, 
Func 
< 
T 
, 
TParam 
, 
CancellationToken /
,/ 0
Task1 5
<5 6
TState6 <
>< =
>= >
stateFuncAsync? M
, 
string 
name 
, 
uint 
priority 
) 
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
	fromState0 9
,9 :
name; ?
,? @
priorityA I
)I J
{ 	
StateFuncAsync 
= 
stateFuncAsync +
??, .
throw/ 4
new5 8!
ArgumentNullException9 N
(N O
nameofO U
(U V
stateFuncAsyncV d
)d e
)e f
;f g
}   	
public"" 
override"" 
async"" 
Task"" "
<""" #!
StateTransitionResult""# 8
<""8 9
TState""9 ?
,""? @
TTrigger""A I
>""I J
>""J K
ExecuteAsync""L X
(""X Y
ExecutionParameters""Y l
<""l m
T""m n
,""n o
TTrigger""p x
>""x y

parameters	""z Ñ
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
TParam%%( .
typeSafeParam%%/ <
)%%< =
)%%= >
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
&&ö õ
var(( 

startState(( 
=(( 
currentResult(( *
!=((+ -
null((. 2
?((3 4
currentResult((5 B
.((B C
StartingState((C P
:((Q R
StateAccessor((S `
(((` a

parameters((a k
.((k l
Context((l s
)((s t
;((t u
if** 
(** 

parameters** 
.** 
CancellationToken** ,
.**, -#
IsCancellationRequested**- D
)**D E
{++ 
if,, 
(,, 
currentResult,, !
!=,," $
null,,% )
),,) *
{-- 
return-- 
currentResult-- &
;--& '
}--( )
return// 
new// !
StateTransitionResult// 0
<//0 1
TState//1 7
,//7 8
TTrigger//9 A
>//A B
(//B C

parameters//C M
.//M N
Trigger//N U
,00 

startState00  
,11 

startState11  
,22 

startState22  
,33 
lastTransitionName33 (
:33( )
string33* 0
.330 1
Empty331 6
,44 
wasCancelled44 "
:44" #
true44$ (
)44( )
;44) *
}55 
var77 
toState77 
=77 
await77 
StateFuncAsync77  .
(77. /

parameters77/ 9
.779 :
Context77: A
,77A B
typeSafeParam77C P
,77P Q

parameters77R \
.77\ ]
CancellationToken77] n
)77n o
.88 
ConfigureAwait88 
(88 %
continueOnCapturedContext88 8
:888 9
false88: ?
)88? @
;88@ A
return::  
ExecuteFinalizeAsync:: '
(::' (

parameters::( 2
,::2 3
currentResult::4 A
,::A B

startState::C M
,::M N
toState::O V
)::V W
;::W X
};; 	
}<< 
}== Œf
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
(Q R
FuncR V
<V W
TW X
,X Y
TStateZ `
>` a
stateAccessorb o
,o p
Actionq w
<w x
Tx y
,y z
TState	{ Å
>
Å Ç
stateMutator
É è
,
è ê
TState
ë ó
	fromState
ò °
,
° ¢
TState
£ ©
toState
™ ±
,
± ≤
Func
≥ ∑
<
∑ ∏
T
∏ π
,
π ∫
bool
ª ø
>
ø ¿
	condition
¡  
,
  À
string
Ã “
name
” ◊
,
◊ ÿ
uint
Ÿ ›
priority
ﬁ Ê
=
Á Ë
$num
È Í
)
Í Î
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
(; <
stateAccessor< I
,I J
stateMutatorK W
,W X
toStateY `
,` a
	conditionb k
,k l
namem q
,q r
prioritys {
){ |
;| }
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
<Q R
TRequestR Z
>Z [
([ \
Func\ `
<` a
Ta b
,b c
TStated j
>j k
stateAccessorl y
,y z
Action	{ Å
<
Å Ç
T
Ç É
,
É Ñ
TState
Ö ã
>
ã å
stateMutator
ç ô
,
ô ö
TState
õ °
	fromState
¢ ´
,
´ ¨
TState
≠ ≥
toState
¥ ª
,
ª º
Func
Ω ¡
<
¡ ¬
T
¬ √
,
√ ƒ
TRequest
≈ Õ
,
Õ Œ
bool
œ ”
>
” ‘
	condition
’ ﬁ
,
ﬁ ﬂ
string
‡ Ê
name
Á Î
,
Î Ï
uint
Ì Ò
priority
Ú ˙
=
˚ ¸
$num
˝ ˛
)
˛ ˇ
where 
TRequest 
: 
class "
{ 	
return 
new (
StateTransitionParameterized 3
<3 4
T4 5
,5 6
TState7 =
,= >
TTrigger? G
,G H
TRequestI Q
>Q R
(R S
stateAccessorS `
,` a
stateMutatorb n
,n o
toStatep w
,w x
	condition	y Ç
,
Ç É
name
Ñ à
,
à â
priority
ä í
)
í ì
;
ì î
} 	
public 
static 
StateTransitionBase )
<) *
T* +
,+ ,
TState- 3
,3 4
TTrigger5 =
>= >
GetStateTransition? Q
(Q R
FuncR V
<V W
TW X
,X Y
TStateZ `
>` a
stateAccessorb o
,o p
Actionq w
<w x
Tx y
,y z
TState	{ Å
>
Å Ç
stateMutator
É è
,
è ê
TState
ë ó
	fromState
ò °
,
° ¢
TState
£ ©
toState
™ ±
,
± ≤
Func
≥ ∑
<
∑ ∏
T
∏ π
,
π ∫
CancellationToken
ª Ã
,
Ã Õ
Task
Œ “
<
“ ”
bool
” ◊
>
◊ ÿ
>
ÿ Ÿ
conditionAsync
⁄ Ë
,
Ë È
string
Í 
name
Ò ı
,
ı ˆ
uint
˜ ˚
priority
¸ Ñ
=
Ö Ü
$num
á à
)
à â
{   	
return!! 
new!!  
StateTransitionAsync!! +
<!!+ ,
T!!, -
,!!- .
TState!!/ 5
,!!5 6
TTrigger!!7 ?
>!!? @
(!!@ A
stateAccessor!!A N
,!!N O
stateMutator!!P \
,!!\ ]
toState!!^ e
,!!e f
conditionAsync!!g u
,!!u v
name!!w {
,!!{ |
priority	!!} Ö
)
!!Ö Ü
;
!!Ü á
}"" 	
public$$ 
static$$ 
StateTransitionBase$$ )
<$$) *
T$$* +
,$$+ ,
TState$$- 3
,$$3 4
TTrigger$$5 =
>$$= >
GetStateTransition$$? Q
($$Q R
Func$$R V
<$$V W
T$$W X
,$$X Y
TState$$Z `
>$$` a
stateAccessor$$b o
,$$o p
Action$$q w
<$$w x
T$$x y
,$$y z
TState	$${ Å
>
$$Å Ç
stateMutator
$$É è
,
$$è ê
TState
$$ë ó
	fromState
$$ò °
,
$$° ¢
Func
$$£ ß
<
$$ß ®
T
$$® ©
,
$$© ™
TState
$$´ ±
>
$$± ≤
	stateFunc
$$≥ º
,
$$º Ω
string
$$æ ƒ
name
$$≈ …
,
$$…  
uint
$$À œ
priority
$$– ÿ
=
$$Ÿ ⁄
$num
$$€ ‹
)
$$‹ ›
{%% 	
return&& 
new&& "
StateTransitionDynamic&& -
<&&- .
T&&. /
,&&/ 0
TState&&1 7
,&&7 8
TTrigger&&9 A
>&&A B
(&&B C
stateAccessor&&C P
,&&P Q
stateMutator&&R ^
,&&^ _
	fromState&&` i
,&&i j
	stateFunc&&k t
,&&t u
name&&v z
,&&z {
priority	&&| Ñ
)
&&Ñ Ö
;
&&Ö Ü
}'' 	
public)) 
static)) 
StateTransitionBase)) )
<))) *
T))* +
,))+ ,
TState))- 3
,))3 4
TTrigger))5 =
>))= >
GetStateTransition))? Q
())Q R
Func))R V
<))V W
T))W X
,))X Y
TState))Z `
>))` a
stateAccessor))b o
,))o p
Action))q w
<))w x
T))x y
,))y z
TState	)){ Å
>
))Å Ç
stateMutator
))É è
,
))è ê
TState
))ë ó
	fromState
))ò °
,
))° ¢
Func
))£ ß
<
))ß ®
T
))® ©
,
))© ™
CancellationToken
))´ º
,
))º Ω
Task
))æ ¬
<
))¬ √
TState
))√ …
>
))…  
>
))  À
stateFuncAsync
))Ã ⁄
,
))⁄ €
string
))‹ ‚
name
))„ Á
,
))Á Ë
uint
))È Ì
priority
))Ó ˆ
=
))˜ ¯
$num
))˘ ˙
)
))˙ ˚
{** 	
return++ 
new++ '
StateTransitionDynamicAsync++ 2
<++2 3
T++3 4
,++4 5
TState++6 <
,++< =
TTrigger++> F
>++F G
(++G H
stateAccessor++H U
,++U V
stateMutator++W c
,++c d
	fromState++e n
,++n o
stateFuncAsync++p ~
,++~ 
name
++Ä Ñ
,
++Ñ Ö
priority
++Ü é
)
++é è
;
++è ê
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
<..Q R
TParam..R X
>..X Y
(..Y Z
Func..Z ^
<..^ _
T.._ `
,..` a
TState..b h
>..h i
stateAccessor..j w
,..w x
Action..y 
<	.. Ä
T
..Ä Å
,
..Å Ç
TState
..É â
>
..â ä
stateMutator
..ã ó
,
..ó ò
TState
..ô ü
	fromState
..† ©
,
..© ™
Func
..´ Ø
<
..Ø ∞
T
..∞ ±
,
..± ≤
TParam
..≥ π
,
..π ∫
TState
..ª ¡
>
..¡ ¬
	stateFunc
..√ Ã
,
..Ã Õ
string
..Œ ‘
name
..’ Ÿ
,
..Ÿ ⁄
uint
..€ ﬂ
priority
..‡ Ë
=
..È Í
$num
..Î Ï
)
..Ï Ì
where// 
TParam// 
:// 
class//  
{00 	
return11 
new11 /
#StateTransitionDynamicParameterized11 :
<11: ;
T11; <
,11< =
TState11> D
,11D E
TTrigger11F N
,11N O
TParam11P V
>11V W
(11W X
stateAccessor11X e
,11e f
stateMutator11g s
,11s t
	fromState11u ~
,11~ 
	stateFunc
11Ä â
,
11â ä
name
11ã è
,
11è ê
priority
11ë ô
)
11ô ö
;
11ö õ
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
<44Q R
TParam44R X
>44X Y
(44Y Z
Func44Z ^
<44^ _
T44_ `
,44` a
TState44b h
>44h i
stateAccessor44j w
,44w x
Action44y 
<	44 Ä
T
44Ä Å
,
44Å Ç
TState
44É â
>
44â ä
stateMutator
44ã ó
,
44ó ò
TState
44ô ü
	fromState
44† ©
,
44© ™
Func
44´ Ø
<
44Ø ∞
T
44∞ ±
,
44± ≤
TParam
44≥ π
,
44π ∫
CancellationToken
44ª Ã
,
44Ã Õ
Task
44Œ “
<
44“ ”
TState
44” Ÿ
>
44Ÿ ⁄
>
44⁄ €
stateFuncAsync
44‹ Í
,
44Í Î
string
44Ï Ú
name
44Û ˜
,
44˜ ¯
uint
44˘ ˝
priority
44˛ Ü
=
44á à
$num
44â ä
)
44ä ã
where55 
TParam55 
:55 
class55 
{66 	
return77 
new77 4
(StateTransitionDynamicParameterizedAsync77 ?
<77? @
T77@ A
,77A B
TState77C I
,77I J
TTrigger77K S
,77S T
TParam77U [
>77[ \
(77\ ]
stateAccessor77] j
,77j k
stateMutator77l x
,77x y
	fromState	77z É
,
77É Ñ
stateFuncAsync
77Ö ì
,
77ì î
name
77ï ô
,
77ô ö
priority
77õ £
)
77£ §
;
77§ •
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
<::Q R
TParam::R X
>::X Y
(::Y Z
Func::Z ^
<::^ _
T::_ `
,::` a
TState::b h
>::h i
stateAccessor::j w
,::w x
Action::y 
<	:: Ä
T
::Ä Å
,
::Å Ç
TState
::É â
>
::â ä
stateMutator
::ã ó
,
::ó ò
TState
::ô ü
	fromState
::† ©
,
::© ™
TState
::´ ±
toState
::≤ π
,
::π ∫
Func
::ª ø
<
::ø ¿
T
::¿ ¡
,
::¡ ¬
TParam
::√ …
,
::…  
CancellationToken
::À ‹
,
::‹ ›
Task
::ﬁ ‚
<
::‚ „
bool
::„ Á
>
::Á Ë
>
::Ë È
conditionAsync
::Í ¯
,
::¯ ˘
string
::˙ Ä
name
::Å Ö
,
::Ö Ü
uint
::á ã
priority
::å î
=
::ï ñ
$num
::ó ò
)
::ò ô
where;; 
TParam;; 
:;; 
class;; 
{<< 	
return== 
new== -
!StateTransitionParameterizedAsync== 8
<==8 9
T==9 :
,==: ;
TState==< B
,==B C
TTrigger==D L
,==L M
TParam==N T
>==T U
(==U V
stateAccessor==V c
,==c d
stateMutator==e q
,==q r
toState==s z
,==z {
conditionAsync	==| ä
,
==ä ã
name
==å ê
,
==ê ë
priority
==í ö
)
==ö õ
;
==õ ú
}>> 	
}?? 
}@@ ›
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
:M N
StateTransitionBaseO b
<b c
Tc d
,d e
TStatef l
,l m
TTriggern v
>v w
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
}!! ¶>
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
:R S
StateTransitionBaseT g
<g h
Th i
,i j
TStatek q
,q r
TTriggers {
>{ |
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
return%% 
	GetResult%% 
(%% 

parameters%% )
,%%) *
currentResult%%+ 8
,%%8 9

startState%%: D
,%%D E
wasSuccessful%%F S
:%%S T
false%%U Z
,%%Z [
wasCancelled%%\ h
:%%h i
true%%j n
)%%n o
;%%o p
}%%q r
if'' 
('' 
!'' 
await'' 
ConditionAsync'' %
(''% &

parameters''& 0
.''0 1
Context''1 8
,''8 9
typeSafeParam'': G
,''G H

parameters''I S
.''S T
CancellationToken''T e
)''e f
.(( 
ConfigureAwait(( 
((( %
continueOnCapturedContext(( 8
:((8 9
false((: ?
)((? @
)((@ A
{)) 
return** 
new** !
StateTransitionResult** 0
<**0 1
TState**1 7
,**7 8
TTrigger**9 A
>**A B
(**B C

parameters**C M
.**M N
Trigger**N U
,++ 

startState++  
,,, 
currentResult,, #
==,,$ &
null,,' +
?,,, -

startState,,. 8
:,,9 :
currentResult,,; H
.,,H I
PreviousState,,I V
,-- 
currentResult-- #
==--$ &
null--' +
?--, -

startState--. 8
:--9 :
currentResult--; H
.--H I
CurrentState--I U
,.. 
lastTransitionName.. (
:..( )
currentResult..* 7
==..8 :
null..; ?
?..@ A
string..B H
...H I
Empty..I N
:..O P
currentResult..Q ^
...^ _
LastTransitionName.._ q
,// 
conditionMet// "
://" #
currentResult//$ 1
!=//2 4
null//5 9
,00 
wasCancelled00 "
:00" #

parameters00$ .
.00. /
CancellationToken00/ @
.00@ A#
IsCancellationRequested00A X
)00X Y
;00Y Z
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
}<< £
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
;"". /
}""0 1
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
boolAA 
WasSuccessfulAA !
{AA" #
getAA$ '
;AA' (
}AA) *
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
;[[3 4
WasSuccessful\\ 
=\\ 
transitionDefined\\ -
&&\\. 0
conditionMet\\1 =
&&\\> @
!\\A B
wasCancelled\\B N
;\\N O
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
}bb ı
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