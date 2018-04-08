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
$str++ $
)++$ %
]++% &
[,, 
assembly,, 	
:,,	 

AssemblyFileVersion,, 
(,, 
$str,, (
),,( )
],,) *·
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
}"" Æ]
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
IStateConfiguration 
< 
T 
, 
TState %
,% &
TTrigger' /
>/ 0 
AddDynamicTransition1 E
(E F
TTriggerF N
triggerO V
,V W
FuncX \
<\ ]
T] ^
,^ _
TState` f
>f g
functionh p
,p q
stringr x
namey }
=~ 
null
Ä Ñ
,
Ñ Ö
uint
Ü ä
priority
ã ì
=
î ï
$num
ñ ó
)
ó ò
;
ò ô
IStateConfiguration   
<   
T   
,   
TState   %
,  % &
TTrigger  ' /
>  / 0 
AddDynamicTransition  1 E
<  E F
TRequest  F N
>  N O
(  O P
TTrigger  P X
trigger  Y `
,  ` a
Func  b f
<  f g
T  g h
,  h i
TRequest  j r
,  r s
TState  t z
>  z {
function	  | Ñ
,
  Ñ Ö
string
  Ü å
name
  ç ë
=
  í ì
null
  î ò
,
  ò ô
uint
  ö û
priority
  ü ß
=
  ® ©
$num
  ™ ´
)
  ´ ¨
where!! 
TRequest!! 
:!! 
class!! "
;!!" #
IStateConfiguration** 
<** 
T** 
,** 
TState** %
,**% &
TTrigger**' /
>**/ 0
AddTransition**1 >
(**> ?
TTrigger**? G
trigger**H O
,**O P
TState**Q W
toState**X _
,**_ `
Func**a e
<**e f
T**f g
,**g h
bool**i m
>**m n
	condition**o x
=**y z
null**{ 
,	** Ä
string
**Å á
name
**à å
=
**ç é
null
**è ì
,
**ì î
uint
**ï ô
priority
**ö ¢
=
**£ §
$num
**• ¶
)
**¶ ß
;
**ß ®
IStateConfiguration44 
<44 
T44 
,44 
TState44 %
,44% &
TTrigger44' /
>44/ 0
AddTransition441 >
<44> ?
TRequest44? G
>44G H
(44H I
TTrigger44I Q
trigger44R Y
,44Y Z
TState44[ a
toState44b i
,44i j
Func44k o
<44o p
T44p q
,44q r
TRequest44s {
,44{ |
bool	44} Å
>
44Å Ç
	condition
44É å
,
44å ç
string
44é î
name
44ï ô
=
44ö õ
null
44ú †
,
44† °
uint
44¢ ¶
priority
44ß Ø
=
44∞ ±
$num
44≤ ≥
)
44≥ ¥
where55 
TRequest55 
:55 
class55 "
;55" #
IStateConfiguration== 
<== 
T== 
,== 
TState== %
,==% &
TTrigger==' /
>==/ 0
AddAutoTransition==1 B
(==B C
TState==C I
toState==J Q
,==Q R
Func==S W
<==W X
T==X Y
,==Y Z
bool==[ _
>==_ `
	condition==a j
===k l
null==m q
,==q r
string==s y
name==z ~
=	== Ä
null
==Å Ö
,
==Ö Ü
uint
==á ã
priority
==å î
=
==ï ñ
$num
==ó ò
)
==ò ô
;
==ô ö
IStateConfiguration?? 
<?? 
T?? 
,?? 
TState?? %
,??% &
TTrigger??' /
>??/ 0!
AddFallbackTransition??1 F
(??F G
Func??G K
<??K L
T??L M
,??M N
bool??O S
>??S T
	condition??U ^
=??_ `
null??a e
,??e f
string??g m
name??n r
=??s t
null??u y
,??y z
uint??{ 
priority
??Ä à
=
??â ä
$num
??ã å
)
??å ç
;
??ç é
IStateConfigurationII 
<II 
TII 
,II 
TStateII %
,II% &
TTriggerII' /
>II/ 0
AddAutoTransitionII1 B
<IIB C
TRequestIIC K
>IIK L
(IIL M
TStateIIM S
toStateIIT [
,II[ \
FuncII] a
<IIa b
TIIb c
,IIc d
TRequestIIe m
,IIm n
boolIIo s
>IIs t
	conditionIIu ~
=	II Ä
null
IIÅ Ö
,
IIÖ Ü
string
IIá ç
name
IIé í
=
IIì î
null
IIï ô
,
IIô ö
uint
IIõ ü
priority
II† ®
=
II© ™
$num
II´ ¨
)
II¨ ≠
whereJJ 
TRequestJJ 
:JJ 
classJJ "
;JJ" #
IStateConfigurationLL 
<LL 
TLL 
,LL 
TStateLL %
,LL% &
TTriggerLL' /
>LL/ 0!
AddFallbackTransitionLL1 F
<LLF G
TRequestLLG O
>LLO P
(LLP Q
FuncLLQ U
<LLU V
TLLV W
,LLW X
TRequestLLY a
,LLa b
boolLLc g
>LLg h
	conditionLLi r
=LLs t
nullLLu y
,LLy z
string	LL{ Å
name
LLÇ Ü
=
LLá à
null
LLâ ç
,
LLç é
uint
LLè ì
priority
LLî ú
=
LLù û
$num
LLü †
)
LL† °
whereMM 
TRequestMM 
:MM 
classMM "
;MM" #
IStateConfigurationVV 
<VV 
TVV 
,VV 
TStateVV %
,VV% &
TTriggerVV' /
>VV/ 0
AddAutoTransitionVV1 B
(VVB C
TStateVVC I
toStateVVJ Q
,VVQ R
FuncVVS W
<VVW X
TVVX Y
,VVY Z
boolVV[ _
>VV_ `
	conditionVVa j
,VVj k
TStateVVl r
previousState	VVs Ä
,
VVÄ Å
string
VVÇ à
name
VVâ ç
=
VVé è
null
VVê î
,
VVî ï
uint
VVñ ö
priority
VVõ £
=
VV§ •
$num
VV¶ ß
)
VVß ®
;
VV® ©
IStateConfigurationXX 
<XX 
TXX 
,XX 
TStateXX %
,XX% &
TTriggerXX' /
>XX/ 0!
AddFallbackTransitionXX1 F
(XXF G
FuncXXG K
<XXK L
TXXL M
,XXM N
boolXXO S
>XXS T
	conditionXXU ^
,XX^ _
TStateXX` f
previousStateXXg t
,XXt u
stringXXv |
name	XX} Å
=
XXÇ É
null
XXÑ à
,
XXà â
uint
XXä é
priority
XXè ó
=
XXò ô
$num
XXö õ
)
XXõ ú
;
XXú ù
IStateConfigurationbb 
<bb 
Tbb 
,bb 
TStatebb %
,bb% &
TTriggerbb' /
>bb/ 0
AddAutoTransitionbb1 B
<bbB C
TRequestbbC K
>bbK L
(bbL M
TStatebbM S
toStatebbT [
,bb[ \
Funcbb] a
<bba b
Tbbb c
,bbc d
TRequestbbe m
,bbm n
boolbbo s
>bbs t
	conditionbbu ~
,bb~ 
TState
bbÄ Ü
previousState
bbá î
,
bbî ï
string
bbñ ú
name
bbù °
=
bb¢ £
null
bb§ ®
,
bb® ©
uint
bb™ Æ
priority
bbØ ∑
=
bb∏ π
$num
bb∫ ª
)
bbª º
wherecc 
TRequestcc 
:cc 
classcc "
;cc" #
IStateConfigurationee 
<ee 
Tee 
,ee 
TStateee %
,ee% &
TTriggeree' /
>ee/ 0!
AddFallbackTransitionee1 F
<eeF G
TRequesteeG O
>eeO P
(eeP Q
FunceeQ U
<eeU V
TeeV W
,eeW X
TRequesteeY a
,eea b
booleec g
>eeg h
	conditioneei r
,eer s
TStateeet z
previousState	ee{ à
,
eeà â
string
eeä ê
name
eeë ï
=
eeñ ó
null
eeò ú
,
eeú ù
uint
eeû ¢
priority
ee£ ´
=
ee¨ ≠
$num
eeÆ Ø
)
eeØ ∞
whereff 
TRequestff 
:ff 
classff "
;ff" #
IStateConfigurationmm 
<mm 
Tmm 
,mm 
TStatemm %
,mm% &
TTriggermm' /
>mm/ 0
AddEntryActionmm1 ?
(mm? @
Actionmm@ F
<mmF G
TmmG H
>mmH I
actionmmJ P
)mmP Q
;mmQ R
IStateConfigurationtt 
<tt 
Ttt 
,tt 
TStatett %
,tt% &
TTriggertt' /
>tt/ 0
AddReentryActiontt1 A
(ttA B
ActionttB H
<ttH I
TttI J
>ttJ K
actionttL R
)ttR S
;ttS T
IStateConfiguration|| 
<|| 
T|| 
,|| 
TState|| %
,||% &
TTrigger||' /
>||/ 0
AddEntryAction||1 ?
(||? @
Action||@ F
<||F G
T||G H
>||H I
action||J P
,||P Q
TState||R X
previousState||Y f
)||f g
;||g h!
IStateConfiguration
ÉÉ 
<
ÉÉ 
T
ÉÉ 
,
ÉÉ 
TState
ÉÉ %
,
ÉÉ% &
TTrigger
ÉÉ' /
>
ÉÉ/ 0
AddExitAction
ÉÉ1 >
(
ÉÉ> ?
Action
ÉÉ? E
<
ÉÉE F
T
ÉÉF G
>
ÉÉG H
action
ÉÉI O
)
ÉÉO P
;
ÉÉP Q!
IStateConfiguration
ää 
<
ää 
T
ää 
,
ää 
TState
ää %
,
ää% &
TTrigger
ää' /
>
ää/ 0
AddExitAction
ää1 >
(
ää> ?
Action
ää? E
<
ääE F
T
ääF G
>
ääG H
action
ääI O
,
ääO P
TState
ääQ W
	nextState
ääX a
)
ääa b
;
ääb c!
IStateConfiguration
íí 
<
íí 
T
íí 
,
íí 
TState
íí %
,
íí% &
TTrigger
íí' /
>
íí/ 0
AddTriggerAction
íí1 A
(
ííA B
TTrigger
ííB J
trigger
ííK R
,
ííR S
Action
ííT Z
<
ííZ [
T
íí[ \
>
íí\ ]
action
íí^ d
)
ííd e
;
ííe f!
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
õõ/ 0
AddTriggerAction
õõ1 A
<
õõA B
TRequest
õõB J
>
õõJ K
(
õõK L
TTrigger
õõL T
trigger
õõU \
,
õõ\ ]
Action
õõ^ d
<
õõd e
T
õõe f
,
õõf g
TRequest
õõh p
>
õõp q
action
õõr x
)
õõx y
;
õõy z!
IStateConfiguration
ùù 
<
ùù 
T
ùù 
,
ùù 
TState
ùù %
,
ùù% &
TTrigger
ùù' /
>
ùù/ 0
IsSubStateOf
ùù1 =
(
ùù= >!
IStateConfiguration
ùù> Q
<
ùùQ R
T
ùùR S
,
ùùS T
TState
ùùU [
,
ùù[ \
TTrigger
ùù] e
>
ùùe f%
superStateConfiguration
ùùg ~
)
ùù~ 
;ùù Ä
}
ûû 
}üü ﬂm
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
IStateConfigurationAsync&&  
<&&  !
T&&! "
,&&" #
TState&&$ *
,&&* +
TTrigger&&, 4
>&&4 5
AddTransition&&6 C
(&&C D
TTrigger&&D L
trigger&&M T
,&&T U
TState&&V \
toState&&] d
,&&d e
Func&&f j
<&&j k
T&&k l
,&&l m
CancellationToken&&n 
,	&& Ä
Task
&&Å Ö
<
&&Ö Ü
bool
&&Ü ä
>
&&ä ã
>
&&ã å
conditionAsync
&&ç õ
=
&&ú ù
null
&&û ¢
,
&&¢ £
string
&&§ ™
name
&&´ Ø
=
&&∞ ±
null
&&≤ ∂
,
&&∂ ∑
uint
&&∏ º
priority
&&Ω ≈
=
&&∆ «
$num
&&» …
)
&&…  
;
&&  À$
IStateConfigurationAsync00  
<00  !
T00! "
,00" #
TState00$ *
,00* +
TTrigger00, 4
>004 5
AddTransition006 C
<00C D
TRequest00D L
>00L M
(00M N
TTrigger00N V
trigger00W ^
,00^ _
TState00` f
toState00g n
,00n o
Func00p t
<00t u
T00u v
,00v w
TRequest	00x Ä
,
00Ä Å
CancellationToken
00Ç ì
,
00ì î
Task
00ï ô
<
00ô ö
bool
00ö û
>
00û ü
>
00ü †
conditionAsync
00° Ø
,
00Ø ∞
string
00± ∑
name
00∏ º
=
00Ω æ
null
00ø √
,
00√ ƒ
uint
00≈ …
priority
00  “
=
00” ‘
$num
00’ ÷
)
00÷ ◊
where11 
TRequest11 
:11 
class11 "
;11" #$
IStateConfigurationAsync99  
<99  !
T99! "
,99" #
TState99$ *
,99* +
TTrigger99, 4
>994 5 
AddDynamicTransition996 J
(99J K
TTrigger99K S
trigger99T [
,99[ \
Func99] a
<99a b
T99b c
,99c d
CancellationToken99e v
,99v w
Task99x |
<99| }
TState	99} É
>
99É Ñ
>
99Ñ Ö
function
99Ü é
,
99é è
string
99ê ñ
name
99ó õ
=
99ú ù
null
99û ¢
,
99¢ £
uint
99§ ®
priority
99© ±
=
99≤ ≥
$num
99¥ µ
)
99µ ∂
;
99∂ ∑$
IStateConfigurationAsyncBB  
<BB  !
TBB! "
,BB" #
TStateBB$ *
,BB* +
TTriggerBB, 4
>BB4 5 
AddDynamicTransitionBB6 J
<BBJ K
TRequestBBK S
>BBS T
(BBT U
TTriggerBBU ]
triggerBB^ e
,BBe f
FuncBBg k
<BBk l
TBBl m
,BBm n
TRequestBBo w
,BBw x
CancellationToken	BBy ä
,
BBä ã
Task
BBå ê
<
BBê ë
TState
BBë ó
>
BBó ò
>
BBò ô
function
BBö ¢
,
BB¢ £
string
BB§ ™
name
BB´ Ø
=
BB∞ ±
null
BB≤ ∂
,
BB∂ ∑
uint
BB∏ º
priority
BBΩ ≈
=
BB∆ «
$num
BB» …
)
BB…  
whereCC 
TRequestCC 
:CC 
classCC "
;CC" #$
IStateConfigurationAsyncKK  
<KK  !
TKK! "
,KK" #
TStateKK$ *
,KK* +
TTriggerKK, 4
>KK4 5
AddAutoTransitionKK6 G
(KKG H
TStateKKH N
toStateKKO V
,KKV W
FuncKKX \
<KK\ ]
TKK] ^
,KK^ _
CancellationTokenKK` q
,KKq r
TaskKKs w
<KKw x
boolKKx |
>KK| }
>KK} ~
	condition	KK à
,
KKà â
string
KKä ê
name
KKë ï
=
KKñ ó
null
KKò ú
,
KKú ù
uint
KKû ¢
priority
KK£ ´
=
KK¨ ≠
$num
KKÆ Ø
)
KKØ ∞
;
KK∞ ±$
IStateConfigurationAsyncMM  
<MM  !
TMM! "
,MM" #
TStateMM$ *
,MM* +
TTriggerMM, 4
>MM4 5!
AddFallbackTransitionMM6 K
(MMK L
FuncMML P
<MMP Q
TMMQ R
,MMR S
CancellationTokenMMT e
,MMe f
TaskMMg k
<MMk l
boolMMl p
>MMp q
>MMq r
	conditionMMs |
,MM| }
string	MM~ Ñ
name
MMÖ â
=
MMä ã
null
MMå ê
,
MMê ë
uint
MMí ñ
priority
MMó ü
=
MM† °
$num
MM¢ £
)
MM£ §
;
MM§ •$
IStateConfigurationAsyncVV  
<VV  !
TVV! "
,VV" #
TStateVV$ *
,VV* +
TTriggerVV, 4
>VV4 5
AddAutoTransitionVV6 G
<VVG H
TRequestVVH P
>VVP Q
(VVQ R
TStateVVR X
toStateVVY `
,VV` a
FuncVVb f
<VVf g
TVVg h
,VVh i
TRequestVVj r
,VVr s
CancellationToken	VVt Ö
,
VVÖ Ü
Task
VVá ã
<
VVã å
bool
VVå ê
>
VVê ë
>
VVë í
	condition
VVì ú
,
VVú ù
string
VVû §
name
VV• ©
=
VV™ ´
null
VV¨ ∞
,
VV∞ ±
uint
VV≤ ∂
priority
VV∑ ø
=
VV¿ ¡
$num
VV¬ √
)
VV√ ƒ
whereWW 
TRequestWW 
:WW 
classWW "
;WW" #$
IStateConfigurationAsyncYY  
<YY  !
TYY! "
,YY" #
TStateYY$ *
,YY* +
TTriggerYY, 4
>YY4 5!
AddFallbackTransitionYY6 K
<YYK L
TRequestYYL T
>YYT U
(YYU V
FuncYYV Z
<YYZ [
TYY[ \
,YY\ ]
TRequestYY^ f
,YYf g
CancellationTokenYYh y
,YYy z
TaskYY{ 
<	YY Ä
bool
YYÄ Ñ
>
YYÑ Ö
>
YYÖ Ü
	condition
YYá ê
,
YYê ë
string
YYí ò
name
YYô ù
=
YYû ü
null
YY† §
,
YY§ •
uint
YY¶ ™
priority
YY´ ≥
=
YY¥ µ
$num
YY∂ ∑
)
YY∑ ∏
whereZZ 
TRequestZZ 
:ZZ 
classZZ "
;ZZ" #$
IStateConfigurationAsynccc  
<cc  !
Tcc! "
,cc" #
TStatecc$ *
,cc* +
TTriggercc, 4
>cc4 5
AddAutoTransitioncc6 G
(ccG H
TStateccH N
toStateccO V
,ccV W
FuncccX \
<cc\ ]
Tcc] ^
,cc^ _
CancellationTokencc` q
,ccq r
Taskccs w
<ccw x
boolccx |
>cc| }
>cc} ~
	condition	cc à
,
ccà â
TState
ccä ê
previousState
ccë û
,
ccû ü
string
cc† ¶
name
ccß ´
=
cc¨ ≠
null
ccÆ ≤
,
cc≤ ≥
uint
cc¥ ∏
priority
ccπ ¡
=
cc¬ √
$num
ccƒ ≈
)
cc≈ ∆
;
cc∆ «$
IStateConfigurationAsyncee  
<ee  !
Tee! "
,ee" #
TStateee$ *
,ee* +
TTriggeree, 4
>ee4 5!
AddFallbackTransitionee6 K
(eeK L
FunceeL P
<eeP Q
TeeQ R
,eeR S
CancellationTokeneeT e
,eee f
Taskeeg k
<eek l
booleel p
>eep q
>eeq r
	conditionees |
,ee| }
TState	ee~ Ñ
previousState
eeÖ í
,
eeí ì
string
eeî ö
name
eeõ ü
=
ee† °
null
ee¢ ¶
,
ee¶ ß
uint
ee® ¨
priority
ee≠ µ
=
ee∂ ∑
$num
ee∏ π
)
eeπ ∫
;
ee∫ ª$
IStateConfigurationAsyncoo  
<oo  !
Too! "
,oo" #
TStateoo$ *
,oo* +
TTriggeroo, 4
>oo4 5
AddAutoTransitionoo6 G
<ooG H
TRequestooH P
>ooP Q
(ooQ R
TStateooR X
toStateooY `
,oo` a
Funcoob f
<oof g
Toog h
,ooh i
TRequestooj r
,oor s
CancellationToken	oot Ö
,
ooÖ Ü
Task
ooá ã
<
ooã å
bool
ooå ê
>
ooê ë
>
ooë í
	condition
ooì ú
,
ooú ù
TState
ooû §
previousState
oo• ≤
,
oo≤ ≥
string
oo¥ ∫
name
ooª ø
=
oo¿ ¡
null
oo¬ ∆
,
oo∆ «
uint
oo» Ã
priority
ooÕ ’
=
oo÷ ◊
$num
ooÿ Ÿ
)
ooŸ ⁄
wherepp 
TRequestpp 
:pp 
classpp "
;pp" #$
IStateConfigurationAsyncrr  
<rr  !
Trr! "
,rr" #
TStaterr$ *
,rr* +
TTriggerrr, 4
>rr4 5!
AddFallbackTransitionrr6 K
<rrK L
TRequestrrL T
>rrT U
(rrU V
FuncrrV Z
<rrZ [
Trr[ \
,rr\ ]
TRequestrr^ f
,rrf g
CancellationTokenrrh y
,rry z
Taskrr{ 
<	rr Ä
bool
rrÄ Ñ
>
rrÑ Ö
>
rrÖ Ü
	condition
rrá ê
,
rrê ë
TState
rrí ò
previousState
rrô ¶
,
rr¶ ß
string
rr® Æ
name
rrØ ≥
=
rr¥ µ
null
rr∂ ∫
,
rr∫ ª
uint
rrº ¿
priority
rr¡ …
=
rr  À
$num
rrÃ Õ
)
rrÕ Œ
wheress 
TRequestss 
:ss 
classss "
;ss" #$
IStateConfigurationAsynczz  
<zz  !
Tzz! "
,zz" #
TStatezz$ *
,zz* +
TTriggerzz, 4
>zz4 5
AddEntryActionzz6 D
(zzD E
FunczzE I
<zzI J
TzzJ K
,zzK L
CancellationTokenzzM ^
,zz^ _
Taskzz` d
>zzd e
actionzzf l
)zzl m
;zzm n&
IStateConfigurationAsync
ÅÅ  
<
ÅÅ  !
T
ÅÅ! "
,
ÅÅ" #
TState
ÅÅ$ *
,
ÅÅ* +
TTrigger
ÅÅ, 4
>
ÅÅ4 5
AddReentryAction
ÅÅ6 F
(
ÅÅF G
Func
ÅÅG K
<
ÅÅK L
T
ÅÅL M
,
ÅÅM N
CancellationToken
ÅÅO `
,
ÅÅ` a
Task
ÅÅb f
>
ÅÅf g
action
ÅÅh n
)
ÅÅn o
;
ÅÅo p&
IStateConfigurationAsync
ââ  
<
ââ  !
T
ââ! "
,
ââ" #
TState
ââ$ *
,
ââ* +
TTrigger
ââ, 4
>
ââ4 5
AddEntryAction
ââ6 D
(
ââD E
Func
ââE I
<
ââI J
T
ââJ K
,
ââK L
CancellationToken
ââM ^
,
ââ^ _
Task
ââ` d
>
ââd e
action
ââf l
,
ââl m
TState
âân t
previousStateââu Ç
)ââÇ É
;ââÉ Ñ&
IStateConfigurationAsync
êê  
<
êê  !
T
êê! "
,
êê" #
TState
êê$ *
,
êê* +
TTrigger
êê, 4
>
êê4 5
AddExitAction
êê6 C
(
êêC D
Func
êêD H
<
êêH I
T
êêI J
,
êêJ K
CancellationToken
êêL ]
,
êê] ^
Task
êê_ c
>
êêc d
action
êêe k
)
êêk l
;
êêl m&
IStateConfigurationAsync
óó  
<
óó  !
T
óó! "
,
óó" #
TState
óó$ *
,
óó* +
TTrigger
óó, 4
>
óó4 5
AddExitAction
óó6 C
(
óóC D
Func
óóD H
<
óóH I
T
óóI J
,
óóJ K
CancellationToken
óóL ]
,
óó] ^
Task
óó_ c
>
óóc d
action
óóe k
,
óók l
TState
óóm s
	nextState
óót }
)
óó} ~
;
óó~ &
IStateConfigurationAsync
üü  
<
üü  !
T
üü! "
,
üü" #
TState
üü$ *
,
üü* +
TTrigger
üü, 4
>
üü4 5
AddTriggerAction
üü6 F
(
üüF G
TTrigger
üüG O
trigger
üüP W
,
üüW X
Func
üüY ]
<
üü] ^
T
üü^ _
,
üü_ `
CancellationToken
üüa r
,
üür s
Task
üüt x
>
üüx y
actionüüz Ä
)üüÄ Å
;üüÅ Ç&
IStateConfigurationAsync
®®  
<
®®  !
T
®®! "
,
®®" #
TState
®®$ *
,
®®* +
TTrigger
®®, 4
>
®®4 5
AddTriggerAction
®®6 F
<
®®F G
TRequest
®®G O
>
®®O P
(
®®P Q
TTrigger
®®Q Y
trigger
®®Z a
,
®®a b
Func
®®c g
<
®®g h
T
®®h i
,
®®i j
TRequest
®®k s
,
®®s t 
CancellationToken®®u Ü
,®®Ü á
Task®®à å
>®®å ç
action®®é î
)®®î ï
;®®ï ñ
bool
™™ 
	IsInState
™™ 
(
™™ 
TState
™™ 
state
™™ #
)
™™# $
;
™™$ %&
IStateConfigurationAsync
≠≠  
<
≠≠  !
T
≠≠! "
,
≠≠" #
TState
≠≠$ *
,
≠≠* +
TTrigger
≠≠, 4
>
≠≠4 5
IsSubStateOf
≠≠6 B
(
≠≠B C&
IStateConfigurationAsync
≠≠C [
<
≠≠[ \
T
≠≠\ ]
,
≠≠] ^
TState
≠≠_ e
,
≠≠e f
TTrigger
≠≠g o
>
≠≠o p&
superStateConfiguration≠≠q à
)≠≠à â
;≠≠â ä
}
ÆÆ 
}ØØ Ñ
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
} ù
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
Ç É
} 
} ∞
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
)
@@á à
;
@@à â
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
}FF —ã
TC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateConfiguration.cs
	namespace 	
