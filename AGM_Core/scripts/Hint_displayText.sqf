// by commy2

#define DEFAULT_PLAY_SOUND false
#define DEFAULT_DELAY 2
#define DEFAULT_PRIORITY 1.5

/* OBSOLETE */

private ["_text", "_sound", "_delay", "_priority", "_lastHintTime", "_lastHintPriority", "_time"];

_this resize 4;

_text = _this select 0;
_sound = _this select 1;
_delay = _this select 2;
_priority = _this select 3;

_lastHintTime = AGM_Hint_lastHint select 0;
_lastHintPriority = AGM_Hint_lastHint select 1;

if (typeName _text != "STRING") then {_text = str _text};
if (isNil "_sound") then {_sound = DEFAULT_PLAY_SOUND};
if (isNil "_delay") then {_delay = DEFAULT_DELAY};
if (isNil "_priority") then {_priority = DEFAULT_PRIORITY};

_time = time;
if (_time > _lastHintTime + _delay || {_priority >= _lastHintPriority}) then {
	hintSilent _text;
	if (_sound) then {playSound "AGM_Sound_Click"};
	AGM_Hint_lastHint set [0, _time];
	AGM_Hint_lastHint set [1, _priority];

	sleep _delay;
	if (_time == AGM_Hint_lastHint select 0) then {hintSilent ""};
};
