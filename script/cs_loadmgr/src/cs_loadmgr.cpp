// 默认编码 utf-8 sb微软

#include "cs_loadmgr.h" 

class cs_loadmgr : public CommandScript
{
public:
	cs_loadmgr() : CommandScript("cs_loadmgr") { }

	std::vector<ChatCommand> GetCommands() const override
	{
		static std::vector<ChatCommand> scriptCommandTable =
		{
			{ "load",		SEC_GAMEMASTER,     true,  &HandleLoadDLLCommand, "" },
			{ "update",		SEC_GAMEMASTER,     true,  &HandleUpdateDLLCommand, "" },
		    { "free",       SEC_ADMINISTRATOR,  true,  &HandleFreeDLLCommand, "" }
		};

		static std::vector<ChatCommand> commandTable =
		{
			{ "script",    SEC_GAMEMASTER,		true, nullptr,            "", scriptCommandTable }
		};

		return commandTable;
	}

	static bool HandleLoadDLLCommand(ChatHandler* handler, char const* args)
	{
		if (!*args)
			return false;

		return sScriptMgr->LoadScript(args);
	}

	static bool HandleUpdateDLLCommand(ChatHandler* handler, char const* args)
	{
		if (!*args)
			return false;

		return sScriptMgr->FreeScript(args) && sScriptMgr->LoadScript(args);
	}

	static bool HandleFreeDLLCommand(ChatHandler* handler, char const*  args)
	{
		if (!*args)
			return false;

		return sScriptMgr->FreeScript(args);
	}
};

_module void AddSC_cs_loadmgr() { new cs_loadmgr(); }