NStateManager
 
{ 
public 

class 
StateConfiguration #
<# $
T$ %
,% &
TState' -
,- .
TTrigger/ 7
>7 8
:9 :"
StateConfigurationBase; Q
<Q R
TR S
,S T
TStateU [
,[ \
TTrigger] e
>e f
,f g(
IStateConfigurationInternal	h É
<
É Ñ
T
Ñ Ö
,
Ö Ü
TState
á ç
,
ç é
TTrigger
è ó
>
ó ò
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
,* +
Action, 2
<2 3
T3 4
>4 5
>5 6&
_previousStateEntryActions7 Q
=R S
newT W

DictionaryX b
<b c
TStatec i
,i j
Actionk q
<q r
Tr s
>s t
>t u
(u v
)v w
;w x
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
>5 6!
_nextStateExitActions7 L
=M N
newO R

DictionaryS ]
<] ^
TState^ d
,d e
Actionf l
<l m
Tm n
>n o
>o p
(p q
)q r
;r s
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
new` c

Dictionaryd n
<n o
TTriggero w
,w x
TriggerActionBase	y ä
<
ä ã
T
ã å
,
å ç
TTrigger
é ñ
>
ñ ó
>
ó ò
(
ò ô
)
ô ö
;
ö õ
private 
Action 
< 
T 
> 
_defaultEntryAction -
;- .
private 
Action 
< 
T 
> 
_defaultExitAction ,
;, -
private 
Action 
< 
T 
> 
_reentryAction (
;( )
private   '
IStateConfigurationInternal   +
<  + ,
T  , -
,  - .
TState  / 5
,  5 6
TTrigger  7 ?
>  ? @
_superState  A L
;  L M
internal(( 
StateConfiguration(( #
(((# $
TState(($ *
state((+ 0
,((0 1
Func((2 6
<((6 7
T((7 8
,((8 9
TState((: @
>((@ A
stateAccessor((B O
,((O P
Action((Q W
<((W X
T((X Y
,((Y Z
TState(([ a
>((a b
stateMutator((c o
)((o p
:)) 
base)) 
()) 
state)) 
,)) 
stateAccessor)) '
,))' (
stateMutator))) 5
)))5 6
{** 	
}**
 
public44 
IStateConfiguration44 "
<44" #
T44# $
,44$ %
TState44& ,
,44, -
TTrigger44. 6
>446 7 
AddDynamicTransition448 L
(44L M
TTrigger44M U
trigger44V ]
,55 
Func55 
<55 
T55 
,55 
TState55 
>55 
function55 &
,66 
string66 
name66 
=66 
null66  
,77 
uint77 
priority77 
=77 
$num77 
)77  
{88 	
if99 
(99 
function99 
==99 
null99  
)99  !
{:: 
throw:: 
new:: !
ArgumentNullException:: -
(::- .
nameof::. 4
(::4 5
function::5 =
)::= >
)::> ?
;::? @
}::A B
var<< 

transition<< 
=<< "
StateTransitionFactory<< 3
<<<3 4
T<<4 5
,<<5 6
TState<<7 =
,<<= >
TTrigger<<? G
><<G H
.<<H I
GetStateTransition<<I [
(<<[ \
StateAccessor<<\ i
,== 
StateMutator== 
,>> 
State>> 
,?? 
function?? 
,@@ 
name@@ 
,AA 
priorityAA 
)AA 
;AA 
AddTransitionBB 
(BB 
triggerBB !
,BB! "

transitionBB# -
)BB- .
;BB. /
returnDD 
thisDD 
;DD 
}EE 	
publicPP 
IStateConfigurationPP "
<PP" #
TPP# $
,PP$ %
TStatePP& ,
,PP, -
TTriggerPP. 6
>PP6 7 
AddDynamicTransitionPP8 L
<PPL M
TRequestPPM U
>PPU V
(PPV W
TTriggerPPW _
triggerPP` g
,QQ 
FuncQQ 
<QQ 
TQQ 
,QQ 
TRequestQQ 
,QQ 
TStateQQ  &
>QQ& '
functionQQ( 0
,RR 
stringRR 
nameRR 
=RR 
nullRR  
,SS 
uintSS 
prioritySS 
=SS 
$numSS 
)SS  
whereTT 
TRequestTT 
:TT 
classTT "
{UU 	
ifVV 
(VV 
functionVV 
==VV 
nullVV  
)VV  !
{WW 
throwWW 
newWW !
ArgumentNullExceptionWW -
(WW- .
nameofWW. 4
(WW4 5
functionWW5 =
)WW= >
)WW> ?
;WW? @
}WWA B
varYY 

transitionYY 
=YY "
StateTransitionFactoryYY 3
<YY3 4
TYY4 5
,YY5 6
TStateYY7 =
,YY= >
TTriggerYY? G
>YYG H
.YYH I
GetStateTransitionYYI [
(YY[ \
StateAccessorYY\ i
,ZZ 
StateMutatorZZ 
,[[ 
State[[ 
,\\ 
function\\ 
,]] 
name]] 
,^^ 
priority^^ 
)^^ 
;^^ 
AddTransition__ 
(__ 
trigger__ !
,__! "

transition__# -
)__- .
;__. /
returnaa 
thisaa 
;aa 
}bb 	
publicmm 
IStateConfigurationmm "
<mm" #
Tmm# $
,mm$ %
TStatemm& ,
,mm, -
TTriggermm. 6
>mm6 7
AddTransitionmm8 E
(mmE F
TTriggermmF N
triggermmO V
,nn 
TStatenn 
toStatenn 
,oo 
Funcoo 
<oo 
Too 
,oo 
booloo 
>oo 
	conditionoo %
=oo& '
nulloo( ,
,pp 
stringpp 
namepp 
=pp 
nullpp  
,qq 
uintqq 
priorityqq 
=qq 
$numqq 
)qq  
{rr 	
ifss 
(ss 
	conditionss 
==ss 
nullss !
)ss! "
{tt 
	conditiontt 
=tt 
_tt 
=>tt 
truett #
;tt# $
}tt% &
varvv 

transitionvv 
=vv "
StateTransitionFactoryvv 3
<vv3 4
Tvv4 5
,vv5 6
TStatevv7 =
,vv= >
TTriggervv? G
>vvG H
.vvH I
GetStateTransitionvvI [
(vv[ \
StateAccessorvv\ i
,ww 
StateMutatorww 
,xx 
Statexx 
,yy 
toStateyy 
,zz 
	conditionzz 
,{{ 
name{{ 
,|| 
priority|| 
)|| 
;|| 
AddTransition}} 
(}} 
trigger}} !
,}}! "

transition}}# -
)}}- .
;}}. /
return 
this 
; 
}
ÄÄ 	
public
åå !
IStateConfiguration
åå "
<
åå" #
T
åå# $
,
åå$ %
TState
åå& ,
,
åå, -
TTrigger
åå. 6
>
åå6 7
AddTransition
åå8 E
<
ååE F
TRequest
ååF N
>
ååN O
(
ååO P
TTrigger
ååP X
trigger
ååY `
,
çç 
TState
çç 
toState
çç 
,
éé 
Func
éé 
<
éé 
T
éé 
,
éé 
TRequest
éé 
,
éé 
bool
éé  $
>
éé$ %
	condition
éé& /
,
èè 
string
èè 
name
èè 
=
èè 
null
èè  
,
êê 
uint
êê 
priority
êê 
=
êê 
$num
êê 
)
êê  
where
ëë 
TRequest
ëë 
:
ëë 
class
ëë "
{
íí 	
if
ìì 
(
ìì 
	condition
ìì 
==
ìì 
null
ìì !
)
ìì! "
{
îî 
throw
îî 
new
îî #
ArgumentNullException
îî -
(
îî- .
nameof
îî. 4
(
îî4 5
	condition
îî5 >
)
îî> ?
)
îî? @
;
îî@ A
}
îîB C
var
ññ 

transition
ññ 
=
ññ $
StateTransitionFactory
ññ 3
<
ññ3 4
T
ññ4 5
,
ññ5 6
TState
ññ7 =
,
ññ= >
TTrigger
ññ? G
>
ññG H
.
ññH I 
GetStateTransition
ññI [
(
ññ[ \
StateAccessor
ññ\ i
,
óó 
StateMutator
óó 
,
òò 
State
òò 
,
ôô 
toState
ôô 
,
öö 
	condition
öö 
,
õõ 
name
õõ 
,
úú 
priority
úú 
)
úú 
;
úú 
AddTransition
ùù 
(
ùù 
trigger
ùù !
,
ùù! "

transition
ùù# -
)
ùù- .
;
ùù. /
return
üü 
this
üü 
;
üü 
}
†† 	
public
™™ !
IStateConfiguration
™™ "
<
™™" #
T
™™# $
,
™™$ %
TState
™™& ,
,
™™, -
TTrigger
™™. 6
>
™™6 7
AddAutoTransition
™™8 I
(
™™I J
TState
™™J P
toState
™™Q X
,
´´ 
Func
´´ 
<
´´ 
T
´´ 
,
´´ 
bool
´´ 
>
´´ 
	condition
´´ %
=
´´& '
null
´´( ,
,
¨¨ 
string
¨¨ 
name
¨¨ 
=
¨¨ 
null
¨¨  
,
≠≠ 
uint
≠≠ 
priority
≠≠ 
=
≠≠ 
$num
≠≠ 
)
≠≠  
{
ÆÆ 	
if
ØØ 
(
ØØ #
DefaultAutoTransition
ØØ %
!=
ØØ& (
null
ØØ) -
)
ØØ- .
{
∞∞ 
throw
∞∞ 
new
∞∞ '
InvalidOperationException
∞∞ 1
(
∞∞1 2
$str
∞∞2 d
)
∞∞d e
;
∞∞e f
}
∞∞g h
if
≤≤ 
(
≤≤ 
	condition
≤≤ 
==
≤≤ 
null
≤≤ !
)
≤≤! "
{
≥≥ 
	condition
≥≥ 
=
≥≥ 
_
≥≥ 
=>
≥≥ 
true
≥≥ #
;
≥≥# $
}
≥≥% &#
DefaultAutoTransition
µµ !
=
µµ" #$
StateTransitionFactory
µµ$ :
<
µµ: ;
T
µµ; <
,
µµ< =
TState
µµ> D
,
µµD E
TTrigger
µµF N
>
µµN O
.
µµO P 
GetStateTransition
µµP b
(
µµb c
StateAccessor
µµc p
,
∂∂ 
StateMutator
∂∂ 
,
∑∑ 
State
∑∑ 
,
∏∏ 
toState
∏∏ 
,
ππ 
	condition
ππ 
,
∫∫ 
name
∫∫ 
,
ªª 
priority
ªª 
)
ªª 
;
ªª 
return
ΩΩ 
this
ΩΩ 
;
ΩΩ 
}
ææ 	
public
…… !
IStateConfiguration
…… "
<
……" #
T
……# $
,
……$ %
TState
……& ,
,
……, -
TTrigger
……. 6
>
……6 7
AddAutoTransition
……8 I
<
……I J
TRequest
……J R
>
……R S
(
……S T
TState
……T Z
toState
……[ b
,
   
Func
   
<
   
T
   
,
   
TRequest
   
,
   
bool
    $
>
  $ %
	condition
  & /
=
  0 1
null
  2 6
,
ÀÀ 
string
ÀÀ 
name
ÀÀ 
=
ÀÀ 
null
ÀÀ  
,
ÃÃ 
uint
ÃÃ 
priority
ÃÃ 
=
ÃÃ 
$num
ÃÃ 
)
ÃÃ  
where
ÕÕ 
TRequest
ÕÕ 
:
ÕÕ 
class
ÕÕ "
{
ŒŒ 	
if
œœ 
(
œœ #
DefaultAutoTransition
œœ %
!=
œœ& (
null
œœ) -
)
œœ- .
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
––2 b
)
––b c
;
––c d
}
––e f
if
““ 
(
““ 
	condition
““ 
==
““ 
null
““ !
)
““! "
{
”” 
	condition
”” 
=
”” 
(
”” 
_
”” 
,
”” 
request
”” %
)
””% &
=>
””' )
true
””* .
;
””. /
}
””0 1#
DefaultAutoTransition
’’ !
=
’’" #$
StateTransitionFactory
’’$ :
<
’’: ;
T
’’; <
,
’’< =
TState
’’> D
,
’’D E
TTrigger
’’F N
>
’’N O
.
’’O P 
GetStateTransition
’’P b
(
’’b c
StateAccessor
’’c p
,
÷÷ 
StateMutator
÷÷ 
,
◊◊ 
State
◊◊ 
,
ÿÿ 
toState
ÿÿ 
,
ŸŸ 
	condition
ŸŸ 
,
⁄⁄ 
name
⁄⁄ 
,
€€ 
priority
€€ 
)
€€ 
;
€€ 
return
›› 
this
›› 
;
›› 
}
ﬁﬁ 	
public
ÈÈ !
IStateConfiguration
ÈÈ "
<
ÈÈ" #
T
ÈÈ# $
,
ÈÈ$ %
TState
ÈÈ& ,
,
ÈÈ, -
TTrigger
ÈÈ. 6
>
ÈÈ6 7
AddAutoTransition
ÈÈ8 I
(
ÈÈI J
TState
ÈÈJ P
toState
ÈÈQ X
,
ÍÍ 
Func
ÍÍ 
<
ÍÍ 
T
ÍÍ 
,
ÍÍ 
bool
ÍÍ 
>
ÍÍ 
	condition
ÍÍ %
,
ÎÎ 
TState
ÎÎ 
previousState
ÎÎ "
,
ÏÏ 
string
ÏÏ 
name
ÏÏ 
=
ÏÏ 
null
ÏÏ  
,
ÌÌ 
uint
ÌÌ 
priority
ÌÌ 
=
ÌÌ 
$num
ÌÌ 
)
ÌÌ  
{
ÓÓ 	
if
ÔÔ 
(
ÔÔ 
	condition
ÔÔ 
==
ÔÔ 
null
ÔÔ !
)
ÔÔ! "
{
 
throw
 
new
 #
ArgumentNullException
 -
(
- .
nameof
. 4
(
4 5
	condition
5 >
)
> ?
)
? @
;
@ A
}
B C
if
ÚÚ 
(
ÚÚ *
PreviousStateAutoTransitions
ÚÚ ,
.
ÚÚ, -
ContainsKey
ÚÚ- 8
(
ÚÚ8 9
previousState
ÚÚ9 F
)
ÚÚF G
)
ÚÚG H
{
ÛÛ 
throw
ÙÙ 
new
ÙÙ '
InvalidOperationException
ÙÙ 3
(
ÙÙ3 4
$"
ıı 1
#AutoTransition already defined for 
ıı 9
{
ıı9 :
previousState
ıı: G
}
ııG H<
.. Only one auto transition allowed per toState
ııH v
"
ııv w
)
ııw x
;
ııx y
}
ˆˆ 
var
¯¯ 

transition
¯¯ 
=
¯¯ $
StateTransitionFactory
¯¯ 3
<
¯¯3 4
T
¯¯4 5
,
¯¯5 6
TState
¯¯7 =
,
¯¯= >
TTrigger
¯¯? G
>
¯¯G H
.
¯¯H I 
GetStateTransition
¯¯I [
(
¯¯[ \
StateAccessor
¯¯\ i
,
˘˘ 
StateMutator
˘˘ 
,
˙˙ 
State
˙˙ 
,
˚˚ 
toState
˚˚ 
,
¸¸ 
	condition
¸¸ 
,
˝˝ 
name
˝˝ 
,
˛˛ 
priority
˛˛ 
)
˛˛ 
;
˛˛ *
PreviousStateAutoTransitions
ˇˇ (
.
ˇˇ( )
Add
ˇˇ) ,
(
ˇˇ, -
previousState
ˇˇ- :
,
ˇˇ: ;

transition
ˇˇ< F
)
ˇˇF G
;
ˇˇG H
return
ÅÅ 
this
ÅÅ 
;
ÅÅ 
}
ÇÇ 	
public
éé !
IStateConfiguration
éé "
<
éé" #
T
éé# $
,
éé$ %
TState
éé& ,
,
éé, -
TTrigger
éé. 6
>
éé6 7
AddAutoTransition
éé8 I
<
ééI J
TRequest
ééJ R
>
ééR S
(
ééS T
TState
ééT Z
toState
éé[ b
,
èè 
Func
èè 
<
èè 
T
èè 
,
èè 
TRequest
èè 
,
èè 
bool
èè  $
>
èè$ %
	condition
èè& /
,
êê 
TState
êê 
previousState
êê "
,
ëë 
string
ëë 
name
ëë 
=
ëë 
null
ëë  
,
íí 
uint
íí 
priority
íí 
=
íí 
$num
íí 
)
íí  
where
ìì 
TRequest
ìì 
:
ìì 
class
ìì "
{
îî 	
if
ïï 
(
ïï 
	condition
ïï 
==
ïï 
null
ïï !
)
ïï! "
{
ññ 
throw
ññ 
new
ññ #
ArgumentNullException
ññ -
(
ññ- .
nameof
ññ. 4
(
ññ4 5
	condition
ññ5 >
)
ññ> ?
)
ññ? @
;
ññ@ A
}
ññB C
if
òò 
(
òò *
PreviousStateAutoTransitions
òò ,
.
òò, -
ContainsKey
òò- 8
(
òò8 9
previousState
òò9 F
)
òòF G
)
òòG H
{
ôô 
throw
öö 
new
öö '
InvalidOperationException
öö 3
(
öö3 4
$"
õõ 1
#AutoTransition already defined for 
õõ 9
{
õõ9 :
previousState
õõ: G
}
õõG HC
5. Only one auto transition allowed per previous state
õõH }
"
õõ} ~
)
õõ~ 
;õõ Ä
}
úú 
var
ûû 

transition
ûû 
=
ûû $
StateTransitionFactory
ûû 3
<
ûû3 4
T
ûû4 5
,
ûû5 6
TState
ûû7 =
,
ûû= >
TTrigger
ûû? G
>
ûûG H
.
ûûH I 
GetStateTransition
ûûI [
(
ûû[ \
StateAccessor
ûû\ i
,
üü 
StateMutator
üü 
,
†† 
State
†† 
,
°° 
toState
°° 
,
¢¢ 
	condition
¢¢ 
,
££ 
name
££ 
,
§§ 
priority
§§ 
)
§§ 
;
§§ *
PreviousStateAutoTransitions
•• (
.
••( )
Add
••) ,
(
••, -
previousState
••- :
,
••: ;

transition
••< F
)
••F G
;
••G H
return
ßß 
this
ßß 
;
ßß 
}
®® 	
public
™™ !
IStateConfiguration
™™ "
<
™™" #
T
™™# $
,
™™$ %
TState
™™& ,
,
™™, -
TTrigger
™™. 6
>
™™6 7#
AddFallbackTransition
™™8 M
<
™™M N
TRequest
™™N V
>
™™V W
(
™™W X
Func
™™X \
<
™™\ ]
T
™™] ^
,
™™^ _
TRequest
™™` h
,
™™h i
bool
™™j n
>
™™n o
	condition
™™p y
,
´´ 
TState
´´ 
previousState
´´ "
,
¨¨ 
string
¨¨ 
name
¨¨ 
=
¨¨ 
null
¨¨  
,
≠≠ 
uint
≠≠ 
priority
≠≠ 
=
≠≠ 
$num
≠≠ 
)
≠≠  
where
ÆÆ 
TRequest
ÆÆ 
:
ÆÆ 
class
ÆÆ "
{
ØØ 	
if
∞∞ 
(
∞∞ 
	condition
∞∞ 
==
∞∞ 
null
∞∞ !
)
∞∞! "
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
±±4 5
	condition
±±5 >
)
±±> ?
)
±±? @
;
±±@ A
}
±±B C
if
≥≥ 
(
≥≥ *
PreviousStateAutoTransitions
≥≥ ,
.
≥≥, -
ContainsKey
≥≥- 8
(
≥≥8 9
previousState
≥≥9 F
)
≥≥F G
)
≥≥G H
{
¥¥ 
throw
µµ 
new
µµ '
InvalidOperationException
µµ 3
(
µµ3 4
$"
∂∂ 1
#AutoTransition already defined for 
∂∂ 9
{
∂∂9 :
previousState
∂∂: G
}
∂∂G HC
5. Only one auto transition allowed per previous state
∂∂H }
"
∂∂} ~
)
∂∂~ 
;∂∂ Ä
}
∑∑ 
var
ππ 

transition
ππ 
=
ππ $
StateTransitionFactory
ππ 3
<
ππ3 4
T
ππ4 5
,
ππ5 6
TState
ππ7 =
,
ππ= >
TTrigger
ππ? G
>
ππG H
.
ππH I 
GetStateTransition
ππI [
(
ππ[ \
StateAccessor
ππ\ i
,
∫∫ 
StateMutator
∫∫ 
,
ªª 
State
ªª 
,
ºº 
State
ºº 
,
ΩΩ 
	condition
ΩΩ 
,
ææ 
name
ææ 
,
øø 
priority
øø 
)
øø 
;
øø *
PreviousStateAutoTransitions
¿¿ (
.
¿¿( )
Add
¿¿) ,
(
¿¿, -
previousState
¿¿- :
,
¿¿: ;

transition
¿¿< F
)
¿¿F G
;
¿¿G H
return
¬¬ 
this
¬¬ 
;
¬¬ 
}
√√ 	
public
   !
IStateConfiguration
   "
<
  " #
T
  # $
,
  $ %
TState
  & ,
,
  , -
TTrigger
  . 6
>
  6 7
AddEntryAction
  8 F
(
  F G
Action
  G M
<
  M N
T
  N O
>
  O P
action
  Q W
)
  W X
{
ÀÀ 	
if
ÃÃ 
(
ÃÃ !
_defaultEntryAction
ÃÃ #
!=
ÃÃ$ &
null
ÃÃ' +
)
ÃÃ+ ,
{
ÕÕ 
throw
ÕÕ 
new
ÕÕ '
InvalidOperationException
ÕÕ 1
(
ÕÕ1 2
$str
ÕÕ2 a
)
ÕÕa b
;
ÕÕb c
}
ÕÕd e!
_defaultEntryAction
œœ 
=
œœ  !
action
œœ" (
??
œœ) +
throw
œœ, 1
new
œœ2 5#
ArgumentNullException
œœ6 K
(
œœK L
nameof
œœL R
(
œœR S
action
œœS Y
)
œœY Z
)
œœZ [
;
œœ[ \
return
—— 
this
—— 
;
—— 
}
““ 	
public
€€ !
IStateConfiguration
€€ "
<
€€" #
T
€€# $
,
€€$ %
TState
€€& ,
,
€€, -
TTrigger
€€. 6
>
€€6 7#
AddFallbackTransition
€€8 M
(
€€M N
Func
€€N R
<
€€R S
T
€€S T
,
€€T U
bool
€€V Z
>
€€Z [
	condition
€€\ e
=
€€f g
null
€€h l
,
‹‹
 
string
‹‹ 
name
‹‹ 
=
‹‹ 
null
‹‹ 
,
››
 
uint
›› 
priority
›› 
=
›› 
$num
›› 
)
›› 
{
ﬁﬁ 	
if
ﬂﬂ 
(
ﬂﬂ #
DefaultAutoTransition
ﬂﬂ %
!=
ﬂﬂ& (
null
ﬂﬂ) -
)
ﬂﬂ- .
{
‡‡ 
throw
‡‡ 
new
‡‡ '
InvalidOperationException
‡‡ 1
(
‡‡1 2
$str
‡‡2 b
)
‡‡b c
;
‡‡c d
}
‡‡e f
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
„„ 
	condition
„„ 
=
„„ 
_
„„ 
=>
„„ 
true
„„ #
;
„„# $
}
„„% &#
DefaultAutoTransition
ÂÂ !
=
ÂÂ" #$
StateTransitionFactory
ÂÂ$ :
<
ÂÂ: ;
T
ÂÂ; <
,
ÂÂ< =
TState
ÂÂ> D
,
ÂÂD E
TTrigger
ÂÂF N
>
ÂÂN O
.
ÂÂO P 
GetStateTransition
ÂÂP b
(
ÂÂb c
StateAccessor
ÂÂc p
,
ÊÊ 
StateMutator
ÊÊ 
,
ÁÁ 
State
ÁÁ 
,
ËË 
State
ËË 
,
ÈÈ 
	condition
ÈÈ 
,
ÍÍ 
name
ÍÍ 
,
ÎÎ 
priority
ÎÎ 
)
ÎÎ 
;
ÎÎ 
return
ÌÌ 
this
ÌÌ 
;
ÌÌ 
}
ÓÓ 	
public
˜˜ !
IStateConfiguration
˜˜ "
<
˜˜" #
T
˜˜# $
,
˜˜$ %
TState
˜˜& ,
,
˜˜, -
TTrigger
˜˜. 6
>
˜˜6 7#
AddFallbackTransition
˜˜8 M
<
˜˜M N
TRequest
˜˜N V
>
˜˜V W
(
˜˜W X
Func
˜˜X \
<
˜˜\ ]
T
˜˜] ^
,
˜˜^ _
TRequest
˜˜` h
,
˜˜h i
bool
˜˜j n
>
˜˜n o
	condition
˜˜p y
=
˜˜z {
null˜˜| Ä
,
¯¯
 
string
¯¯ 
name
¯¯ 
=
¯¯ 
null
¯¯ 
,
˘˘
 
uint
˘˘ 
priority
˘˘ 
=
˘˘ 
$num
˘˘ 
)
˘˘ 
where
˙˙ 
TRequest
˙˙ 
:
˙˙ 
class
˙˙ "
{
˚˚ 	
if
¸¸ 
(
¸¸ #
DefaultAutoTransition
¸¸ %
!=
¸¸& (
null
¸¸) -
)
¸¸- .
{
˝˝ 
throw
˝˝ 
new
˝˝ '
InvalidOperationException
˝˝ 1
(
˝˝1 2
$str
˝˝2 b
)
˝˝b c
;
˝˝c d
}
˝˝e f
if
ˇˇ 
(
ˇˇ 
	condition
ˇˇ 
==
ˇˇ 
null
ˇˇ !
)
ˇˇ! "
{
ÄÄ 
	condition
ÄÄ 
=
ÄÄ 
(
ÄÄ 
_
ÄÄ 
,
ÄÄ 
request
ÄÄ %
)
ÄÄ% &
=>
ÄÄ' )
true
ÄÄ* .
;
ÄÄ. /
}
ÄÄ0 1#
DefaultAutoTransition
ÇÇ !
=
ÇÇ" #$
StateTransitionFactory
ÇÇ$ :
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
.
ÇÇO P 
GetStateTransition
ÇÇP b
(
ÇÇb c
StateAccessor
ÇÇc p
,
ÉÉ 
StateMutator
ÉÉ 
,
ÑÑ 
State
ÑÑ 
,
ÖÖ 
State
ÖÖ 
,
ÜÜ 
	condition
ÜÜ 
,
áá 
name
áá 
,
àà 
priority
àà 
)
àà 
;
àà 
return
ää 
this
ää 
;
ää 
}
ãã 	
public
ïï !
IStateConfiguration
ïï "
<
ïï" #
T
ïï# $
,
ïï$ %
TState
ïï& ,
,
ïï, -
TTrigger
ïï. 6
>
ïï6 7#
AddFallbackTransition
ïï8 M
(
ïïM N
Func
ïïN R
<
ïïR S
T
ïïS T
,
ïïT U
bool
ïïV Z
>
ïïZ [
	condition
ïï\ e
,
ññ
 
TState
ññ 
previousState
ññ  
,
óó
 
string
óó 
name
óó 
=
óó 
null
óó 
,
òò
 
uint
òò 
priority
òò 
=
òò 
$num
òò 
)
òò 
{
ôô 	
if
öö 
(
öö 
	condition
öö 
==
öö 
null
öö !
)
öö! "
{
õõ 
throw
õõ 
new
õõ #
ArgumentNullException
õõ -
(
õõ- .
nameof
õõ. 4
(
õõ4 5
	condition
õõ5 >
)
õõ> ?
)
õõ? @
;
õõ@ A
}
õõB C
if
ùù 
(
ùù *
PreviousStateAutoTransitions
ùù ,
.
ùù, -
ContainsKey
ùù- 8
(
ùù8 9
previousState
ùù9 F
)
ùùF G
)
ùùG H
{
ûû 
throw
ûû 
new
ûû '
InvalidOperationException
ûû 1
(
ûû1 2
$"
ûû2 41
#AutoTransition already defined for 
ûû4 W
{
ûûW X
previousState
ûûX e
}
ûûe f=
.. Only one auto transition allowed per toStateûûf î
"ûûî ï
)ûûï ñ
;ûûñ ó
}ûûò ô
var
†† 

transition
†† 
=
†† $
StateTransitionFactory
†† 3
<
††3 4
T
††4 5
,
††5 6
TState
††7 =
,
††= >
TTrigger
††? G
>
††G H
.
††H I 
GetStateTransition
††I [
(
††[ \
StateAccessor
††\ i
,
°° 
StateMutator
°° 
,
¢¢ 
State
¢¢ 
,
££ 
State
££ 
,
§§ 
	condition
§§ 
,
•• 
name
•• 
,
¶¶ 
priority
¶¶ 
)
¶¶ 
;
¶¶ *
PreviousStateAutoTransitions
ßß (
.
ßß( )
Add
ßß) ,
(
ßß, -
previousState
ßß- :
,
ßß: ;

transition
ßß< F
)
ßßF G
;
ßßG H
return
©© 
this
©© 
;
©© 
}
™™ 	
public
≤≤ !
IStateConfiguration
≤≤ "
<
≤≤" #
T
≤≤# $
,
≤≤$ %
TState
≤≤& ,
,
≤≤, -
TTrigger
≤≤. 6
>
≤≤6 7
AddReentryAction
≤≤8 H
(
≤≤H I
Action
≤≤I O
<
≤≤O P
T
≤≤P Q
>
≤≤Q R
action
≤≤S Y
)
≤≤Y Z
{
≥≥ 	
if
¥¥ 
(
¥¥ 
_reentryAction
¥¥ 
!=
¥¥ !
null
¥¥" &
)
¥¥& '
{
µµ 
throw
∂∂ 
new
∂∂ '
InvalidOperationException
∂∂ 3
(
∂∂3 4
$str
∂∂4 [
)
∂∂[ \
;
∂∂\ ]
}
∑∑ 
_reentryAction
ππ 
=
ππ 
action
ππ #
??
ππ$ &
throw
ππ' ,
new
ππ- 0#
ArgumentNullException
ππ1 F
(
ππF G
nameof
ππG M
(
ππM N
action
ππN T
)
ππT U
)
ππU V
;
ππV W
return
ªª 
this
ªª 
;
ªª 
}
ºº 	
public
ƒƒ !
IStateConfiguration
ƒƒ "
<
ƒƒ" #
T
ƒƒ# $
,
ƒƒ$ %
TState
ƒƒ& ,
,
ƒƒ, -
TTrigger
ƒƒ. 6
>
ƒƒ6 7
AddEntryAction
ƒƒ8 F
(
ƒƒF G
Action
ƒƒG M
<
ƒƒM N
T
ƒƒN O
>
ƒƒO P
action
ƒƒQ W
,
ƒƒW X
TState
ƒƒY _
previousState
ƒƒ` m
)
ƒƒm n
{
≈≈ 	
if
∆∆ 
(
∆∆ 
action
∆∆ 
==
∆∆ 
null
∆∆ 
)
∆∆ 
{
«« 
throw
«« 
new
«« #
ArgumentNullException
«« -
(
««- .
nameof
««. 4
(
««4 5
action
««5 ;
)
««; <
)
««< =
;
««= >
}
««? @
if
…… 
(
…… (
_previousStateEntryActions
…… *
.
……* +
ContainsKey
……+ 6
(
……6 7
previousState
……7 D
)
……D E
)
……E F
{
   
throw
   
new
   '
InvalidOperationException
   1
(
  1 2
$str
  2 g
)
  g h
;
  h i
}
  j k(
_previousStateEntryActions
ÃÃ &
.
ÃÃ& '
Add
ÃÃ' *
(
ÃÃ* +
previousState
ÃÃ+ 8
,
ÃÃ8 9
action
ÃÃ: @
)
ÃÃ@ A
;
ÃÃA B
return
ŒŒ 
this
ŒŒ 
;
ŒŒ 
}
œœ 	
public
÷÷ !
IStateConfiguration
÷÷ "
<
÷÷" #
T
÷÷# $
,
÷÷$ %
TState
÷÷& ,
,
÷÷, -
TTrigger
÷÷. 6
>
÷÷6 7
AddExitAction
÷÷8 E
(
÷÷E F
Action
÷÷F L
<
÷÷L M
T
÷÷M N
>
÷÷N O
action
÷÷P V
)
÷÷V W
{
◊◊ 	
if
ÿÿ 
(
ÿÿ  
_defaultExitAction
ÿÿ "
!=
ÿÿ# %
null
ÿÿ& *
)
ÿÿ* +
{
ŸŸ 
throw
ŸŸ 
new
ŸŸ '
InvalidOperationException
ŸŸ 1
(
ŸŸ1 2
$str
ŸŸ2 T
)
ŸŸT U
;
ŸŸU V
}
ŸŸW X 
_defaultExitAction
€€ 
=
€€  
action
€€! '
??
€€( *
throw
€€+ 0
new
€€1 4#
ArgumentNullException
€€5 J
(
€€J K
nameof
€€K Q
(
€€Q R
action
€€R X
)
€€X Y
)
€€Y Z
;
€€Z [
return
›› 
this
›› 
;
›› 
}
ﬁﬁ 	
public
ÊÊ !
IStateConfiguration
ÊÊ "
<
ÊÊ" #
T
ÊÊ# $
,
ÊÊ$ %
TState
ÊÊ& ,
,
ÊÊ, -
TTrigger
ÊÊ. 6
>
ÊÊ6 7
AddExitAction
ÊÊ8 E
(
ÊÊE F
Action
ÊÊF L
<
ÊÊL M
T
ÊÊM N
>
ÊÊN O
action
ÊÊP V
,
ÊÊV W
TState
ÊÊX ^
	nextState
ÊÊ_ h
)
ÊÊh i
{
ÁÁ 	
if
ËË 
(
ËË 
action
ËË 
==
ËË 
null
ËË 
)
ËË 
{
ÈÈ 
throw
ÈÈ 
new
ÈÈ #
ArgumentNullException
ÈÈ -
(
ÈÈ- .
nameof
ÈÈ. 4
(
ÈÈ4 5
action
ÈÈ5 ;
)
ÈÈ; <
)
ÈÈ< =
;
ÈÈ= >
}
ÈÈ> ?
if
ÎÎ 
(
ÎÎ #
_nextStateExitActions
ÎÎ %
.
ÎÎ% &
ContainsKey
ÎÎ& 1
(
ÎÎ1 2
	nextState
ÎÎ2 ;
)
ÎÎ; <
)
ÎÎ< =
{
ÏÏ 
throw
ÏÏ 
new
ÏÏ '
InvalidOperationException
ÏÏ 1
(
ÏÏ1 2
$"
ÏÏ2 4)
Exit action for next state 
ÏÏ4 O
{
ÏÏO P
	nextState
ÏÏP Y
}
ÏÏY Z
 already set.
ÏÏZ g
"
ÏÏg h
)
ÏÏh i
;
ÏÏi j
}
ÏÏk l#
_nextStateExitActions
ÓÓ !
.
ÓÓ! "
Add
ÓÓ" %
(
ÓÓ% &
	nextState
ÓÓ& /
,
ÓÓ/ 0
action
ÓÓ1 7
)
ÓÓ7 8
;
ÓÓ8 9
return
 
this
 
;
 
}
ÒÒ 	
public
ÛÛ 
void
ÛÛ 
AddSuperState
ÛÛ !
(
ÛÛ! ")
IStateConfigurationInternal
ÛÛ" =
<
ÛÛ= >
T
ÛÛ> ?
,
ÛÛ? @
TState
ÛÛA G
,
ÛÛG H
TTrigger
ÛÛI Q
>
ÛÛQ R%
superStateConfiguration
ÛÛS j
)
ÛÛj k
{
ÙÙ 	
if
ıı 
(
ıı 
	IsInState
ıı 
(
ıı %
superStateConfiguration
ıı 1
.
ıı1 2
State
ıı2 7
)
ıı7 8
)
ıı8 9
{
ˆˆ 
throw
ˆˆ 
new
ˆˆ )
ArgumentOutOfRangeException
ˆˆ 3
(
ˆˆ3 4
$"
ˆˆ4 6
{
ˆˆ6 7
State
ˆˆ7 <
}
ˆˆ< =)
 is already a sub-state of 
ˆˆ= X
{
ˆˆX Y%
superStateConfiguration
ˆˆY p
.
ˆˆp q
State
ˆˆq v
}
ˆˆv w
.
ˆˆw x
"
ˆˆx y
)
ˆˆy z
;
ˆˆz {
}
ˆˆ| }
if
¯¯ 
(
¯¯ %
superStateConfiguration
¯¯ '
.
¯¯' (
	IsInState
¯¯( 1
(
¯¯1 2
State
¯¯2 7
)
¯¯7 8
)
¯¯8 9
{
˘˘ 
throw
˘˘ 
new
˘˘ )
ArgumentOutOfRangeException
˘˘ 3
(
˘˘3 4
$"
˘˘4 6
{
˘˘6 7%
superStateConfiguration
˘˘7 N
.
˘˘N O
State
˘˘O T
}
˘˘T U)
 is already a sub-state of 
˘˘U p
{
˘˘p q
State
˘˘q v
}
˘˘v w
.
˘˘w x
"
˘˘x y
)
˘˘y z
;
˘˘z {
}
˘˘| }
_superState
˚˚ 
=
˚˚ %
superStateConfiguration
˚˚ 1
;
˚˚1 2
}
¸¸ 	
public
ÑÑ !
IStateConfiguration
ÑÑ "
<
ÑÑ" #
T
ÑÑ# $
,
ÑÑ$ %
TState
ÑÑ& ,
,
ÑÑ, -
TTrigger
ÑÑ. 6
>
ÑÑ6 7
AddTriggerAction
ÑÑ8 H
(
ÑÑH I
TTrigger
ÑÑI Q
trigger
ÑÑR Y
,
ÑÑY Z
Action
ÑÑ[ a
<
ÑÑa b
T
ÑÑb c
>
ÑÑc d
action
ÑÑe k
)
ÑÑk l
{
ÖÖ 	
if
ÜÜ 
(
ÜÜ 
_triggerActions
ÜÜ 
.
ÜÜ  
ContainsKey
ÜÜ  +
(
ÜÜ+ ,
trigger
ÜÜ, 3
)
ÜÜ3 4
)
ÜÜ4 5
{
áá 
throw
áá 
new
áá '
InvalidOperationException
áá 1
(
áá1 2
$"
áá2 41
#Only one action is allowed for the 
áá4 W
{
ááW X
trigger
ááX _
}
áá_ `
	 trigger.
áá` i
"
áái j
)
ááj k
;
áák l
}
áám n
_triggerActions
ââ 
.
ââ 
Add
ââ 
(
ââ  
trigger
ââ  '
,
ââ' ("
TriggerActionFactory
ââ) =
<
ââ= >
T
ââ> ?
,
ââ? @
TTrigger
ââA I
>
ââI J
.
ââJ K
GetTriggerAction
ââK [
(
ââ[ \
action
ââ\ b
)
ââb c
)
ââc d
;
ââd e
return
ãã 
this
ãã 
;
ãã 
}
åå 	
public
ïï !
IStateConfiguration
ïï "
<
ïï" #
T
ïï# $
,
ïï$ %
TState
ïï& ,
,
ïï, -
TTrigger
ïï. 6
>
ïï6 7
AddTriggerAction
ïï8 H
<
ïïH I
TRequest
ïïI Q
>
ïïQ R
(
ïïR S
TTrigger
ïïS [
trigger
ïï\ c
,
ïïc d
Action
ññ 
<
ññ 
T
ññ 
,
ññ 
TRequest
ññ 
>
ññ 
action
ññ  &
)
ññ& '
{
óó 	
if
òò 
(
òò 
_triggerActions
òò 
.
òò  
ContainsKey
òò  +
(
òò+ ,
trigger
òò, 3
)
òò3 4
)
òò4 5
{
ôô 
throw
ôô 
new
ôô '
InvalidOperationException
ôô 1
(
ôô1 2
$"
ôô2 4-
Only one action is allowed for 
ôô4 S
{
ôôS T
trigger
ôôT [
}
ôô[ \
	 trigger.
ôô\ e
"
ôôe f
)
ôôf g
;
ôôg h
}
ôôi j
_triggerActions
õõ 
.
õõ 
Add
õõ 
(
õõ  
trigger
õõ  '
,
õõ' ("
TriggerActionFactory
õõ) =
<
õõ= >
T
õõ> ?
,
õõ? @
TTrigger
õõA I
>
õõI J
.
õõJ K
GetTriggerAction
õõK [
(
õõ[ \
action
õõ\ b
)
õõb c
)
õõc d
;
õõd e
return
ùù 
this
ùù 
;
ùù 
}
ûû 	
public
†† #
StateTransitionResult
†† $
<
††$ %
TState
††% +
,
††+ ,
TTrigger
††- 5
>
††5 6#
ExecuteAutoTransition
††7 L
(
††L M!
ExecutionParameters
††M `
<
††` a
T
††a b
,
††b c
TTrigger
††d l
>
††l m

parameters
††n x
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
§§ *
PreviousStateAutoTransitions
§§ ,
.
§§, -
TryGetValue
§§- 8
(
§§8 9
currentResult
§§9 F
.
§§F G
PreviousState
§§G T
,
§§T U
out
§§V Y
var
§§Z ]
action
§§^ d
)
§§d e
)
§§e f
{
•• 
return
•• 
action
•• 
.
•• 
Execute
•• #
(
••# $

parameters
••$ .
,
••. /
currentResult
••0 =
)
••= >
;
••> ?
}
••@ A
if
®® 
(
®® #
DefaultAutoTransition
®® %
!=
®®& (
null
®®) -
)
®®- .
{
©© 
return
©© #
DefaultAutoTransition
©© *
.
©©* +
Execute
©©+ 2
(
©©2 3

parameters
©©3 =
,
©©= >
currentResult
©©? L
)
©©L M
;
©©M N
}
©©O P
return
´´ 
_superState
´´ 
!=
´´ !
null
´´" &
?
¨¨ 
_superState
¨¨ 
.
¨¨ #
ExecuteAutoTransition
¨¨ 3
(
¨¨3 4

parameters
¨¨4 >
,
¨¨> ?
currentResult
¨¨@ M
)
¨¨M N
:
≠≠ 
new
≠≠ #
StateTransitionResult
≠≠ +
<
≠≠+ ,
TState
≠≠, 2
,
≠≠2 3
TTrigger
≠≠4 <
>
≠≠< =
(
≠≠= >

parameters
≠≠> H
.
≠≠H I
Trigger
≠≠I P
,
ÆÆ 
currentResult
ÆÆ #
.
ÆÆ# $
StartingState
ÆÆ$ 1
,
ØØ 
currentResult
ØØ #
.
ØØ# $
PreviousState
ØØ$ 1
,
∞∞ 
currentResult
∞∞ #
.
∞∞# $
CurrentState
∞∞$ 0
,
±± 
currentResult
±± #
.
±±# $ 
LastTransitionName
±±$ 6
,
≤≤ 
transitionDefined
≤≤ '
:
≤≤' (
true
≤≤) -
)
≤≤- .
;
≤≤. /
}
≥≥ 	
public
µµ 
void
µµ  
ExecuteEntryAction
µµ &
(
µµ& '
T
µµ' (
context
µµ) 0
,
µµ0 1#
StateTransitionResult
µµ2 G
<
µµG H
TState
µµH N
,
µµN O
TTrigger
µµP X
>
µµX Y
currentResult
µµZ g
)
µµg h
{
∂∂ 	
if
∏∏ 
(
∏∏ 
_superState
∏∏ 
!=
∏∏ 
null
∏∏ #
&&
∏∏$ &
!
∏∏' (
	IsInState
∏∏( 1
(
∏∏1 2
currentResult
∏∏2 ?
.
∏∏? @
CurrentState
∏∏@ L
)
∏∏L M
)
∏∏M N
{
ππ 
_superState
ππ 
.
ππ  
ExecuteEntryAction
ππ ,
(
ππ, -
context
ππ- 4
,
ππ4 5
currentResult
ππ6 C
)
ππC D
;
ππD E
}
ππF G
if
ºº 
(
ºº (
_previousStateEntryActions
ºº *
.
ºº* +
TryGetValue
ºº+ 6
(
ºº6 7
currentResult
ºº7 D
.
ººD E
PreviousState
ººE R
,
ººR S
out
ººT W
var
ººX [
action
ºº\ b
)
ººb c
)
ººc d
{
ΩΩ 
action
ΩΩ 
.
ΩΩ 
Invoke
ΩΩ 
(
ΩΩ 
context
ΩΩ #
)
ΩΩ# $
;
ΩΩ$ %
}
ΩΩ& '!
_defaultEntryAction
¿¿ 
?
¿¿  
.
¿¿  !
Invoke
¿¿! '
(
¿¿' (
context
¿¿( /
)
¿¿/ 0
;
¿¿0 1
}
¡¡ 	
public
√√ 
void
√√ 
ExecuteExitAction
√√ %
(
√√% &
T
√√& '
context
√√( /
,
√√/ 0#
StateTransitionResult
√√1 F
<
√√F G
TState
√√G M
,
√√M N
TTrigger
√√O W
>
√√W X
currentResult
√√Y f
)
√√f g
{
ƒƒ 	
if
∆∆ 
(
∆∆ #
_nextStateExitActions
∆∆ %
.
∆∆% &
TryGetValue
∆∆& 1
(
∆∆1 2
currentResult
∆∆2 ?
.
∆∆? @
CurrentState
∆∆@ L
,
∆∆L M
out
∆∆N Q
var
∆∆R U
action
∆∆V \
)
∆∆\ ]
)
∆∆] ^
{
«« 
action
«« 
.
«« 
Invoke
«« 
(
«« 
context
«« #
)
««# $
;
««$ %
}
««& ' 
_defaultExitAction
   
?
   
.
    
Invoke
    &
(
  & '
context
  ' .
)
  . /
;
  / 0
if
ÃÃ 
(
ÃÃ 
_superState
ÃÃ 
!=
ÃÃ 
null
ÃÃ #
&&
ÃÃ$ &
!
ÃÃ' (
	IsInState
ÃÃ( 1
(
ÃÃ1 2
currentResult
ÃÃ2 ?
.
ÃÃ? @
CurrentState
ÃÃ@ L
)
ÃÃL M
)
ÃÃM N
{
ÕÕ 
_superState
ÕÕ 
.
ÕÕ 
ExecuteExitAction
ÕÕ +
(
ÕÕ+ ,
context
ÕÕ, 3
,
ÕÕ3 4
currentResult
ÕÕ5 B
)
ÕÕB C
;
ÕÕC D
}
ÕÕE F
}
ŒŒ 	
public
–– 
void
–– "
ExecuteReentryAction
–– (
(
––( )
T
––) *
context
––+ 2
,
––2 3#
StateTransitionResult
––4 I
<
––I J
TState
––J P
,
––P Q
TTrigger
––R Z
>
––Z [
currentResult
––\ i
)
––i j
{
—— 	
_superState
““ 
?
““ 
.
““ "
ExecuteReentryAction
““ -
(
““- .
context
““. 5
,
““5 6
currentResult
““7 D
)
““D E
;
““E F
_reentryAction
‘‘ 
?
‘‘ 
.
‘‘ 
Invoke
‘‘ "
(
‘‘" #
context
‘‘# *
)
‘‘* +
;
‘‘+ ,
}
’’ 	
public
◊◊ #
StateTransitionResult
◊◊ $
<
◊◊$ %
TState
◊◊% +
,
◊◊+ ,
TTrigger
◊◊- 5
>
◊◊5 6
FireTrigger
◊◊7 B
(
◊◊B C!
ExecutionParameters
◊◊C V
<
◊◊V W
T
◊◊W X
,
◊◊X Y
TTrigger
◊◊Z b
>
◊◊b c

parameters
◊◊d n
)
◊◊n o
{
ÿÿ 	
if
ŸŸ 
(
ŸŸ 
_triggerActions
ŸŸ 
.
ŸŸ  
TryGetValue
ŸŸ  +
(
ŸŸ+ ,

parameters
ŸŸ, 6
.
ŸŸ6 7
Trigger
ŸŸ7 >
,
ŸŸ> ?
out
ŸŸ@ C
var
ŸŸD G
triggerAction
ŸŸH U
)
ŸŸU V
)
ŸŸV W
{
⁄⁄ 
triggerAction
⁄⁄ 
.
⁄⁄ 
Execute
⁄⁄ #
(
⁄⁄# $

parameters
⁄⁄$ .
)
⁄⁄. /
;
⁄⁄/ 0
}
⁄⁄1 2
var
‹‹ 
result
‹‹ 
=
‹‹ 
FireTriggerPrim
‹‹ (
(
‹‹( )

parameters
‹‹) 3
)
‹‹3 4
;
‹‹4 5
if
ﬁﬁ 
(
ﬁﬁ 
!
ﬁﬁ 
(
ﬁﬁ 
result
ﬁﬁ 
?
ﬁﬁ 
.
ﬁﬁ 
WasSuccessful
ﬁﬁ '
??
ﬁﬁ( *
false
ﬁﬁ+ 0
)
ﬁﬁ0 1
&&
ﬁﬁ2 4
_superState
ﬁﬁ5 @
!=
ﬁﬁA C
null
ﬁﬁD H
)
ﬁﬁH I
{
ﬂﬂ 
result
ﬂﬂ 
=
ﬂﬂ 
_superState
ﬂﬂ "
.
ﬂﬂ" #
FireTrigger
ﬂﬂ# .
(
ﬂﬂ. /

parameters
ﬂﬂ/ 9
)
ﬂﬂ9 :
;
ﬂﬂ: ;
}
ﬂﬂ< =
else
‡‡ 
{
·· 
var
‚‚ 

startState
‚‚ 
=
‚‚  
StateAccessor
‚‚! .
(
‚‚. /

parameters
‚‚/ 9
.
‚‚9 :
Context
‚‚: A
)
‚‚A B
;
‚‚B C
result
„„ 
=
„„ 
result
„„ 
??
„„  "
new
‰‰ #
StateTransitionResult
‰‰ -
<
‰‰- .
TState
‰‰. 4
,
‰‰4 5
TTrigger
‰‰6 >
>
‰‰> ?
(
‰‰? @

parameters
‰‰@ J
.
‰‰J K
Trigger
‰‰K R
,
ÂÂ 

startState
ÂÂ $
,
ÊÊ 

startState
ÊÊ $
,
ÁÁ 

startState
ÁÁ $
,
ËË 
string
ËË  
.
ËË  !
Empty
ËË! &
,
ÈÈ 
transitionDefined
ÈÈ +
:
ÈÈ+ ,
false
ÈÈ- 2
)
ÈÈ2 3
;
ÈÈ3 4
}
ÍÍ 
return
ÏÏ 
result
ÏÏ 
;
ÏÏ 
}
ÌÌ 	
public
ÔÔ 
bool
ÔÔ 
	IsInState
ÔÔ 
(
ÔÔ 
TState
ÔÔ $
state
ÔÔ% *
)
ÔÔ* +
{
 	
if
ÒÒ 
(
ÒÒ 
state
ÒÒ 
.
ÒÒ 
	CompareTo
ÒÒ 
(
ÒÒ  
State
ÒÒ  %
)
ÒÒ% &
==
ÒÒ' )
$num
ÒÒ* +
)
ÒÒ+ ,
{
ÚÚ 
return
ÚÚ 
true
ÚÚ 
;
ÚÚ 
}
ÚÚ 
return
ÙÙ 
_superState
ÙÙ 
?
ÙÙ 
.
ÙÙ  
	IsInState
ÙÙ  )
(
ÙÙ) *
state
ÙÙ* /
)
ÙÙ/ 0
??
ÙÙ1 3
false
ÙÙ4 9
;
ÙÙ9 :
}
ıı 	
public
˜˜ !
IStateConfiguration
˜˜ "
<
˜˜" #
T
˜˜# $
,
˜˜$ %
TState
˜˜& ,
,
˜˜, -
TTrigger
˜˜. 6
>
˜˜6 7
IsSubStateOf
˜˜8 D
(
˜˜D E!
IStateConfiguration
˜˜E X
<
˜˜X Y
T
˜˜Y Z
,
˜˜Z [
TState
˜˜\ b
,
˜˜b c
TTrigger
˜˜d l
>
˜˜l m&
superStateConfiguration˜˜n Ö
)˜˜Ö Ü
{
¯¯ 	
AddSuperState
˘˘ 
(
˘˘ %
superStateConfiguration
˘˘ 1
as
˘˘2 4)
IStateConfigurationInternal
˘˘5 P
<
˘˘P Q
T
˘˘Q R
,
˘˘R S
TState
˘˘T Z
,
˘˘Z [
TTrigger
˘˘\ d
>
˘˘d e
)
˘˘e f
;
˘˘f g
return
˚˚ 
this
˚˚ 
;
˚˚ 
}
¸¸ 	
}
˝˝ 
}˛˛ ≈Ÿ
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
>==; <
AddAutoTransition=== N
(==N O
TState==O U
toState==V ]
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
(BB !
DefaultAutoTransitionBB %
!=BB& (
nullBB) -
)BB- .
{CC 
throwCC 
newCC %
InvalidOperationExceptionCC 1
(CC1 2
$strCC2 d
)CCd e
;CCe f
}CCg h
ifEE 
(EE 
	conditionEE 
==EE 
nullEE !
)EE! "
{FF 
throwFF 
newFF !
ArgumentNullExceptionFF -
(FF- .
nameofFF. 4
(FF4 5
	conditionFF5 >
)FF> ?
)FF? @
;FF@ A
}FFB C!
DefaultAutoTransitionHH !
=HH" #"
StateTransitionFactoryHH$ :
<HH: ;
THH; <
,HH< =
TStateHH> D
,HHD E
TTriggerHHF N
>HHN O
.HHO P
GetStateTransitionHHP b
(HHb c
StateAccessorHHc p
,II 
StateMutatorII 
,JJ 
StateJJ 
,KK 
toStateKK 
,LL 
	conditionLL 
,MM 
nameMM 
,NN 
priorityNN 
)NN 
;NN 
returnPP 
thisPP 
;PP 
}QQ 	
public\\ $
IStateConfigurationAsync\\ '
<\\' (
T\\( )
,\\) *
TState\\+ 1
,\\1 2
TTrigger\\3 ;
>\\; <
AddAutoTransition\\= N
<\\N O
TRequest\\O W
>\\W X
(\\X Y
TState\\Y _
toState\\` g
,]]
 
Func]] 
<]] 
T]] 
,]] 
TRequest]] 
,]] 
CancellationToken]] /
,]]/ 0
Task]]1 5
<]]5 6
bool]]6 :
>]]: ;
>]]; <
	condition]]= F
,^^
 
string^^ 
name^^ 
=^^ 
null^^ 
,__
 
uint__ 
priority__ 
=__ 
$num__ 
)__ 
where`` 
TRequest`` 
:`` 
class`` "
{aa 	
ifbb 
(bb !
DefaultAutoTransitionbb %
!=bb& (
nullbb) -
)bb- .
{cc 
throwcc 
newcc %
InvalidOperationExceptioncc 1
(cc1 2
$strcc2 b
)ccb c
;ccc d
}cce f
ifee 
(ee 
	conditionee 
==ee 
nullee !
)ee! "
{ff 
throwff 
newff !
ArgumentNullExceptionff -
(ff- .
nameofff. 4
(ff4 5
	conditionff5 >
)ff> ?
)ff? @
;ff@ A
}ffB C!
DefaultAutoTransitionhh !
=hh" #"
StateTransitionFactoryhh$ :
<hh: ;
Thh; <
,hh< =
TStatehh> D
,hhD E
TTriggerhhF N
>hhN O
.hhO P
GetStateTransitionhhP b
(hhb c
StateAccessorhhc p
,ii 
StateMutatorii 
,jj 
Statejj 
,kk 
toStatekk 
,ll 
	conditionll 
,mm 
namemm 
,nn 
prioritynn 
)nn 
;nn 
returnpp 
thispp 
;pp 
}qq 	
public|| $
IStateConfigurationAsync|| '
<||' (
T||( )
,||) *
TState||+ 1
,||1 2
TTrigger||3 ;
>||; <
AddAutoTransition||= N
(||N O
TState||O U
toState||V ]
,}}
 
Func}} 
<}} 
T}} 
,}} 
CancellationToken}} %
,}}% &
Task}}' +
<}}+ ,
bool}}, 0
>}}0 1
>}}1 2
	condition}}3 <
,~~
 
TState~~ 
previousState~~  
,
 
string 
name 
= 
null 
,
ÄÄ
 
uint
ÄÄ 
priority
ÄÄ 
=
ÄÄ 
$num
ÄÄ 
)
ÄÄ 
{
ÅÅ 	
if
ÇÇ 
(
ÇÇ 
	condition
ÇÇ 
==
ÇÇ 
null
ÇÇ !
)
ÇÇ! "
{
ÉÉ 
throw
ÉÉ 
new
ÉÉ #
ArgumentNullException
ÉÉ -
(
ÉÉ- .
nameof
ÉÉ. 4
(
ÉÉ4 5
	condition
ÉÉ5 >
)
ÉÉ> ?
)
ÉÉ? @
;
ÉÉ@ A
}
ÉÉB C
if
ÖÖ 
(
ÖÖ *
PreviousStateAutoTransitions
ÖÖ ,
.
ÖÖ, -
ContainsKey
ÖÖ- 8
(
ÖÖ8 9
previousState
ÖÖ9 F
)
ÖÖF G
)
ÖÖG H
{
ÜÜ 
throw
áá 
new
áá '
InvalidOperationException
áá 3
(
áá3 4
$"
àà 1
#AutoTransition already defined for 
àà 9
{
àà9 :
previousState
àà: G
}
ààG H<
.. Only one auto transition allowed per toState
ààH v
"
ààv w
)
ààw x
;
ààx y
}
ââ 
var
ãã 

transition
ãã 
=
ãã $
StateTransitionFactory
ãã 3
<
ãã3 4
T
ãã4 5
,
ãã5 6
TState
ãã7 =
,
ãã= >
TTrigger
ãã? G
>
ããG H
.
ããH I 
GetStateTransition
ããI [
(
ãã[ \
StateAccessor
ãã\ i
,
åå 
StateMutator
åå 
,
çç 
State
çç 
,
éé 
toState
éé 
,
èè 
	condition
èè 
,
êê 
name
êê 
,
ëë 
priority
ëë 
)
ëë 
;
ëë *
PreviousStateAutoTransitions
íí (
.
íí( )
Add
íí) ,
(
íí, -
previousState
íí- :
,
íí: ;

transition
íí< F
)
ííF G
;
ííG H
return
îî 
this
îî 
;
îî 
}
ïï 	
public
°° &
IStateConfigurationAsync
°° '
<
°°' (
T
°°( )
,
°°) *
TState
°°+ 1
,
°°1 2
TTrigger
°°3 ;
>
°°; <
AddAutoTransition
°°= N
<
°°N O
TRequest
°°O W
>
°°W X
(
°°X Y
TState
°°Y _
toState
°°` g
,
¢¢
 
Func
¢¢ 
<
¢¢ 
T
¢¢ 
,
¢¢ 
TRequest
¢¢ 
,
¢¢ 
CancellationToken
¢¢ /
,
¢¢/ 0
Task
¢¢1 5
<
¢¢5 6
bool
¢¢6 :
>
¢¢: ;
>
¢¢; <
	condition
¢¢= F
,
££
 
TState
££ 
previousState
££  
,
§§
 
string
§§ 
name
§§ 
=
§§ 
null
§§ 
,
••
 
uint
•• 
priority
•• 
=
•• 
$num
•• 
)
•• 
where
¶¶ 
TRequest
¶¶ 
:
¶¶ 
class
¶¶ "
{
ßß 	
if
®® 
(
®® 
	condition
®® 
==
®® 
null
®® !
)
®®! "
{
©© 
throw
©© 
new
©© #
ArgumentNullException
©© -
(
©©- .
nameof
©©. 4
(
©©4 5
	condition
©©5 >
)
©©> ?
)
©©? @
;
©©@ A
}
©©B C
if
´´ 
(
´´ *
PreviousStateAutoTransitions
´´ ,
.
´´, -
ContainsKey
´´- 8
(
´´8 9
previousState
´´9 F
)
´´F G
)
´´G H
{
¨¨ 
throw
¨¨ 
new
¨¨ '
InvalidOperationException
¨¨ 1
(
¨¨1 2
$"
¨¨2 41
#AutoTransition already defined for 
¨¨4 W
{
¨¨W X
previousState
¨¨X e
}
¨¨e f=
.. Only one auto transition allowed per toState¨¨f î
"¨¨î ï
)¨¨ï ñ
;¨¨ñ ó
}¨¨ò ô
var
ÆÆ 

transition
ÆÆ 
=
ÆÆ $
StateTransitionFactory
ÆÆ 3
<
ÆÆ3 4
T
ÆÆ4 5
,
ÆÆ5 6
TState
ÆÆ7 =
,
ÆÆ= >
TTrigger
ÆÆ? G
>
ÆÆG H
.
ÆÆH I 
GetStateTransition
ÆÆI [
(
ÆÆ[ \
StateAccessor
ÆÆ\ i
,
ØØ 
StateMutator
ØØ 
,
∞∞ 
State
∞∞ 
,
±± 
toState
±± 
,
≤≤ 
	condition
≤≤ 
,
≥≥ 
name
≥≥ 
,
¥¥ 
priority
¥¥ 
)
¥¥ 
;
¥¥ *
PreviousStateAutoTransitions
µµ (
.
µµ( )
Add
µµ) ,
(
µµ, -
previousState
µµ- :
,
µµ: ;

transition
µµ< F
)
µµF G
;
µµG H
return
∑∑ 
this
∑∑ 
;
∑∑ 
}
∏∏ 	
public
¬¬ &
IStateConfigurationAsync
¬¬ '
<
¬¬' (
T
¬¬( )
,
¬¬) *
TState
¬¬+ 1
,
¬¬1 2
TTrigger
¬¬3 ;
>
¬¬; <"
AddDynamicTransition
¬¬= Q
(
¬¬Q R
TTrigger
¬¬R Z
trigger
¬¬[ b
,
√√ 
Func
√√ 
<
√√ 
T
√√ 
,
√√ 
CancellationToken
√√ '
,
√√' (
Task
√√) -
<
√√- .
TState
√√. 4
>
√√4 5
>
√√5 6
function
√√7 ?
,
ƒƒ 
string
ƒƒ 
name
ƒƒ 
=
ƒƒ 
null
ƒƒ  
,
≈≈ 
uint
≈≈ 
priority
≈≈ 
=
≈≈ 
$num
≈≈ 
)
≈≈  
{
∆∆ 	
if
«« 
(
«« 
function
«« 
==
«« 
null
««  
)
««  !
{
»» 
throw
»» 
new
»» #
ArgumentNullException
»» -
(
»»- .
nameof
»». 4
(
»»4 5
function
»»5 =
)
»»= >
)
»»> ?
;
»»? @
}
»»A B
var
   

transition
   
=
   $
StateTransitionFactory
   3
<
  3 4
T
  4 5
,
  5 6
TState
  7 =
,
  = >
TTrigger
  ? G
>
  G H
.
  H I 
GetStateTransition
  I [
(
  [ \
StateAccessor
  \ i
,
ÀÀ 
StateMutator
ÀÀ 
,
ÃÃ 
State
ÃÃ 
,
ÕÕ 
function
ÕÕ 
,
ŒŒ 
name
ŒŒ 
,
œœ 
priority
œœ 
)
œœ 
;
œœ 
AddTransition
–– 
(
–– 
trigger
–– !
,
––! "

transition
––# -
)
––- .
;
––. /
return
““ 
this
““ 
;
““ 
}
”” 	
public
ﬁﬁ &
IStateConfigurationAsync
ﬁﬁ '
<
ﬁﬁ' (
T
ﬁﬁ( )
,
ﬁﬁ) *
TState
ﬁﬁ+ 1
,
ﬁﬁ1 2
TTrigger
ﬁﬁ3 ;
>
ﬁﬁ; <"
AddDynamicTransition
ﬁﬁ= Q
<
ﬁﬁQ R
TRequest
ﬁﬁR Z
>
ﬁﬁZ [
(
ﬁﬁ[ \
TTrigger
ﬁﬁ\ d
trigger
ﬁﬁe l
,
ﬂﬂ 
Func
ﬂﬂ 
<
ﬂﬂ 
T
ﬂﬂ 
,
ﬂﬂ 
TRequest
ﬂﬂ 
,
ﬂﬂ 
CancellationToken
ﬂﬂ  1
,
ﬂﬂ1 2
Task
ﬂﬂ3 7
<
ﬂﬂ7 8
TState
ﬂﬂ8 >
>
ﬂﬂ> ?
>
ﬂﬂ? @
function
ﬂﬂA I
,
‡‡ 
string
‡‡ 
name
‡‡ 
=
‡‡ 
null
‡‡  
,
·· 
uint
·· 
priority
·· 
=
·· 
$num
·· 
)
··  
where
‚‚ 
TRequest
‚‚ 
:
‚‚ 
class
‚‚ "
{
„„ 	
if
‰‰ 
(
‰‰ 
function
‰‰ 
==
‰‰ 
null
‰‰  
)
‰‰  !
{
ÂÂ 
throw
ÂÂ 
new
ÂÂ #
ArgumentNullException
ÂÂ -
(
ÂÂ- .
nameof
ÂÂ. 4
(
ÂÂ4 5
function
ÂÂ5 =
)
ÂÂ= >
)
ÂÂ> ?
;
ÂÂ? @
}
ÂÂA B
var
ÁÁ 

transition
ÁÁ 
=
ÁÁ $
StateTransitionFactory
ÁÁ 3
<
ÁÁ3 4
T
ÁÁ4 5
,
ÁÁ5 6
TState
ÁÁ7 =
,
ÁÁ= >
TTrigger
ÁÁ? G
>
ÁÁG H
.
ËË  
GetStateTransition
ËË "
(
ËË" #
StateAccessor
ËË# 0
,
ÈÈ 
StateMutator
ÈÈ "
,
ÍÍ 
State
ÍÍ 
,
ÎÎ 
function
ÎÎ 
,
ÏÏ 
name
ÏÏ 
,
ÌÌ 
priority
ÌÌ 
)
ÌÌ 
;
ÌÌ  
AddTransition
ÓÓ 
(
ÓÓ 
trigger
ÓÓ !
,
ÓÓ! "

transition
ÓÓ# -
)
ÓÓ- .
;
ÓÓ. /
return
 
this
 
;
 
}
ÒÒ 	
public
¯¯ &
IStateConfigurationAsync
¯¯ '
<
¯¯' (
T
¯¯( )
,
¯¯) *
TState
¯¯+ 1
,
¯¯1 2
TTrigger
¯¯3 ;
>
¯¯; <
AddEntryAction
¯¯= K
(
¯¯K L
Func
¯¯L P
<
¯¯P Q
T
¯¯Q R
,
¯¯R S
CancellationToken
¯¯T e
,
¯¯e f
Task
¯¯g k
>
¯¯k l
action
¯¯m s
)
¯¯s t
{
˘˘ 	
if
˙˙ 
(
˙˙ !
_defaultEntryAction
˙˙ #
!=
˙˙$ &
null
˙˙' +
)
˙˙+ ,
{
˚˚ 
throw
˚˚ 
new
˚˚ '
InvalidOperationException
˚˚ 1
(
˚˚1 2
$str
˚˚2 a
)
˚˚a b
;
˚˚b c
}
˚˚d e!
_defaultEntryAction
˝˝ 
=
˝˝  !
action
˝˝" (
??
˝˝) +
throw
˝˝, 1
new
˝˝2 5#
ArgumentNullException
˝˝6 K
(
˝˝K L
nameof
˝˝L R
(
˝˝R S
action
˝˝S Y
)
˝˝Y Z
)
˝˝Z [
;
˝˝[ \
return
ˇˇ 
this
ˇˇ 
;
ˇˇ 
}
ÄÄ 	
public
àà &
IStateConfigurationAsync
àà '
<
àà' (
T
àà( )
,
àà) *
TState
àà+ 1
,
àà1 2
TTrigger
àà3 ;
>
àà; <
AddEntryAction
àà= K
(
ààK L
Func
ààL P
<
ààP Q
T
ààQ R
,
ààR S
CancellationToken
ààT e
,
ààe f
Task
ààg k
>
ààk l
action
ààm s
,
ààs t
TState
ààu {
previousStateàà| â
)ààâ ä
{
ââ 	
if
ää 
(
ää 
action
ää 
==
ää 
null
ää 
)
ää 
{
ãã 
throw
ãã 
new
ãã #
ArgumentNullException
ãã -
(
ãã- .
nameof
ãã. 4
(
ãã4 5
action
ãã5 ;
)
ãã; <
)
ãã< =
;
ãã= >
}
ãã? @
if
çç 
(
çç (
_previousStateEntryActions
çç *
.
çç* +
ContainsKey
çç+ 6
(
çç6 7
previousState
çç7 D
)
ççD E
)
ççE F
{
éé 
throw
éé 
new
éé '
InvalidOperationException
éé 1
(
éé1 2
$str
éé2 g
)
éég h
;
ééh i
}
ééj k(
_previousStateEntryActions
êê &
.
êê& '
Add
êê' *
(
êê* +
previousState
êê+ 8
,
êê8 9
action
êê: @
)
êê@ A
;
êêA B
return
íí 
this
íí 
;
íí 
}
ìì 	
public
öö &
IStateConfigurationAsync
öö '
<
öö' (
T
öö( )
,
öö) *
TState
öö+ 1
,
öö1 2
TTrigger
öö3 ;
>
öö; <
AddExitAction
öö= J
(
ööJ K
Func
ööK O
<
ööO P
T
ööP Q
,
ööQ R
CancellationToken
ööS d
,
ööd e
Task
ööf j
>
ööj k
action
ööl r
)
öör s
{
õõ 	
if
úú 
(
úú  
_defaultExitAction
úú "
!=
úú# %
null
úú& *
)
úú* +
{
ùù 
throw
ùù 
new
ùù '
InvalidOperationException
ùù 1
(
ùù1 2
$str
ùù2 T
)
ùùT U
;
ùùU V
}
ùùW X 
_defaultExitAction
üü 
=
üü  
action
üü! '
??
üü( *
throw
üü+ 0
new
üü1 4#
ArgumentNullException
üü5 J
(
üüJ K
nameof
üüK Q
(
üüQ R
action
üüR X
)
üüX Y
)
üüY Z
;
üüZ [
return
°° 
this
°° 
;
°° 
}
¢¢ 	
public
™™ &
IStateConfigurationAsync
™™ '
<
™™' (
T
™™( )
,
™™) *
TState
™™+ 1
,
™™1 2
TTrigger
™™3 ;
>
™™; <
AddExitAction
™™= J
(
™™J K
Func
™™K O
<
™™O P
T
™™P Q
,
™™Q R
CancellationToken
™™S d
,
™™d e
Task
™™f j
>
™™j k
action
™™l r
,
™™r s
TState
™™t z
	nextState™™{ Ñ
)™™Ñ Ö
{
´´ 	
if
¨¨ 
(
¨¨ 
action
¨¨ 
==
¨¨ 
null
¨¨ 
)
¨¨ 
{
≠≠ 
throw
≠≠ 
new
≠≠ #
ArgumentNullException
≠≠ -
(
≠≠- .
nameof
≠≠. 4
(
≠≠4 5
	nextState
≠≠5 >
)
≠≠> ?
)
≠≠? @
;
≠≠@ A
}
≠≠B C
if
ØØ 
(
ØØ #
_nextStateExitActions
ØØ %
.
ØØ% &
ContainsKey
ØØ& 1
(
ØØ1 2
	nextState
ØØ2 ;
)
ØØ; <
)
ØØ< =
{
∞∞ 
throw
∞∞ 
new
∞∞ '
InvalidOperationException
∞∞ 1
(
∞∞1 2
$"
∞∞2 4)
Exit action with nextState 
∞∞4 O
{
∞∞O P
	nextState
∞∞P Y
}
∞∞Y Z
 already set.
∞∞Z g
"
∞∞g h
)
∞∞h i
;
∞∞i j
}
∞∞k l#
_nextStateExitActions
≤≤ !
.
≤≤! "
Add
≤≤" %
(
≤≤% &
	nextState
≤≤& /
,
≤≤/ 0
action
≤≤1 7
)
≤≤7 8
;
≤≤8 9
return
¥¥ 
this
¥¥ 
;
¥¥ 
}
µµ 	
public
∑∑ &
IStateConfigurationAsync
∑∑ '
<
∑∑' (
T
∑∑( )
,
∑∑) *
TState
∑∑+ 1
,
∑∑1 2
TTrigger
∑∑3 ;
>
∑∑; <#
AddFallbackTransition
∑∑= R
(
∑∑R S
Func
∑∑S W
<
∑∑W X
T
∑∑X Y
,
∑∑Y Z
CancellationToken
∑∑[ l
,
∑∑l m
Task
∑∑n r
<
∑∑r s
bool
∑∑s w
>
∑∑w x
>
∑∑x y
	condition∑∑z É
,
∏∏
 
string
∏∏ 
name
∏∏ 
=
∏∏ 
null
∏∏ 
,
ππ
 
uint
ππ 
priority
ππ 
=
ππ 
$num
ππ 
)
ππ 
{
∫∫ 	
if
ªª 
(
ªª #
DefaultAutoTransition
ªª %
!=
ªª& (
null
ªª) -
)
ªª- .
{
ºº 
throw
ºº 
new
ºº '
InvalidOperationException
ºº 1
(
ºº1 2
$str
ºº2 b
)
ººb c
;
ººc d
}
ººe f
if
ææ 
(
ææ 
	condition
ææ 
==
ææ 
null
ææ !
)
ææ! "
{
øø 
throw
øø 
new
øø #
ArgumentNullException
øø -
(
øø- .
nameof
øø. 4
(
øø4 5
	condition
øø5 >
)
øø> ?
)
øø? @
;
øø@ A
}
øøB C#
DefaultAutoTransition
¡¡ !
=
¡¡" #$
StateTransitionFactory
¡¡$ :
<
¡¡: ;
T
¡¡; <
,
¡¡< =
TState
¡¡> D
,
¡¡D E
TTrigger
¡¡F N
>
¡¡N O
.
¡¡O P 
GetStateTransition
¡¡P b
(
¡¡b c
StateAccessor
¡¡c p
,
¬¬ 
StateMutator
¬¬ 
,
√√ 
State
√√ 
,
ƒƒ 
State
ƒƒ 
,
≈≈ 
	condition
≈≈ 
,
∆∆ 
name
∆∆ 
,
«« 
priority
«« 
)
«« 
;
«« 
return
…… 
this
…… 
;
…… 
}
   	
public
ÃÃ &
IStateConfigurationAsync
ÃÃ '
<
ÃÃ' (
T
ÃÃ( )
,
ÃÃ) *
TState
ÃÃ+ 1
,
ÃÃ1 2
TTrigger
ÃÃ3 ;
>
ÃÃ; <#
AddFallbackTransition
ÃÃ= R
<
ÃÃR S
TRequest
ÃÃS [
>
ÃÃ[ \
(
ÃÃ\ ]
Func
ÃÃ] a
<
ÃÃa b
T
ÃÃb c
,
ÃÃc d
TRequest
ÃÃe m
,
ÃÃm n 
CancellationTokenÃÃo Ä
,ÃÃÄ Å
TaskÃÃÇ Ü
<ÃÃÜ á
boolÃÃá ã
>ÃÃã å
>ÃÃå ç
	conditionÃÃé ó
,
ÕÕ
 
string
ÕÕ 
name
ÕÕ 
=
ÕÕ 
null
ÕÕ 
,
ŒŒ
 
uint
ŒŒ 
priority
ŒŒ 
=
ŒŒ 
$num
ŒŒ 
)
ŒŒ 
where
œœ 
TRequest
œœ 
:
œœ 
class
œœ "
{
–– 	
if
—— 
(
—— #
DefaultAutoTransition
—— %
!=
——& (
null
——) -
)
——- .
{
““ 
throw
““ 
new
““ '
InvalidOperationException
““ 1
(
““1 2
$str
““2 b
)
““b c
;
““c d
}
““e f
if
‘‘ 
(
‘‘ 
	condition
‘‘ 
==
‘‘ 
null
‘‘ !
)
‘‘! "
{
’’ 
throw
’’ 
new
’’ #
ArgumentNullException
’’ -
(
’’- .
nameof
’’. 4
(
’’4 5
	condition
’’5 >
)
’’> ?
)
’’? @
;
’’@ A
}
’’B C#
DefaultAutoTransition
◊◊ !
=
◊◊" #$
StateTransitionFactory
◊◊$ :
<
◊◊: ;
T
◊◊; <
,
◊◊< =
TState
◊◊> D
,
◊◊D E
TTrigger
◊◊F N
>
◊◊N O
.
◊◊O P 
GetStateTransition
◊◊P b
(
◊◊b c
StateAccessor
◊◊c p
,
ÿÿ 
StateMutator
ÿÿ 
,
ŸŸ 
State
ŸŸ 
,
⁄⁄ 
State
⁄⁄ 
,
€€ 
	condition
€€ 
,
‹‹ 
name
‹‹ 
,
›› 
priority
›› 
)
›› 
;
›› 
return
ﬂﬂ 
this
ﬂﬂ 
;
ﬂﬂ 
}
‡‡ 	
public
‚‚ &
IStateConfigurationAsync
‚‚ '
<
‚‚' (
T
‚‚( )
,
‚‚) *
TState
‚‚+ 1
,
‚‚1 2
TTrigger
‚‚3 ;
>
‚‚; <#
AddFallbackTransition
‚‚= R
(
‚‚R S
Func
‚‚S W
<
‚‚W X
T
‚‚X Y
,
‚‚Y Z
CancellationToken
‚‚[ l
,
‚‚l m
Task
‚‚n r
<
‚‚r s
bool
‚‚s w
>
‚‚w x
>
‚‚x y
	condition‚‚z É
,
„„
 
TState
„„ 
previousState
„„  
,
‰‰
 
string
‰‰ 
name
‰‰ 
=
‰‰ 
null
‰‰ 
,
ÂÂ
 
uint
ÂÂ 
priority
ÂÂ 
=
ÂÂ 
$num
ÂÂ 
)
ÂÂ 
{
ÊÊ 	
if
ÁÁ 
(
ÁÁ 
	condition
ÁÁ 
==
ÁÁ 
null
ÁÁ !
)
ÁÁ! "
{
ËË 
throw
ËË 
new
ËË #
ArgumentNullException
ËË -
(
ËË- .
nameof
ËË. 4
(
ËË4 5
	condition
ËË5 >
)
ËË> ?
)
ËË? @
;
ËË@ A
}
ËËB C
if
ÍÍ 
(
ÍÍ *
PreviousStateAutoTransitions
ÍÍ ,
.
ÍÍ, -
ContainsKey
ÍÍ- 8
(
ÍÍ8 9
previousState
ÍÍ9 F
)
ÍÍF G
)
ÍÍG H
{
ÎÎ 
throw
ÎÎ 
new
ÎÎ '
InvalidOperationException
ÎÎ 1
(
ÎÎ1 2
$"
ÎÎ2 41
#AutoTransition already defined for 
ÎÎ4 W
{
ÎÎW X
previousState
ÎÎX e
}
ÎÎe fC
4. Only one auto transition allowed per previousStateÎÎf ö
"ÎÎö õ
)ÎÎõ ú
;ÎÎú ù
}ÎÎû ü
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
ÓÓ 
StateMutator
ÓÓ 
,
ÔÔ 
State
ÔÔ 
,
 
State
 
,
ÒÒ 
	condition
ÒÒ 
,
ÚÚ 
name
ÚÚ 
,
ÛÛ 
priority
ÛÛ 
)
ÛÛ 
;
ÛÛ *
PreviousStateAutoTransitions
ÙÙ (
.
ÙÙ( )
Add
ÙÙ) ,
(
ÙÙ, -
previousState
ÙÙ- :
,
ÙÙ: ;

transition
ÙÙ< F
)
ÙÙF G
;
ÙÙG H
return
ˆˆ 
this
ˆˆ 
;
ˆˆ 
}
˜˜ 	
public
˘˘ &
IStateConfigurationAsync
˘˘ '
<
˘˘' (
T
˘˘( )
,
˘˘) *
TState
˘˘+ 1
,
˘˘1 2
TTrigger
˘˘3 ;
>
˘˘; <#
AddFallbackTransition
˘˘= R
<
˘˘R S
TRequest
˘˘S [
>
˘˘[ \
(
˘˘\ ]
Func
˘˘] a
<
˘˘a b
T
˘˘b c
,
˘˘c d
TRequest
˘˘e m
,
˘˘m n 
CancellationToken˘˘o Ä
,˘˘Ä Å
Task˘˘Ç Ü
<˘˘Ü á
bool˘˘á ã
>˘˘ã å
>˘˘å ç
	condition˘˘é ó
,
˙˙
 
TState
˙˙ 
previousState
˙˙  
,
˚˚
 
string
˚˚ 
name
˚˚ 
=
˚˚ 
null
˚˚ 
,
¸¸
 
uint
¸¸ 
priority
¸¸ 
=
¸¸ 
$num
¸¸ 
)
¸¸ 
where
˝˝ 
TRequest
˝˝ 
:
˝˝ 
class
˝˝ "
{
˛˛ 	
if
ˇˇ 
(
ˇˇ 
	condition
ˇˇ 
==
ˇˇ 
null
ˇˇ !
)
ˇˇ! "
{
ÄÄ 
throw
ÄÄ 
new
ÄÄ #
ArgumentNullException
ÄÄ -
(
ÄÄ- .
nameof
ÄÄ. 4
(
ÄÄ4 5
	condition
ÄÄ5 >
)
ÄÄ> ?
)
ÄÄ? @
;
ÄÄ@ A
}
ÄÄB C
if
ÇÇ 
(
ÇÇ *
PreviousStateAutoTransitions
ÇÇ ,
.
ÇÇ, -
ContainsKey
ÇÇ- 8
(
ÇÇ8 9
previousState
ÇÇ9 F
)
ÇÇF G
)
ÇÇG H
{
ÉÉ 
throw
ÉÉ 
new
ÉÉ '
InvalidOperationException
ÉÉ 1
(
ÉÉ1 2
$"
ÉÉ2 41
#AutoTransition already defined for 
ÉÉ4 W
{
ÉÉW X
previousState
ÉÉX e
}
ÉÉe fC
4. Only one auto transition allowed per previousStateÉÉf ö
"ÉÉö õ
)ÉÉõ ú
;ÉÉú ù
}ÉÉû ü
var
ÖÖ 

transition
ÖÖ 
=
ÖÖ $
StateTransitionFactory
ÖÖ 3
<
ÖÖ3 4
T
ÖÖ4 5
,
ÖÖ5 6
TState
ÖÖ7 =
,
ÖÖ= >
TTrigger
ÖÖ? G
>
ÖÖG H
.
ÖÖH I 
GetStateTransition
ÖÖI [
(
ÖÖ[ \
StateAccessor
ÖÖ\ i
,
ÜÜ 
StateMutator
ÜÜ 
,
áá 
State
áá 
,
àà 
State
àà 
,
ââ 
	condition
ââ 
,
ää 
name
ää 
,
ãã 
priority
ãã 
)
ãã 
;
ãã *
PreviousStateAutoTransitions
åå (
.
åå( )
Add
åå) ,
(
åå, -
previousState
åå- :
,
åå: ;

transition
åå< F
)
ååF G
;
ååG H
return
éé 
this
éé 
;
éé 
}
èè 	
public
óó &
IStateConfigurationAsync
óó '
<
óó' (
T
óó( )
,
óó) *
TState
óó+ 1
,
óó1 2
TTrigger
óó3 ;
>
óó; <
AddReentryAction
óó= M
(
óóM N
Func
óóN R
<
óóR S
T
óóS T
,
óóT U
CancellationToken
óóV g
,
óóg h
Task
óói m
>
óóm n
action
óóo u
)
óóu v
{
òò 	
if
ôô 
(
ôô 
_reentryAction
ôô 
!=
ôô !
null
ôô" &
)
ôô& '
{
öö 
throw
öö 
new
öö '
InvalidOperationException
öö 1
(
öö1 2
$str
öö2 Y
)
ööY Z
;
ööZ [
}
öö\ ]
_reentryAction
úú 
=
úú 
action
úú #
??
úú$ &
throw
úú' ,
new
úú- 0#
ArgumentNullException
úú1 F
(
úúF G
nameof
úúG M
(
úúM N
action
úúN T
)
úúT U
)
úúU V
;
úúV W
return
ûû 
this
ûû 
;
ûû 
}
üü 	
public
°° 
void
°° 
AddSuperState
°° !
(
°°! ".
 IStateConfigurationAsyncInternal
°°" B
<
°°B C
T
°°C D
,
°°D E
TState
°°F L
,
°°L M
TTrigger
°°N V
>
°°V W%
superStateConfiguration
°°X o
)
°°o p
{
¢¢ 	
if
££ 
(
££ 
	IsInState
££ 
(
££ %
superStateConfiguration
££ 1
.
££1 2
State
££2 7
)
££7 8
)
££8 9
{
§§ 
throw
§§ 
new
§§ )
ArgumentOutOfRangeException
§§ 3
(
§§3 4
$"
§§4 6
{
§§6 7
State
§§7 <
}
§§< =)
 is already a sub-state of 
§§= X
{
§§X Y%
superStateConfiguration
§§Y p
.
§§p q
State
§§q v
}
§§v w
.
§§w x
"
§§x y
)
§§y z
;
§§z {
}
§§| }
if
¶¶ 
(
¶¶ %
superStateConfiguration
¶¶ '
.
¶¶' (
	IsInState
¶¶( 1
(
¶¶1 2
State
¶¶2 7
)
¶¶7 8
)
¶¶8 9
{
ßß 
throw
ßß 
new
ßß )
ArgumentOutOfRangeException
ßß 3
(
ßß3 4
$"
ßß4 6
{
ßß6 7%
superStateConfiguration
ßß7 N
.
ßßN O
State
ßßO T
}
ßßT U)
 is already a sub-state of 
ßßU p
{
ßßp q
State
ßßq v
}
ßßv w
.
ßßw x
"
ßßx y
)
ßßy z
;
ßßz {
}
ßß| }
_superState
©© 
=
©© %
superStateConfiguration
©© 1
;
©©1 2
}
™™ 	
public
µµ &
IStateConfigurationAsync
µµ '
<
µµ' (
T
µµ( )
,
µµ) *
TState
µµ+ 1
,
µµ1 2
TTrigger
µµ3 ;
>
µµ; <
AddTransition
µµ= J
(
µµJ K
TTrigger
µµK S
trigger
µµT [
,
∂∂ 
TState
∂∂ 
toState
∂∂ 
,
∑∑ 
Func
∑∑ 
<
∑∑ 
T
∑∑ 
,
∑∑ 
CancellationToken
∑∑ '
,
∑∑' (
Task
∑∑) -
<
∑∑- .
bool
∑∑. 2
>
∑∑2 3
>
∑∑3 4
conditionAsync
∑∑5 C
=
∑∑D E
null
∑∑F J
,
∏∏ 
string
∏∏ 
name
∏∏ 
=
∏∏ 
null
∏∏  
,
ππ 
uint
ππ 
priority
ππ 
=
ππ 
$num
ππ 
)
ππ  
{
∫∫ 	
if
ªª 
(
ªª 
conditionAsync
ªª 
==
ªª !
null
ªª" &
)
ªª& '
{
ºº 
conditionAsync
ºº 
=
ºº 
(
ºº  
_
ºº  !
,
ºº! "
ct
ºº# %
)
ºº% &
=>
ºº' )
Task
ºº* .
.
ºº. /

FromResult
ºº/ 9
(
ºº9 :
result
ºº: @
:
ºº@ A
true
ººB F
)
ººF G
;
ººG H
}
ººI J
var
ææ 

transition
ææ 
=
ææ $
StateTransitionFactory
ææ 3
<
ææ3 4
T
ææ4 5
,
ææ5 6
TState
ææ7 =
,
ææ= >
TTrigger
ææ? G
>
ææG H
.
ææH I 
GetStateTransition
ææI [
(
ææ[ \
StateAccessor
ææ\ i
,
øø 
StateMutator
øø 
,
¿¿ 
State
¿¿ 
,
¡¡ 
toState
¡¡ 
,
¬¬ 
conditionAsync
¬¬  
,
√√ 
name
√√ 
,
ƒƒ 
priority
ƒƒ 
)
ƒƒ 
;
ƒƒ 
AddTransition
≈≈ 
(
≈≈ 
trigger
≈≈ !
,
≈≈! "

transition
≈≈# -
)
≈≈- .
;
≈≈. /
return
«« 
this
«« 
;
«« 
}
»» 	
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
‘‘; <
AddTransition
‘‘= J
<
‘‘J K
TRequest
‘‘K S
>
‘‘S T
(
‘‘T U
TTrigger
‘‘U ]
trigger
‘‘^ e
,
’’ 
TState
’’ 
toState
’’ 
,
÷÷ 
Func
÷÷ 
<
÷÷ 
T
÷÷ 
,
÷÷ 
TRequest
÷÷ 
,
÷÷ 
CancellationToken
÷÷  1
,
÷÷1 2
Task
÷÷3 7
<
÷÷7 8
bool
÷÷8 <
>
÷÷< =
>
÷÷= >
conditionAsync
÷÷? M
,
◊◊ 
string
◊◊ 
name
◊◊ 
=
◊◊ 
null
◊◊  
,
ÿÿ 
uint
ÿÿ 
priority
ÿÿ 
=
ÿÿ 
$num
ÿÿ 
)
ÿÿ  
where
ŸŸ 
TRequest
ŸŸ 
:
ŸŸ 
class
ŸŸ "
{
⁄⁄ 	
if
€€ 
(
€€ 
conditionAsync
€€ 
==
€€ !
null
€€" &
)
€€& '
{
‹‹ 
throw
‹‹ 
new
‹‹ #
ArgumentNullException
‹‹ -
(
‹‹- .
nameof
‹‹. 4
(
‹‹4 5
conditionAsync
‹‹5 C
)
‹‹C D
)
‹‹D E
;
‹‹E F
}
‹‹G H
var
ﬁﬁ 

transition
ﬁﬁ 
=
ﬁﬁ $
StateTransitionFactory
ﬁﬁ 3
<
ﬁﬁ3 4
T
ﬁﬁ4 5
,
ﬁﬁ5 6
TState
ﬁﬁ7 =
,
ﬁﬁ= >
TTrigger
ﬁﬁ? G
>
ﬁﬁG H
.
ﬁﬁH I 
GetStateTransition
ﬁﬁI [
(
ﬁﬁ[ \
StateAccessor
ﬁﬁ\ i
,
ﬂﬂ 
StateMutator
ﬂﬂ 
,
‡‡ 
State
‡‡ 
,
·· 
toState
·· 
,
‚‚ 
conditionAsync
‚‚  
,
„„ 
name
„„ 
,
‰‰ 
priority
‰‰ 
)
‰‰ 
;
‰‰ 
AddTransition
ÂÂ 
(
ÂÂ 
trigger
ÂÂ !
,
ÂÂ! "

transition
ÂÂ# -
)
ÂÂ- .
;
ÂÂ. /
return
ÁÁ 
this
ÁÁ 
;
ÁÁ 
}
ËË 	
public
 &
IStateConfigurationAsync
 '
<
' (
T
( )
,
) *
TState
+ 1
,
1 2
TTrigger
3 ;
>
; <
AddTriggerAction
= M
(
M N
TTrigger
N V
trigger
W ^
,
^ _
Func
` d
<
d e
T
e f
,
f g
CancellationToken
h y
,
y z
Task
{ 
> Ä
actionÅ á
)á à
{
ÒÒ 	
if
ÚÚ 
(
ÚÚ 
_triggerActions
ÚÚ 
.
ÚÚ  
ContainsKey
ÚÚ  +
(
ÚÚ+ ,
trigger
ÚÚ, 3
)
ÚÚ3 4
)
ÚÚ4 5
{
ÛÛ 
throw
ÛÛ 
new
ÛÛ '
InvalidOperationException
ÛÛ 1
(
ÛÛ1 2
$"
ÛÛ2 4-
Only one action is allowed for 
ÛÛ4 S
{
ÛÛS T
trigger
ÛÛT [
}
ÛÛ[ \
	 trigger.
ÛÛ\ e
"
ÛÛe f
)
ÛÛf g
;
ÛÛg h
}
ÛÛi j
_triggerActions
ıı 
.
ıı 
Add
ıı 
(
ıı  
trigger
ıı  '
,
ıı' ("
TriggerActionFactory
ıı) =
<
ıı= >
T
ıı> ?
,
ıı? @
TTrigger
ııA I
>
ııI J
.
ııJ K
GetTriggerAction
ııK [
(
ıı[ \
action
ıı\ b
)
ııb c
)
ııc d
;
ııd e
return
˜˜ 
this
˜˜ 
;
˜˜ 
}
¯¯ 	
public
ÅÅ &
IStateConfigurationAsync
ÅÅ '
<
ÅÅ' (
T
ÅÅ( )
,
ÅÅ) *
TState
ÅÅ+ 1
,
ÅÅ1 2
TTrigger
ÅÅ3 ;
>
ÅÅ; <
AddTriggerAction
ÅÅ= M
<
ÅÅM N
TRequest
ÅÅN V
>
ÅÅV W
(
ÅÅW X
TTrigger
ÅÅX `
trigger
ÅÅa h
,
ÇÇ
 
Func
ÇÇ 
<
ÇÇ 
T
ÇÇ 
,
ÇÇ 
TRequest
ÇÇ 
,
ÇÇ 
CancellationToken
ÇÇ /
,
ÇÇ/ 0
Task
ÇÇ1 5
>
ÇÇ5 6
action
ÇÇ7 =
)
ÇÇ= >
{
ÉÉ 	
if
ÑÑ 
(
ÑÑ 
_triggerActions
ÑÑ 
.
ÑÑ  
ContainsKey
ÑÑ  +
(
ÑÑ+ ,
trigger
ÑÑ, 3
)
ÑÑ3 4
)
ÑÑ4 5
{
ÖÖ 
throw
ÖÖ 
new
ÖÖ '
InvalidOperationException
ÖÖ 1
(
ÖÖ1 2
$"
ÖÖ2 4-
Only one action is allowed for 
ÖÖ4 S
{
ÖÖS T
trigger
ÖÖT [
}
ÖÖ[ \
	 trigger.
ÖÖ\ e
"
ÖÖe f
)
ÖÖf g
;
ÖÖg h
}
ÖÖi j
_triggerActions
áá 
.
áá 
Add
áá 
(
áá  
trigger
áá  '
,
áá' ("
TriggerActionFactory
áá) =
<
áá= >
T
áá> ?
,
áá? @
TTrigger
ááA I
>
ááI J
.
ááJ K
GetTriggerAction
ááK [
(
áá[ \
action
áá\ b
)
ááb c
)
áác d
;
áád e
return
ââ 
this
ââ 
;
ââ 
}
ää 	
public
åå 
async
åå 
Task
åå 
<
åå #
StateTransitionResult
åå /
<
åå/ 0
TState
åå0 6
,
åå6 7
TTrigger
åå8 @
>
åå@ A
>
ååA B(
ExecuteAutoTransitionAsync
ååC ]
(
åå] ^!
ExecutionParameters
åå^ q
<
ååq r
T
åår s
,
åås t
TTrigger
ååu }
>
åå} ~

parametersåå â
,
çç #
StateTransitionResult
çç #
<
çç# $
TState
çç$ *
,
çç* +
TTrigger
çç, 4
>
çç4 5
currentResult
çç6 C
)
ççC D
{
éé 	
if
êê 
(
êê *
PreviousStateAutoTransitions
êê ,
.
êê, -
TryGetValue
êê- 8
(
êê8 9
currentResult
êê9 F
.
êêF G
PreviousState
êêG T
,
êêT U
out
êêV Y
var
êêZ ]
action
êê^ d
)
êêd e
)
êêe f
{
ëë 
return
ëë 
await
ëë 
action
ëë !
.
ëë! "
ExecuteAsync
ëë" .
(
ëë. /

parameters
ëë/ 9
,
ëë9 :
currentResult
ëë; H
)
ëëH I
.
ëëI J
ConfigureAwait
ëëJ X
(
ëëX Y'
continueOnCapturedContext
ëëY r
:
ëër s
false
ëët y
)
ëëy z
;
ëëz {
}
ëë| }
if
îî 
(
îî #
DefaultAutoTransition
îî %
!=
îî& (
null
îî) -
)
îî- .
{
ïï 
return
ïï 
await
ïï #
DefaultAutoTransition
ïï 0
.
ïï0 1
ExecuteAsync
ïï1 =
(
ïï= >

parameters
ïï> H
,
ïïH I
currentResult
ïïJ W
)
ïïW X
.
ïïX Y
ConfigureAwait
ïïY g
(
ïïg h(
continueOnCapturedContextïïh Å
:ïïÅ Ç
falseïïÉ à
)ïïà â
;ïïâ ä
}ïïã å
return
óó 
_superState
óó 
!=
óó !
null
óó" &
?
òò 
await
òò 
_superState
òò #
.
òò# $(
ExecuteAutoTransitionAsync
òò$ >
(
òò> ?

parameters
òò? I
,
òòI J
currentResult
òòK X
)
òòX Y
.
òòY Z
ConfigureAwait
òòZ h
(
òòh i(
continueOnCapturedContextòòi Ç
:òòÇ É
falseòòÑ â
)òòâ ä
:
ôô 
new
ôô #
StateTransitionResult
ôô +
<
ôô+ ,
TState
ôô, 2
,
ôô2 3
TTrigger
ôô4 <
>
ôô< =
(
ôô= >

parameters
ôô> H
.
ôôH I
Trigger
ôôI P
,
öö 
currentResult
öö #
.
öö# $
StartingState
öö$ 1
,
õõ 
currentResult
õõ #
.
õõ# $
PreviousState
õõ$ 1
,
úú 
currentResult
úú #
.
úú# $
CurrentState
úú$ 0
,
ùù 
currentResult
ùù #
.
ùù# $ 
LastTransitionName
ùù$ 6
,
ûû 
transitionDefined
ûû '
:
ûû' (
true
ûû) -
,
üü 
wasCancelled
üü "
:
üü" #

parameters
üü$ .
.
üü. /
CancellationToken
üü/ @
.
üü@ A%
IsCancellationRequested
üüA X
)
üüX Y
;
üüY Z
}
†† 	
public
¢¢ 
async
¢¢ 
Task
¢¢ %
ExecuteEntryActionAsync
¢¢ 1
(
¢¢1 2!
ExecutionParameters
¢¢2 E
<
¢¢E F
T
¢¢F G
,
¢¢G H
TTrigger
¢¢I Q
>
¢¢Q R

parameters
¢¢S ]
,
¢¢] ^#
StateTransitionResult
¢¢_ t
<
¢¢t u
TState
¢¢u {
,
¢¢{ |
TTrigger¢¢} Ö
>¢¢Ö Ü
currentResult¢¢á î
)¢¢î ï
{
££ 	
if
•• 
(
•• (
_previousStateEntryActions
•• *
.
••* +
TryGetValue
••+ 6
(
••6 7
currentResult
••7 D
.
••D E
PreviousState
••E R
,
••R S
out
••T W
var
••X [
action
••\ b
)
••b c
)
••c d
{
¶¶ 
if
ßß 
(
ßß 

parameters
ßß 
.
ßß 
CancellationToken
ßß 0
.
ßß0 1%
IsCancellationRequested
ßß1 H
)
ßßH I
{
®® 
return
®® 
;
®® 
}
®® 
await
™™ 
action
™™ 
.
™™ 
Invoke
™™ #
(
™™# $

parameters
™™$ .
.
™™. /
Context
™™/ 6
,
™™6 7

parameters
™™8 B
.
™™B C
CancellationToken
™™C T
)
™™T U
.
™™U V
ConfigureAwait
™™V d
(
™™d e'
continueOnCapturedContext
™™e ~
:
™™~ 
false™™Ä Ö
)™™Ö Ü
;™™Ü á
}
´´ 
if
ÆÆ 
(
ÆÆ !
_defaultEntryAction
ÆÆ #
!=
ÆÆ$ &
null
ÆÆ' +
)
ÆÆ+ ,
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
≥≥ !
_defaultEntryAction
≥≥ '
!=
≥≥( *
null
≥≥+ /
)
≥≥/ 0
{
¥¥ 
await
¥¥ !
_defaultEntryAction
¥¥ +
.
¥¥+ ,
Invoke
¥¥, 2
(
¥¥2 3

parameters
¥¥3 =
.
¥¥= >
Context
¥¥> E
,
¥¥E F

parameters
¥¥G Q
.
¥¥Q R
CancellationToken
¥¥R c
)
¥¥c d
.
¥¥d e
ConfigureAwait
¥¥e s
(
¥¥s t(
continueOnCapturedContext¥¥t ç
:¥¥ç é
false¥¥è î
)¥¥î ï
;¥¥ï ñ
}¥¥ó ò
}
µµ 
}
∂∂ 	
public
∏∏ 
async
∏∏ 
Task
∏∏ '
ExecuteReentryActionAsync
∏∏ 3
(
∏∏3 4!
ExecutionParameters
∏∏4 G
<
∏∏G H
T
∏∏H I
,
∏∏I J
TTrigger
∏∏K S
>
∏∏S T

parameters
∏∏U _
,
∏∏_ `#
StateTransitionResult
∏∏a v
<
∏∏v w
TState
∏∏w }
,
∏∏} ~
TTrigger∏∏ á
>∏∏á à
currentResult∏∏â ñ
)∏∏ñ ó
{
ππ 	
if
∫∫ 
(
∫∫ 
_superState
∫∫ 
!=
∫∫ 
null
∫∫ #
)
∫∫# $
{
ªª 
await
ºº 
_superState
ºº !
.
ºº! "'
ExecuteReentryActionAsync
ºº" ;
(
ºº; <

parameters
ºº< F
,
ººF G
currentResult
ººH U
)
ººU V
.
ΩΩ 
ConfigureAwait
ΩΩ #
(
ΩΩ# $'
continueOnCapturedContext
ΩΩ$ =
:
ΩΩ= >
false
ΩΩ? D
)
ΩΩD E
;
ΩΩE F
}
ææ 
if
¿¿ 
(
¿¿ 
_reentryAction
¿¿ 
!=
¿¿ !
null
¿¿" &
&&
¿¿' )
!
¿¿* +

parameters
¿¿+ 5
.
¿¿5 6
CancellationToken
¿¿6 G
.
¿¿G H%
IsCancellationRequested
¿¿H _
)
¿¿_ `
{
¡¡ 
await
¬¬ 
_reentryAction
¬¬ $
.
¬¬$ %
Invoke
¬¬% +
(
¬¬+ ,

parameters
¬¬, 6
.
¬¬6 7
Context
¬¬7 >
,
¬¬> ?

parameters
¬¬@ J
.
¬¬J K
CancellationToken
¬¬K \
)
¬¬\ ]
.
√√ 
ConfigureAwait
√√ #
(
√√# $'
continueOnCapturedContext
√√$ =
:
√√= >
false
√√? D
)
√√D E
;
√√E F
}
ƒƒ 
}
≈≈ 	
public
«« 
async
«« 
Task
«« $
ExecuteExitActionAsync
«« 0
(
««0 1!
ExecutionParameters
««1 D
<
««D E
T
««E F
,
««F G
TTrigger
««H P
>
««P Q

parameters
««R \
,
»» #
StateTransitionResult
»» #
<
»»# $
TState
»»$ *
,
»»* +
TTrigger
»», 4
>
»»4 5
currentResult
»»6 C
)
»»C D
{
…… 	
if
ÀÀ 
(
ÀÀ #
_nextStateExitActions
ÀÀ %
.
ÀÀ% &
TryGetValue
ÀÀ& 1
(
ÀÀ1 2
currentResult
ÀÀ2 ?
.
ÀÀ? @
CurrentState
ÀÀ@ L
,
ÀÀL M
out
ÀÀN Q
var
ÀÀR U
action
ÀÀV \
)
ÀÀ\ ]
)
ÀÀ] ^
{
ÃÃ 
if
ÕÕ 
(
ÕÕ 

parameters
ÕÕ 
.
ÕÕ 
CancellationToken
ÕÕ 0
.
ÕÕ0 1%
IsCancellationRequested
ÕÕ1 H
)
ÕÕH I
{
ŒŒ 
return
ŒŒ 
;
ŒŒ 
}
ŒŒ 
await
–– 
action
–– 
.
–– 
Invoke
–– #
(
––# $

parameters
––$ .
.
––. /
Context
––/ 6
,
––6 7

parameters
––8 B
.
––B C
CancellationToken
––C T
)
––T U
.
—— 
ConfigureAwait
—— "
(
——" #'
continueOnCapturedContext
——# <
:
——< =
false
——> C
)
——C D
;
——D E
}
““ 
if
’’ 
(
’’  
_defaultExitAction
’’ "
!=
’’# %
null
’’& *
)
’’* +
{
÷÷ 
if
◊◊ 
(
◊◊ 

parameters
◊◊ 
.
◊◊ 
CancellationToken
◊◊ 0
.
◊◊0 1%
IsCancellationRequested
◊◊1 H
)
◊◊H I
{
ÿÿ 
return
ÿÿ 
;
ÿÿ 
}
ÿÿ 
if
⁄⁄ 
(
⁄⁄  
_defaultExitAction
⁄⁄ &
!=
⁄⁄' )
null
⁄⁄* .
)
⁄⁄. /
{
€€ 
await
‹‹  
_defaultExitAction
‹‹ ,
.
‹‹, -
Invoke
‹‹- 3
(
‹‹3 4

parameters
‹‹4 >
.
‹‹> ?
Context
‹‹? F
,
‹‹F G

parameters
‹‹H R
.
‹‹R S
CancellationToken
‹‹S d
)
‹‹d e
.
›› 
ConfigureAwait
›› '
(
››' ('
continueOnCapturedContext
››( A
:
››A B
false
››C H
)
››H I
;
››I J
}
ﬁﬁ 
}
ﬂﬂ 
}
‡‡ 	
public
‚‚ 
async
‚‚ 
Task
‚‚ 
<
‚‚ #
StateTransitionResult
‚‚ /
<
‚‚/ 0
TState
‚‚0 6
,
‚‚6 7
TTrigger
‚‚8 @
>
‚‚@ A
>
‚‚A B
FireTriggerAsync
‚‚C S
(
‚‚S T!
ExecutionParameters
‚‚T g
<
‚‚g h
T
‚‚h i
,
‚‚i j
TTrigger
‚‚k s
>
‚‚s t

parameters
‚‚u 
)‚‚ Ä
{
„„ 	
if
‰‰ 
(
‰‰ 
_triggerActions
‰‰ 
.
‰‰  
TryGetValue
‰‰  +
(
‰‰+ ,

parameters
‰‰, 6
.
‰‰6 7
Trigger
‰‰7 >
,
‰‰> ?
out
‰‰@ C
var
‰‰D G
triggerAction
‰‰H U
)
‰‰U V
)
‰‰V W
{
ÂÂ 
await
ÊÊ 
triggerAction
ÊÊ #
.
ÊÊ# $
ExecuteAsync
ÊÊ$ 0
(
ÊÊ0 1

parameters
ÊÊ1 ;
.
ÊÊ; <
Context
ÊÊ< C
,
ÊÊC D
request
ÊÊE L
:
ÊÊL M
null
ÊÊN R
,
ÊÊR S
cancellationToken
ÊÊT e
:
ÊÊe f

parameters
ÊÊg q
.
ÊÊq r 
CancellationTokenÊÊr É
)ÊÊÉ Ñ
.
ÁÁ 
ConfigureAwait
ÁÁ #
(
ÁÁ# $'
continueOnCapturedContext
ÁÁ$ =
:
ÁÁ= >
false
ÁÁ? D
)
ÁÁD E
;
ÁÁE F
}
ËË 
var
ÍÍ 
result
ÍÍ 
=
ÍÍ 
await
ÍÍ "
FireTriggerPrimAsync
ÍÍ 3
(
ÍÍ3 4

parameters
ÍÍ4 >
)
ÍÍ> ?
.
ÍÍ? @
ConfigureAwait
ÍÍ@ N
(
ÍÍN O'
continueOnCapturedContext
ÍÍO h
:
ÍÍh i
false
ÍÍj o
)
ÍÍo p
;
ÍÍp q
if
ÏÏ 
(
ÏÏ 
!
ÏÏ 
(
ÏÏ 
result
ÏÏ 
?
ÏÏ 
.
ÏÏ 
WasSuccessful
ÏÏ '
??
ÏÏ( *
false
ÏÏ+ 0
)
ÏÏ0 1
&&
ÏÏ2 4
_superState
ÏÏ5 @
!=
ÏÏA C
null
ÏÏD H
)
ÏÏH I
{
ÌÌ 
result
ÓÓ 
=
ÓÓ 
await
ÓÓ 
_superState
ÓÓ *
.
ÓÓ* +
FireTriggerAsync
ÓÓ+ ;
(
ÓÓ; <

parameters
ÓÓ< F
)
ÓÓF G
.
ÓÓG H
ConfigureAwait
ÓÓH V
(
ÓÓV W'
continueOnCapturedContext
ÓÓW p
:
ÓÓp q
false
ÓÓr w
)
ÓÓw x
;
ÓÓx y
}
ÔÔ 
else
 
{
ÒÒ 
var
ÚÚ 

startState
ÚÚ 
=
ÚÚ  
StateAccessor
ÚÚ! .
(
ÚÚ. /

parameters
ÚÚ/ 9
.
ÚÚ9 :
Context
ÚÚ: A
)
ÚÚA B
;
ÚÚB C
result
ÛÛ 
=
ÛÛ 
result
ÛÛ 
??
ÛÛ  "
new
ÛÛ# &#
StateTransitionResult
ÛÛ' <
<
ÛÛ< =
TState
ÛÛ= C
,
ÛÛC D
TTrigger
ÛÛE M
>
ÛÛM N
(
ÛÛN O

parameters
ÛÛO Y
.
ÛÛY Z
Trigger
ÛÛZ a
,
ÙÙ 

startState
ÙÙ  
,
ıı 

startState
ıı  
,
ˆˆ 

startState
ˆˆ  
,
˜˜  
lastTransitionName
˜˜ (
:
˜˜( )
string
˜˜* 0
.
˜˜0 1
Empty
˜˜1 6
,
¯¯ 
transitionDefined
¯¯ '
:
¯¯' (
false
¯¯) .
)
¯¯. /
;
¯¯/ 0
}
˘˘ 
return
˚˚ 
result
˚˚ 
;
˚˚ 
}
¸¸ 	
private
˛˛ 
async
˛˛ 
Task
˛˛ 
<
˛˛ #
StateTransitionResult
˛˛ 0
<
˛˛0 1
TState
˛˛1 7
,
˛˛7 8
TTrigger
˛˛9 A
>
˛˛A B
>
˛˛B C"
FireTriggerPrimAsync
˛˛D X
(
˛˛X Y!
ExecutionParameters
˛˛Y l
<
˛˛l m
T
˛˛m n
,
˛˛n o
TTrigger
˛˛p x
>
˛˛x y

parameters˛˛z Ñ
)˛˛Ñ Ö
{
ˇˇ 	#
StateTransitionResult
ÄÄ !
<
ÄÄ! "
TState
ÄÄ" (
,
ÄÄ( )
TTrigger
ÄÄ* 2
>
ÄÄ2 3
result
ÄÄ4 :
=
ÄÄ; <
null
ÄÄ= A
;
ÄÄA B
if
ÇÇ 
(
ÇÇ  
AllowedTransitions
ÇÇ "
.
ÇÇ" #
TryGetValue
ÇÇ# .
(
ÇÇ. /

parameters
ÇÇ/ 9
.
ÇÇ9 :
Trigger
ÇÇ: A
,
ÇÇA B
out
ÇÇC F
var
ÇÇG J
transitions
ÇÇK V
)
ÇÇV W
)
ÇÇW X
{
ÉÉ 
foreach
ÑÑ 
(
ÑÑ 
var
ÑÑ 

transition
ÑÑ '
in
ÑÑ( *
transitions
ÑÑ+ 6
.
ÑÑ6 7
OrderBy
ÑÑ7 >
(
ÑÑ> ?
t
ÑÑ? @
=>
ÑÑA C
t
ÑÑD E
.
ÑÑE F
Priority
ÑÑF N
)
ÑÑN O
)
ÑÑO P
{
ÖÖ 
result
ÜÜ 
=
ÜÜ 
await
ÜÜ "

transition
ÜÜ# -
.
ÜÜ- .
ExecuteAsync
ÜÜ. :
(
ÜÜ: ;

parameters
ÜÜ; E
)
ÜÜE F
.
ÜÜF G
ConfigureAwait
ÜÜG U
(
ÜÜU V'
continueOnCapturedContext
ÜÜV o
:
ÜÜo p
false
ÜÜq v
)
ÜÜv w
;
ÜÜw x
if
áá 
(
áá 
result
áá 
.
áá 
WasSuccessful
áá ,
)
áá, -
{
àà 
return
àà 
result
àà #
;
àà# $
}
àà% &
}
ââ 
}
ää 
return
åå 
result
åå 
;
åå 
}
çç 	
public
èè 
bool
èè 
	IsInState
èè 
(
èè 
TState
èè $
state
èè% *
)
èè* +
{
êê 	
if
ëë 
(
ëë 
state
ëë 
.
ëë 
	CompareTo
ëë 
(
ëë  
State
ëë  %
)
ëë% &
==
ëë' )
$num
ëë* +
)
ëë+ ,
{
íí 
return
íí 
true
íí 
;
íí 
}
íí 
return
îî 
_superState
îî 
?
îî 
.
îî  
	IsInState
îî  )
(
îî) *
state
îî* /
)
îî/ 0
??
îî1 3
false
îî4 9
;
îî9 :
}
ïï 	
public
óó &
IStateConfigurationAsync
óó '
<
óó' (
T
óó( )
,
óó) *
TState
óó+ 1
,
óó1 2
TTrigger
óó3 ;
>
óó; <
IsSubStateOf
óó= I
(
óóI J&
IStateConfigurationAsync
óóJ b
<
óób c
T
óóc d
,
óód e
TState
óóf l
,
óól m
TTrigger
óón v
>
óóv w&
superStateConfigurationóóx è
)óóè ê
{
òò 	
AddSuperState
ôô 
(
ôô %
superStateConfiguration
ôô 1
as
ôô2 4.
 IStateConfigurationAsyncInternal
ôô5 U
<
ôôU V
T
ôôV W
,
ôôW X
TState
ôôY _
,
ôô_ `
TTrigger
ôôa i
>
ôôi j
)
ôôj k
;
ôôk l
return
õõ 
this
õõ 
;
õõ 
}
úú 	
}
ùù 
}ûû °9
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
{ 
public 
Func 
< 
T 
, 
TState 
> 
StateAccessor ,
{- .
get/ 2
;2 3
}4 5
public 
Action 
< 
T 
, 
TState 
>  
StateMutator! -
{. /
get0 3
;3 4
}5 6
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
>U V
AllowedTransitionsW i
=j k
newl o

Dictionaryp z
<z {
TTrigger	{ É
,
É Ñ
List
Ö â
<
â ä!
StateTransitionBase
ä ù
<
ù û
T
û ü
,
ü †
TState
° ß
,
ß ®
TTrigger
© ±
>
± ≤
>
≤ ≥
>
≥ ¥
(
¥ µ
)
µ ∂
;
∂ ∑
	protected 

Dictionary 
< 
TState #
,# $
StateTransitionBase% 8
<8 9
T9 :
,: ;
TState< B
,B C
TTriggerD L
>L M
>M N(
PreviousStateAutoTransitionsO k
=l m
newn q

Dictionaryr |
<| }
TState	} É
,
É Ñ!
StateTransitionBase
Ö ò
<
ò ô
T
ô ö
,
ö õ
TState
ú ¢
,
¢ £
TTrigger
§ ¨
>
¨ ≠
>
≠ Æ
(
Æ Ø
)
Ø ∞
;
∞ ±
	protected 
StateTransitionBase %
<% &
T& '
,' (
TState) /
,/ 0
TTrigger1 9
>9 :!
DefaultAutoTransition; P
;P Q
public 
TState 
State 
{ 
get !
;! "
}# $
internal$$ "
StateConfigurationBase$$ '
($$' (
TState$$( .
state$$/ 4
,$$4 5
Func$$6 :
<$$: ;
T$$; <
,$$< =
TState$$> D
>$$D E
stateAccessor$$F S
,$$S T
Action$$U [
<$$[ \
T$$\ ]
,$$] ^
TState$$_ e
>$$e f
stateMutator$$g s
)$$s t
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
void00 
AddTransition00 !
(00! "
TTrigger00" *
trigger00+ 2
,002 3
StateTransitionBase004 G
<00G H
T00H I
,00I J
TState00K Q
,00Q R
TTrigger00S [
>00[ \

transition00] g
)00g h
{11 	
if22 
(22 
!22 
AllowedTransitions22 #
.22# $
TryGetValue22$ /
(22/ 0
trigger220 7
,227 8
out229 <
var22= @
existingTransitions22A T
)22T U
)22U V
{33 
AllowedTransitions33  
.33  !
Add33! $
(33$ %
trigger33% ,
,33, -
new33. 1
List332 6
<336 7
StateTransitionBase337 J
<33J K
T33K L
,33L M
TState33N T
,33T U
TTrigger33V ^
>33^ _
>33_ `
{33a b

transition33b l
}33l m
)33m n
;33n o
}33p q
else44 
{55 
if66 
(66 
existingTransitions66 '
.66' (
Any66( +
(66+ ,
t66, -
=>66. 0
t661 2
.662 3
Priority663 ;
==66< >

transition66? I
.66I J
Priority66J R
)66R S
)66S T
{77 
throw77 
new77 %
InvalidOperationException77 5
(775 6
$"776 8
{778 9
trigger779 @
}77@ A.
" trigger was previously added for 77A c
{77c d
State77d i
}77i j
 state as priority 77j }
{77} ~

transition	77~ à
.
77à â
Priority
77â ë
}
77ë í
.
77í ì
"
77ì î
)
77î ï
;
77ï ñ
}
77ó ò
existingTransitions99 #
.99# $
Add99$ '
(99' (

transition99( 2
)992 3
;993 4
}:: 
};; 	
	protected== !
StateTransitionResult== '
<==' (
TState==( .
,==. /
TTrigger==0 8
>==8 9
FireTriggerPrim==: I
(==I J
ExecutionParameters==J ]
<==] ^
T==^ _
,==_ `
TTrigger==a i
>==i j

parameters==k u
)==u v
{>> 	!
StateTransitionResult?? !
<??! "
TState??" (
,??( )
TTrigger??* 2
>??2 3
result??4 :
=??; <
null??= A
;??A B
ifAA 
(AA 
AllowedTransitionsAA "
.AA" #
TryGetValueAA# .
(AA. /

parametersAA/ 9
.AA9 :
TriggerAA: A
,AAA B
outAAC F
varAAG J
transitionsAAK V
)AAV W
)AAW X
{BB 
foreachCC 
(CC 
varCC 

transitionCC '
inCC( *
transitionsCC+ 6
.CC6 7
OrderByCC7 >
(CC> ?
tCC? @
=>CCA C
tCCD E
.CCE F
PriorityCCF N
)CCN O
)CCO P
{DD 
resultEE 
=EE 

transitionEE '
.EE' (
ExecuteEE( /
(EE/ 0

parametersEE0 :
)EE: ;
;EE; <
ifFF 
(FF 
resultFF 
.FF 
WasSuccessfulFF ,
)FF, -
{GG 
returnGG 
resultGG #
;GG# $
}GG% &
}HH 
}II 
returnKK 
resultKK 
;KK 
}LL 	
}MM 
}NN ì
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
readonly 
Func 
< 
T 
,  
TState! '
>' (
_stateAccessor) 7
;7 8
private 
readonly 
Action 
<  
T  !
,! "
TState# )
>) *
_stateMutator+ 8
;8 9
private 
readonly 

Dictionary #
<# $
TState$ *
,* +'
IStateConfigurationInternal, G
<G H
TH I
,I J
TStateK Q
,Q R
TTriggerS [
>[ \
>\ ] 
_stateConfigurations^ r
=s t
new 

Dictionary 
< 
TState !
,! "'
IStateConfigurationInternal# >
<> ?
T? @
,@ A
TStateB H
,H I
TTriggerJ R
>R S
>S T
(T U
)U V
;V W
private 
readonly 

Dictionary #
<# $
TTrigger$ ,
,, -
TriggerActionBase. ?
<? @
T@ A
,A B
TTriggerC K
>K L
>L M
_triggerActionsN ]
=^ _
new   

Dictionary   
<   
TTrigger   #
,  # $
TriggerActionBase  % 6
<  6 7
T  7 8
,  8 9
TTrigger  : B
>  B C
>  C D
(  D E
)  E F
;  F G
public'' 
StateMachine'' 
('' 
Func''  
<''  !
T''! "
,''" #
TState''$ *
>''* +
stateAccessor'', 9
,''9 :
Action''; A
<''A B
T''B C
,''C D
TState''E K
>''K L
stateMutator''M Y
)''Y Z
{(( 	
_stateAccessor)) 
=)) 
stateAccessor)) *
??))+ -
throw)). 3
new))4 7!
ArgumentNullException))8 M
())M N
nameof))N T
())T U
stateAccessor))U b
)))b c
)))c d
;))d e
_stateMutator** 
=** 
stateMutator** (
??**) +
throw**, 1
new**2 5!
ArgumentNullException**6 K
(**K L
nameof**L R
(**R S
stateMutator**S _
)**_ `
)**` a
;**a b
}++ 	
public44 
IStateMachine44 
<44 
T44 
,44 
TState44  &
,44& '
TTrigger44( 0
>440 1
AddTriggerAction442 B
(44B C
TTrigger44C K
trigger44L S
,44S T
Action44U [
<44[ \
T44\ ]
>44] ^
action44_ e
)44e f
{55 	
if66 
(66 
_triggerActions66 
.66  
ContainsKey66  +
(66+ ,
trigger66, 3
)663 4
)664 5
{77 
throw77 
new77 %
InvalidOperationException77 1
(771 2
$"772 4+
Only one action is allowed for 774 S
{77S T
trigger77T [
}77[ \
	 trigger.77\ e
"77e f
)77f g
;77g h
}77i j
_triggerActions99 
.99 
Add99 
(99  
trigger99  '
,99' ( 
TriggerActionFactory99) =
<99= >
T99> ?
,99? @
TTrigger99A I
>99I J
.99J K
GetTriggerAction99K [
(99[ \
action99\ b
)99b c
)99c d
;99d e
return;; 
this;; 
;;; 
}<< 	
publicFF 
IStateMachineFF 
<FF 
TFF 
,FF 
TStateFF  &
,FF& '
TTriggerFF( 0
>FF0 1
AddTriggerActionFF2 B
<FFB C
TRequestFFC K
>FFK L
(FFL M
TTriggerFFM U
triggerFFV ]
,FF] ^
ActionGG 
<GG 
TGG 
,GG 
TRequestGG 
>GG 
actionGG  &
)GG& '
{HH 	
ifII 
(II 
_triggerActionsII 
.II  
ContainsKeyII  +
(II+ ,
triggerII, 3
)II3 4
)II4 5
{JJ 
throwJJ 
newJJ %
InvalidOperationExceptionJJ 1
(JJ1 2
$"JJ2 4+
Only one action is allowed for JJ4 S
{JJS T
triggerJJT [
}JJ[ \
	 trigger.JJ\ e
"JJe f
)JJf g
;JJg h
}JJi j
_triggerActionsLL 
.LL 
AddLL 
(LL  
triggerLL  '
,LL' ( 
TriggerActionFactoryLL) =
<LL= >
TLL> ?
,LL? @
TTriggerLLA I
>LLI J
.LLJ K
GetTriggerActionLLK [
(LL[ \
actionLL\ b
)LLb c
)LLc d
;LLd e
returnNN 
thisNN 
;NN 
}OO 	
publicVV 
IStateConfigurationVV "
<VV" #
TVV# $
,VV$ %
TStateVV& ,
,VV, -
TTriggerVV. 6
>VV6 7
ConfigureStateVV8 F
(VVF G
TStateVVG M
stateVVN S
)VVS T
{WW 	
ifXX 
(XX  
_stateConfigurationsXX $
.XX$ %
TryGetValueXX% 0
(XX0 1
stateXX1 6
,XX6 7
outXX8 ;
varXX< ?
stateConfigurationXX@ R
)XXR S
)XXS T
{YY 
returnYY 
stateConfigurationYY '
;YY' (
}YY) *
var[[ 
newState[[ 
=[[ 
new[[ 
StateConfiguration[[ 1
<[[1 2
T[[2 3
,[[3 4
TState[[5 ;
,[[; <
TTrigger[[= E
>[[E F
([[F G
state[[G L
,[[L M
_stateAccessor[[N \
,[[\ ]
_stateMutator[[^ k
)[[k l
;[[l m 
_stateConfigurations\\  
.\\  !
Add\\! $
(\\$ %
state\\% *
,\\* +
newState\\, 4
)\\4 5
;\\5 6
return]] 
newState]] 
;]] 
}^^ 	
publicgg !
StateTransitionResultgg $
<gg$ %
TStategg% +
,gg+ ,
TTriggergg- 5
>gg5 6
FireTriggergg7 B
<ggB C
TRequestggC K
>ggK L
(ggL M
TggM N
contextggO V
,ggV W
TTriggerggX `
triggergga h
,ggh i
TRequestggj r
requestggs z
)ggz {
wherehh 
TRequesthh 
:hh 
classhh "
{ii 	
varjj 
executionParametersjj #
=jj$ %
newjj& )
ExecutionParametersjj* =
<jj= >
Tjj> ?
,jj? @
TTriggerjjA I
>jjI J
(jjJ K
triggerjjK R
,jjR S
contextjjT [
,jj[ \
requestjj] d
:jjd e
requestjjf m
)jjm n
;jjn o
varkk 

startStatekk 
=kk 
_stateAccessorkk +
(kk+ ,
contextkk, 3
)kk3 4
;kk4 5
ifmm 
(mm 
_triggerActionsmm 
.mm  
TryGetValuemm  +
(mm+ ,
triggermm, 3
,mm3 4
outmm5 8
varmm9 <
triggerActionmm= J
)mmJ K
)mmK L
{nn 
triggerActionnn 
.nn 
Executenn #
(nn# $
executionParametersnn$ 7
)nn7 8
;nn8 9
}nn: ;
varpp 
resultpp 
=pp 
!pp  
_stateConfigurationspp .
.pp. /
TryGetValuepp/ :
(pp: ;

startStatepp; E
,ppE F
outppG J
varppK N
stateConfigurationppO a
)ppa b
?qq 
newqq !
StateTransitionResultqq +
<qq+ ,
TStateqq, 2
,qq2 3
TTriggerqq4 <
>qq< =
(qq= >
triggerqq> E
,rr 

startStaterr  
,ss 

startStatess  
,tt 

startStatett  
,uu 
lastTransitionNameuu (
:uu( )
stringuu* 0
.uu0 1
Emptyuu1 6
,vv 
transitionDefinedvv '
:vv' (
falsevv) .
)vv. /
:ww 
stateConfigurationww $
.ww$ %
FireTriggerww% 0
(ww0 1
executionParametersww1 D
)wwD E
;wwE F
returnyy &
executeExitAndEntryActionsyy -
(yy- .
executionParametersyy. A
,yyA B
resultyyC I
)yyI J
;yyJ K
}zz 	
public
ÇÇ #
StateTransitionResult
ÇÇ $
<
ÇÇ$ %
TState
ÇÇ% +
,
ÇÇ+ ,
TTrigger
ÇÇ- 5
>
ÇÇ5 6
FireTrigger
ÇÇ7 B
(
ÇÇB C
T
ÇÇC D
context
ÇÇE L
,
ÇÇL M
TTrigger
ÇÇN V
trigger
ÇÇW ^
)
ÇÇ^ _
{
ÉÉ 	
var
ÑÑ 

startState
ÑÑ 
=
ÑÑ 
_stateAccessor
ÑÑ +
(
ÑÑ+ ,
context
ÑÑ, 3
)
ÑÑ3 4
;
ÑÑ4 5
var
ÖÖ !
executionParameters
ÖÖ #
=
ÖÖ$ %
new
ÖÖ& )!
ExecutionParameters
ÖÖ* =
<
ÖÖ= >
T
ÖÖ> ?
,
ÖÖ? @
TTrigger
ÖÖA I
>
ÖÖI J
(
ÖÖJ K
trigger
ÖÖK R
,
ÖÖR S
context
ÖÖT [
)
ÖÖ[ \
;
ÖÖ\ ]
if
áá 
(
áá 
_triggerActions
áá 
.
áá  
TryGetValue
áá  +
(
áá+ ,
trigger
áá, 3
,
áá3 4
out
áá5 8
var
áá9 <
triggerAction
áá= J
)
ááJ K
)
ááK L
{
àà 
triggerAction
àà 
.
àà 
Execute
àà #
(
àà# $!
executionParameters
àà$ 7
)
àà7 8
;
àà8 9
}
àà: ;
var
ää 
result
ää 
=
ää 
!
ää "
_stateConfigurations
ää .
.
ää. /
TryGetValue
ää/ :
(
ää: ;

startState
ää; E
,
ääE F
out
ääG J
var
ääK N 
stateConfiguration
ääO a
)
ääa b
?
ãã 
new
ãã #
StateTransitionResult
ãã +
<
ãã+ ,
TState
ãã, 2
,
ãã2 3
TTrigger
ãã4 <
>
ãã< =
(
ãã= >
trigger
ãã> E
,
åå 

startState
åå  
,
çç 

startState
çç  
,
éé 

startState
éé  
,
èè  
lastTransitionName
èè '
:
èè' (
String
èè) /
.
èè/ 0
Empty
èè0 5
,
êê 
transitionDefined
êê '
:
êê' (
false
êê) .
)
êê. /
:
ëë  
stateConfiguration
ëë $
.
ëë$ %
FireTrigger
ëë% 0
(
ëë0 1!
executionParameters
ëë1 D
)
ëëD E
;
ëëE F
return
ìì (
executeExitAndEntryActions
ìì -
(
ìì- .!
executionParameters
ìì. A
,
ììA B
result
ììC I
)
ììI J
;
ììJ K
}
îî 	
public
ññ 
bool
ññ 
	IsInState
ññ 
(
ññ 
T
ññ 
context
ññ  '
,
ññ' (
TState
ññ) /
state
ññ0 5
)
ññ5 6
{
óó 	
var
òò 
objectState
òò 
=
òò 
_stateAccessor
òò ,
(
òò, -
context
òò- 4
)
òò4 5
;
òò5 6
if
öö 
(
öö 
state
öö 
.
öö 
	CompareTo
öö 
(
öö  
objectState
öö  +
)
öö+ ,
==
öö- /
$num
öö0 1
)
öö1 2
{
õõ 
return
õõ 
true
õõ 
;
õõ 
}
õõ 
return
ùù "
_stateConfigurations
ùù '
.
ùù' (
TryGetValue
ùù( 3
(
ùù3 4
objectState
ùù4 ?
,
ùù? @
out
ùùA D
var
ùùE H&
objectStateConfiguration
ùùI a
)
ùùa b
&&
ûû &
objectStateConfiguration
ûû .
.
ûû. /
	IsInState
ûû/ 8
(
ûû8 9
state
ûû9 >
)
ûû> ?
;
ûû? @
}
üü 	
public
°° 
IStateMachine
°° 
<
°° 
T
°° 
,
°° 
TState
°°  &
,
°°& '
TTrigger
°°( 0
>
°°0 1*
RegisterOnTransitionedAction
°°2 N
(
°°N O
Action
°°O U
<
°°U V
T
°°V W
,
°°W X#
StateTransitionResult
°°Y n
<
°°n o
TState
°°o u
,
°°u v
TTrigger
°°w 
>°° Ä
>°°Ä Å
action°°Ç à
)°°à â
{
¢¢ 	!
StateTransitionBase
££ 
<
££  
T
££  !
,
££! "
TState
££# )
,
££) *
TTrigger
££+ 3
>
££3 4
.
££4 5!
OnTransitionedEvent
££5 H
+=
££I K
action
££L R
;
££R S
return
•• 
this
•• 
;
•• 
}
¶¶ 	
private
®® #
StateTransitionResult
®® %
<
®®% &
TState
®®& ,
,
®®, -
TTrigger
®®. 6
>
®®6 7(
executeExitAndEntryActions
®®8 R
(
®®R S!
ExecutionParameters
®®S f
<
®®f g
T
®®g h
,
®®h i
TTrigger
®®j r
>
®®r s

parameters
®®t ~
,
©©
 #
StateTransitionResult
©© !
<
©©! "
TState
©©" (
,
©©( )
TTrigger
©©* 2
>
©©2 3
currentResult
©©4 A
)
©©A B
{
™™ 	
if
´´ 
(
´´ 
currentResult
´´ 
.
´´ 
WasSuccessful
´´ +
&&
´´, .
!
¨¨ 
(
¨¨ 
currentResult
¨¨ 
.
¨¨  
StartingState
¨¨  -
.
¨¨- .
	CompareTo
¨¨. 7
(
¨¨7 8
currentResult
¨¨8 E
.
¨¨E F
PreviousState
¨¨F S
)
¨¨S T
==
¨¨U W
$num
¨¨X Y
&&
¨¨Z \
currentResult
¨¨] j
.
¨¨j k
PreviousState
¨¨k x
.
¨¨x y
	CompareTo¨¨y Ç
(¨¨Ç É
currentResult¨¨É ê
.¨¨ê ë
CurrentState¨¨ë ù
)¨¨ù û
==¨¨ü °
$num¨¨¢ £
)¨¨£ §
)¨¨§ •
{
≠≠ "
_stateConfigurations
ÆÆ $
.
ÆÆ$ %
TryGetValue
ÆÆ% 0
(
ÆÆ0 1
currentResult
ÆÆ1 >
.
ÆÆ> ?
PreviousState
ÆÆ? L
,
ÆÆL M
out
ÆÆN Q
var
ÆÆR U
previousState
ÆÆV c
)
ÆÆc d
;
ÆÆd e
if
±± 
(
±± 
!
±± 
	IsInState
±± 
(
±± 

parameters
±± )
.
±±) *
Context
±±* 1
,
±±1 2
currentResult
±±3 @
.
±±@ A
PreviousState
±±A N
)
±±N O
)
±±O P
{
≤≤ 
previousState
≤≤ 
.
≤≤  
ExecuteExitAction
≤≤  1
(
≤≤1 2

parameters
≤≤2 <
.
≤≤< =
Context
≤≤= D
,
≤≤D E
currentResult
≤≤F S
)
≤≤S T
;
≤≤T U
}
≤≤V W
if
¥¥ 
(
¥¥ "
_stateConfigurations
¥¥ (
.
¥¥( )
TryGetValue
¥¥) 4
(
¥¥4 5
currentResult
¥¥5 B
.
¥¥B C
CurrentState
¥¥C O
,
¥¥O P
out
¥¥Q T
var
¥¥U X
newState
¥¥Y a
)
¥¥a b
)
¥¥b c
{
µµ 
if
∑∑ 
(
∑∑ 
!
∑∑ 
previousState
∑∑ &
.
∑∑& '
	IsInState
∑∑' 0
(
∑∑0 1
currentResult
∑∑1 >
.
∑∑> ?
CurrentState
∑∑? K
)
∑∑K L
)
∑∑L M
{
∏∏ 
newState
∏∏ 
.
∏∏  
ExecuteEntryAction
∏∏ 1
(
∏∏1 2

parameters
∏∏2 <
.
∏∏< =
Context
∏∏= D
,
∏∏D E
currentResult
∏∏F S
)
∏∏S T
;
∏∏T U
}
∏∏V W
var
ªª !
preAutoForwardState
ªª +
=
ªª, -
currentResult
ªª. ;
.
ªª; <
CurrentState
ªª< H
;
ªªH I
currentResult
ºº !
=
ºº" #
newState
ºº$ ,
.
ºº, -#
ExecuteAutoTransition
ºº- B
(
ººB C

parameters
ººC M
,
ººM N
currentResult
ººO \
)
ºº\ ]
??
ºº^ `
currentResult
ººa n
;
ººn o
if
øø 
(
øø 
currentResult
øø %
.
øø% &
CurrentState
øø& 2
.
øø2 3
	CompareTo
øø3 <
(
øø< =!
preAutoForwardState
øø= P
)
øøP Q
!=
øøR T
$num
øøU V
)
øøV W
{
¿¿ 
currentResult
¿¿ #
=
¿¿$ %(
executeExitAndEntryActions
¿¿& @
(
¿¿@ A

parameters
¿¿A K
,
¿¿K L
currentResult
¿¿M Z
)
¿¿Z [
;
¿¿[ \
}
¿¿] ^
}
¡¡ 
}
¬¬ 
else
ƒƒ 
if
ƒƒ 
(
ƒƒ "
_stateConfigurations
ƒƒ )
.
ƒƒ) *
TryGetValue
ƒƒ* 5
(
ƒƒ5 6
currentResult
ƒƒ6 C
.
ƒƒC D
CurrentState
ƒƒD P
,
ƒƒP Q
out
ƒƒR U
var
ƒƒV Y
reenteredState
ƒƒZ h
)
ƒƒh i
)
ƒƒi j
{
≈≈ 
reenteredState
≈≈ 
.
≈≈ "
ExecuteReentryAction
≈≈ 1
(
≈≈1 2

parameters
≈≈2 <
.
≈≈< =
Context
≈≈= D
,
≈≈D E
currentResult
≈≈F S
)
≈≈S T
;
≈≈T U
}
≈≈V W
return
«« 
currentResult
««  
;
««  !
}
»» 	
}
…… 
}   ã¨
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
}ÁÁ Ê(
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
{ 	
var 

startState 
= 
currentResult *
!=+ -
null. 2
?3 4
currentResult5 B
.B C
StartingStateC P
:Q R
StateAccessorS `
(` a

parametersa k
.k l
Contextl s
)s t
;t u
if 
( 
! 
	Condition 
( 

parameters %
.% &
Context& -
)- .
). /
{ 
if   
(   
currentResult   !
!=  " $
null  % )
)  ) *
{!! 
return!! 
currentResult!! &
;!!& '
}!!( )
return## 
new## !
StateTransitionResult## 0
<##0 1
TState##1 7
,##7 8
TTrigger##9 A
>##A B
(##B C

parameters##C M
.##M N
Trigger##N U
,$$ 

startState$$  
,%% 

startState%%  
,&& 

startState&&  
,'' 
lastTransitionName'' (
:''( )
string''* 0
.''0 1
Empty''1 6
,(( 
conditionMet(( "
:((" #
false(($ )
)(() *
;((* +
})) 
StateMutator++ 
(++ 

parameters++ #
.++# $
Context++$ +
,+++ ,
ToState++- 4
)++4 5
;++5 6
var-- 
transitionResult--  
=--! "
currentResult--# 0
==--1 3
null--4 8
?.. 
new.. !
StateTransitionResult.. +
<..+ ,
TState.., 2
,..2 3
TTrigger..4 <
>..< =
(..= >

parameters..> H
...H I
Trigger..I P
,..P Q

startState..R \
,..\ ]

startState..^ h
,..h i
ToState..j q
,..q r
Name..s w
)..w x
:// 
new// !
StateTransitionResult// +
<//+ ,
TState//, 2
,//2 3
TTrigger//4 <
>//< =
(//= >

parameters//> H
.//H I
Trigger//I P
,//P Q

startState//R \
,//\ ]
currentResult//^ k
.//k l
CurrentState//l x
,//x y
ToState	//z Å
,
//Å Ç
Name
//É á
)
//á à
;
//à â
NotifyOfTransition00 
(00 

parameters00 )
.00) *
Context00* 1
,001 2
transitionResult003 C
)00C D
;00D E
return22 
transitionResult22 #
;22# $
}33 	
}44 
}55 ˆ9
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
return"" 
new"" !
StateTransitionResult"" 0
<""0 1
TState""1 7
,""7 8
TTrigger""9 A
>""A B
(""B C

parameters""C M
.""M N
Trigger""N U
,## 

startState##  
,$$ 
currentResult$$ #
==$$$ &
null$$' +
?$$, -

startState$$. 8
:$$9 :
currentResult$$; H
.$$H I
PreviousState$$I V
,%% 
currentResult%% #
==%%$ &
null%%' +
?%%, -

startState%%. 8
:%%9 :
currentResult%%; H
.%%H I
CurrentState%%I U
,&& 
currentResult&& #
==&&$ &
null&&' +
?&&, -
string&&. 4
.&&4 5
Empty&&5 :
:&&; <
currentResult&&= J
.&&J K
LastTransitionName&&K ]
,'' 
wasCancelled'' "
:''" #
true''$ (
)''( )
;'') *
}(( 
if** 
(** 
!** 
await** 
ConditionAsync** %
(**% &

parameters**& 0
.**0 1
Context**1 8
,**8 9

parameters**: D
.**D E
CancellationToken**E V
)**V W
.++ 
ConfigureAwait++ 
(++ %
continueOnCapturedContext++ 8
:++8 9
false++: ?
)++? @
)++@ A
{,, 
return-- 
new-- !
StateTransitionResult-- 0
<--0 1
TState--1 7
,--7 8
TTrigger--9 A
>--A B
(--B C

parameters--C M
.--M N
Trigger--N U
,.. 

startState..  
,// 
currentResult// #
==//$ &
null//' +
?//, -

startState//. 8
://9 :
currentResult//; H
.//H I
PreviousState//I V
,00 
currentResult00 #
==00$ &
null00' +
?00, -

startState00. 8
:009 :
currentResult00; H
.00H I
CurrentState00I U
,11 
currentResult11 #
==11$ &
null11' +
?11, -
string11. 4
.114 5
Empty115 :
:11; <
currentResult11= J
.11J K
LastTransitionName11K ]
,22 
conditionMet22 "
:22" #
false22$ )
,33 
wasCancelled33 "
:33" #

parameters33$ .
.33. /
CancellationToken33/ @
.33@ A#
IsCancellationRequested33A X
)33X Y
;33Y Z
}44 
StateMutator66 
(66 

parameters66 #
.66# $
Context66$ +
,66+ ,
ToState66- 4
)664 5
;665 6
var77 
transitionResult77  
=77! "
currentResult77# 0
==771 3
null774 8
?88 
new88 !
StateTransitionResult88 +
<88+ ,
TState88, 2
,882 3
TTrigger884 <
>88< =
(88= >

parameters88> H
.88H I
Trigger88I P
,88P Q

startState88R \
,88\ ]

startState88^ h
,88h i
ToState88j q
,88q r
Name88s w
)88w x
:99 
new99 !
StateTransitionResult99 +
<99+ ,
TState99, 2
,992 3
TTrigger994 <
>99< =
(99= >

parameters99> H
.99H I
Trigger99I P
,99P Q

startState99R \
,99\ ]
currentResult99^ k
.99k l
CurrentState99l x
,99x y
ToState	99z Å
,
99Å Ç
Name
99É á
)
99á à
;
99à â
NotifyOfTransition:: 
(:: 

parameters:: )
.::) *
Context::* 1
,::1 2
transitionResult::3 C
)::C D
;::D E
return<< 
transitionResult<< #
;<<# $
}== 	
}>> 
}?? ¯%
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
	protected44 
void44 
NotifyOfTransition44 )
(44) *
T44* +
context44, 3
,443 4!
StateTransitionResult445 J
<44J K
TState44K Q
,44Q R
TTrigger44S [
>44[ \
transitionResult44] m
)44m n
{55 	
OnTransitionedEvent66 
?66  
.66  !
Invoke66! '
(66' (
context66( /
,66/ 0
transitionResult661 A
)66A B
;66B C
}77 	
}88 
}99 Ë+
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
{%% 
if&& 
(&& 
currentResult&& !
!=&&" $
null&&% )
)&&) *
{'' 
return'' 
currentResult'' &
;''& '
}''( )
return)) 
new)) !
StateTransitionResult)) 0
<))0 1
TState))1 7
,))7 8
TTrigger))9 A
>))A B
())B C

parameters))C M
.))M N
Trigger))N U
,** 

startState**  
,++ 

startState++  
,,, 
toState,, 
,-- 
lastTransitionName-- (
:--( )
string--* 0
.--0 1
Empty--1 6
,.. 
conditionMet.. "
:.." #
false..$ )
)..) *
;..* +
}// 
StateMutator11 
.11 
Invoke11 
(11  

parameters11  *
.11* +
Context11+ 2
,112 3
toState114 ;
)11; <
;11< =
var22 
transitionResult22  
=22! "
currentResult22# 0
==221 3
null224 8
?33 
new33 !
StateTransitionResult33 +
<33+ ,
TState33, 2
,332 3
TTrigger334 <
>33< =
(33= >

parameters33> H
.33H I
Trigger33I P
,33P Q

startState33R \
,33\ ]

startState33^ h
,33h i
toState33j q
,33q r
Name33s w
)33w x
:44 
new44 !
StateTransitionResult44 +
<44+ ,
TState44, 2
,442 3
TTrigger444 <
>44< =
(44= >

parameters44> H
.44H I
Trigger44I P
,44P Q

startState44R \
,44\ ]
currentResult44^ k
.44k l
CurrentState44l x
,44x y
toState	44z Å
,
44Å Ç
Name
44É á
)
44á à
;
44à â
NotifyOfTransition55 
(55 

parameters55 )
.55) *
Context55* 1
,551 2
transitionResult553 C
)55C D
;55D E
return77 
transitionResult77 #
;77# $
}88 	
}99 
}:: ∫9
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
{'' 
if(( 
((( 
currentResult(( !
!=((" $
null((% )
)(() *
{)) 
return)) 
currentResult)) &
;))& '
}))( )
return++ 
new++ !
StateTransitionResult++ 0
<++0 1
TState++1 7
,++7 8
TTrigger++9 A
>++A B
(++B C

parameters++C M
.++M N
Trigger++N U
,,, 

startState,,  
,-- 

startState--  
,.. 

startState..  
,// 
lastTransitionName// (
://( )
string//* 0
.//0 1
Empty//1 6
,00 
wasCancelled00 "
:00" #
true00$ (
)00( )
;00) *
}11 
var33 
toState33 
=33 
await33 
StateFunctionAsync33  2
(332 3

parameters333 =
.33= >
Context33> E
,33E F

parameters33G Q
.33Q R
CancellationToken33R c
)33c d
.44 
ConfigureAwait44 
(44  %
continueOnCapturedContext44  9
:449 :
false44; @
)44@ A
;44A B
if77 
(77 
toState77 
.77 
	CompareTo77 !
(77! "

startState77" ,
)77, -
==77. 0
$num771 2
)772 3
{88 
return99 
new99 !
StateTransitionResult99 0
<990 1
TState991 7
,997 8
TTrigger999 A
>99A B
(99B C

parameters99C M
.99M N
Trigger99N U
,:: 

startState::  
,;; 
currentResult;; #
==;;$ &
null;;' +
?;;, -

startState;;. 8
:;;9 :
currentResult;;; H
.;;H I
PreviousState;;I V
,<< 
toState<< 
,== 
currentResult== #
====$ &
null==' +
?==, -
string==. 4
.==4 5
Empty==5 :
:==; <
currentResult=== J
.==J K
LastTransitionName==K ]
,>> 
conditionMet>> "
:>>" #
currentResult>>$ 1
!=>>2 4
null>>5 9
,?? 
wasCancelled?? "
:??" #

parameters??$ .
.??. /
CancellationToken??/ @
.??@ A#
IsCancellationRequested??A X
)??X Y
;??Y Z
}@@ 
StateMutatorBB 
(BB 

parametersBB #
.BB# $
ContextBB$ +
,BB+ ,
toStateBB- 4
)BB4 5
;BB5 6
varCC 
transitionResultCC  
=CC! "
currentResultCC# 0
==CC1 3
nullCC4 8
?DD 
newDD !
StateTransitionResultDD +
<DD+ ,
TStateDD, 2
,DD2 3
TTriggerDD4 <
>DD< =
(DD= >

parametersDD> H
.DDH I
TriggerDDI P
,DDP Q

startStateDDR \
,DD\ ]

startStateDD^ h
,DDh i
toStateDDj q
,DDq r
NameDDs w
)DDw x
:EE 
newEE !
StateTransitionResultEE +
<EE+ ,
TStateEE, 2
,EE2 3
TTriggerEE4 <
>EE< =
(EE= >

parametersEE> H
.EEH I
TriggerEEI P
,EEP Q

startStateEER \
,EE\ ]
currentResultEE^ k
.EEk l
CurrentStateEEl x
,EEx y
toState	EEz Å
,
EEÅ Ç
Name
EEÉ á
)
EEá à
;
EEà â
NotifyOfTransitionFF 
(FF 

parametersFF )
.FF) *
ContextFF* 1
,FF1 2
transitionResultFF3 C
)FFC D
;FFD E
returnHH 
transitionResultHH #
;HH# $
}II 	
}JJ 
}KK Ï

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
>u v
{ 
	protected &
StateTransitionDynamicBase ,
(, -
Func- 1
<1 2
T2 3
,3 4
TState5 ;
>; <
stateAccessor= J
,J K
ActionL R
<R S
TS T
,T U
TStateV \
>\ ]
stateMutator^ j
,j k
TStatel r
	fromStates |
,| }
string	~ Ñ
name
Ö â
,
â ä
uint
ã è
priority
ê ò
)
ò ô
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
	fromState0 9
,9 :
name; ?
,? @
priorityA I
)I J
{ 	
}	 

} 
} …-
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
: 	&
StateTransitionDynamicBase
 $
<$ %
T% &
,& '
TState( .
,. /
TTrigger0 8
>8 9
where 
TParam 
: 
class 
where 
TState 
: 
IComparable "
{ 
public 
Func 
< 
T 
, 
TParam 
, 
TState %
>% &
	StateFunc' 0
{1 2
get3 6
;6 7
}8 9
public /
#StateTransitionDynamicParameterized 2
(2 3
Func3 7
<7 8
T8 9
,9 :
TState; A
>A B
stateAccessorC P
,P Q
ActionR X
<X Y
TY Z
,Z [
TState\ b
>b c
stateMutatord p
,p q
TStater x
	fromState	y Ç
,
Ç É
Func
Ñ à
<
à â
T
â ä
,
ä ã
TParam
å í
,
í ì
TState
î ö
>
ö õ
	stateFunc
ú •
,
• ¶
string
ß ≠
name
Æ ≤
,
≤ ≥
uint
¥ ∏
priority
π ¡
)
¡ ¬
: 
base 
( 
stateAccessor  
,  !
stateMutator" .
,. /
	fromState0 9
,9 :
name; ?
,? @
priorityA I
)I J
{ 	
	StateFunc 
= 
	stateFunc !
??" $
throw% *
new+ .!
ArgumentNullException/ D
(D E
nameofE K
(K L
	stateFuncL U
)U V
)V W
;W X
} 	
public 
override !
StateTransitionResult -
<- .
TState. 4
,4 5
TTrigger6 >
>> ?
Execute@ G
(G H
ExecutionParametersH [
<[ \
T\ ]
,] ^
TTrigger_ g
>g h

parametersi s
,s t"
StateTransitionResult	u ä
<
ä ã
TState
ã ë
,
ë í
TTrigger
ì õ
>
õ ú
currentResult
ù ™
=
´ ¨
null
≠ ±
)
± ≤
{ 	
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
(""# $

parameters""$ .
."". /
Context""/ 6
,""6 7

parameters""8 B
.""B C
Request""C J
as""K M
TParam""N T
)""T U
;""U V
var$$ 
transitioned$$ 
=$$ 
toState$$ &
.$$& '
	CompareTo$$' 0
($$0 1

startState$$1 ;
)$$; <
!=$$= ?
$num$$@ A
;$$A B
if&& 
(&& 
transitioned&& 
)&& 
{'' 
StateMutator'' 
('' 

parameters'' %
.''% &
Context''& -
,''- .
toState''/ 6
)''6 7
;''7 8
}''9 :
var)) 
transitionResult))  
=))! "
())# $
currentResult))$ 1
==))2 4
null))5 9
)))9 :
?** 
new** !
StateTransitionResult** +
<**+ ,
TState**, 2
,**2 3
TTrigger**4 <
>**< =
(**= >

parameters**> H
.**H I
Trigger**I P
,++ 

startState++  
,,, 

startState,,  
,-- 
toState-- 
,.. 
lastTransitionName.. (
:..( )
transitioned..* 6
?..7 8
Name..9 =
:..> ?
string..@ F
...F G
Empty..G L
,// 
conditionMet// "
://" #
transitioned//$ 0
)//0 1
:00 
new00 !
StateTransitionResult00 +
<00+ ,
TState00, 2
,002 3
TTrigger004 <
>00< =
(00= >

parameters00> H
.00H I
Trigger00I P
,11 

startState11  
,22 
currentResult22 #
.22# $
CurrentState22$ 0
,33 
toState33 
,44 
lastTransitionName44 (
:44( )
transitioned44* 6
?447 8
Name449 =
:44> ?
string44@ F
.44F G
Empty44G L
,55 
conditionMet55 "
:55" #
transitioned55$ 0
)550 1
;551 2
if77 
(77 
transitioned77 
)77 
{88 
NotifyOfTransition88  
(88  !

parameters88! +
.88+ ,
Context88, 3
,883 4
transitionResult885 E
)88E F
;88F G
}88H I
return:: 
transitionResult:: #
;::# $
};; 	
}<< 
}== º9
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
{$$ 	
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
,77A B

parameters77C M
.77M N
Request77N U
as77V X
TParam77Y _
,77_ `

parameters77a k
.77k l
CancellationToken77l }
)77} ~
.88 
ConfigureAwait88 
(88  %
continueOnCapturedContext88  9
:889 :
false88; @
)88@ A
;88A B
var:: 
wasSuccessful:: 
=:: 
false::  %
;::% &
if;; 
(;; 
toState;; 
.;; 
	CompareTo;; !
(;;! "

startState;;" ,
);;, -
!=;;. 0
$num;;1 2
);;2 3
{<< 
StateMutator== 
(== 

parameters== '
.==' (
Context==( /
,==/ 0
toState==1 8
)==8 9
;==9 :
wasSuccessful>> 
=>> 
true>>  $
;>>$ %
}?? 
varAA 
transitionResultAA  
=AA! "
currentResultAA# 0
==AA1 3
nullAA4 8
?BB 
newBB !
StateTransitionResultBB +
<BB+ ,
TStateBB, 2
,BB2 3
TTriggerBB4 <
>BB< =
(BB= >

parametersBB> H
.BBH I
TriggerBBI P
,CC 

startStateCC  
,DD 

startStateDD  
,EE 
toStateEE 
,FF 
lastTransitionNameFF (
:FF( )
wasSuccessfulFF* 7
?FF8 9
NameFF: >
:FF? @
stringFFA G
.FFG H
EmptyFFH M
,GG 
conditionMetGG "
:GG" #
wasSuccessfulGG$ 1
,HH 
wasCancelledHH "
:HH" #
!HH$ %
wasSuccessfulHH% 2
&&HH3 5

parametersHH6 @
.HH@ A
CancellationTokenHHA R
.HHR S#
IsCancellationRequestedHHS j
)HHj k
:II 
newII !
StateTransitionResultII +
<II+ ,
TStateII, 2
,II2 3
TTriggerII4 <
>II< =
(II= >

parametersII> H
.IIH I
TriggerIII P
,IIP Q

startStateIIR \
,II\ ]
currentResultII^ k
.IIk l
CurrentStateIIl x
,IIx y
toState	IIz Å
,
IIÅ Ç
Name
IIÉ á
)
IIá à
;
IIà â
ifKK 
(KK 
wasSuccessfulKK 
)KK 
{LL 
NotifyOfTransitionLL  
(LL  !

parametersLL! +
.LL+ ,
ContextLL, 3
,LL3 4
transitionResultLL5 E
)LLE F
;LLF G
}LLH I
returnNN 
transitionResultNN #
;NN# $
}OO 	
}PP 
}QQ ∫f
XC:\Users\Scott\Source\Repos\NStateManager\Source\NStateManager\StateTransitionFactory.cs
	namespace 	
NStateManager
 
{ 
internal 
class "
StateTransitionFactory )
<) *
T* +
,+ ,
TState- 3
,3 4
TTrigger5 =
>= >
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
}@@ ¢1
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
if 
( 
! 
( 

parameters 
. 
Request $
is% '
TParam( .
typeSafeParam/ <
)< =
)= >
{ 
throw 
new 
ArgumentException )
() *
$"* ,
Expected a , 7
{7 8
typeof8 >
(> ?
TParam? E
)E F
.F G
NameG K
}K L'
 parameter, but received a L g
{g h

parametersh r
.r s
Requests z
.z {
GetType	{ Ç
(
Ç É
)
É Ñ
.
Ñ Ö
Name
Ö â
}
â ä
.
ä ã
"
ã å
)
å ç
;
ç é
}
è ê
var 

startState 
= 
currentResult *
!=+ -
null. 2
?3 4
currentResult5 B
.B C
StartingStateC P
:Q R
StateAccessorS `
(` a

parametersa k
.k l
Contextl s
)s t
;t u
if!! 
(!! 
!!! 
	Condition!! 
(!! 

parameters!! %
.!!% &
Context!!& -
,!!- .
typeSafeParam!!/ <
)!!< =
)!!= >
{"" 
if## 
(## 
currentResult## !
!=##" $
null##% )
)##) *
{$$ 
return$$ 
currentResult$$ &
;$$& '
}$$( )
return&& 
new&& !
StateTransitionResult&& 0
<&&0 1
TState&&1 7
,&&7 8
TTrigger&&9 A
>&&A B
(&&B C

parameters&&C M
.&&M N
Trigger&&N U
,'' 

startState''  
,(( 

startState((  
,)) 

startState))  
,** 
lastTransitionName** (
:**( )
string*** 0
.**0 1
Empty**1 6
,++ 
conditionMet++ "
:++" #
false++$ )
)++) *
;++* +
},, 
StateMutator.. 
(.. 

parameters.. #
...# $
Context..$ +
,..+ ,
ToState..- 4
)..4 5
;..5 6
var// 
transitionResult//  
=//! "
currentResult//# 0
==//1 3
null//4 8
?00 
new00 !
StateTransitionResult00 +
<00+ ,
TState00, 2
,002 3
TTrigger004 <
>00< =
(00= >

parameters00> H
.00H I
Trigger00I P
,00P Q

startState00R \
,00\ ]

startState00^ h
,00h i
ToState00j q
,00q r
Name00s w
)00w x
:11 
new11 !
StateTransitionResult11 +
<11+ ,
TState11, 2
,112 3
TTrigger114 <
>11< =
(11= >

parameters11> H
.11H I
Trigger11I P
,11P Q

startState11R \
,11\ ]
currentResult11^ k
.11k l
CurrentState11l x
,11x y
ToState	11z Å
,
11Å Ç
Name
11É á
)
11á à
;
11à â
NotifyOfTransition22 
(22 

parameters22 )
.22) *
Context22* 1
,221 2
transitionResult223 C
)22C D
;22D E
return44 
transitionResult44 #
;44# $
}55 	
}66 
}77 ÛD
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
if   
(   

parameters   
.   
Request   "
==  # %
null  & *
)  * +
{!! 
throw!! 
new!! !
ArgumentNullException!! -
(!!- .
nameof!!. 4
(!!4 5

parameters!!5 ?
.!!? @
Request!!@ G
)!!G H
)!!H I
;!!I J
}!!K L
if$$ 
($$ 
!$$ 
($$ 

parameters$$ 
.$$ 
Request$$ $
is$$% '
TParam$$( .
typeSafeParam$$/ <
)$$< =
)$$= >
{%% 
throw%% 
new%% 
ArgumentException%% )
(%%) *
$"%%* ,
Expected a %%, 7
{%%7 8
typeof%%8 >
(%%> ?
TParam%%? E
)%%E F
.%%F G
Name%%G K
}%%K L'
 parameter, but received a %%L g
{%%g h

parameters%%h r
.%%r s
Request%%s z
.%%z {
GetType	%%{ Ç
(
%%Ç É
)
%%É Ñ
.
%%Ñ Ö
Name
%%Ö â
}
%%â ä
.
%%ä ã
"
%%ã å
)
%%å ç
;
%%ç é
}
%%è ê
var'' 

startState'' 
='' 
currentResult'' *
!=''+ -
null''. 2
?''3 4
currentResult''5 B
.''B C
StartingState''C P
:''Q R
StateAccessor''S `
(''` a

parameters''a k
.''k l
Context''l s
)''s t
;''t u
if)) 
()) 

parameters)) 
.)) 
CancellationToken)) ,
.)), -#
IsCancellationRequested))- D
)))D E
{** 
if++ 
(++ 
currentResult++ !
!=++" $
null++% )
)++) *
{,, 
return,, 
currentResult,, &
;,,& '
},,( )
return.. 
new.. !
StateTransitionResult.. 0
<..0 1
TState..1 7
,..7 8
TTrigger..9 A
>..A B
(..B C

parameters..C M
...M N
Trigger..N U
,// 

startState//  
,00 

startState00  
,11 

startState11  
,22 
lastTransitionName22 (
:22( )
string22* 0
.220 1
Empty221 6
,33 
conditionMet33 "
:33" #
false33$ )
,44 
wasCancelled44 "
:44" #
true44$ (
)44( )
;44) *
}55 
if77 
(77 
!77 
await77 
ConditionAsync77 %
(77% &

parameters77& 0
.770 1
Context771 8
,778 9
typeSafeParam77: G
,77G H

parameters77I S
.77S T
CancellationToken77T e
)77e f
.88 
ConfigureAwait88 
(88 %
continueOnCapturedContext88 8
:888 9
false88: ?
)88? @
)88@ A
{99 
return:: 
new:: !
StateTransitionResult:: 0
<::0 1
TState::1 7
,::7 8
TTrigger::9 A
>::A B
(::B C

parameters::C M
.::M N
Trigger::N U
,;; 

startState;;  
,<< 
currentResult<< #
==<<$ &
null<<' +
?<<, -

startState<<. 8
:<<9 :
currentResult<<; H
.<<H I
PreviousState<<I V
,== 
currentResult== #
====$ &
null==' +
?==, -

startState==. 8
:==9 :
currentResult==; H
.==H I
CurrentState==I U
,>> 
lastTransitionName>> (
:>>( )
currentResult>>* 7
==>>8 :
null>>; ?
?>>@ A
string>>B H
.>>H I
Empty>>I N
:>>O P
currentResult>>Q ^
.>>^ _
LastTransitionName>>_ q
,?? 
conditionMet?? "
:??" #
currentResult??$ 1
!=??2 4
null??5 9
,@@ 
wasCancelled@@ "
:@@" #

parameters@@$ .
.@@. /
CancellationToken@@/ @
.@@@ A#
IsCancellationRequested@@A X
)@@X Y
;@@Y Z
}AA 
StateMutatorCC 
(CC 

parametersCC #
.CC# $
ContextCC$ +
,CC+ ,
ToStateCC- 4
)CC4 5
;CC5 6
varDD 
transitionResultDD  
=DD! "
currentResultDD# 0
==DD1 3
nullDD4 8
?EE 
newEE !
StateTransitionResultEE +
<EE+ ,
TStateEE, 2
,EE2 3
TTriggerEE4 <
>EE< =
(EE= >

parametersEE> H
.EEH I
TriggerEEI P
,EEP Q

startStateEER \
,EE\ ]

startStateEE^ h
,EEh i
ToStateEEj q
,EEq r
NameEEs w
)EEw x
:FF 
newFF !
StateTransitionResultFF +
<FF+ ,
TStateFF, 2
,FF2 3
TTriggerFF4 <
>FF< =
(FF= >

parametersFF> H
.FFH I
TriggerFFI P
,FFP Q

startStateFFR \
,FF\ ]
currentResultFF^ k
.FFk l
CurrentStateFFl x
,FFx y
ToState	FFz Å
,
FFÅ Ç
Name
FFÉ á
)
FFá à
;
FFà â
NotifyOfTransitionGG 
(GG 

parametersGG )
.GG) *
ContextGG* 1
,GG1 2
transitionResultGG3 C
)GGC D
;GGD E
returnII 
transitionResultII #
;II# $
}JJ 	
}KK 
}LL £
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
Action 
. 
Invoke 
( 

parameters $
.$ %
Context% ,
), -
;- .
} 	
} 
} ¯
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